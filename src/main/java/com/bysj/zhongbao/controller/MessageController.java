package com.bysj.zhongbao.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
/*
 * 站内信
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bysj.zhongbao.pojo.Message;
import com.bysj.zhongbao.pojo.User;
import com.bysj.zhongbao.service.MessageService;
import com.bysj.zhongbao.util.Page;
import com.bysj.zhongbao.vo.MessageInfo;
import com.google.gson.Gson;
import com.mysql.fabric.Response;

@Controller
@RequestMapping("/Message")
public class MessageController {
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value="/messageList")
	//用户登录 根据 用户Id 显示页面 带分页
		public void MessageList(Integer index,Integer num,HttpSession session, HttpServletResponse response){
		User user = (User) session.getAttribute("user");
		
		System.out.println(user);
		
		if(user!=null){
			
		
		int userId=user.getUserid();
		if(userId!=0){
		List<Message> list = messageService.selectMessageList(userId, index, num);
		session.setAttribute("LIst", list);
		Gson gson=new Gson();

		String data = gson.toJson(list);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
	}
	}
	
	//mymsg->message 传过ID
	@RequestMapping(value="/getMsg")
	public void getMsg(Integer msgid,HttpSession session,HttpServletResponse response){
		User user = (User) session.getAttribute("user");
		String realname = user.getRealname();
		session.setAttribute( "userrealname", realname);
		System.out.println(msgid);
		MessageInfo info = messageService.selectMessageById(msgid);
		Gson gson =new Gson();
		String data = gson.toJson(info);
		System.out.println("--------------");
		System.out.println(data);
		System.out.println("---------------");
		try {
			response.setCharacterEncoding("UTF-8");

			response.getWriter().print(data);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	//查找商家
	
	
	//跳转到 回复界面 ，并 传送 发件人的 realname
	@RequestMapping(value="/replyMsg")
	public void replyMsg(Integer msgId,HttpServletResponse response){
		System.out.println(msgId);
		MessageInfo info = messageService.selectMessageById(msgId);
		Gson gson =new Gson();
		String data = gson.toJson(info);
		System.out.println(data);
		try {
			response.setCharacterEncoding("UTF-8");

			response.getWriter().print(data);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	//回复的提交replymsg
	@RequestMapping(value="/sendMsg")
	@ResponseBody
	public void sendMsg(String textarea,Integer userid,Integer bussinessid,String time,HttpServletResponse response){
		System.out.println("===================================");
		System.out.println(textarea);
		System.out.println(userid);
		System.out.println("------------------------------------");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date nowtime = null;
		try {
			nowtime = sdf.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		Message record=new Message();
		record.setBussinessid(bussinessid);
		record.setUserid(userid);
		record.setMsgcontents(textarea);
		record.setMsgtime(nowtime);
		
		int message = messageService.insertMessage(record);
		System.out.println(message);
		String reg="";
		if(message>0){
			reg="{\"res\":1}";
		}else{
			reg="{\"res\":-1}";
		}
		try {
			response.getWriter().print(reg);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	//商家回复
		@RequestMapping(value="/selectUsersendMsg")
		@ResponseBody
		public void send1Msg(int bussinessid,String taskid,HttpServletResponse response,HttpSession session){
			int taskid1=Integer.parseInt(taskid);
			System.out.println(bussinessid);
			System.out.println(taskid);
		User u110=	messageService.selectUserNameByTwoId(bussinessid, taskid1);
		System.out.println("======================");
		System.out.println(u110);
		System.out.println("========================");
		session.setAttribute("usernamea", u110);
		}
		
		
}

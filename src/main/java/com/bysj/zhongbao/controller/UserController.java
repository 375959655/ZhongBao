package com.bysj.zhongbao.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bysj.zhongbao.pojo.Task;
import com.bysj.zhongbao.pojo.TaskExample;
import com.bysj.zhongbao.pojo.User;
import com.bysj.zhongbao.pojo.TaskExample.Criteria;
import com.bysj.zhongbao.service.TaskService;
import com.bysj.zhongbao.service.TypeService;
import com.bysj.zhongbao.service.UserService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/User")
public class UserController {

	@Autowired
	private TypeService  typeService;
	@Autowired
	private UserService userService;
	@Autowired
	private TaskService taskService;
	/**
	 * 登录页面
	 * @return
	 */
	@RequestMapping(value = "/fadeworklist")
	public String fadeworklist(){
		return "user/fadeworklist";
	}

	
	
	@RequestMapping(value = "/index")
	public String Index() {
		return "index";
	}
	@RequestMapping(value = "/login",produces = "text/html;charset=UTF-8")
	public String Login(){
		return "login";
	}
	@RequestMapping(value = "/register")
	public String Register(){
		return "user/register";
	}
	@RequestMapping(value = "/center")
	public String UserCenter(){
		return "user/center";
	}
	@RequestMapping(value = "/changepwd")
	public String UserChangePwd(){
		return "user/changepwd";
	}
	@RequestMapping(value = "/worklist")
	public String Search(){
		return "user/worklist";
	}
	@RequestMapping(value = "/myworks")
	public String myworks(Model model,HttpSession session,Integer pageNum){
			int size=0;
			User user=(User) session.getAttribute("user");
			Integer userid=1;
			if(user!=null) {
				 userid=user.getUserid();
			}
			List<Task> list = userService.getMyTask(userid);
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			ArrayList<Task> mywork = new ArrayList<Task>();
			for(Task task:list){
				String createTime = sdf1.format(task.getCreatetime());
				Date date = Timestamp.valueOf(createTime);
				task.setCreatetime(date);
				mywork.add(task);
				size++;
				if (size>=5) {
					break;
				}
			}
			model.addAttribute("mywork", mywork);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("userid", userid);
		    return "user/myworks";
		 
	}
	
	@RequestMapping(value = "/giveup")
	public void giveup(Model model,Integer taskid,HttpSession session) {
		taskService.giveup(taskid);
	}
	
	@RequestMapping(value = "/myworkload")
	public void myworkload(Integer userid,Integer pageNum,HttpServletResponse response){
		int size=0;
		TaskExample te = new TaskExample();
		Criteria criteria = te.createCriteria();
		criteria.andUseridEqualTo(userid);
		List<Task> list = userService.myworks(te);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		ArrayList<Task> mywork = new ArrayList<Task>();
		for(Task task:list){
			String createTime = sdf1.format(task.getCreatetime());
			Date date = Timestamp.valueOf(createTime);
			task.setCreatetime(date);
			if (size>=5*(pageNum-1)) {
				mywork.add(task);
			}
			size++;
			if (size>=(5*pageNum)) {
				break;
			}
		}
		Gson gson = new Gson();
		if (!mywork.isEmpty()) {
			try {
				response.setCharacterEncoding("utf-8"); 
				response.getWriter().print(gson.toJson(mywork));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			try {
				response.getWriter().print(gson.toJson("empty"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	@RequestMapping(value = "/allasset")
	public String allasset(HttpSession session,Model model){
		User user=(User) session.getAttribute("user");
		Integer userid=1;
		if(user!=null) {
			 userid=user.getUserid();
		}
		TaskExample te = new TaskExample();
		Criteria criteria = te.createCriteria();
		criteria.andUseridEqualTo(userid);
		List<Task> list = userService.myworks(te);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		ArrayList<Task> myallasset = new ArrayList<Task>();
		double sumMoney = 0.0;
		for(Task task:list){
			String createTime = sdf1.format(task.getCreatetime());
			Date date = Timestamp.valueOf(createTime);
			task.setCreatetime(date);
			if (task.getState()==1) {
				myallasset.add(task);
				sumMoney += task.getTaskmoney();
			}
		}
		model.addAttribute("myallasset", myallasset);
		model.addAttribute("sumMoney", sumMoney);
		return "user/allasset";
	}
	
	@RequestMapping(value = "/mymsg")
	public String myMessage(){
		return ("user/mymsg");
	}
	@RequestMapping(value = "/message")
	public String Message(){
		return ("user/message");
	}
	@RequestMapping(value = "/sendmsg")
	public String sendMsg(){
		return ("user/sendmsg");
	}
	@RequestMapping(value = "/replymsg")
	public String replyMsg(){
		return "user/replymsg";
	}
	
	/**
	 * 登录实现
	 * @param username
	 * @param password
	 * @param session
	 * @return 用户登录信息
	 */
	@RequestMapping(value = "/userlogin", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String login(String username,String password,HttpSession session) {
		System.out.println("用户登录测试:"+username+"//"+password);
//		UserExample userExample = new UserExample();
//		UserExample.Criteria criteria = userExample.createCriteria();
//		criteria.andUsernameEqualTo(username);
//		criteria.andPasswordEqualTo(password);
//		UserServiceImpl userServiceImpl = new UserServiceImpl();
//		List<User> list = userServiceImpl.login(userExample);
		Map<String, Object> map = new HashMap<String, Object>();
		Gson gson = new Gson();
		User user = userService.login(username, password);
		if (null!=user) {
			session.setAttribute("user", user);
			map.put("result", 1);
			System.out.println(user);
		}
		return gson.toJson(map);
	}
	
	@RequestMapping(value = "/getAllTheme",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getAllTheme(){
		List list=typeService.getAllTheme();
		Gson gson=new Gson();
		return gson.toJson(list);
	}
	
	@RequestMapping(value = "/upload")
	public String  upload(Model model,Integer hidden,HttpSession session,MultipartFile file) throws  IOException {
        Integer userid=((User)session.getAttribute("user")).getUserid();
	    String name = UUID.randomUUID().toString().replaceAll("-", "");
		String ext = FilenameUtils.getExtension(file.getOriginalFilename());
		file.transferTo(new File("D:\\upload\\" + "userid"+userid+"taskid"+hidden+"-"+name + "." + ext));	
		String path="userid"+userid+"taskid"+hidden+"-"+name + "." + ext;
	    taskService.upload(userid,hidden,path);
		return myworks(model,session,1);
	}
	
	@RequestMapping(value = "/getTask")
	@ResponseBody
	public String getTask(Integer taskid,HttpSession session){
		User user=(User) session.getAttribute("user");
		if(user==null) {
		return "{\"res\": 2}";
		}
		int res=userService.getTask(taskid,user.getUserid());
		return "{\"res\": "+res+"}";
	}
	@RequestMapping(value = "/updUser",produces = "text/html;charset=UTF-8")
	@ResponseBody
	private String updUser(String username,String realname,String sex,Integer age,String tel,HttpSession session){
		System.out.println("更改个人信息测试:"+username+"/"+realname+"/"+sex+"/"+age+"/"+tel);
		User user = (User) session.getAttribute("user");
		int result = userService.updUser(username, realname, sex, age, tel,user.getUserid());
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("result", result);
		return jsonObject.toString();
	}
	@RequestMapping(value = "/logout",produces = "text/html;charset=UTF-8")
	@ResponseBody
	private String logout(HttpSession session){
		System.out.println("退出测试");
		session.invalidate();
		int result = 1;
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("result", result);
//		session.removeAttribute("user");
//		session.invalidate();
		return jsonObject.toString();
	}
	@RequestMapping(value = "/regis",produces = "text/html;charset=UTF-8")
	@ResponseBody
	private String regis(String username,String password,String realname,String sex,Integer age,String tel,HttpSession session){
		System.out.println("注册测试"+username);
		int result = userService.insertUser(username, password, realname, sex, age, tel);
		if(result==1){
			login(username, password, session);
		}
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("result", result);
		return jsonObject.toString();
	}
	@RequestMapping(value = "/updpwd",produces = "text/html;charset=UTF-8")
	@ResponseBody
	private String updPwd(String newpassword,HttpSession session){
		System.out.println("更改密码测试:"+newpassword);
		User user = (User) session.getAttribute("user");
		int result = userService.updPwd(newpassword,user.getUserid());
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("result", result);
		session.invalidate();
		return jsonObject.toString();
	}
	
	
}

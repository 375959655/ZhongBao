package com.bysj.zhongbao.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bysj.zhongbao.pojo.Bussiness;
import com.bysj.zhongbao.pojo.Task;
import com.bysj.zhongbao.pojo.TaskDetail;
import com.bysj.zhongbao.pojo.TaskExample;
import com.bysj.zhongbao.pojo.TaskExample.Criteria;
import com.bysj.zhongbao.service.BussinessService;
import com.bysj.zhongbao.service.TaskService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/Business")
public class BusinessController {

	@Autowired
	private BussinessService bussService;
	@Autowired
	private TaskService taskService;
	/**
	 * 商家登陆
	 */
	@RequestMapping("/login")
	public String login(){
		return"login";
	}
	@RequestMapping("/Login")
	@ResponseBody
	public String Login(String username,String password,HttpSession session){
		System.out.println("######################");
		Bussiness bussiness = new Bussiness();
		Gson gson = new Gson();
		Map<String, Object> map = new HashMap<String, Object>();
		bussiness.setBussinessname(username);
		bussiness.setPassword(password);
		Bussiness result = bussService.bussLogin(bussiness);
		if(result!=null){
			map.put("result", 1);
			session.setAttribute("business",username);
			session.setAttribute("businesspwd", password);
			session.setAttribute("businessId", result.getBussinessid());
		}
		return gson.toJson(map);
	}
	/**
	 * 跳转到修改密码
	 */
	@RequestMapping("/bussChangePwd")
	public String changePwd(){
		return"business/busschangepwd";
	}
	/**
	 * 修改密码
	 */
	@RequestMapping("/changeBussPwd")
	public ModelAndView changeBussPwd(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		Bussiness bussiness = new Bussiness();
		ModelAndView mav = new ModelAndView();
		bussiness.setBussinessname((String)session.getAttribute("businessname"));
		bussiness.setPassword(request.getParameter("newpassword"));
		int result = bussService.bussChangePwd(bussiness);
		mav.addObject("changePwdResult", result);
		mav.setViewName("business/busschangepwd");
		return mav;
	}
	/**
	 * 商家查看所发布的任务
	 * @return
	 */
	@RequestMapping("/bussTasks")
	public String bussTasks(){
		return"business/busstasks";
	}
	/**
	 * 商家删除任务
	 */
	@RequestMapping("/deleteTask")
	public ModelAndView deleteTask(){
		return null;
	}
	/**
	 * 商家所接收的评价
	 */
	@RequestMapping("/myEvaluate")
	public String  myEvaluate(){
		return "business/myevaluate";
	}
	/**
	 * 发布新的任务
	 */
	@RequestMapping("/newTask")
	public String newTask(){		
		return "business/newtask";
	}
	
	@RequestMapping(value="/addTask",produces="text/html;charset=utf-8")
	public String addTask(HttpSession session,String taskTopic,Double money,Integer type,Integer deadLine,String taskinfo){		
	System.out.println("addtask");
		Integer bussinessid=(Integer) session.getAttribute("businessId");
    Task task=new Task();
	task.setBussinessid(bussinessid);
	task.setCreatetime(new Date());
	task.setDeadline(deadLine);
	task.setTaskcontents(taskinfo);
	task.setTaskmoney(money);
	task.setTypeid(type);
	task.setTaskname(taskTopic);
	task.setEvaluate("");
	task.setState(0);
	taskService.addTask(task);
		return "business/busstasks";
	}
	
	@RequestMapping("/bussWork")
	public String bussWork(){		
		return "business/busswork";
	}
	
	/**
	 * 审核
	 */
	@RequestMapping(value="/changeState",produces="text/html;charset=utf-8")
	public void  changeState(Integer taskid,Integer state ){		
		Task task=taskService.getTaskById(taskid);
		task.setState(state);
		taskService.changeState(task);
	}
	
	/**
	 * 商家查看任务详细信息
	 */
	@RequestMapping(value="/getTask",produces="text/html;charset=utf-8")
	@ResponseBody
	private void getTask(int taskid){
		TaskDetail taskDetail = bussService.getDetailTask(taskid);
		Gson gson = new Gson();
		System.out.println(gson.toJson(taskDetail));
	}
	/*
	 * 商家查看具体任务详细信息时 的判断
	 */
	@RequestMapping(value="/judgeTask",produces="text/html;charset=utf-8")
	@ResponseBody
	private String judgeTask(int taskid){
		TaskDetail taskDetail = bussService.judgeDetail(taskid);
		Gson gson = new Gson();
		if(taskDetail.getUserid()!=0){
			taskDetail = bussService.getDetailTask(taskid);
			return gson.toJson(taskDetail);
		}else{
			taskDetail.setUsername("无");
			taskDetail.setTel("无");
			return gson.toJson(taskDetail);
		}
	}
	/**
	 * 商家查看所发布的任务
	 * @return
	 */
	@RequestMapping("/bussTask")
	public void bussTasks(Integer businessId,Integer pageNum,HttpServletResponse response){
		int size=0;
		/*businessId = 1;
		pageNum=2;*/
		TaskExample example = new TaskExample();
		Criteria criteria = example.createCriteria();
		criteria.andBussinessidEqualTo(businessId);
		List<Task> list = bussService.busstasks(example);
		ArrayList<Task> bussTasks = new ArrayList<Task>();
		for(Task task:list){
			if (size>=5*(pageNum-1)) {
				bussTasks.add(task);
			}
			size++;
			if (size>=(5*pageNum)) {
				break;
			}
		}
		Gson gson = new Gson();
		if (!bussTasks.isEmpty()) {
			try {
				response.setCharacterEncoding("utf-8"); 
				response.getWriter().print(gson.toJson(bussTasks));
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
}

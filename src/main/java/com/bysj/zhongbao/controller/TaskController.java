package com.bysj.zhongbao.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bysj.zhongbao.pojo.Bussiness;
import com.bysj.zhongbao.pojo.Task;
import com.bysj.zhongbao.pojo.Type;
import com.bysj.zhongbao.pojo.User;
import com.bysj.zhongbao.service.BussinessService;
import com.bysj.zhongbao.service.TaskService;
import com.bysj.zhongbao.service.TypeService;
import com.bysj.zhongbao.service.UserService;
import com.google.gson.Gson;


@Controller
@RequestMapping("/Task")
public class TaskController {
	@Autowired
	private UserService userService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private BussinessService bussinessService;
	@Autowired
	private TypeService typeService;
	@RequestMapping(value = "/tasklist")
	public String worklist(){
		return "user/worklist";
	}
	

	
	@RequestMapping(value = "/worksearch")
	public String worksearch(){
		return "user/worksearch";
	}
	
	@RequestMapping(value = "/getTask",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getTask(String typeid,String pageSize,String pageIndex) {
		Gson gson = new Gson();
		List<Task> list = userService.getTaskByType(Integer.parseInt(typeid),Integer.parseInt(pageSize) , Integer.parseInt(pageIndex));
		Map<String, Object> map = new HashMap<String, Object>();
		if (list!=null) {
			if (list.size()>0) {
				map.put("res", 1);
				map.put("data", list);
			}else {
				map.put("res", 0);
			}
		}
		System.out.println(gson.toJson(map));
		return gson.toJson(map);
	}
	
	@RequestMapping(value = "/tasksearch",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String taskSearch(String text,String pageSize,String pageIndex) {
		Gson gson = new Gson();
		System.out.println(text);
		List<Task> list = userService.getTaskByLike(text, 1, 5);
		Map<String, Object> map = new HashMap<String, Object>();
		if (list!=null) {
			if (list.size()>0) {
				map.put("res", 1);
				map.put("data", list);
			}else {
				map.put("res", 0);
			}
		}
		System.out.println(gson.toJson(map));
		return gson.toJson(map);
	}

	@RequestMapping(value = "/getAllTask", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String  getAllTask(String pageIndex,String pageSize,String theme){
		Gson gson = new Gson();
		int pageNum = 1;
		int pagesize = 5;
		try {
			pageNum = Integer.parseInt(pageIndex);
		} catch (Exception e) {
		}
		try {
			pagesize = Integer.parseInt(pageSize);
		} catch (Exception e) {
		}
		List<Task> list = taskService.getAllTasks(pageNum , pagesize,theme);
		Map<String, Object> map = new HashMap<String, Object>();
		if (list!=null) {
			if (list.size()>0) {
				map.put("res", 1);
				map.put("data", list);
			}else {
				map.put("res", 0);
			}
		}
		return gson.toJson(map);
	}
	
	@RequestMapping(value = "/getNewTask", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String  getNewTask(String pageIndex,String pageSize,String theme){
		
		Gson gson = new Gson();
		int pageNum = -1;
		int pagesize = 5;
		try {
			pageNum = Integer.parseInt(pageIndex);
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			pagesize = Integer.parseInt(pageSize);
		} catch (Exception e) {
			// TODO: handle exception
		}
		List<Task> list = taskService.getNewTasks(pageNum , pagesize,theme);
		Map<String, Object> map = new HashMap<String, Object>();
		if (list!=null) {
			if (list.size()>0) {
				map.put("res", 1);
				map.put("data", list);
			}else {
				map.put("res", 0);
			}
		}
		return gson.toJson(map);
	}
	@RequestMapping(value = "/getMoneyTask", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String  getMoneyTask(String pageIndex,String pageSize,String theme){
		Gson gson = new Gson();
		List<Task> list = taskService.getMoneyTasks(Integer.parseInt(pageIndex) , Integer.parseInt(pageSize),theme);
		Map<String, Object> map = new HashMap<String, Object>();
		if (list!=null) {
			if (list.size()>0) {
				map.put("res", 1);
				map.put("data", list);
			}else {
				map.put("res", 0);
			}
		}
		return gson.toJson(map);
	}
	
	@RequestMapping(value = "/mywork")
	public String mywork(Model model,String taskid,HttpSession session){
		Task task=taskService.getTaskById(Integer.parseInt(taskid));
		User user=(User) session.getAttribute("user");
		if(user==null||user.getUserid()!=task.getUserid()) {
			return "user/error";
		}
		Bussiness bussiness=bussinessService.getBussinessById(task.getBussinessid());
		Type type=typeService.getTypeByTypeid(task.getTypeid());
		model.addAttribute("task",task);
		model.addAttribute("bussiness",bussiness);
		model.addAttribute("type",type);
		return "user/mywork";
	}
	@RequestMapping(value = "/work")
	public String work(Model model ,String taskid){
		Task task=taskService.getTaskById(Integer.parseInt(taskid));
		Bussiness bussiness=bussinessService.getBussinessById(task.getBussinessid());
		Type type=typeService.getTypeByTypeid(task.getTypeid());
		model.addAttribute("task",task);
		model.addAttribute("bussiness",bussiness);
		model.addAttribute("type",type);
		return "user/work";
	}
	
}

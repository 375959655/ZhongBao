package com.bysj.zhongbao.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bysj.zhongbao.pojo.Admin;
import com.bysj.zhongbao.pojo.Bussiness;
import com.bysj.zhongbao.pojo.Task;
import com.bysj.zhongbao.pojo.TaskExample;
import com.bysj.zhongbao.pojo.Type;
import com.bysj.zhongbao.pojo.User;
import com.bysj.zhongbao.pojo.TaskExample.Criteria;
import com.bysj.zhongbao.service.AdminService;
import com.bysj.zhongbao.service.TaskService;
import com.bysj.zhongbao.service.TypeService;
import com.bysj.zhongbao.util.Page;
import com.bysj.zhongbao.vo.TaskInfo;
import com.google.gson.Gson;

@Controller
@RequestMapping("Admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private TypeService typeService;
	@RequestMapping("/login")
	public String login() {
		return "admin/index";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "admin/main";
	}
	
	@RequestMapping("/task")
	public String task() {
		return "admin/task";
	}
	
	@RequestMapping("user")
	public String user() {
		return "admin/user";
	}
	
	@RequestMapping("/business")
	public String business() {
		return "admin/business";
	}
	
	@RequestMapping("/type")
	public String type() {
		return "admin/type";
	}
	
	@RequestMapping("/type_add")
	public String type_add() {
		return "admin/type_add";
	}
	
	@RequestMapping("/type_update")
	public String type_update() {
		return "admin/type_update";
	}
	
	@RequestMapping("/admin_left")
	public String admin_left() {
		return "admin/admin_left";
	}
	
	@RequestMapping("/admin_top")
	public String admin_top() {
		return "admin/admin_top";
	}
	//test
	@RequestMapping(value="/adminLogin",produces="text/html;charset=UTF-8")
	@ResponseBody
	private String adminLogin(String name,String password,HttpSession session) {
		System.out.println("用户登录测试:"+name+"//"+password);
		Map<String, Object> map = new HashMap<String, Object>();
		Gson gson = new Gson();
		Admin admin = adminService.login(name, password);
		if (null!=admin) {
			session.setAttribute("user", admin);
			map.put("result", 1);
			System.out.println(admin);
		}
		return gson.toJson(map);
	}
	@RequestMapping(value = "/getUser",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public void getUser(Integer curPage,Model model,HttpServletResponse response) {
		Page page = new Page();
		int totalPage = 0,pagesize = 0,startsize=0;
		List<User> list = adminService.userList();
		if (list.size()%page.getPageNumber()==0) {
			totalPage = list.size()/page.getPageNumber();
		}else{
			totalPage = list.size()/page.getPageNumber()+1;
		}
		page.setCurPage(curPage);
		page.setTotalPage(totalPage);
		List<User> bussinesses = new ArrayList<User>();
		for(User task:list){
			if (startsize++>=(curPage-1)*page.getPageNumber()) {
				bussinesses.add(task);
				pagesize++;
			}
			if (pagesize>=page.getPageNumber()) {
				break;
			}
		}
		page.setData(bussinesses);
		Gson gson = new Gson();
		response.setCharacterEncoding("utf-8"); 
		try {
			response.getWriter().print(gson.toJson(page));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/getBusiness",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public void getBusiness(Integer curPage,Model model,HttpServletResponse response) {
		Page page = new Page();
		int totalPage = 0,pagesize = 0,startsize=0;
		List<Bussiness> list = adminService.bussinessList();
		if (list.size()%page.getPageNumber()==0) {
			totalPage = list.size()/page.getPageNumber();
		}else{
			totalPage = list.size()/page.getPageNumber()+1;
		}
		page.setCurPage(curPage);
		page.setTotalPage(totalPage);
		List<Bussiness> bussinesses = new ArrayList<Bussiness>();
		for(Bussiness buss:list){
			if (startsize++>=(curPage-1)*page.getPageNumber()) {
				bussinesses.add(buss);
				pagesize++;
			}
			if (pagesize>=page.getPageNumber()) {
				break;
			}
		}
		page.setData(bussinesses);
		Gson gson = new Gson();
		response.setCharacterEncoding("utf-8"); 
		try {
			response.getWriter().print(gson.toJson(page));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/taskList")
	public void getAllTasksPage(Integer curPage,Model model,HttpServletResponse response){
		Page page = new Page();
		int totalPage = 0,pagesize = 0,startsize=0;
		List<TaskInfo> list = adminService.getAllTasksPage();
		if (null!=list) {
			if (list.size()%page.getPageNumber()==0) {
				totalPage = list.size()/page.getPageNumber();
			}else{
				totalPage = list.size()/page.getPageNumber()+1;
			}
			page.setCurPage(curPage);
			page.setTotalPage(totalPage);
			List<TaskInfo> taskList = new ArrayList<TaskInfo>();
			for(TaskInfo task:list){
				if (startsize++>=(curPage-1)*page.getPageNumber()) {
					taskList.add(task);
					pagesize++;
				}
				if (pagesize>=page.getPageNumber()) {
					break;
				}
			}
			page.setData(taskList);
			Gson gson = new Gson();
			response.setCharacterEncoding("utf-8"); 
			try {
				response.getWriter().print(gson.toJson(page));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping("/addType")
	@ResponseBody
	public String addType(String typename) {
		Type type = new Type();
		Map<String, Object> map = new HashMap<String, Object>();
		Gson gson = new Gson();
		type.setTypename(typename);
		int result = adminService.addType(type);
		map.put("result", result);
		return gson.toJson(map);
	}
	
	@RequestMapping("/deleteType")
	@ResponseBody
	public ModelAndView deleteType(String typeid){
		Type type = new Type();
		ModelAndView mav = new ModelAndView();
		type.setTypeid(Integer.parseInt(typeid));
		int result = adminService.deleteType(type);
		mav.setViewName("admin/type");
		return mav;
	}

	@RequestMapping(value = "/updateType", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String updateType(String typeId,String typeName){
		Type type = new Type();
	 
		type.setTypeid(Integer.parseInt(typeId));
        type.setTypename(typeName);
        int result = typeService.updateType(type);
        System.out.println(result);
        Map<String, Object> map = new HashMap<>();
        Gson gson = new Gson();
       
			map.put("res", result);
		
        return gson.toJson(map);
	}
	@RequestMapping(value="/getAllType", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public  String getAllType(){
		List<Type> result = typeService.getAllType();
		Gson gson = new Gson();
		Map<String, Object> map = new HashMap<>();
		if (result!=null&&result.size()>0) {
            System.out.println(result);
            map.put("res", 1);
            map.put("list", result);
		}
		return gson.toJson(map);
	}
	@RequestMapping(value="/deleteTask", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public  String deleteTask(Integer taskid,HttpSession session){
		//查询原来的状态
		Task task = adminService.selectByTaskid(taskid);
		int state = task.getState();
		if (state!=-1) {
			session.setAttribute("taskState", state);
			state = -1;
		}else if (state==-1) {
			state = (int) session.getAttribute("taskState");
			session.setAttribute("taskState", -1);
		}
		//设置更新的task
		Task task2 = new Task();
		task2.setState(state);
		task2.setTaskid(taskid);
		task2.setUserid(task.getUserid());
		//更新
		
		int result = adminService.updateByPrimaryKeySelective(task2);
		return ""+result;
	}
	@RequestMapping(value="/deleteUser", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public  String deleteUser(Integer userid,HttpSession session){
		//查询原来的状态
		User user = adminService.selectByPrimaryKey(userid);
		int state = user.getState();
		if (state!=-1) {
			session.setAttribute("userState", state);
			state = -1;
		}else if (state==-1) {
			state = 0;
			session.setAttribute("userState", -1);
		}
		//设置更新的task
		User user2 = new User();
		user2.setState(state);
		user2.setUserid(userid);
		//更新
		
		int result = adminService.updateByPrimaryKeySelective(user2);
		return ""+result;
	}
}


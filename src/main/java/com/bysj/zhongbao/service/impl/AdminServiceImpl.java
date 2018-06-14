package com.bysj.zhongbao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.zhongbao.controller.AdminController;
import com.bysj.zhongbao.dao.AdminMapper;
import com.bysj.zhongbao.dao.BussinessMapper;
import com.bysj.zhongbao.dao.TaskMapper;
import com.bysj.zhongbao.dao.TypeMapper;
import com.bysj.zhongbao.dao.UserMapper;
import com.bysj.zhongbao.pojo.Admin;
import com.bysj.zhongbao.pojo.Bussiness;
import com.bysj.zhongbao.pojo.Task;
import com.bysj.zhongbao.pojo.TaskExample;
import com.bysj.zhongbao.pojo.Type;
import com.bysj.zhongbao.pojo.User;
import com.bysj.zhongbao.service.AdminService;
import com.bysj.zhongbao.vo.TaskInfo;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private TaskMapper taskMapper;
	@Autowired
	private BussinessMapper bussinessMapper;
	@Autowired
	private UserMapper	 userMapper;
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private TypeMapper typeMapper;
	@Override
	public List<Task> taskList(TaskExample te) {
		return taskMapper.selectByExample(te);
	}

	@Override
	public List<User> userList() {
		return userMapper.getUsers();
	}

	@Override
	public List<Bussiness> bussinessList() {
		return bussinessMapper.getBussiness();
	}

	@Override
	public Admin login(String adminname, String password) {
		return adminMapper.queryByNameAndPwd(adminname, password);
	}

	@Override
	public List<TaskInfo> getAllTasksPage() {
		return taskMapper.getAlltasksPage();
	}
	/**
	 * 添加类别
	 */
	public int addType(Type type) {
		return typeMapper.insert(type);
	} 

	/**
	 * 删除类别
	 */
	public int deleteType(Type type) {
		int typeid = type.getTypeid();
		return typeMapper.deleteByPrimaryKey(typeid);
	}

	@Override
	public Task selectByTaskid(int taskid) {
		// TODO Auto-generated method stub
		return taskMapper.selectByPrimaryKey(taskid);
	}

	@Override
	public int updateByPrimaryKeySelective(Task record){
		
		return taskMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public User selectByPrimaryKey(Integer userid) {
		return userMapper.selectByPrimaryKey(userid);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		return userMapper.updateByPrimaryKeySelective(record);
	}
}

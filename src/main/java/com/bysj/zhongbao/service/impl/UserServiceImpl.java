package com.bysj.zhongbao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.zhongbao.dao.TaskMapper;
import com.bysj.zhongbao.dao.UserMapper;
import com.bysj.zhongbao.pojo.Task;
import com.bysj.zhongbao.pojo.TaskExample;
import com.bysj.zhongbao.pojo.User;
import com.bysj.zhongbao.pojo.UserPwd;
import com.bysj.zhongbao.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private TaskMapper taskMapper;
	@Override
	public User login(String username, String password) {
		System.out.println(username+"ServiceImpl//"+password);
		return userMapper.queryByNameAndPwd(username, password);
	}
	//更新个人信息
	@Override
	public Integer updUser(String username, String realname, String sex, Integer age, String tel, Integer userid) {
		// TODO Auto-generated method stub
		User record = new User();
		record.setUserid(userid);
		record.setUsername(username);
		record.setRealname(realname);
		record.setSex(sex);
		record.setAge(age);
		record.setTel(tel);
		return userMapper.udpateById(record);
	}
	//注册用户
	@Override
	public Integer insertUser(String username, String password, String realname, String sex, Integer age, String tel) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setRealname(realname);
		user.setLevel(1);
		user.setState(0);
		user.setMoney(0.0);
		user.setSex(sex);
		user.setAge(age);
		user.setTel(tel);
		return userMapper.insert(user);
	}
	//更改用户密码
	@Override
	public Integer updPwd(String newpassword, Integer userid) {
		// TODO Auto-generated method stub
		UserPwd userPwd = new UserPwd(newpassword, userid);
		return userMapper.updPwdById(userPwd);
	}
	
	@Override
	public List<Task> getTaskByType(int typeId,int pageSize, int pageIndex) {
		return taskMapper.taskInfosByType(typeId,(pageIndex - 1) * pageSize, pageSize);
	}
	@Override
	public List<Task> getTaskByLike(String text,int pageSize, int pageIndex) {
		return taskMapper.taskInfosByText(text, (pageIndex - 1) * pageSize, pageSize);
	}
	
	@Override
	public synchronized int getTask(Integer taskid,Integer userid) {
		// TODO Auto-generated method stub
		
		Task task =taskMapper.selectByPrimaryKey(taskid);
		if(task.getUserid()==null) {
			Task task2=new Task();
			task2.setUserid(userid);
			task2.setTaskid(taskid);
			taskMapper.updateByPrimaryKeySelective(task2);
			return 1;
		}
		else if(task.getUserid()==userid) {
			return 0;
		}
		else {
		return -1;
	   }
	}

	@Override
	public List getMyTask(Integer userid) {
		// TODO Auto-generated method stub
		List list=taskMapper.selectByUserid(userid);
		return list;
	}

	@Override
	public List<Task> myworks(TaskExample example){
		return taskMapper.selectByExample(example);
	}
}

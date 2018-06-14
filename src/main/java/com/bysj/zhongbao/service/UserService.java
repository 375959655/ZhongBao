package com.bysj.zhongbao.service;

import java.util.List;

import com.bysj.zhongbao.pojo.Task;
import com.bysj.zhongbao.pojo.TaskExample;
import com.bysj.zhongbao.pojo.User;

public interface UserService {
	//public List<User> login(UserExample userExample);
	public User	 login(String username,String password);
	public Integer updUser(String username,String realname,String sex,Integer age,String tel,Integer userid);
	public Integer insertUser(String username,String password,String realname,String sex,Integer age,String tel);
	public Integer updPwd(String newpassword,Integer userid);
	//
	List<Task> getTaskByType(int typeId,int pageSize, int pageIndex);
	List<Task> getTaskByLike(String text,int pageSize, int pageIndex);
	//
	public int getTask(Integer taskid,Integer userid);
	
	public List getMyTask(Integer userid);

	public List<Task> myworks(TaskExample example);
	
}

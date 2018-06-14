package com.bysj.zhongbao.service;

import java.util.List;

import com.bysj.zhongbao.pojo.Task;
 

public interface TaskService {
	public Task getTaskById(Integer taskid);
	List<Task> getAllTasks(int pageNum,int pageSize,String theme);
	List<Task> getNewTasks(int pageNum,int pageSize, String theme);
	List<Task> getMoneyTasks(int pageNum,int pageSize,String theme);
	public void upload(Integer userid, Integer hidden, String path);
	public void giveup(Integer userid);
	public void addTask(Task task);
	public void changeState(Task task);
}

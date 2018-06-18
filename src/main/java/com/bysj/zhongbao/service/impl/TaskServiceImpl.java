package com.bysj.zhongbao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bysj.zhongbao.dao.TaskMapper;
import com.bysj.zhongbao.pojo.Task;
import com.bysj.zhongbao.service.TaskService;
 

@Service
@Transactional
public class TaskServiceImpl implements TaskService {
	
	@Resource(name="taskMapper")
	private TaskMapper taskMapper ;

	
	@Override
	public Task getTaskById(Integer taskid) {
		// TODO Auto-generated method stub
		return taskMapper.selectByPrimaryKey(taskid);
	}
	
	@Override
	public List<Task> getAllTasks(int pageNum, int pageSize ,String theme) {
		return taskMapper.getAlltasks((pageNum-1)*pageSize, pageSize,theme);
	}

	@Override
	public List<Task> getNewTasks(int pageNum, int pageSize,String theme) {
		// TODO Auto-generated method stub
		return taskMapper.getNewTasks((pageNum-1)*pageSize, pageSize,theme );
	}

	@Override
	public List<Task> getMoneyTasks(int pageNum, int pageSize,String theme) {
		// TODO Auto-generated method stub
		return taskMapper.getMoneyTasks((pageNum-1)*pageSize, pageSize,theme );
	}

	@Override
	public void upload(Integer userid, Integer hidden, String path) {
		// TODO Auto-generated method stub
		Task task=new Task();
		task.setState(1);
		task.setUserid(userid);
		task.setEvaluate(path);
		task.setTaskid(hidden);
		taskMapper.updateByPrimaryKeySelective(task);
	}

	@Override
	public void giveup(Integer taskid) {
		// TODO Auto-generated method stub
		Task task=new Task();
		task.setState(0);
		task.setTaskid(taskid);
		taskMapper.updateByPrimaryKeySelective(task);
	}

	@Override
	public void addTask(Task task) {
		// TODO Auto-generated method stub
		taskMapper.insert(task);
	}

	@Override
	public void changeState(Task task) {
		// TODO Auto-generated method stub
		taskMapper.updateByPrimaryKey(task);
	}



}

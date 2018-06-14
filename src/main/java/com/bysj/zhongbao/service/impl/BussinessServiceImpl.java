package com.bysj.zhongbao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.zhongbao.dao.BussinessMapper;
import com.bysj.zhongbao.dao.TaskMapper;
import com.bysj.zhongbao.pojo.Bussiness;
import com.bysj.zhongbao.pojo.Task;
import com.bysj.zhongbao.pojo.TaskDetail;
import com.bysj.zhongbao.pojo.TaskExample;
import com.bysj.zhongbao.service.BussinessService;

@Service
public class BussinessServiceImpl implements BussinessService{
	@Autowired
	private BussinessMapper bussinessMapper;
	@Autowired
	private TaskMapper taskMapper;
	/**
	 * 商家登陆
	 */
	public Bussiness bussLogin(Bussiness buss) {
		return bussinessMapper.bussLogin(buss);
	}

	/**
	 * 商家修改密码
	 */
	public int bussChangePwd(Bussiness buss) {
		return bussinessMapper.updateByName(buss);
	}

	/**
	 * 查找商家所发布的任务
	 */
	public List findTaskByBuss(int bussId) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 商家发布任务
	 */
	public int newTask(Task task) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 商家注册
	 */
	public int bussRegister(Bussiness bussiness) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 查找商家收到的消息
	 */
	public List findMessageByBuss(int bussId) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 删除任务
	 */
	public int deleteTask(int taskId) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 接收此用户做此项目
	 */
	public int agreeUser(int taskId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Bussiness getBussinessById(Integer bussinessid) {
		// TODO Auto-generated method stub
		return bussinessMapper.selectByPrimaryKey(bussinessid);
	}
//获取任务具体信息
	@Override
	public TaskDetail getDetailTask(Integer taskid) {
		// TODO Auto-generated method stub
		return bussinessMapper.getTaskDetail(taskid);
	}
	@Override
	public List<Task> busstasks(TaskExample example) {
		// TODO Auto-generated method stub
		return taskMapper.selectByExample(example);
	}
	//详细任务的判断

		@Override
		public TaskDetail judgeDetail(Integer taskid) {
			// TODO Auto-generated method stub
			return bussinessMapper.judgeDetail(taskid);
		}
}

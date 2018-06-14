package com.bysj.zhongbao.pojo;

import java.util.Date;

public class TaskDetail {
	private Integer taskid;
	private String taskname;
	private String taskcontents;
	private Date createtime;
	private int deadline;
	private double taskmoney;
	private int state;
	private int userid;
	private String username;
	private String tel;
	private String typename;
	private String evaluate;
	public String getEvaluate() {
		return evaluate;
	}
	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}
	public String getTaskname() {
		return taskname;
	}
	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}
	public String getTaskcontents() {
		return taskcontents;
	}
	public void setTaskcontents(String taskcontents) {
		this.taskcontents = taskcontents;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public int getDeadline() {
		return deadline;
	}
	public void setDeadline(int deadline) {
		this.deadline = deadline;
	}
	public double getTaskmoney() {
		return taskmoney;
	}
	public void setTaskmoney(double taskmoney) {
		this.taskmoney = taskmoney;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Integer getTaskid() {
		return taskid;
	}
	public void setTaskid(Integer taskid) {
		this.taskid = taskid;
	}
	
}

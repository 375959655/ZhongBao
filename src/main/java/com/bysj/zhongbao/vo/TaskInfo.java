package com.bysj.zhongbao.vo;

import java.util.Date;

public class TaskInfo {
	
    
    //任务属性
	private Integer taskid;

    private String taskname;

    private String taskcontents;

    private Date createtime;
    
    private Double taskmoney;
    
    private int deadline;
    
    private String evaluate;
    
    private Integer state;
    
    public int getDeadline() {
		return deadline;
	}
	public void setDeadline(int deadline) {
		this.deadline = deadline;
	}
	public String getEvaluate() {
		return evaluate;
	}
	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}
	
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}




	//类别
    private Integer typeid;
    
    private String typename;
    
    private String username;
    private int userid;
    
    private String bussinessname;
    private int bussinessid;
	public Integer getTaskid() {
		return taskid;
	}
	public void setTaskid(Integer taskid) {
		this.taskid = taskid;
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
	public Double getTaskmoney() {
		return taskmoney;
	}
	public void setTaskmoney(Double taskmoney) {
		this.taskmoney = taskmoney;
	}
	public Integer getTypeid() {
		return typeid;
	}
	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getBussinessname() {
		return bussinessname;
	}
	public void setBussinessname(String bussinessname) {
		this.bussinessname = bussinessname;
	}
	public int getBussinessid() {
		return bussinessid;
	}
	public void setBussinessid(int bussinessid) {
		this.bussinessid = bussinessid;
	}
    
    
    
    
}

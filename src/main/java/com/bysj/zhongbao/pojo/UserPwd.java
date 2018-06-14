package com.bysj.zhongbao.pojo;

public class UserPwd {
	private String newpassword;
	private Integer userid;
	
	public String getNewpassword() {
		return newpassword;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public UserPwd(String newpassword, Integer userid) {
		super();
		this.newpassword = newpassword;
		this.userid = userid;
	}
	
}

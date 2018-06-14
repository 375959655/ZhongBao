package com.bysj.zhongbao.vo;

import java.util.Date;

public class MessageInfo {
	private String msgcontents;
	private String realname;
	private Date msgtime;
	private int msgid;
	private String bussinessname;
	private int bussinessid;
	
	public MessageInfo() {
		super();
	}
	public MessageInfo(String msgcontents, String realname, Date msgtime) {
		super();
		this.msgcontents = msgcontents;
		this.realname = realname;
		this.msgtime = msgtime;
	}
	public String getMsgcontents() {
		return msgcontents;
	}
	public void setMsgcontents(String msgcontents) {
		this.msgcontents = msgcontents;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public Date getMsgtime() {
		return msgtime;
	}
	public void setMsgtime(Date msgtime) {
		this.msgtime = msgtime;
	}

	public int getMsgid() {
		return msgid;
	}
	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}
	@Override
	public String toString() {
		return "MessageInfo [msgcontents=" + msgcontents + ", realname=" + realname + ", msgtime=" + msgtime
				+ ", msgid=" + msgid + ", bussinessname=" + bussinessname + ", bussinessid=" + bussinessid + "]";
	}
	public int getBussinessid() {
		return bussinessid;
	}
	public void setBussinessid(int bussinessid) {
		this.bussinessid = bussinessid;
	}
	public String getBussinessname() {
		return bussinessname;
	}
	public void setBussinessname(String bussinessname) {
		this.bussinessname = bussinessname;
	}
	
	
}

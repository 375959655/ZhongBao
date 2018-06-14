package com.bysj.zhongbao.pojo;

import java.util.Date;

public class Message {
    private Integer msgid;

    private String msgcontents;

    private Date msgtime;

    private Integer bussinessid;

    private Integer userid;

    public Integer getMsgid() {
        return msgid;
    }

    public void setMsgid(Integer msgid) {
        this.msgid = msgid;
    }

    public String getMsgcontents() {
        return msgcontents;
    }

    public void setMsgcontents(String msgcontents) {
        this.msgcontents = msgcontents == null ? null : msgcontents.trim();
    }

    public Date getMsgtime() {
        return msgtime;
    }

    public void setMsgtime(Date msgtime) {
        this.msgtime = msgtime;
    }

    public Integer getBussinessid() {
        return bussinessid;
    }

    public void setBussinessid(Integer bussinessid) {
        this.bussinessid = bussinessid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}
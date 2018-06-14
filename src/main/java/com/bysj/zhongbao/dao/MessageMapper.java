package com.bysj.zhongbao.dao;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.bysj.zhongbao.pojo.Message;
import com.bysj.zhongbao.pojo.MessageExample;
import com.bysj.zhongbao.pojo.Task;
import com.bysj.zhongbao.pojo.User;
import com.bysj.zhongbao.vo.MessageInfo;

public interface MessageMapper {
    int countByExample(MessageExample example);

    int deleteByExample(MessageExample example);

    int deleteByPrimaryKey(Integer msgid);

    int insert(Message record);

    int insertSelective(Message record);

    List<Message> selectByExample(MessageExample example);

    Message selectByPrimaryKey(Integer msgid);

    int updateByExampleSelective(@Param("record") Message record, @Param("example") MessageExample example);

    int updateByExample(@Param("record") Message record, @Param("example") MessageExample example);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
    /*@Param("msgid")int msgid,*/
    List<Message> getMessage(@Param("userId")int userId,@Param("index")int index,@Param("num")int num);
    
    MessageInfo getMessageByIdd(@Param("msgid")int msgid);
    
    User getUserIdBytaskIdandBussId(@Param("bussinessid")int bussinessid,@Param("taskid")int taskid);
   
    /*int insertintoSQlBUs(@Param("bussinessid")int bussinessid,@Param("userid")int userid
    ,@Param("msgcontents")String msgcontents,@Param("msgtime")Date msgtime);*/
	
}
package com.erzu.zhongbao.dao;

import com.erzu.zhongbao.pojo.User;
import com.erzu.zhongbao.pojo.UserExample;
import com.erzu.zhongbao.pojo.UserPwd;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer userid);

    int insert(User record);
    
    int insertUser(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer userid);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User queryByNameAndPwd(@Param("username")String username,@Param("password")String password);
    
    int udpateById(@Param("record") User record);
    
    int updPwdById(UserPwd userPwd);
    
    List<User> getUsers();
}
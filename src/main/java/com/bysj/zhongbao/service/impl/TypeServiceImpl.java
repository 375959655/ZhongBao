package com.bysj.zhongbao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bysj.zhongbao.dao.AdminMapper;
import com.bysj.zhongbao.dao.TypeMapper;
import com.bysj.zhongbao.pojo.Type;
import com.bysj.zhongbao.service.TypeService;

@Service
public class TypeServiceImpl  implements TypeService{
	@Autowired
	private TypeMapper typeMapper;
	@Autowired
	private AdminMapper adminMapper;
	@Override
	public List getAllTheme() {
		// TODO Auto-generated method stub
		//index 中为theme，实际上应该为type，getAllType();
		return typeMapper.getAllTheme();
	}
	@Override
	public Type getTypeByTypeid(Integer typeid) {
		// TODO Auto-generated method stub
		return typeMapper.selectByPrimaryKey(typeid);
	}

	@Override
	public int updateType(Type type) {
		// TODO Auto-generated method stub
		return typeMapper.updateByPrimaryKeySelective(type);
	}

	@Override
	public List<Type> getAllType() {
		// TODO Auto-generated method stub
		return typeMapper.getAllType();
	}

}

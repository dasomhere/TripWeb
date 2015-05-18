package com.webapp.dao;

import javax.sql.DataSource;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import com.webapp.model.User;

public interface UserDao {
	
//	final static String SELECT_BY_USERID = "select id, pwd from member where id=? and password=?";
	
	public void setDataSource(DataSource ds);
	
	public User selectByUserid(@Param("id")String id);
	public User selectByUseridpwd(@Param("id")String id, @Param("password")String password );
	public User insertByUserid(@Param("name")String name,@Param("id")String id,@Param("password")String password,@Param("email")String email);
}

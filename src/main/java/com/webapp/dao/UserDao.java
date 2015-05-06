package com.webapp.dao;

import javax.sql.DataSource;

import com.webapp.model.User;

public interface UserDao {
	
	final static String SELECT_BY_USERID = "select id, pwd from member where id=? and pwd=?";
	
	public void setDataSource(DataSource ds);
	
	public User selectByUserid(String id, String pwd );
}

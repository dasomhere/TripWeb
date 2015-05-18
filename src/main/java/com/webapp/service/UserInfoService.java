package com.webapp.service;

import javax.sql.DataSource;

import com.webapp.dao.UserDao;
import com.webapp.model.User;

public class UserInfoService {

	UserDao userdao;
	DataSource dataSource;

	public void setUserDao(UserDao dao) {
		userdao = dao;
	}

	public void setDataSource(DataSource ds) {
		dataSource = ds;
	}
	
	public User getUserid(String id){
		User user = userdao.selectByUserid(id);
		return user;
	}
	
	public User getUserInfo(String id, String password) {
		User user = userdao.selectByUseridpwd(id, password);
		return user;
	}
	
	public User setUserInfo(String name, String id, String password, String email){
		User user = userdao.insertByUserid(name, id, password, email);
		return user;
	}
}

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

	public User getDeptInfo(String id, String pwd) {

		User user = userdao.selectByUserid(id, pwd);

		return user;
	}
}

package com.webapp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.datasource.DataSourceUtils;

import com.webapp.dao.UserDao;
import com.webapp.model.User;

public class MyUserDao implements UserDao {
	
	static Log log = LogFactory.getLog(MyUserDao.class);

	DataSource dataSource;
	
	@Override
	public void setDataSource(DataSource ds) {
		
		dataSource = ds;
	}

	@Override
	public User selectByUserid(String id, String pwd) {
		
		Connection con = DataSourceUtils.getConnection(dataSource);
		
		User user=null;
		try {
			PreparedStatement pstmt = con.prepareStatement(SELECT_BY_USERID);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				user = new User();
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
			}
			
		} catch (SQLException e) {
			throw new DataRetrievalFailureException("fail", e);
		}
		
		if (user == null)
			throw new EmptyResultDataAccessException("dept empty row", 1);
		
		
		return user;
	}
	
	
	
}

package com.webapp.model;

public class LoginResult {
	Boolean status = false;
	Boolean loginStatus = false;
	User user;
	
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public Boolean getLoginStatus() {
		return loginStatus;
	}
	public void setLoginStatus(Boolean loginStatus) {
		this.loginStatus = loginStatus;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}

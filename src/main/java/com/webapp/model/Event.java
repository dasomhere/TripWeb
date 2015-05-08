package com.webapp.model;

public class Event {
	
	private String title;
	private String firstimage;
	private String addr1;
	private String tel;
	
	
	public Event(String title, String firstimage, String addr1, String tel) {
		this.title = title;
		this.firstimage = firstimage;
		this.addr1 = addr1;
		this.tel = tel;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage2(String firstimage) {
		this.firstimage = firstimage;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}

}

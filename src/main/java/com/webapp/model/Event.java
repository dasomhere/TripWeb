package com.webapp.model;

import java.util.Date;

public class Event {
	
	private Long code;
	private String title;
	private String firstimage;
	private String addr1;
	private String tel;
	private Long eventstartdate;
	private Long eventenddate;
	
	public Event(){
		
	}
	
	public Event( String title, String firstimage, String addr1, String tel, Long eventstartdate, Long eventenddate) {
		this.title = title;
		this.firstimage = firstimage;
		this.addr1 = addr1;
		this.tel = tel;
		this.eventstartdate = eventstartdate;
		this.eventenddate = eventenddate;
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
	public void setFirstimage(String firstimage) {
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
	
	public Long getEventstartdate() {
		return eventstartdate;
	}

	public void setEventstartdate(Long eventstartdate) {
		this.eventstartdate = eventstartdate;
	}

	public Long getEventenddate() {
		return eventenddate;
	}

	public void setEventenddate(Long eventenddate) {
		this.eventenddate = eventenddate;
	}

}

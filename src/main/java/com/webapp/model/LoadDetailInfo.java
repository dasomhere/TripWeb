package com.webapp.model;

public class LoadDetailInfo {
	private String title;
	private Long subnum;
	private String subname;
	private String subdetailoverview;
	private String subdetailimg;
	
	public LoadDetailInfo(String title, Long subnum, String subname, String subdetailoverview, String subdetailimg) {
		this.title = title;
		this.subnum = subnum;
		this.subname=subname;
		this.subdetailoverview=subdetailoverview;
		this.subdetailimg=subdetailimg;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getSubnum() {
		return subnum;
	}

	public void setSubnum(Long subnum) {
		this.subnum = subnum;
	}

	public String getSubname() {
		return subname;
	}

	public void setSubname(String subname) {
		this.subname = subname;
	}

	public String getSubdetailoverview() {
		return subdetailoverview;
	}

	public void setSubdetailoverview(String subdetailoverview) {
		this.subdetailoverview = subdetailoverview;
	}

	public String getSubdetailimg() {
		return subdetailimg;
	}

	public void setSubdetailimg(String subdetailimg) {
		this.subdetailimg = subdetailimg;
	}
	

}

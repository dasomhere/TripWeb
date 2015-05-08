package com.webapp.model;

public class DetailInfo {
	private String title;
	private String firstimage2;
	private Long contentid;
	
	public DetailInfo(String title, String firstimage2, Long contentid) {
		this.title = title;
		this.firstimage2 = firstimage2;
		this.contentid = contentid;
	}
		
	public String getFirstimage2() {
		return firstimage2;
	}
	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}
	public Long getContentid() {
		return contentid;
	}

	public void setContentid(Long contentid) {
		this.contentid = contentid;
	}

	public String getFirstimage() {
		return firstimage2;
	}

	public void setFirstimage(String firstimage2) {
		this.firstimage2 = firstimage2;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}

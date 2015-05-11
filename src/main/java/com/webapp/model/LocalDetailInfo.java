package com.webapp.model;

public class LocalDetailInfo {
	private String title;
	private String firstimage2;
	private String addr1;
	private String addr2;
	private String overview;
	private String zipcode;
	

	public LocalDetailInfo(String title, String firstimage2, String addr1, String addr2, String overview, String zipcode) {
		this.title = title;
		this.firstimage2 = firstimage2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.overview = overview;
		this.zipcode = zipcode;
	}
	
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getFirstimage2() {
		return firstimage2;
	}

	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}

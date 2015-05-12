package com.webapp.model.request;

import java.net.URLEncoder;


public class SearchFestivalRequestParameter extends RequestParameter {
	String serviceUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival";
	String areaCode = "";
	String month = "";
	
	public String getQueryString() {
		String queryString="";
		queryString += super.getQueryString();
		queryString += "&cat1=A02&cat2=A0207&arrange=A&listYN=Y";
		queryString += "&areaCode=" + areaCode;
		queryString += "&eventStartDate=" + "2015" + month + "1";
		queryString += "&eventEndDate=" + "2015" + month + "31";
		
		return queryString;
	}
	
	public String getUrl() {
		
		return serviceUrl + "?" + getQueryString();
	}
	
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	
	

}

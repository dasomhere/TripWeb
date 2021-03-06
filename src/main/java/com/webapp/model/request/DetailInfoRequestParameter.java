package com.webapp.model.request;

import java.net.URLEncoder;


public class DetailInfoRequestParameter extends RequestParameter {
	String serviceUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo";
	String contentId = "";
	String contentTypeId = "";
	
	public String getQueryString() {
		String queryString="";
		queryString += super.getQueryString();
		queryString += "&contentId=" + contentId;
		queryString += "&contentTypeId=" + contentTypeId;
		
		return queryString;
	}
	public String getUrl() {	
		
		return serviceUrl + "?" + getQueryString();
	}
	
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getContentTypeId() {
		return contentTypeId;
	}
	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}
	
	
	

}

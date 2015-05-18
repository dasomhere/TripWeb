package com.webapp.model.request;

import java.net.URLEncoder;


public class HanOkInfoRequestParameter extends RequestParameter {
	String serviceUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay";
	String areaCode = "";
	String sigunguCode = "";
	String hanOk = "";
	String contentId = "";
	String contentTypeId = "";
	
	
	public String getQueryString() {
		String queryString="";
		queryString += super.getQueryString();
		queryString += "&areaCode=" + areaCode;
		queryString += "&sigungucode=" + sigunguCode;
		queryString += "&contentId=" + contentId;
		queryString += "&contentTypeId=" + contentTypeId;
		queryString += "&hanOk="+hanOk;
		queryString += "&listYN=Y";
		
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
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
	}
	public String getHanOk() {
		return hanOk;
	}
	public void setHanOk(String hanOk) {
		this.hanOk = hanOk;
	}
	
	
	

}

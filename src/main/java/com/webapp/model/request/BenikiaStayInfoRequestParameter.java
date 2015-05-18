package com.webapp.model.request;

import java.net.URLEncoder;


public class BenikiaStayInfoRequestParameter extends RequestParameter {
	String serviceUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay";
	String areaCode = "";
	String sigunguCode = "";
	String benikia = "";
	String contentId = "";
	String contentTypeId = "";
	
	
	public String getQueryString() {
		String queryString="";
		queryString += super.getQueryString();
		queryString += "&areaCode=" + areaCode;
		queryString += "&sigungucode=" + sigunguCode;
		queryString += "&contentId=" + contentId;
		queryString += "&contentTypeId=" + contentTypeId;
		queryString += "&benikia="+benikia;
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
	public String getBenikia() {
		return benikia;
	}
	public void setBenikia(String benikia) {
		this.benikia = benikia;
	}
	
	
	
	
	

}

package com.webapp.model.request;

import java.net.URLEncoder;


public class SearchHanOkRequestParameter extends RequestParameter {
	String serviceUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay";
	String areaCode = "";
	String contentTypeId = "";
	String sigungucode = "";
	String cat2 = "";
	String hanOk= "";
	
	public String getQueryString() {
		String queryString="";
		queryString += super.getQueryString();
		queryString += "&areaCode="+ areaCode;
		queryString += "&contentTypeId=" + contentTypeId;
		queryString += "&sigungucode=" + sigungucode;
		queryString += "&hanOk="+ hanOk;
		queryString += "&IntroYN=Y";
		
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
	public String getContentTypeId() {
		return contentTypeId;
	}
	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}
	public String getSigungucode() {
		return sigungucode;
	}
	public void setSigungucode(String sigungucode) {
		this.sigungucode = sigungucode;
	}
	public String getCat2() {
		return cat2;
	}
	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}
	public String getHanOk() {
		return hanOk;
	}
	public void setHanOk(String hanOk) {
		this.hanOk = hanOk;
	}

}

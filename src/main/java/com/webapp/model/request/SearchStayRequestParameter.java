package com.webapp.model.request;

import java.net.URLEncoder;


public class SearchStayRequestParameter extends RequestParameter {
	String serviceUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay";
	String areaCode = "";
	String contentTypeId = "";
	String sigungucode = "";
	String cat2 = "";
	String hanOk= "";
	String goodStay="";
	String benikia ="";
	
	public String getQueryString() {
		String queryString="";
		queryString += super.getQueryString();
		queryString += "&areaCode="+ areaCode;
		queryString += "&contentTypeId=" + contentTypeId;
		queryString += "&sigungucode=" + sigungucode;
		queryString += "&hanOk="+ hanOk;
		queryString += "&goodStay="+ goodStay;
		queryString += "&benikia="+ benikia;
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
	public String getGoodStay() {
		return goodStay;
	}
	public void setGoodStay(String goodStay) {
		this.goodStay = goodStay;
	}
	public String getBenikia() {
		return benikia;
	}
	public void setBenikia(String benikia) {
		this.benikia = benikia;
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

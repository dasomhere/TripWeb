package com.webapp.model.request;

import java.net.URLEncoder;
import java.util.Map;

public class DetailCommonRequestParameter extends RequestParameter {
	String serviceUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon";
	String contentId = "";
	
	public String getQueryString() {
		String queryString="";
		queryString += super.getQueryString();
		queryString += "&defaultYN=Y" + "&firstImageYN=Y" + "&addrinfoYN=Y" + "&overviewYN=Y";
		queryString += "&contentId=" + contentId;
		
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
	
}



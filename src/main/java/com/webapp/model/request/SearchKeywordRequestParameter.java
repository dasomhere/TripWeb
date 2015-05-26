package com.webapp.model.request;

import java.net.URLEncoder;
import java.util.Map;

public class SearchKeywordRequestParameter extends RequestParameter {
	String serviceUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword";
	String keyword;
	String contentTypeId = "";
	
	public String getQueryString() {
		String queryString="";
		queryString += super.getQueryString();
		queryString += "&keyword=" + URLEncoder.encode(keyword);
		queryString += "&contentTypeId=" + contentTypeId;
		
		return queryString;
	}
	
	public String getUrl() {
		
		return serviceUrl + "?" + getQueryString();
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getContentTypeId() {
		return contentTypeId;
	}
	
	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}
	
}

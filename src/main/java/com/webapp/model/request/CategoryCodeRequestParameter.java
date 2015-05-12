package com.webapp.model.request;

import java.net.URLEncoder;
import java.util.Map;

public class CategoryCodeRequestParameter extends RequestParameter {
	String serviceUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode";
	
	public String getQueryString() {
		String queryString="";
		queryString += super.getQueryString();
		queryString += "&&contentTypeId=25&cat1=C01";
		
		return queryString;
	}
	public String getUrl() {
		
		return serviceUrl + "?" + getQueryString();
	}

}

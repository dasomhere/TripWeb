package com.webapp.model.request;

import java.net.URLEncoder;
import java.util.Map;

public class CityRequestParameter extends RequestParameter {
	String serviceUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode";
	
	public String getQueryString() {
		String queryString="";
		queryString += super.getQueryString();
		
		return queryString;
	}
	public String getUrl() {
		
		return serviceUrl + "?" + getQueryString();
	}

}



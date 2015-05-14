package com.webapp.model.request;

import java.net.URLEncoder;
import java.util.Map;

public class WeatherRequestParameter {
	String serviceUrl = "http://query.yahooapis.com/v1/public/yql?&u=c&format=json&q=select%20*%20from%20weather.forecast%20where%20woeid=";
	String woeid;
	
	public String getQueryString() {
		String queryString="";
		queryString += serviceUrl;
		queryString += woeid;
		
		return queryString;
	}
	public String getUrl() {
		
		return getQueryString();
	}
	
	public String getWoeid() {
		return woeid;
	}
	public void setWoeid(String woeid) {
		this.woeid = woeid;
	}

	
}

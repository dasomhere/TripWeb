package com.webapp.model.request;



public class DetailImageRequestParameter extends RequestParameter {
	String serviceUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage";
	String contentId = "";
	String imageYN = "";
	
	public String getQueryString() {
		String queryString="";
		queryString += super.getQueryString();
		queryString += "&contentId=" + contentId;
		queryString += "&imageYN=" + imageYN;
		
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
	public String getImageYN() {
		return imageYN;
	}
	public void setImageYN(String imageYN) {
		this.imageYN = imageYN;
	}
	
}

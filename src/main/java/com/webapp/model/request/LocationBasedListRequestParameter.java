package com.webapp.model.request;



public class LocationBasedListRequestParameter extends RequestParameter {
	String serviceUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList";
	String contentTypeId = "";
	String mapX = "";
	String mapY = "";
	String radius = "";
	
	public String getQueryString() {
		String queryString="";
		queryString += super.getQueryString();
		queryString += "&contentTypeId=" + contentTypeId;
		queryString += "&mapX=" + mapX;
		queryString += "&mapY=" + mapY;
		queryString += "&radius=" + radius;
		
		return queryString;
	}

	public String getUrl() {
		return serviceUrl + "?" + getQueryString();
	}

	public String getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}

	public String getMapX() {
		return mapX;
	}

	public void setMapX(String mapX) {
		this.mapX = mapX;
	}

	public String getMapY() {
		return mapY;
	}

	public void setMapY(String mapY) {
		this.mapY = mapY;
	}

	public String getRadius() {
		return radius;
	}

	public void setRadius(String radius) {
		this.radius = radius;
	}

	
}

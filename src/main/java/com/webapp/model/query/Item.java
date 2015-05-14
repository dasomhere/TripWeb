package com.webapp.model.query;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class Item {
	String title;
	String lat;
	@SerializedName("long")
	String lng;
	String link;
	String pubDate;
	Condition condition;
	String description;
	List<Forecast> forecast;
	Guid guid;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public Condition getCondition() {
		return condition;
	}
	public void setCondition(Condition condition) {
		this.condition = condition;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<Forecast> getForecast() {
		return forecast;
	}
	public void setForecast(List<Forecast> forecast) {
		this.forecast = forecast;
	}
	public Guid getGuid() {
		return guid;
	}
	public void setGuid(Guid guid) {
		this.guid = guid;
	}
	
	
	
}

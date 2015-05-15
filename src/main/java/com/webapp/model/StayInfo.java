package com.webapp.model;

public class StayInfo {
	private String contentid;
	private String roomtitle;
	
	public StayInfo(String contentid, String roomtitle) {
		this.contentid = contentid;
		this.roomtitle = roomtitle;
	}

	public String getContentid() {
		return contentid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public String getRoomtitle() {
		return roomtitle;
	}

	public void setRoomtitle(String roomtitle) {
		this.roomtitle = roomtitle;
	}
}

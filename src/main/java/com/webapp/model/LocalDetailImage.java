package com.webapp.model;

public class LocalDetailImage {
	private String originimgurl;
	private String contentid;
	private String serialnum;
	private String smallimageurl;
	private String nullImage;
//	public LocalDetailImage(String originimgurl, String contentid, String serialnum, String smallimageurl) {
//		this.originimgurl = originimgurl;
//		this.contentid = contentid;
//		this.serialnum = serialnum;
//		this.smallimageurl = smallimageurl;
//	}

	public String getNullImage() {
		return nullImage;
	}

	public void setNullImage(String nullImage) {
		this.nullImage = nullImage;
	}

	public String getSerialnum() {
		return serialnum;
	}

	public void setSerialnum(String serialnum) {
		this.serialnum = serialnum;
	}

	public String getSmallimageurl() {
		return smallimageurl;
	}

	public void setSmallimageurl(String smallimageurl) {
		this.smallimageurl = smallimageurl;
	}

	public String getContentid() {
		return contentid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public String getOriginimgurl() {
		return originimgurl;
	}

	public void setOriginimgurl(String originimgurl) {
		this.originimgurl = originimgurl;
	}
	
	
}

package com.webapp.model.response;

import java.util.Map;

public class ResponseObject {
	Header header;
	BodyObject body;
	
	public Header getHeader() {
		return header;
	}
	public void setHeader(Header header) {
		this.header = header;
	}
	public BodyObject getBody() {
		return body;
	}
	public void setBody(BodyObject body) {
		this.body = body;
	}
}

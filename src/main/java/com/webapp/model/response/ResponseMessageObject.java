package com.webapp.model.response;

import java.util.Map;

public class ResponseMessageObject {
	ResponseObject response;
	
	public ResponseMessage getResponseMessage () {
		ResponseMessage msg = new ResponseMessage();
		Body body = new Body();
		
		Header header = response.getHeader();
		response.getBody().getItems();
		
		return msg;
	}

	public ResponseObject getResponse() {
		return response;
	}

	public void setResponse(ResponseObject response) {
		this.response = response;
	}
	
}

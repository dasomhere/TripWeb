package com.webapp.controller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.webapp.model.request.AreaCodeRequestParameter;
import com.webapp.model.response.ResponseMessage;
import com.webapp.service.TourApiService;


public class Test {
	static Log log = LogFactory.getLog(Test.class);
	@org.junit.Test
	public void test() {
		
		TourApiService tour = new TourApiService();
			
		log.info("###############");
		log.info("tour");
		log.info("###############");
		
		AreaCodeRequestParameter request = new AreaCodeRequestParameter();
		ResponseMessage response = tour.getApi(request.getUrl());
		Gson gson = new Gson();
		File file = new File("src/main/webapp/trip/areacode.json");
		FileWriter fileWriter;
		try {
			fileWriter = new FileWriter("src/main/webapp/trip/areacode.json");
			fileWriter.write(gson.toJson(response));
			
			fileWriter.flush();
			fileWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

package com.webapp.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webapp.model.City;
import com.webapp.model.Event;
import com.webapp.model.request.AreaCodeRequestParameter;
import com.webapp.model.request.SearchFestivalRequestParameter;
import com.webapp.model.response.ResponseMessage;
import com.webapp.service.TourApiService;



@Controller
@RequestMapping("/event")
public class EventController {

		static Log log = LogFactory.getLog(EventController.class);

	
	@Autowired
	TourApiService tour;



	@RequestMapping(value="festival", method=RequestMethod.POST)
	@ResponseBody
	public ResponseMessage festival(@RequestBody SearchFestivalRequestParameter request) {
		log.info("###############");
		log.info("festival");
		log.info("###############");
	
		return tour.getApi(request.getUrl());
	}
	
	
	
	
	

}


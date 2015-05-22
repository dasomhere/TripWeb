package com.webapp.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webapp.model.request.AreaBasedListRequestParameter;
import com.webapp.model.request.AreaCodeRequestParameter;
import com.webapp.model.response.ResponseMessage;
import com.webapp.service.TourApiService;


@Controller
@RequestMapping("/map")
public class MapController {
	static Log log = LogFactory.getLog(MapController.class);
	
	@Autowired
	TourApiService tour;
	
	@RequestMapping(value="city", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage city(AreaCodeRequestParameter request) {
		log.info("###############");
		log.info("local");
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="gus", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage gus(AreaCodeRequestParameter request) {
		log.info("###############");
		log.info("gus" + request.getAreaCode());
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage search(AreaBasedListRequestParameter request) {
		log.info("###############");
		log.info("search()..." + request.getAreaCode() + " " + request.getSigunguCode()+ " " + request.getContentTypeId());
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
}

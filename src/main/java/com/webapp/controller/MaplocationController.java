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
import com.webapp.model.request.LocationBasedListRequestParameter;
import com.webapp.model.response.ResponseMessage;
import com.webapp.service.TourApiService;


@Controller
@RequestMapping("/maplocation")
public class MaplocationController {
	static Log log = LogFactory.getLog(MaplocationController.class);
	
	@Autowired
	TourApiService tour;
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage search(LocationBasedListRequestParameter request) {
		log.info("###############");
		log.info("search()..." + request.getContentTypeId() + " " + request.getMapX()+ " " + request.getMapY() + " " + request.getRadius());
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
}

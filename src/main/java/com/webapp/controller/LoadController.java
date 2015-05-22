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
import com.webapp.model.request.CategoryCodeRequestParameter;
import com.webapp.model.request.DetailInfoRequestParameter;
import com.webapp.model.response.ResponseMessage;
import com.webapp.service.TourApiService;


@Controller
@RequestMapping("/load")
public class LoadController {
	static Log log = LogFactory.getLog(LoadController.class);
	
	@Autowired
	TourApiService tour;
		
	@RequestMapping(value="city", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage city(AreaCodeRequestParameter request) {
		log.info("###############");
		log.info("load");
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="category", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage category(CategoryCodeRequestParameter request) {
		log.info("###############");
		log.info("category");
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage search(AreaBasedListRequestParameter request) {
		log.info("###############");
		log.info("search()..." + request.getAreaCode() + " " + request.getCat2());
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage detail(DetailInfoRequestParameter request) {
		log.info("###############");
		log.info("detail()..." + request.getContentId());
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
}


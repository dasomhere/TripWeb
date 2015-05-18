package com.webapp.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webapp.model.request.AreaCodeRequestParameter;
import com.webapp.model.request.DetailIntroRequestParameter;
import com.webapp.model.request.ImageInfoRequestParameter;
import com.webapp.model.request.SearchFestivalRequestParameter;
import com.webapp.model.response.ResponseMessage;
import com.webapp.service.TourApiService;


@Controller
@RequestMapping("/event")
public class EventController {

		static Log log = LogFactory.getLog(EventController.class);

	@Autowired
	TourApiService tour;

	@RequestMapping(value="city", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage city(AreaCodeRequestParameter request) {
		log.info("###############");
		log.info("city");
		log.info("###############");
	
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="festival", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage festival(SearchFestivalRequestParameter request) {
		log.info("###############");
		log.info("festival");
		log.info("###############");
	
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage detail(DetailIntroRequestParameter request) {
		log.info("###############");
		log.info("detail" +request.getUrl());
		log.info("###############");
	
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="detailImage", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage detailImage(ImageInfoRequestParameter request) {
		log.info("###############");
		log.info("detail" +request.getUrl());
		log.info("###############");
	
		return tour.getApi(request.getUrl());
	}
	
}


package com.webapp.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webapp.model.request.DetailCommonRequestParameter;
import com.webapp.model.request.DetailImageRequestParameter;
import com.webapp.model.request.DetailInfoRequestParameter;
import com.webapp.model.request.DetailIntroRequestParameter;
import com.webapp.model.request.SearchKeywordRequestParameter;
import com.webapp.model.response.ResponseMessage;
import com.webapp.service.TourApiService;


@Controller
@RequestMapping("/search")
public class SearchController {
	static Log log = LogFactory.getLog(SearchController.class);
	
	@Autowired
	TourApiService tour;
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage search(SearchKeywordRequestParameter request) {
		log.info("###############");
		log.info("search()..." + request.getKeyword());
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="detailImage", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage detailImage(DetailImageRequestParameter request) {
		log.info("###############");
		log.info("detail()..." + request.getContentId());
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="detailCommon", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage detailCommon(DetailCommonRequestParameter request) {
		log.info("###############");
		log.info("detail()..." + request.getContentId());
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="detailIntro", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage detailIntro(DetailIntroRequestParameter request) {
		log.info("###############");
		log.info("detail" +request.getUrl());
		log.info("###############");
	
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="detailInfo", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage detailInfo(DetailInfoRequestParameter request) {
		log.info("###############");
		log.info("detail" +request.getUrl());
		log.info("###############");
	
		return tour.getApi(request.getUrl());
	}
	
}


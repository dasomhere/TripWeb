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
import com.webapp.model.request.DetailCommonRequestParameter;
import com.webapp.model.request.DetailIntroRequestParameter;
import com.webapp.model.request.ImageInfoRequestParameter;
import com.webapp.model.request.SearchStayRequestParameter;
import com.webapp.model.response.ResponseMessage;
import com.webapp.service.TourApiService;


@Controller
@RequestMapping("/local")
public class LocalController {
	static Log log = LogFactory.getLog(LocalController.class);
	
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
	@RequestMapping(value="searchhanok", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage searchHanOk(SearchStayRequestParameter request) {
		log.info("###############");
		log.info("searchhanOk()..." + request.getAreaCode() + " " + request.getSigungucode()+ " " + request.getContentTypeId()+" " + request.getHanOk());
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="detailcommon", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage detailCommon(DetailCommonRequestParameter request) {
		log.info("###############");
		log.info("local detailCommon");
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="detailintro", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage detailIntro(DetailIntroRequestParameter request) {
		log.info("###############");
		log.info("local detailintro");
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="imageIintro", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage imageIntro(ImageInfoRequestParameter request) {
		log.info("###############");
		log.info("local imageIntro");
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
//	@RequestMapping(value="stayinfo", method=RequestMethod.GET)
//	@ResponseBody
//	public ResponseMessage hanokinfo(StayInfoRequestParameter request) {
//		log.info("###############");
//		log.info("stay change");
//		log.info("###############");
//		
//		return tour.getApi(request.getUrl());
//	}
//	@RequestMapping(value="goodstayinfo", method=RequestMethod.GET)
//	@ResponseBody
//	public ResponseMessage goodStayinfo(goodStayInfoRequestParameter request) {
//		log.info("###############");
//		log.info("local goodstayinfo");
//		log.info("###############");
//		
//		return tour.getApi(request.getUrl());
//	}
}

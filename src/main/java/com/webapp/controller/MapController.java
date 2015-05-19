package com.webapp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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

import com.webapp.model.GuanGuangJi;
import com.webapp.model.Gus;
import com.webapp.model.LocalCategory;
import com.webapp.model.LocalDetailImage;
import com.webapp.model.LocalDetailInfo;
import com.webapp.model.LocalSearch;
import com.webapp.model.request.AreaBasedListRequestParameter;
import com.webapp.model.request.AreaCodeRequestParameter;
import com.webapp.model.request.CategoryCodeRequestParameter;
import com.webapp.model.request.DetailCommonRequestParameter;
import com.webapp.model.request.DetailInfoRequestParameter;
import com.webapp.model.request.DetailIntroRequestParameter;
import com.webapp.model.request.StayInfoRequestParameter;
import com.webapp.model.request.ImageInfoRequestParameter;
import com.webapp.model.request.SearchStayRequestParameter;
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
	
}

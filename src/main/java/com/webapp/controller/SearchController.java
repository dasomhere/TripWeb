package com.webapp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.xml.soap.Detail;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import com.webapp.model.City;
import com.webapp.model.DetailInfo;
import com.webapp.model.GuanGuangJi;
import com.webapp.model.Gus;
import com.webapp.model.LoadCategory;
import com.webapp.model.LoadDetailInfo;
import com.webapp.model.LoadSearch;
import com.webapp.model.Weather;
import com.webapp.model.request.AreaBasedListRequestParameter;
import com.webapp.model.request.AreaCodeRequestParameter;
import com.webapp.model.request.CategoryCodeRequestParameter;
import com.webapp.model.request.DetailInfoRequestParameter;
import com.webapp.model.request.SearchKeywordRequestParameter;
import com.webapp.model.response.Items;
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
	
	@RequestMapping(value="city", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage city(AreaCodeRequestParameter request) {
		log.info("###############");
		log.info("search.city()...");
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
	@RequestMapping(value="sigungu", method=RequestMethod.GET)
	@ResponseBody
	public ResponseMessage sigungu(AreaCodeRequestParameter request) {
		log.info("###############");
		log.info("search.sigungu()...");
		log.info("###############");
		
		return tour.getApi(request.getUrl());
	}
	
//	@RequestMapping(value="detail", method=RequestMethod.GET)
//	@ResponseBody
//	public ResponseMessage detail(DetailInfoRequestParameter request) {
//		log.info("###############");
//		log.info("detail()..." + request.getContentId());
//		log.info("###############");
//		
//		return tour.getApi(request.getUrl());
//	}
}


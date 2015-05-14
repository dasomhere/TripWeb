package com.webapp.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webapp.model.query.QueryMessage;
import com.webapp.model.request.WeatherRequestParameter;
import com.webapp.service.WeatherApiService;


@Controller
@RequestMapping("/weather")
public class WeatherController {
	static Log log = LogFactory.getLog(WeatherController.class);
	
	@Autowired
	WeatherApiService weather;
	
	@RequestMapping(value="weather", method=RequestMethod.GET)
	@ResponseBody
	public QueryMessage weather(WeatherRequestParameter request) {
		log.info("###############");
		log.info("weather() woeid = " + request.getWoeid());
		log.info("###############");
		
		return weather.getApi(request.getUrl());
	}
}


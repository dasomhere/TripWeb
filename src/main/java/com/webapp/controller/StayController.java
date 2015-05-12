package com.webapp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.naming.directory.SearchResult;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webapp.model.City;
import com.webapp.model.LoadSearch;
import com.webapp.model.LocalCategory;
import com.webapp.model.LocalDetailInfo;
import com.webapp.model.GuanGuangJi;
import com.webapp.model.Gus;
import com.webapp.model.LocalSearch;


@Controller
@RequestMapping("/stay")
public class StayController {
	static Log log = LogFactory.getLog(StayController.class);
	
	@RequestMapping(value="stay", method=RequestMethod.GET)
	@ResponseBody
	public List<City> city() throws IOException, ParseException{
		log.info("###############");
		log.info("local");
		log.info("###############");
		
		List<City> list = new ArrayList<City>();
		
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?numOfRows=30&pageNo=1&MobileOS=AND&MobileApp=myxxx&_type=json&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		
		URL get = new URL(url+key);
		InputStream in = get.openStream();

		JSONParser parser = new JSONParser();

		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
		
		JSONObject response = (JSONObject) jsonObject.get("response");
		JSONObject header = (JSONObject) response.get("header");
		
		JSONObject body = (JSONObject) response.get("body");
		JSONObject items = (JSONObject) body.get("items");
		JSONArray item = (JSONArray) items.get("item");
		
		Iterator<JSONObject> iterator = item.iterator();
		while (iterator.hasNext()) {
			JSONObject obj = (JSONObject)iterator.next();
			Long code = (Long)obj.get("code");
			String name = (String)obj.get("name");
			
			log.info(code);
			log.info(name);
			list.add(new City(code, name));
		}
		return list;
	}
}
	

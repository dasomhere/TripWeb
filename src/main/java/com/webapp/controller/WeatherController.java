package com.webapp.controller;

import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


@Controller
@RequestMapping("/weather")
public class WeatherController {
		static Log log = LogFactory.getLog(WeatherController.class);
	
	@RequestMapping(value="weather", method=RequestMethod.GET, headers="Accept=application/json")
	@ResponseBody
	public List<String> weather() throws IOException, ParseException{
		log.info("###############");
		log.info("weather");
		log.info("###############");
		List<String> list = new ArrayList<String>();
		
		String url_start = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService/ForecastGrib?ServiceKey=";
		String key = "7d%2FbbFXB0fawdZ9r5xCVp486QYWCNaTz71MAAHegiYr8HK%2B%2FIKupIlmIiHZhRIY5%2F9PI2v%2Fkd50vmNV%2FLVAAjQ%3D%3D";
		String url_end = "& region= 5%EC%9B%94&_type=json";
		
		URL get = new URL(url_start+key+url_end);
		InputStream in = get.openStream();
		
		JSONObject obj = new JSONObject();
		
		try {
			 
			FileWriter file = new FileWriter("test.json");
			file.write(obj.toJSONString());
			file.flush();
			file.close();
	 
		} catch (IOException e) {
			e.printStackTrace();
		}
	 
		System.out.print(obj);
		
		

//		JSONParser parser = new JSONParser();
//		
//		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
//		
//		JSONObject response = (JSONObject) jsonObject.get("response");
//		JSONObject header = (JSONObject) response.get("header");
//		
//		JSONObject body = (JSONObject) response.get("body");
//		JSONObject items = (JSONObject) body.get("items");
//		JSONArray item = (JSONArray) items.get("item");
//		
//		Iterator<JSONObject> iterator = item.iterator();
//		while (iterator.hasNext()) {
////			List<LocalApi> name = (List<LocalApi>) iterator.next().get("name");
//			String name = (String)iterator.next().get("name");
//			list.add(name);
////			log.info(name);
//		}
////		log.info(name);
//		
		return list;
	}
}


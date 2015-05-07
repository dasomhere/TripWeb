package com.webapp.controller;

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

import com.webapp.model.GangSeo;


@Controller
@RequestMapping("/local")
public class LocalController {
		static Log log = LogFactory.getLog(LocalController.class);
	
	@RequestMapping(value="city", method=RequestMethod.GET, headers="Accept=application/json")
	@ResponseBody
	public List<String> City() throws IOException, ParseException{
		log.info("###############");
		log.info("local");
		log.info("###############");
		List<String> list = new ArrayList<String>();
		
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?numOfRows=10&pageNo=1&MobileOS=AND&MobileApp=myxxx&_type=json&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
//		String seoul = "&areaCode=1&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTesting";
		
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
//			List<LocalApi> name = (List<LocalApi>) iterator.next().get("name");
			String name = (String)iterator.next().get("name");
			list.add(name);
//			log.info(name);
		}
//		log.info(name);
		
		return list;
	}
	
	@RequestMapping(value="seoul", method=RequestMethod.GET, headers="Accept=application/json")
	@ResponseBody
	public List<String> Seoul() throws IOException, ParseException{
		log.info("###############");
		log.info("local");
		log.info("###############");
		List<String> list = new ArrayList<String>();
		
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?numOfRows=5000&pageNo=1&MobileOS=AND&MobileApp=myxxx&_type=json&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		String seoul = "&areaCode=1&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTesting";
		
		URL get = new URL(url+key+seoul);

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
			String name = (String)iterator.next().get("name");
			list.add(name);
		}
		
		return list;
	}
	@RequestMapping(value="nature", method=RequestMethod.GET, headers="Accept=application/json")
	@ResponseBody
	public List<GangSeo> seoulNature() throws IOException, ParseException{
		log.info("###############");
		log.info("seoulNature");
		log.info("###############");
		List<GangSeo> list = new ArrayList<GangSeo>();
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?&contentTypeId=12&areaCode=1&sigunguCode=4&MobileOS=ETC&MobileApp=AppTesting&_type=json&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		
		URL get = new URL(url+key);
		System.out.println(get);
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
			String title = (String) iterator.next().get("title");
			String firstimage = (String) iterator.next().get("firstimage2");

			GangSeo gs = new GangSeo();
			gs.setTitle(title);
			gs.setFirstimage(firstimage);
			list.add(gs);
			
			log.info(firstimage);
			log.info(title);
		}
		
		return list;
	}
	
}


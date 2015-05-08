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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webapp.model.City;
import com.webapp.model.DetailInfo;
import com.webapp.model.GuanGuangJi;
import com.webapp.model.Gus;


@Controller
@RequestMapping("/local")
public class LocalController {
		static Log log = LogFactory.getLog(LocalController.class);
	
	@RequestMapping(value="city", method=RequestMethod.GET)
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
	
	@RequestMapping(value="gus", method=RequestMethod.GET)
	@ResponseBody
	public List<Gus> gus(Integer cityCode) throws IOException, ParseException{
		log.info("###############");
		log.info("local");
		log.info("CityCode = " + cityCode);
		log.info("###############");
		List<Gus> list = new ArrayList<Gus>();
		
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?numOfRows=100&pageNo=1&MobileOS=AND&MobileApp=myxxx&_type=json&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		String areaCode = "&areaCode="+cityCode;
		
		URL get = new URL(url+key+areaCode);

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
			list.add(new Gus(code, name));
		}
		
		return list;
	}
	@RequestMapping(value="type", method=RequestMethod.GET)
	@ResponseBody
	public List<GuanGuangJi> guanGuang(Integer cityCode, Integer sigunguCode, Integer contentTypeId) throws IOException, ParseException{
		log.info("###############");
		log.info("local");
		log.info("CityCode = " + cityCode);
		log.info("areaCode = " + sigunguCode);
		log.info("contentTypeId = " + contentTypeId);
		log.info("###############");
		List<GuanGuangJi> list = new ArrayList<GuanGuangJi>();

		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=myxxx&_type=json&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		String type = "&areaCode="+ cityCode +"&contentTypeId="+contentTypeId+"&sigunguCode="+sigunguCode;
//		log.info(type);

		URL get = new URL(url+key+type);
		log.info(get);
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
			
			String title = (String)obj.get("title");
			String firstimage = (String)obj.get("firstimage2");
			Long contentid = (Long)obj.get("contentid");
			if(firstimage == null){
				firstimage = "http://placehold.it/150x100/808080/ffffff&text=No Image!";
			}
			if(title == null){
				title = null;
			}
			
			list.add(new GuanGuangJi(title, firstimage, contentid));
		}
		log.info("전송성공");
		return list;
	}
	@ResponseBody
	@RequestMapping(value="detail", method=RequestMethod.POST)
	public List<DetailInfo> detail(@RequestBody DetailInfo detail) throws IOException, ParseException{
		log.info("###############");
		log.info("local");
		log.info("contentId = " + detail.getContentid());
		log.info("###############");
		List<DetailInfo> list = new ArrayList<DetailInfo>();

		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?defaultYN=Y&MobileOS=ETC&MobileApp=myxxx&_type=json&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		String details = "&contentId="+detail.getContentid();

		URL get = new URL(url+key+details);
		log.info(get);
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
			
			String title = (String)obj.get("title");
			String firstimage2 = (String)obj.get("firstimage2");

			DetailInfo d = new DetailInfo();
			d.setTitle(title);
			log.info(d);
//			d.setFirstimage2(firstimage2);
			list.add(d);
		}
		return list;
	}
	
}


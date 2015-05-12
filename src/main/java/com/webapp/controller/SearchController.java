package com.webapp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.xml.soap.Detail;

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
import com.webapp.model.LoadCategory;
import com.webapp.model.LoadDetailInfo;
import com.webapp.model.LoadSearch;
import com.webapp.model.Weather;


@Controller
@RequestMapping("/search")
public class SearchController {
		static Log log = LogFactory.getLog(SearchController.class);
	
	@RequestMapping(value="city", method=RequestMethod.GET)
	@ResponseBody
	public List<City> city() throws IOException, ParseException{
		log.info("###############");
		log.info("load");
		log.info("###############");
		
		List<City> list = new ArrayList<City>();
		
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?numOfRows=30&pageNo=1&MobileOS=AND&MobileApp=myxxx&_type=json&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		
		URL get = new URL(url+key);
		InputStream in = get.openStream();

		JSONParser parser = new JSONParser();

		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
		
		JSONObject response = (JSONObject) jsonObject.get("response");
		
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
	
	@RequestMapping(value="category", method=RequestMethod.GET)
	@ResponseBody
	public List<LoadCategory> category() throws IOException, ParseException{
		log.info("###############");
		log.info("category");
		log.info("###############");
		
		List<LoadCategory> list = new ArrayList<LoadCategory>();
		
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?numOfRows=50&pageNo=1&MobileOS=AND&MobileApp=myxxx&_type=json&contentTypeId=25&cat1=C01&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		
		URL get = new URL(url+key);
		InputStream in = get.openStream();

		JSONParser parser = new JSONParser();

		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
		
		JSONObject response = (JSONObject) jsonObject.get("response");
		
		JSONObject body = (JSONObject) response.get("body");
		JSONObject items = (JSONObject) body.get("items");
		JSONArray item = (JSONArray) items.get("item");
		
		Iterator<JSONObject> iterator = item.iterator();
		while (iterator.hasNext()) {
			JSONObject obj = (JSONObject)iterator.next();
			String code = (String)obj.get("code");
			String name = (String)obj.get("name");
			
			list.add(new LoadCategory(code, name));
			log.info("code = " + code + " name = " + name);
		}

		return list;
	}
	
	@RequestMapping(value="search", method=RequestMethod.POST)
	@ResponseBody
	public List<GuanGuangJi> search(@RequestBody LoadSearch search) throws IOException, ParseException{
		log.info("###############");
		log.info("search()..." + search.getCity() + " " + search.getCategory());
		log.info("###############");
		
		List<GuanGuangJi> list = new ArrayList<GuanGuangJi>();
		
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?numOfRows=50&pageNo=1&MobileOS=AND&MobileApp=myxxx&_type=json&contentTypeId=25"
				   + "&areaCode=" + search.getCity()
				   + "&cat2=" + search.getCategory() + "&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		
		URL get = new URL(url+key);
		InputStream in = get.openStream();

		JSONParser parser = new JSONParser();
		
		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
		
		JSONObject response = (JSONObject) jsonObject.get("response");
		
		JSONObject body = (JSONObject) response.get("body");
		Long totalCount = (Long) body.get("totalCount");
		log.info("totalCount = " + totalCount);
		
		switch (String.valueOf(totalCount)) {
		case "0":
			
			break;
		case "1":
			JSONObject items = (JSONObject) body.get("items");
			JSONObject item = (JSONObject)items.get("item");

			String title = (String)item.get("title");
			String firstimage = (String)item.get("firstimage2");
			if(firstimage == null){
				firstimage = "http://placehold.it/150x100/808080/ffffff&text=No Image!";
			}
			Long contentid = (Long)item.get("contentid");
			list.add(new GuanGuangJi(title, firstimage, contentid));
			break;

		default:
			JSONObject items1 = (JSONObject) body.get("items");
			JSONArray item1 = (JSONArray) items1.get("item");
			Iterator<JSONObject> iterator = item1.iterator();

			while (iterator.hasNext()) {
				JSONObject obj = (JSONObject)iterator.next();

				String title1 = (String)obj.get("title");
				String firstimage1 = (String)obj.get("firstimage2");
				if(firstimage1 == null){
					firstimage1 = "http://placehold.it/150x100/808080/ffffff&text=No Image!";
				}
				Long contentid1 = (Long)obj.get("contentid");
				list.add(new GuanGuangJi(title1, firstimage1, contentid1));
			}
			break;
		}
		return list;
	}
	
	@RequestMapping(value="detail", method=RequestMethod.POST)
	@ResponseBody
	public List<LoadDetailInfo> detail(@RequestBody DetailInfo detailInfo) throws IOException, ParseException{
		log.info("###############");
		log.info("search()..." + detailInfo.getContentid() + " " +  detailInfo.getTitle());
		log.info("###############");
		
		List<LoadDetailInfo> list = new ArrayList<LoadDetailInfo>();
		String title = detailInfo.getTitle();
		
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?numOfRows=50&pageNo=1&MobileOS=AND&MobileApp=myxxx&_type=json"
				   + "&contentTypeId=25"
				   + "&contentId=" + detailInfo.getContentid()
				   + "&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		
		URL get = new URL(url+key);
		InputStream in = get.openStream();

		JSONParser parser = new JSONParser();
		
		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
		
		JSONObject response = (JSONObject) jsonObject.get("response");
		
		JSONObject body = (JSONObject) response.get("body");
		JSONObject items = (JSONObject) body.get("items");

		
		JSONArray item = (JSONArray) items.get("item");
		Iterator<JSONObject> iterator = item.iterator();

		while (iterator.hasNext()) {
			JSONObject obj = (JSONObject)iterator.next();
			Long subnum = (Long)obj.get("subnum");
			String subname = (String)obj.get("subname");
			String subdetailoverview = (String)obj.get("subdetailoverview");
			String subdetailimg = (String)obj.get("subdetailimg");
			if(subdetailimg == null){
				subdetailimg = "http://placehold.it/150x100/808080/ffffff&text=No Image!";
			}
			list.add(new LoadDetailInfo(title, subnum, subname, subdetailoverview, subdetailimg));
		}
		return list;
	}
}


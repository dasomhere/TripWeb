package com.webapp.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
<<<<<<< HEAD
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
=======
import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> 9a3574bb1cbe56ee356a7ef5ccb806818e331468
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

<<<<<<< HEAD
import com.webapp.model.City;
import com.webapp.model.Event;
import com.webapp.model.Eventmonth;
=======
import com.webapp.model.request.AreaCodeRequestParameter;
import com.webapp.model.request.SearchFestivalRequestParameter;
import com.webapp.model.response.ResponseMessage;
import com.webapp.service.TourApiService;
>>>>>>> 9a3574bb1cbe56ee356a7ef5ccb806818e331468


@Controller
@RequestMapping("/event")
public class EventController {
<<<<<<< HEAD
		static Log log = LogFactory.getLog(EventController.class);
=======
	static Log log = LogFactory.getLog(EventController.class);
	
	@Autowired
	TourApiService tour;
>>>>>>> 9a3574bb1cbe56ee356a7ef5ccb806818e331468
	
	@RequestMapping(value="festival", method=RequestMethod.POST)
	@ResponseBody
<<<<<<< HEAD
	public List<Event> event(@RequestBody Eventmonth city) throws IOException, ParseException{
=======
	public ResponseMessage city(AreaCodeRequestParameter request) {
>>>>>>> 9a3574bb1cbe56ee356a7ef5ccb806818e331468
		log.info("###############");
		log.info("event" + city.getCitys() + "month" + city.getMonth());
		log.info("###############");
		
		List<Event> list = new ArrayList<Event>();
		
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?cat1=A02&cat2=A0207&arrange=A&listYN=Y&pageNo=1&numOfRows=200&MobileOS=ETC&MobileApp=AppTesting&_type=json&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		String areaCode = "&areaCode="+city.getCitys();
		String month = city.getMonth();
		String eventDay = "&eventStartDate=2015"+month+"01&eventEndDate=2015"+month+"31";
		
		Event e = new Event();
		
		URL get = new URL(url+key+areaCode+eventDay);
		log.info(get);
		InputStream in = get.openStream();

		JSONParser parser = new JSONParser();

		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
		
		JSONObject response = (JSONObject) jsonObject.get("response");
		JSONObject header = (JSONObject) response.get("header");
		
		JSONObject body = (JSONObject) response.get("body");
		Long totalCount = (Long) body.get("totalCount");
		log.info(totalCount);
		
		if(totalCount == 0){
			String firstimage = "http://placehold.it/200x250/808080/ffffff&text=No imgage!"; 
			
			e.setFirstimage(firstimage);
			list.add(e);
			
			return list;
			
		}
		
		
		JSONObject items = (JSONObject) body.get("items");
		JSONArray item = (JSONArray) items.get("item");
		
		Iterator<JSONObject> iterator = item.iterator();
		while (iterator.hasNext()) {
			JSONObject obj = (JSONObject)iterator.next();
			String title = (String)obj.get("title");
			
			String firstimage = (String)obj.get("firstimage");
			if(firstimage == null){
				firstimage = "http://placehold.it/200x250/808080/ffffff&text=No Image!"; 
			}
			
			String addr1 = (String)obj.get("addr1");
			String tel = (String)obj.get("tel");
			Long eventstartdate = (Long)obj.get("eventstartdate");
			Long eventenddate = (Long)obj.get("eventenddate");
			
			log.info(firstimage);
			log.info(addr1);
			log.info(tel);
			
			list.add(new Event(title, firstimage, addr1, tel, eventstartdate, eventenddate));
		}

		
		return list;
	}
	
<<<<<<< HEAD
=======
	@RequestMapping(value="festival", method=RequestMethod.POST)
	@ResponseBody
	public ResponseMessage festival(@RequestBody SearchFestivalRequestParameter request) {
		log.info("###############");
		log.info("festival");
		log.info("###############");
	
		return tour.getApi(request.getUrl());
	}
	
	
	
	
	
>>>>>>> 9a3574bb1cbe56ee356a7ef5ccb806818e331468

}


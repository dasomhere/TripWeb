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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webapp.model.City;
import com.webapp.model.LoadSearch;
import com.webapp.model.LocalCategory;
import com.webapp.model.LocalDetailImage;
import com.webapp.model.LocalDetailInfo;
import com.webapp.model.GuanGuangJi;
import com.webapp.model.Gus;
import com.webapp.model.LocalSearch;
import com.webapp.model.request.CityRequestParameter;
import com.webapp.model.response.ResponseMessage;
import com.webapp.service.TourApiService;


@Controller
@RequestMapping("/local")
public class LocalController {
		static Log log = LogFactory.getLog(LocalController.class);
	
	@Autowired
	TourApiService tour;
	
	@RequestMapping(value="city", method=RequestMethod.GET)
	public ResponseMessage city(CityRequestParameter request) {
		log.info("###############");
		log.info("local");
		log.info("###############");
		
		return tour.getApi(request.getUrl());
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
	
	@RequestMapping(value="search", method=RequestMethod.POST)
	@ResponseBody
	public List<GuanGuangJi> serch(@RequestBody LocalSearch result) throws IOException, ParseException{
		log.info("###############");
		log.info("local");
		log.info("CityCode = " + result.getCity());
		log.info("areaCode = " + result.getGus());
		log.info("contentTypeId = " + result.getContentid());
		log.info("###############");
		List<GuanGuangJi> list = new ArrayList<GuanGuangJi>();

		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=myxxx&_type=json&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		String type = "&areaCode="+ result.getCity() +"&contentTypeId="+result.getContentid()+"&sigunguCode="+result.getGus();
		log.info(type);

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
//			
			list.add(new GuanGuangJi(title, firstimage, contentid));
		}
		log.info("전송성공");
		return list;
	}
	
	@RequestMapping(value="detail", method=RequestMethod.POST)
	@ResponseBody
	public List<LocalDetailInfo> detail(@RequestBody LocalCategory detail) throws IOException, ParseException{
		log.info("###############");
		log.info("local");
		log.info("contentId = " + detail.getContentid());
		log.info("contenttypeid = " + detail.getContenttypeid());
		log.info("###############");
		
		List<LocalDetailInfo> list = new ArrayList<LocalDetailInfo>();

		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?MobileOS=ETC&MobileApp=myxxx&_type=json&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		String details = "&contentId="+detail.getContentid() + "&contentTypeId=" + detail.getContenttypeid() + "&introYN=Y";
		URL get = new URL(url+key+details);
		log.info(get);
		InputStream in = get.openStream();
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
		JSONObject response = (JSONObject) jsonObject.get("response");
		JSONObject header = (JSONObject) response.get("header");
		JSONObject body = (JSONObject) response.get("body");
		JSONObject items = (JSONObject) body.get("items");
		JSONObject item = (JSONObject) items.get("item");
		
//		Integer num = Integer.parseInt(detail.getContenttypeid());
		
		LocalDetailInfo info = new LocalDetailInfo();
		String chkbabycarriage = (String)item.get("chkbabycarriage");
		String chkcreditcard = (String)item.get("chkcreditcard");
		String chkpet = (String)item.get("chkpet");
//		String contentid = (String)item.get("contentid");
		String infocenter = (String)item.get("infocenter");
		String parking = (String)item.get("parking");
		String restdate = (String)item.get("restdate");
		String usetime = (String)item.get("usetime");	
		
		info.setChkbabycarriage(chkbabycarriage);
		info.setChkcreditcard(chkcreditcard);
		info.setChkpet(chkpet);
		info.setInfocenter(infocenter);
		if(parking!=null){
			info.setParking(parking);
		}else {
			parking = "없음";
			info.setParking(parking);
		}
		if(restdate!=null){
			info.setRestdate(restdate);
		}else {
			restdate = "휴무일 홈페이지 참조";
			info.setRestdate(restdate);
		}
		info.setUsetime(usetime);
//		
		list.add(info);
		return list;
		
	}
	@RequestMapping(value="detailImage", method=RequestMethod.POST)
	@ResponseBody
	public List<LocalDetailImage> detaila(@RequestBody LocalCategory detail) throws IOException, ParseException{
		log.info("###############");
		log.info("localImage");
		log.info("contentId = " + detail.getContentid());
		log.info("contenttypeid = " + detail.getContenttypeid());
		log.info("###############");
		
		List<LocalDetailImage> list = new ArrayList<LocalDetailImage>();
		LocalDetailImage image = new LocalDetailImage();
		
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?MobileOS=ETC&MobileApp=myxxx&_type=json&ServiceKey=";
		String key = "sA7tgy37XyQzBU2fPZpZw%2BGKNlR0BPdgP2RhAvNrw4ls2so%2F%2BgeLDAT8AHJO6CacIlHvKIfubhwPjiDXpy%2B7%2Fw%3D%3D";
		String details = "&contentId="+detail.getContentid() + "&contentTypeId=" + detail.getContenttypeid() + "&imageYN=Y";
		URL get = new URL(url+key+details);
		log.info(get);
		
		InputStream in = get.openStream();
		JSONParser parser = new JSONParser();
		
		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
		JSONObject response = (JSONObject) jsonObject.get("response");
		JSONObject header = (JSONObject) response.get("header");
		JSONObject body = (JSONObject) response.get("body");
		Long totalCount = (Long) body.get("totalCount");
		log.info("totalCount = " + totalCount);
		
		
		if(totalCount == 0){
			String originimgurl = "http://placehold.it/150x100/808080/ffffff&text=No Image!";
			image.setOriginimgurl(originimgurl);
			
			list.add(image);
			
			return list;
		}
		
		JSONObject items = (JSONObject) body.get("items");
		JSONArray item = (JSONArray) items.get("item");
		Iterator<JSONObject> iterator = item.iterator();
			
		
		while (iterator.hasNext()) {
			JSONObject obj = (JSONObject)iterator.next();
			
			
			
			String originimgurl = (String)obj.get("originimgurl");
			if(originimgurl == null){
				originimgurl = "http://placehold.it/150x100/808080/ffffff&text=No Image!";
			}
			log.info(originimgurl);
//			String contentid = (String)obj.get("contentid");
			String serialnum = (String)obj.get("serialnum");
//			String smallimageurl = (String)obj.get("smallimageurl");
			image.setOriginimgurl(originimgurl);
			image.setSerialnum(serialnum);
			
			list.add(image); 
		}
		return list;
		
	}
}

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
import java.util.Scanner;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.webapp.model.User;
import com.webapp.model.Weather;


@Controller
@RequestMapping("/weather")
public class WeatherController {
		static Log log = LogFactory.getLog(WeatherController.class);
	
	@RequestMapping(value="weather", method=RequestMethod.POST)
	@ResponseBody
	public Weather weather(@RequestBody Weather weather) throws IOException, ParseException{
		log.info("###############");
		log.info("weather() woeid = " + weather.getWoeid());
		log.info("###############");
		String url_start = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid=";
		int woeid = weather.getWoeid();
		String url_end = "&u=c&format=json";
		URL get = new URL(url_start + woeid + url_end);
		InputStream in = get.openStream();
		Scanner s = new Scanner(in);
		
		JSONParser parser = new JSONParser();
		
		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
		
		JSONObject query = (JSONObject) jsonObject.get("query");
		JSONObject results = (JSONObject) query.get("results");
		JSONObject channel = (JSONObject) results.get("channel");
		JSONObject location = (JSONObject) channel.get("location");
		
		String city = (String) location.get("city");
		weather.setCity(city);
		log.info("city = " + city);
		
		JSONObject wind = (JSONObject) channel.get("wind");
		int nowWindSpeed = Integer.parseInt((String) wind.get("speed"));
		weather.setNowWindSpeed(nowWindSpeed);
		log.info("nowWindSpeed = " + nowWindSpeed);
		
		JSONObject atmosphere = (JSONObject) channel.get("atmosphere");
		int nowHumidity = Integer.parseInt((String) atmosphere.get("humidity"));
		weather.setNowHumidity(nowHumidity);
		log.info("nowHumidity = " + nowHumidity);
		
		JSONObject item = (JSONObject) channel.get("item");
		JSONObject condition = (JSONObject) item.get("condition");
		String nowConditionText = (String) condition.get("text");
		int nowConditionCode = Integer.parseInt((String) condition.get("code"));
		weather.setNowConditionCode(nowConditionCode);
		weather.setNowConditionText(nowConditionText);
		log.info("nowConditionCode = " + nowConditionCode + " nowConditionText = " + nowConditionText);
		
		double nowTemp = Math.round(((Integer.parseInt((String) condition.get("temp"))-32)/1.8)*10)/10.0;
		weather.setNowTemp(nowTemp);
		log.info("nowTemp = " + nowTemp);
		
		JSONArray forecast = (JSONArray) item.get("forecast");
		
		Iterator<JSONObject> iterator = forecast.iterator();
		int[] code = new int[5];
		String[] day = new String[5];
		double[] high = new double[5];
		double[] low = new double[5];
		String[] text = new String[5];
		int i = 0;
		while(iterator.hasNext()) {
			JSONObject obj = iterator.next();
			code[i] = Integer.parseInt((String)obj.get("code"));
			day[i] = (String)obj.get("day");
			high[i] =  Math.round(((Integer.parseInt((String)obj.get("high"))-32)/1.8)*10)/10.0;
			low[i] =  Math.round(((Integer.parseInt((String)obj.get("low"))-32)/1.8)*10)/10.0;
			text[i] = (String)obj.get("text");
			i += 1;
		}
		
		weather.setCode(code);
		weather.setDay(day);
		weather.setHigh(high);
		weather.setLow(low);
		weather.setText(text);
		
		for(int j=0; j<code.length; j++) {
			log.info("code = " + code[j]
							 + " day = " + day[j]
							 + " high = " + high[j]
							 + " low = " + low[j]
							 + " text = " + text[j]
			);
		}
			
		return weather;
	}
}


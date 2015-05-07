package com.webapp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Date;
import java.util.Iterator;
import java.util.Scanner;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.webapp.model.Weather;

public class Test {

	@org.junit.Test
	public void test() throws IOException, ParseException {
		
		String url_Seoul = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid=1132599&u=c&format=json";
		
		URL get = new URL(url_Seoul);
		InputStream in = get.openStream();
		Scanner s = new Scanner(in);
		Weather weather = new Weather();
		
		JSONParser parser = new JSONParser();
		
		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
		
		JSONObject query = (JSONObject) jsonObject.get("query");
		JSONObject results = (JSONObject) query.get("results");
		JSONObject channel = (JSONObject) results.get("channel");
		JSONObject location = (JSONObject) channel.get("location");
		
		String city = (String) location.get("city");
		weather.setCity(city);
		System.out.println("city = " + city);
		
		JSONObject wind = (JSONObject) channel.get("wind");
		int nowWindSpeed = Integer.parseInt((String) wind.get("speed"));
		weather.setNowWindSpeed(nowWindSpeed);
		System.out.println("nowWindSpeed = " + nowWindSpeed);
		
		JSONObject atmosphere = (JSONObject) channel.get("atmosphere");
		int nowHumidity = Integer.parseInt((String) atmosphere.get("humidity"));
		weather.setNowHumidity(nowHumidity);
		System.out.println("nowHumidity = " + nowHumidity);
		
		JSONObject item = (JSONObject) channel.get("item");
		JSONObject condition = (JSONObject) item.get("condition");
		String nowConditionText = (String) condition.get("text");
		int nowConditionCode = Integer.parseInt((String) condition.get("code"));
		weather.setNowConditionCode(nowConditionCode);
		weather.setNowConditionText(nowConditionText);
		System.out.println("nowConditionCode = " + nowConditionCode + " nowConditionText = " + nowConditionText);
		
		double nowTemp = (Integer.parseInt((String) condition.get("temp"))-32)/1.8;
		weather.setNowTemp(nowTemp);
		System.out.println("nowTemp = " + nowTemp);
		
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
			day[i] = (String)obj.get("day");;
			high[i] = (Integer.parseInt((String)obj.get("high"))-32)/1.8;
			low[i] = (Integer.parseInt((String)obj.get("low"))-32)/1.8;
			text[i] = (String)obj.get("text");
			i += 1;
		}
		
		for(int j=0; j<code.length; j++) {
			System.out.println("code = " + code[j]
							 + " day = " + day[j]
							 + " high = " + high[j]
							 + " low = " + low[j]
							 + " text = " + text[j]
			);
		}
	}

}

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

public class Test {

	@org.junit.Test
	public void test() throws IOException, ParseException {
		
		String url_Seoul = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid=1132599&u=c&format=json";
		
		URL get = new URL(url_Seoul);
		InputStream in = get.openStream();
		Scanner s = new Scanner(in);
		
		JSONParser parser = new JSONParser();
		
		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
		
		JSONObject query = (JSONObject) jsonObject.get("query");
		JSONObject results = (JSONObject) query.get("results");
		JSONObject channel = (JSONObject) results.get("channel");
		JSONObject location = (JSONObject) channel.get("location");
		
		String city = (String) location.get("city");
		System.out.println(city);
		
		JSONObject item = (JSONObject) channel.get("item");
		JSONArray forecast = (JSONArray) item.get("forecast");
		
		Iterator<JSONObject> iterator = forecast.iterator();
		while(iterator.hasNext()) {
			JSONObject obj = iterator.next();
			String date = (String)obj.get("date");
			String day = (String)obj.get("day");
			String high = (String)obj.get("high");
			System.out.println("date = " + date);
			System.out.println("day = " + day);
			System.out.println("high = " + high);
		}
		
//		String url_Seoul = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Seoul&cnt=7&mode=json&units=metric";
//		String url_Chuncheon = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Chuncheon&cnt=7&mode=json&units=metric";
//		String url_Kangneung = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Kang-neung&cnt=7&mode=json&units=metric";
//		String url_Daejeon = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Daejeon&cnt=7&mode=json&units=metric";
//		String url_Cheongju = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Cheongju&cnt=7&mode=json&units=metric";
//		String url_Daegu = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Daegu&cnt=7&mode=json&units=metric";
//		String url_Gwangju = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Gwangju&cnt=7&mode=json&units=metric";
//		String url_Jeonju = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Jeonju&cnt=7&mode=json&units=metric";
//		String url_Busan = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Busan&cnt=7&mode=json&units=metric";
//		String url_Jeju = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Jeju&cnt=7&mode=json&units=metric";
//		
//		URL get = new URL(url_Seoul);
//		InputStream in = get.openStream();
//		Scanner s = new Scanner(in);
//		
//		JSONParser parser = new JSONParser();
//		
//		JSONObject jsonObject = (JSONObject) parser.parse(new InputStreamReader(in));
//		
//		JSONObject city = (JSONObject) jsonObject.get("city");
//		String name = (String)city.get("name");
//		
//		JSONArray list = (JSONArray) jsonObject.get("list");
//		Iterator<JSONObject> iterator = list.iterator();
//		while(iterator.hasNext()) {
//			long dt = (long)iterator.next().get("dt");
//			
//			Date d = new Date(dt*1000);
//			int year = d.getYear();
//			int month = d.getMonth();
//			int date = d.getDate();
//			System.out.println((year + 1900) + "년" + (month+1) + "월" + date + "일");
//			
////			JSONObject temp = (JSONObject) iterator.next().get("temp");
////			double min = (double)temp.get("min");
////			System.out.println("min : " + min);
//		}
//		iterator = list.iterator();
//		while(iterator.hasNext()){
//			JSONObject temp = (JSONObject) iterator.next().get("temp");
//			double min = (double)temp.get("min");
//			double max = (double)temp.get("max");
//			
//			System.out.println("min : " + min);
//			System.out.println("max : " + max);
//		}
//		
//		System.out.println(name);
//		
	}

}

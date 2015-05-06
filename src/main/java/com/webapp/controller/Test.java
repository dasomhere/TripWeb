package com.webapp.controller;

import static org.junit.Assert.*;

import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Scanner;

import org.json.simple.JSONObject;

public class Test {

	@org.junit.Test
	public void test() throws IOException {
		String url_start = "https://oneid.skplanetx.com/oauth/token?client_id=95270dd6-da5c-35ba-8cf2-f9d3a708e8a2&client_secret=7691fd48-9ccb-30ee-ae0f-a65ab653242b&code=authorization code&scope=weather&redirect_uri=http://TripWeb&grant_type=authorization_code";
//		String key = "7d%2FbbFXB0fawdZ9r5xCVp486QYWCNaTz71MAAHegiYr8HK%2B%2FIKupIlmIiHZhRIY5%2F9PI2v%2Fkd50vmNV%2FLVAAjQ%3D%3D";
//		String url_end = "&region=5%EC%9B%94&_type=json";
		
		URL get = new URL(url_start);
		InputStream in = get.openStream();
		Scanner s = new Scanner(in);
		
		JSONObject obj = new JSONObject();
		try {
			FileWriter file = new FileWriter("weather.json");
			file.write(s.nextLine());
			file.flush();
			file.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println(s.nextLine());
		
	}

}

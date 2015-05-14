package com.webapp.service;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import com.google.gson.internal.LinkedTreeMap;
import com.webapp.model.query.QueryMessage;
import com.webapp.model.response.Items;
import com.webapp.model.response.ResponseMessage;

@Service
public class WeatherApiService {

	static Log log = LogFactory.getLog(WeatherApiService.class);
	
	public QueryMessage getApi(String url) {

		Gson g = new GsonBuilder().create();
		
		QueryMessage msg= null;
		InputStream in=null;
		try {
			log.info(url);
			URL u = new URL(url);
			in = u.openStream();
			msg = g.fromJson(new InputStreamReader(in), QueryMessage.class);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JsonSyntaxException e) {
			msg = new QueryMessage();
//			msg.setResponse();
		}
		
		return msg;
	}
}

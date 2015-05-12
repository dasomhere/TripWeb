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
import com.webapp.model.response.Items;
import com.webapp.model.response.ResponseMessage;

@Service
public class TourApiService {

	static Log log = LogFactory.getLog(TourApiService.class);
	
	public ResponseMessage getApi(String url) {

		Gson g = new GsonBuilder().create();
		
		ResponseMessage msg= null;
		InputStream in=null;
		try {
			log.info(url);
			URL u = new URL(url);
			in = u.openStream();
			msg = g.fromJson(new InputStreamReader(in), ResponseMessage.class);
			
			Object obj = msg.getResponse().getBody().getItems();
			if (obj.getClass().equals(String.class)) {
				Items items = new Items();
				msg.getResponse().getBody().setItems(items);
			}
			else if (obj.getClass().equals(LinkedTreeMap.class)  ){
				LinkedTreeMap items = (LinkedTreeMap)obj;
				
				Object item = items.get("item");
				
				if (item.getClass().equals(LinkedTreeMap.class)) {
					Items citems = new Items();
					LinkedTreeMap[] array = new LinkedTreeMap[1];
					array[0] = (LinkedTreeMap)item;
					citems.setItem(array);
					msg.getResponse().getBody().setItems(citems);
				}
			}
				
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JsonSyntaxException e) {
			msg = new ResponseMessage();
//			msg.setResponse();
		}
		
		return msg;
	}
}

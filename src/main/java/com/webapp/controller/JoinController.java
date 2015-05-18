package com.webapp.controller;


import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.webapp.model.JoinResult;
import com.webapp.model.User;
import com.webapp.service.UserInfoService;

@Controller
@RequestMapping("/join")
public class JoinController {
	static Log log = LogFactory.getLog(JoinController.class);

	ApplicationContext factory;
	
	@ResponseBody
	@RequestMapping(value="/check", method=RequestMethod.POST)
	public JoinResult check(@RequestBody User user, HttpSession session) {
		log.info("###########################");
		log.info("### check POST...");
		log.info("id=" + user.getId());
		log.info("###########################");
		
		factory = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
		
		UserInfoService info = factory.getBean(UserInfoService.class);
		
		User us = info.getUserid(user.getId());
		
		JoinResult joinResult = new JoinResult();
		if(us.getId().equals(null))
			joinResult.setStatus(false);
		
		if(us.getId().equals(user.getId()))
			joinResult.setStatus(true);
		
		joinResult.setUser(user);
		return joinResult;
	}
	
	@ResponseBody
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public JoinResult join(@RequestBody User user, HttpSession session) {
		log.info("###########################");
		log.info("### join POST...");
		log.info("name=" + user.getName());
		log.info("id=" + user.getId());
		log.info("pwd=" + user.getPassword());
		log.info("email=" + user.getEmail());
		log.info("###########################");
		
		factory = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
		
		UserInfoService info = factory.getBean(UserInfoService.class);
		JoinResult result = new JoinResult();
		User join = info.setUserInfo(user.getName(), user.getId(), user.getPassword(), user.getEmail());
		result.setUser(join);
		return result;
	}
}



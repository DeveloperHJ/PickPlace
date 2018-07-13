package com.project.pickplace.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*@Controller*/
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET )
	public String home(Model model) {
		
		return "index";
	}
	
	// 메인지도 띄워보려고 생성
	@RequestMapping(value = "/map")
	public String mainMap() {
		return "map/mainmap";
	}
	
	@RequestMapping(value="/example")
	public String example() {
		return "/map/example";
	}
}

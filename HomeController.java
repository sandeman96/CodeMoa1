package com.study.codemoa;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(value = "/home.do")
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value = "/index.do")
	public String index() {
		
		return "index2";
	}
	
	@RequestMapping(value = "/savevideo.do")
	public String savevideo() {
		
		return "savevideo";
	}

}

package com.study.codemoa.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.codemoa.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("loginForm.me")
	public String loginView() {
		return "loginForm";
	}
	
	@RequestMapping("findPwdForm.me")
	public String findPwdView() {
		return "findPwdForm";
	}
	
	@RequestMapping("registerForm.me")
	public String registerForm() {
		return "registerForm";
	}

}

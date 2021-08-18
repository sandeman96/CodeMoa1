package com.study.codemoa.member.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.study.codemoa.member.model.service.MemberService;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

//	@Autowired
//	private MemberService mService;
	
	@RequestMapping("mypage.me")
	public String myPage() {
		
		return "mypage";
	}
	
}

package com.study.codemoa.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.study.codemoa.member.model.service.MemberService;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
=======
import org.springframework.stereotype.Controller;

import com.study.codemoa.member.model.service.MemberService;


@Controller 
public class MemberController {
	@Autowired 
	private MemberService service;
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
	
}

package com.study.codemoa.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.study.codemoa.member.model.service.MemberService;


@Controller 
public class MemberController {
	@Autowired 
	private MemberService service;
	
}

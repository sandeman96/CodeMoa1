package com.study.codemoa.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.codemoa.board.model.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("adminMember.bo")
	public String adminMember() {
		return "adminMember";
	}
	
	@RequestMapping("adminBoard.bo")
	public String adminBoard() {
		return "adminBoard";
	}
	
	@RequestMapping("checkPwd.bo")
	public String checkPwd() {
		return "adminPwdConfirm";
	}
	
	@RequestMapping("updateMember.bo")
	public String updateMember() {
		return "adminUpdateMember";
	}
	
}

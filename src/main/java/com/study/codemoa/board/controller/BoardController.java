package com.study.codemoa.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.codemoa.board.model.service.BoardService;

=======

import com.study.codemoa.board.model.service.BoardService;


>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
<<<<<<< HEAD
	
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
	
=======
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
}
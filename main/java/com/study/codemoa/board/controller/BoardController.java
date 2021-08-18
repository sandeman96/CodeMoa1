package com.study.codemoa.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.study.codemoa.board.model.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
}

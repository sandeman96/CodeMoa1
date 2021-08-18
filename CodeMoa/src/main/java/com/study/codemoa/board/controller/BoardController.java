package com.study.codemoa.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.codemoa.board.model.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("moveTechQnA.bo")
	public String moveTechQnA() {
		return "tech_QnA";
	}
	
	@RequestMapping("moveCommunityCalendar.bo")
	public String moveCommunityCalendar() {
		return "community_Calendar";
	}
	
	@RequestMapping("moveCommunityJob.bo")
	public String moveCommunityJob() {
		return "community_Job";
	}
	
	@RequestMapping("edit.bo")
	public String edit() {
		return "boardEditForm";
	}
	
	@RequestMapping("boardDetail.bo")
	public String boardDetail() {
		return "boardDetail";
	}
	
	@RequestMapping("boardDetailJob.bo")
	public String boardDetailJob() {
		return "boardDetailJob";
	}

	@RequestMapping("editJob.bo")
	public String editJob() {
		return "boardEditFormJob";
	}
}

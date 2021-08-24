package com.study.codemoa.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.codemoa.board.exception.BoardException;
import com.study.codemoa.board.model.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	/* 게시판 이동 */
	@RequestMapping("boardList{boardName}.bo")
	public String boardList(@PathVariable String boardName) {
		
		switch (boardName) {
		case "Faq" : boardName = "boardListFaq"; break;
		case "Tips" : boardName =  "boardListTips"; break;
		case "Study" : boardName = "boardListStudy"; break;
		case "Job" : boardName = "boardListJob"; break;
		case "Calendar" :boardName = "boardListCalendar"; break;
		default: throw new BoardException("게시판 열람에 실패하였습니다.");		
		}

		return boardName;
	}
		
	/*board 글쓰기 폼 이동*/
	@RequestMapping("insertBoardForm.bo")
	public String insertBoardForm() {
		return "insertBoardForm";
	}
	
	/*board 글쓰기*/
	@RequestMapping("insertBoard.bo")
	public String insertBoard() {
		return "";
	}
	
	/*board 상세보기*/
	@RequestMapping("boardDetail.bo")
	public String boardDetail() {
		return "boardDetail";
	}
	
	

	
	
		
	
	
}

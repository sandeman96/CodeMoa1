package com.study.codemoa.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.codemoa.admin.model.service.AdminService;
import com.study.codemoa.admin.model.vo.MemberInfo;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.common.Pagination;
import com.study.codemoa.admin.model.vo.MemberPagination;
import com.study.codemoa.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;
	
	@RequestMapping(value = "/adminPage.ad")
	public ModelAndView selectAll(@RequestParam(value="page", required=false)Integer page, 
								  @RequestParam(value="pageM", required = false)Integer pageM, 
								  Member m, Board b, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int currentPageM = 1;
		if(pageM != null) {
			currentPageM = pageM;
		}
		
		int listCount = adService.getListCount();
		
		int listCountM = adService.getListCountM();
		
		
		MemberInfo mi = MemberPagination.getMemberInfo(currentPageM, listCountM);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Member> mList = adService.selectMember(m, mi);
		ArrayList<Board> bList = adService.selectBoard(b, pi);

		mv.addObject("mList", mList);
		mv.addObject("bList", bList);
		mv.addObject("mi", mi);
		mv.addObject("pi", pi);
		mv.setViewName("adminPage");
		
		return mv;
	}
	
	@RequestMapping("adminBoard.ad")
	public String adminBoard() {
		return "adminBoard";
	}
	
	@RequestMapping("adminMember.ad")
	public String adminMember() {
		return "adminMember";
	}
		
	@RequestMapping("adminCalendar.ad")
	public String adminCalendar() {
		return "calendar";
	}
	
	@RequestMapping("checkPwd.ad")
	public String checkPwd() {
		return "adminPwdConfirm";
	}
	
	@RequestMapping("updateMember.ad")
	public String updateMember() {
		return "adminUpdateMember";
	}
	
//	@RequestMapping("adminPage.ad")
//	public ModelAndView boardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
//		int currentPage = 1;
//		if(page != null) {
//			currentPage = page;
//		}
//		
//		int listCount = adService.getListCount();
//		
//		PageInfo pi	= Pagination.getPageInfo(currentPage, listCount);
//		
//		ArrayList<Board> list = adService.selectList(pi);
//		
//		if(list != null) {
//			mv.addObject("list", list).addObject("pi", pi);
//			// mv.addObject("list" list);
//			// mv.addObject("pi", pi);
//			mv.setViewName("adminPage");
//		} else {
//			throw new BoardException("게시글 전체 조회에 실패했습니다.");
//		}
//		
//		return mv;
//	}
	

}

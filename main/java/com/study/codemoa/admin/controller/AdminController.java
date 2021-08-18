package com.study.codemoa.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.study.codemoa.admin.model.service.AdminService;
import com.study.codemoa.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;
	
//	@RequestMapping("adminPage.ad")
//	public String adminPage() {
//		return "adminPage";
//	}
//	
	@RequestMapping("adminCalendar.ad")
	public String adminCalendar() {
		return "calendar";
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
	
	@RequestMapping(value = "/adminPage.ad", method = RequestMethod.GET)
	public ModelAndView memberList(Member m, ModelAndView mv, Model model) {
		ArrayList<Member> mList = adService.memberList(m);
		
		if(mList != null) {
//			mv.addObject("mList", mList);
			mv.setViewName("adminPage");
		}
		return mv;
	}
}

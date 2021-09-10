package com.study.codemoa.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.study.codemoa.admin.model.exception.AdminException;
import com.study.codemoa.admin.model.service.AdminService;
import com.study.codemoa.admin.model.vo.BoardInfo;
import com.study.codemoa.admin.model.vo.BoardPagination;
import com.study.codemoa.admin.model.vo.MemberInfo;
import com.study.codemoa.admin.model.vo.MemberPagination;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.member.model.vo.Member;

@Controller
public class AdminController {

	@Autowired
	private AdminService adService;

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@RequestMapping(value = "/adminPage.ad")
	public ModelAndView selectAll(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "pageM", required = false) Integer pageM, Member m, Board b, ModelAndView mv) {
		int currentPageB = 1;
		if (page != null) {
			currentPageB = page;
		}

		int currentPageM = 1;
		if (pageM != null) {
			currentPageM = pageM;
		}

		int listCountB = adService.getListCountB();
		int listCountM = adService.getListCountM();

		MemberInfo mi = MemberPagination.getMemberInfo(currentPageM, listCountM);
		BoardInfo bi = BoardPagination.getBoardInfo(currentPageB, listCountB);

		ArrayList<Member> mList = adService.selectMember(m, mi);
		ArrayList<Board> bList = adService.selectBoard(b, bi);

		mv.addObject("mList", mList);
		mv.addObject("bList", bList);
		mv.addObject("mi", mi);
		mv.addObject("bi", bi);
		mv.setViewName("adminPage");

		return mv;
	}

	@RequestMapping("adminCalendar.ad")
	public String adminCalendar() {
		return "calendar";
	}

	/* 사용자 전체 List */
	@RequestMapping("adminMember{memberType}.ad")
	public ModelAndView adminMember(@PathVariable String memberType, String table_search,
			@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
		
		int currentPageM = 1;
		if (page != null) {
			currentPageM = page;
		}

		HashMap<String, String> map = new HashMap<>();
		String madmin = null;
		String mstatus = null;
		
		switch (memberType) {
		case "":
			break;
		case "Out":
			mstatus = "N";
			map.put("mstatus", mstatus);
			break;
		case "User":
			madmin = "N";
			map.put("madmin", madmin);
			break;
		case "Admin":
			madmin = "Y";
			map.put("madmin", madmin);
			break;
		case "Search":
			map.put("table_search", table_search);
			break;
		default:
			throw new AdminException("게시판 조회에 실패하였습니다.");
		}

		int listCountM = adService.getListCountM(map);
		MemberInfo mi = MemberPagination.getMemberInfo(currentPageM, listCountM);
		ArrayList<Member> mList = adService.selectMember(map, mi);
		
		System.out.println(listCountM);
		for(Member m : mList) {
			System.out.println(m);
		}
		
		mv.addObject("mList", mList).addObject("mi", mi).addObject("table_search", table_search);
		mv.setViewName("adminMember");

		return mv;
	}

	/* 사용자 update 전, pwd 확인 */
	@RequestMapping("adminPwdConfirm.ad")
	public String adminPwdConfirm() {
		return "adminPwdConfirm";
	}
	
	/* 비밀번호 일치 확인 */
	@ResponseBody
	@RequestMapping(value="adminPwdCheck.ad", method = RequestMethod.POST)
	public String adminPwdCheck(Member m, ModelAndView mv) {
		
		Member loginUser = adService.pwdCheck(m);
		
		if (bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
			return "success";
		} else {
			return "error";
		}
	}
	
	@RequestMapping("adminUpdateMember{memberType}.ad")
	public ModelAndView adminUpdateMember(@PathVariable String memberType, String table_search,
			@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {

		int currentPageM = 1;
		if (page != null) {
			currentPageM = page;
		}

		HashMap<String, String> map = new HashMap<>();
		String madmin = null;
		String mstatus = null;

		switch (memberType) {
		case "":
			break;
		case "Out":
			mstatus = "N";
			map.put("mstatus", mstatus);
			break;
		case "User":
			madmin = "N";
			map.put("madmin", madmin);
			break;
		case "Admin":
			madmin = "Y";
			map.put("madmin", madmin);
			break;
		case "Search":
			map.put("table_search", table_search);
			break;
		default:
			throw new AdminException("게시판 조회에 실패하였습니다.");
		}

		int listCountM = adService.getListCountM(map);
		MemberInfo mi = MemberPagination.getMemberInfo(currentPageM, listCountM);
		ArrayList<Member> mList = adService.selectMember(map, mi);

		mv.addObject("mList", mList).addObject("mi", mi).addObject("table_search", table_search);
		mv.setViewName("adminUpdateMember");

		return mv;
	}
	
	/* 사용자 update */
	@ResponseBody
	@RequestMapping(value="updateAdminMember.ad", method = RequestMethod.POST)
	public String updateAdminMember(String id, String admin) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("mAdmin", admin);
		
		int result = adService.updateAdminMember(map);
		
		if (result > 0) {
			return "success";
		} else {
			throw new AdminException("사용자 수정에 실패하셨습니다.");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="updateStatusMember.ad", method = RequestMethod.POST)
	public String updateStatusMember(String id, String status) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("mStatus", status);
		
		int result = adService.updateStatusMember(map);
		
		if (result > 0) {
			return "success";
		} else {
			throw new AdminException("사용자 수정에 실패하셨습니다.");
		}
	}

	/* 게시판 조회 */
	@RequestMapping("adminBoard{boardType}.ad")
	public ModelAndView adminBoard(@PathVariable String boardType,
			@RequestParam(value = "page", required = false) Integer page, String table_search, ModelAndView mv) {

		int currentPageB = 1;
		if (page != null) {
			currentPageB = page;
		}

		HashMap<String, String> map = new HashMap<>();
		String bType = null;

		switch (boardType) {
		case "":
			break;
		case "QA":
			bType = "1";
			map.put("bType", bType);
			break;
		case "Tips":
			bType = "2";
			map.put("bType", bType);
			break;
		case "Study":
			bType = "3";
			map.put("bType", bType);
			break;
		case "Search":
			map.put("table_search", table_search);
			break;
		default:
			throw new AdminException("게시판 조회에 실패하였습니다.");
		}

		int listCountB = adService.getListCountB(map);
		BoardInfo bi = BoardPagination.getBoardInfo(currentPageB, listCountB);
		ArrayList<Board> bList = adService.selectBoard(map, bi);

		mv.addObject("bList", bList).addObject("bi", bi).addObject("page", page).addObject("table_search", table_search);
		mv.setViewName("adminBoard");

		return mv;
	}
	
	/* 게시글 status 업데이트 */
	@ResponseBody
	@RequestMapping(value = "adminUpdateBoard.ad", method = RequestMethod.POST)
	public String adminUpdateBoard(int bNo, String bStatus) {

		HashMap<String, String> map = new HashMap<>(); 
		map.put("bNo", bNo+"");
		map.put("bStatus", bStatus); 
		int result = adService.updateBoard(map);
		
		if (result > 0) {
			return "success";
		} else {
			throw new AdminException("게시글 수정에 실패하셨습니다.");
		}
	}
	
	/* 디테일 */
	@RequestMapping("boardDetail.ad")
	public String boardDetail(@RequestParam("bNo") int bNo, String side, String page) {
		return "redirect:boardDetail.bo?bNo=" + bNo + "&page=" + page + "&side=" + side;
	}
	
	/* mypage 접근 */
	@RequestMapping("memberDetail.ad")
	public String myPage(Model model, @RequestParam(value = "userId") String userId, String side) {
		return "redirect:mypage.me?userId=" + userId + "&side=" + side;
	}

}

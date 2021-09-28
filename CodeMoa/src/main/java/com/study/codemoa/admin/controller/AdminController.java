package com.study.codemoa.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.study.codemoa.admin.model.vo.ReportInfo;
import com.study.codemoa.admin.model.vo.ReportPagination;
import com.study.codemoa.board.exception.BoardException;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.member.model.vo.Member;
import com.study.codemoa.admin.model.vo.Report;

@Controller
public class AdminController {

	@Autowired
	private AdminService adService;

	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	/* 관리자 메인 화면 */
	@RequestMapping(value = "/adminPage.ad")
	public ModelAndView selectAll(@RequestParam(value = "pageB", required = false) Integer pageB,
			@RequestParam(value = "pageM", required = false) Integer pageM,
			@RequestParam(value = "pageP", required = false) Integer pageP, Member m, Board b, Report p,
			ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		int currentPageB = 1;
		if (pageB != null) {
			currentPageB = pageB;
		}

		int currentPageM = 1;
		if (pageM != null) {
			currentPageM = pageM;
		}

		int currentPageP = 1;
		if (pageP != null) {
			currentPageP = pageP;
		}

		int listCountB = adService.getListCountB();

		int listCountM = adService.getListCountM();

		int listCountP = adService.getListCountP();

		BoardInfo bi = BoardPagination.getBoardInfo(currentPageB, listCountB);
		MemberInfo mi = MemberPagination.getMemberInfo(currentPageM, listCountM);
		ReportInfo rpi = ReportPagination.getReportInfo(currentPageP, listCountP);

		ArrayList<Member> mList = adService.selectMember(m, mi);
		ArrayList<Board> bList = adService.selectBoard(b, p, bi);
		ArrayList<Report> pList = adService.selectReport(p, rpi);

		mv.addObject("mList", mList);
		mv.addObject("bList", bList);
		mv.addObject("pList", pList);
		mv.addObject("mi", mi);
		mv.addObject("bi", bi);
		mv.addObject("rpi", rpi);
		mv.setViewName("adminPage");

		return mv;
	}

	@RequestMapping(value = "/adminReportBoard.ad")
	public ModelAndView boardReport(@RequestParam(value = "pageP", required = false) Integer pageP, Report p, Board b, ModelAndView mv) {

		int currentPageP = 1;
		if (pageP != null) {
			currentPageP = pageP;
		}
		
		int listCountP = adService.getListCountP();

		ReportInfo rpi = ReportPagination.getReportInfo(currentPageP, listCountP);

		ArrayList<Report> pList = adService.selectBoardReport(rpi, p);
		ArrayList<Board> bList = adService.selectReportB(b);

		mv.addObject("pList", pList);
		mv.addObject("bList", bList);
		mv.addObject("rpi", rpi);
		mv.setViewName("adminReportBoard");

		return mv;

	}

	/* 신고된 유저 */
	@RequestMapping(value = "/adminReportMember.ad")
	public ModelAndView memberReport(@RequestParam(value = "pageP", required = false) Integer pageP, Report p, Member m,
			ModelAndView mv) {

		int currentPageP = 1;
		if (pageP != null) {
			currentPageP = pageP;
		}

		int listCountP = adService.getListCountP();

		ReportInfo rpi = ReportPagination.getReportInfo(currentPageP, listCountP);

		ArrayList<Report> pList = adService.selectMemberReport(rpi, p);
		ArrayList<Member> mList = adService.selectReportM(m);

		mv.addObject("pList", pList);
		mv.addObject("rpi", rpi);
		mv.addObject("mList", mList);
		mv.setViewName("adminReportMember");

		return mv;

	}
	
	/* 신고 insert 화면 */
	@RequestMapping("adminInsertReport.ad")
	public String adminReport() {
		return "adminInsertReport";
	}

	/* 게시글 신고 insert */
	@RequestMapping(value = "insertReport.ad", method = RequestMethod.POST)
	public String insertReport(@ModelAttribute Report p, HttpServletRequest request,
			@RequestParam("pBtype") int pBtype) {
		int result = adService.insertReport(p);

		String path = "";
		if (result > 0) {
			switch (pBtype) {
			case 1:
				path = "redirect:boardListFaq.bo";
				break;
			case 2:
				path = "redirect:boardListTips.bo";
				break;
			case 3:
				path = "redirect:boardListStudy.bo";
				break;
			}
		} else {
			throw new AdminException("신고에 실패했습니다.");
		}

		return path;
	}

	/* 신고 상세보기 */
	@RequestMapping("adminDetailReport.ad")
	public ModelAndView boardDetail(@RequestParam("pNo") int pNo, @RequestParam("pageP") int pageP, ModelAndView mv,
			HttpSession session) {
		Report report = adService.detailReport(pNo);
		if (report != null) {
			mv.addObject("p", report).addObject("pageP", pageP).setViewName("adminDetailReport");
		} else {
			throw new AdminException("게시글 상세조회에 실패했습니다.");
		}

		return mv;
	}

	/* 신고글 삭제 */
	@RequestMapping("adminDeleteReport.ad")
	public String deleteBoardReport(@RequestParam("pNo") String pNo) {

		int result = adService.deleteBoardReport(pNo);

		if (result > 0) {
			return "redirect:adminReportBoard.ad";
		} else {
			throw new AdminException("게시글 삭제에 실패했습니다.");
		}
	}

	/* 신고글 다중 삭제 */
	@RequestMapping(value = "adminDeleteReportCheck.ad")
	public String deleteCheckBoardReport(HttpServletRequest request) {

		String[] ajaxMsg = request.getParameterValues("valueArr");

		int size = ajaxMsg.length;

		for (int i = 0; i < size; i++) {
			adService.deleteBoardReport(ajaxMsg[i]);
		}
		return "redirect:adminReportBoard.ad";
	}

	/* 유저 정보 업데이트 */
	@RequestMapping("userEnable.ad")
	public String userEnable(@RequestParam("id") String id) {

		int result = adService.userEnable(id);

		if (result > 0) {
			return "redirect:adminReportMember.ad";
		} else {
			throw new AdminException("게시글 삭제에 실패했습니다.");
		}
	}

	/* 유저 정보 업데이트 */
	@RequestMapping(value = "userCheckEnable.ad")
	public String userCheckEnable(HttpServletRequest request) {

		String[] ajaxMsg = request.getParameterValues("valueArr");

		int size = ajaxMsg.length;

		for (int i = 0; i < size; i++) {
			adService.userEnable(ajaxMsg[i]);
		}
		return "redirect:adminReportMember.ad";
	}

	/* 보드글 삭제 */
	@RequestMapping("adminDeleteRoportB.ad")
	public String deleteRoportB(@RequestParam("bNo") String bNo) {

		int result = adService.deleteReportB(bNo);

		if (result > 0) {
			return "redirect:adminReportBoard.ad";
		} else {
			throw new AdminException("게시글 삭제에 실패했습니다.");
		}
	}

	/* 보드글 다중 삭제 */
	@RequestMapping(value = "adminDeleteCheckRoportB.ad")
	public String deleteCheckReportB(HttpServletRequest request) {

		String[] ajaxMsg = request.getParameterValues("valueArr");

		int size = ajaxMsg.length;

		for (int i = 0; i < size; i++) {
			adService.deleteReportB(ajaxMsg[i]);
		}
		return "redirect:adminReportBoard.ad";
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
	@RequestMapping(value = "adminPwdCheck.ad", method = RequestMethod.POST)
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
	@RequestMapping(value = "updateAdminMember.ad", method = RequestMethod.POST)
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
	@RequestMapping(value = "updateStatusMember.ad", method = RequestMethod.POST)
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
		map.put("bNo", bNo + "");
		map.put("bStatus", bStatus);
		int result = adService.updateBoard(map);

		if (result > 0) {
			return "success";
		} else {
			throw new AdminException("게시글 수정에 실패하셨습니다.");
		}
	}

}

package com.study.codemoa.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.codemoa.admin.model.service.AdminService;
import com.study.codemoa.admin.model.vo.BoardInfo;
import com.study.codemoa.admin.model.vo.BoardPagination;
import com.study.codemoa.admin.model.vo.MemberInfo;
import com.study.codemoa.admin.model.vo.MemberPagination;
import com.study.codemoa.admin.model.vo.Report;
import com.study.codemoa.admin.model.vo.ReportInfo;
import com.study.codemoa.admin.model.vo.ReportPagination;
import com.study.codemoa.board.exception.BoardException;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;
	
	/* 관리자 메인 화면 */
	@RequestMapping(value = "/adminPage.ad")
	public ModelAndView selectAll(@RequestParam(value="pageB", required=false)Integer pageB, 
								  @RequestParam(value="pageM", required = false)Integer pageM,
								  @RequestParam(value="pageP", required = false)Integer pageP,
								  Member m, Board b, Report p, ModelAndView mv,
								  HttpServletRequest request, HttpServletResponse response) {
		int currentPageB = 1;
		if(pageB != null) {
			currentPageB = pageB;
		}
		
		int currentPageM = 1;
		if(pageM != null) {
			currentPageM = pageM;
		}
		
		int currentPageP = 1;
		if(pageP != null) {
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
	
	/* 신고된 게시글  */
	@RequestMapping("adminReportBoard.ad")
	public ModelAndView boardReport(@RequestParam(value="pageP", required=false) Integer pageP, Report p, Board b,
			ModelAndView mv) {
		
		int currentPageP = 1;
		if(pageP != null) {
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
	
	
	@RequestMapping("adminInsertReport.ad")
	public String adminReport() {
		return "adminInsertReport";
	}
	
	/*Report insert*/
	@RequestMapping(value="insertReport.ad", method= RequestMethod.POST)
	public String insertReport(@ModelAttribute Report p, 
			HttpServletRequest request, @RequestParam("pBtype") int pBtype) {
		int result = adService.insertReport(p);

//	    String referer = request.getHeader("Referer");
//	    if (result > 0) {
//	    return "redirect:boardDetail.bo";
//		} else {
//			throw new BoardException("게시글 등록에 실패했습니다.");
//		}
		
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
			throw new BoardException("신고에 실패했습니다.");
		}

		return path;
	}
	
	/* 신고 상세보기 */
	@RequestMapping("adminDetailReport.ad")
	public ModelAndView boardDetail(@RequestParam("pNo") int pNo, @RequestParam("pageP") int pageP, 
			ModelAndView mv, HttpSession session) {
		Report report = adService.detailReport(pNo);
		if(report != null) {
			mv.addObject("p", report).addObject("pageP", pageP).setViewName("adminDetailReport");
		} else {
			throw new BoardException("게시글 상세조회에 실패했습니다.");
		}
		
			
		return mv;
	}
	
	/* 신고된 유저 */
	@RequestMapping(value="/adminReportMember.ad")
	public ModelAndView memberReport(@RequestParam(value="pageP", required=false) Integer pageP,
			Report p, ModelAndView mv) {
		
		int currentPageP = 1;
		if(pageP != null) {
			currentPageP = pageP;
		}
	
		int listCountP = adService.getListCountP();
		
		ReportInfo rpi = ReportPagination.getReportInfo(currentPageP, listCountP);
		
		ArrayList<Report> pList = adService.selectMemberReport(rpi, p);
	
		mv.addObject("pList", pList);
		mv.addObject("rpi", rpi);
		mv.setViewName("adminReportMember");
	
		return mv;

	}
	
	/* 신고글 삭제 */
	@RequestMapping("adminDeleteReport.ad")
	public String deleteBoardReport(@RequestParam("pNo") String pNo) {
		
		int result = adService.deleteBoardReport(pNo);
		
		if(result > 0) {	
			return "redirect:adminReportBoard.ad";
		} else {
			throw new BoardException("게시글 삭제에 실패했습니다.");
		}		
	}
	
	
	/* 신고글 다중 삭제*/
	@RequestMapping(value="adminDeleteReportCheck.ad")
	public String deleteCheckBoardReport( HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		
		int size = ajaxMsg.length;
		
		for(int i = 0; i < size; i++) {
			adService.deleteBoardReport(ajaxMsg[i]);
		}
			return "redirect:adminReportBoard.ad";
	}
	
//	@RequestMapping(value="/adminDeleteReport.ad")
//	public String deleteBoardReport(HttpServletRequest request) {
//
//		String[] ajaxMsg = request.getParameterValues("valueArr");
//		int size = ajaxMsg.length;
//		for(int i = 0; i < size; i++ ) {
//			adService.deleteBoardReport(ajaxMsg[i]);
//		}
//		return "redirect:adminReportBoard";	
//	}
	
	
//	@RequestMapping("adminDeleteReport.ad")
//	public String deleteBoardReport(@RequestParam("pNo") int pNo) {
//		Report report = adService.selectBoardReport(pNo, false);
//		
//		
//		if(report != null) {	
//			mv.addObject("p", report).setViewName("adminDetailReport");
//			
//		} else {
//			throw new BoardException("게시글 삭제에 실패했습니다.");
//		}	
//		return "redirect:adminReportBoard.ad";
//	}
	
	/* 신고글 삭제 */
//	@RequestMapping("adminDeleteReport.ad")
//	public String deleteBoardReport(@RequestParam("pNo") int pNo) {
//		
//		int result = adService.deleteBoardReport(pNo);
//		
//		if(result > 0) {	
//			return "redirect:adminReportBoard.ad";
//		} else {
//			throw new BoardException("게시글 삭제에 실패했습니다.");
//		}		
//	}
	
//	@RequestMapping(value="/adminReportMember.ad", method = RequestMethod.GET)
//	public String MemberReport(@ModelAttribute("Report") Report p, @RequestParam("pNo") int pNo,
//			@RequestParam(value="pageP", required=false) Integer pageP, Model model) {
//		
//		int currentPageP = 1;
//		if(pageP != null) {
//			currentPageP = pageP;
//		}
//	
//		int listCountP = adService.getListCountP();
//		
//		ReportInfo rpi = ReportPagination.getReportInfo(currentPageP, listCountP);
//		
//		ArrayList<Report> pList = adService.selectBoardReport(rpi, p);
//		model.addAttribute("reportMember", reportMember);
//	
//		return "/adminReportMember";
//
//	}

	
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

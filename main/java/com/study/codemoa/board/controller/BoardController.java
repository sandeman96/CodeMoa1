package com.study.codemoa.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONArray;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.study.codemoa.board.exception.BoardException;
import com.study.codemoa.board.model.service.BoardService;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.Likey;
import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.common.Pagination;
import com.study.codemoa.dto.CodeMoaDTO;
import com.study.codemoa.member.model.vo.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	/* 게시판 이동 */
	@RequestMapping("boardList{boardName}.bo")
	public ModelAndView boardList(@PathVariable String boardName,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "standard", required = false) String standard, ModelAndView mv) {

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		if (standard == null) {
			standard = "bNo";
		}

		int listCount = 0;
		int bType = 0;

		switch (boardName) {
		case "Faq":
			bType = 1;
			break;
		case "Tips":
			bType = 2;
			break;
		case "Study":
			bType = 3;
			break;
//		case "Job" : boardName = "boardListJob"; break;
//		case "Calendar" : boardName = "boardListCalendar"; break;
		default:
			throw new BoardException("게시판 열람에 실패하였습니다.");
		}

		listCount = bService.getListCount(bType);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("bType", bType + "");
		map.put("standard", standard);

		ArrayList<Board> list = bService.selectList(pi, map);
		if (list != null) {
			mv.addObject("list", list).addObject("pi", pi).addObject("bType", bType);
			mv.setViewName("boardList");
		} else {
			throw new BoardException("게시글 전체 조회에 실패했습니다.");
		}

		return mv;

	}

	/* board insertForm 이동 */
	@RequestMapping("insertBoardForm.bo")
	public String insertBoardForm() {
		return "insertBoardForm";
	}

	/* board insert */
	@RequestMapping("insertBoard.bo")
	public String insertBoard(@ModelAttribute Board b) {
		int result = bService.insertBoard(b);

		if (result > 0) {

			String path = "";
			switch (b.getbType()) {
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

			return path;
		} else {
			throw new BoardException("게시글 등록에 실패했습니다.");
		}
	}

	/* 써머노트 insert */
	@RequestMapping(value = "/uploadSummernoteImageFile.bo", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();

		String root = request.getSession().getServletContext().getRealPath("/");
		String fileRoot = root + "/resources/fileupload/";

		File folder = new File(fileRoot);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originalFileName = file.getOriginalFilename();
		String savedFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);

		// String renamePath = folder + "\\" + savedFileName;

		File targetFile = new File(fileRoot + savedFileName);

		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.addProperty("url", "/codemoa/resources/fileupload/" + savedFileName); // contextroot + resources
																								// + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}

	/* board 상세보기 */
	@RequestMapping("boardDetail.bo")
	public ModelAndView boardDetail(@RequestParam("bNo") int bNo, @RequestParam("page") int page, ModelAndView mv,
			HttpSession session) {
		Board board = bService.selectBoard(bNo, true);

		Member member = (Member) session.getAttribute("loginUser");
		String userId = "";
		Likey likey = null;
		if (board != null) {
			if (member != null) {
				userId = member.getId();
				likey = likeyIs(bNo, userId);
			}
			mv.addObject("b", board).addObject("page", page).addObject("likey", likey).setViewName("boardDetail");
		} else {
			throw new BoardException("게시글 상세조회에 실패했습니다.");
		}
		return mv;
	}

	/* board UpdateForm 이동 */
	@RequestMapping("updateBoardForm.bo")
	public String updateBoardForm(@RequestParam("bNo") int bNo, @RequestParam("page") int page, Model model) {
		Board board = bService.selectBoard(bNo, false);
		model.addAttribute("b", board).addAttribute("page", page);
		return "updateBoardForm";
	}

	/* board update */
	@RequestMapping("updateBoard.bo")
	public ModelAndView boardUpdate(@ModelAttribute Board b, @RequestParam("page") int page, HttpServletRequest request,
			ModelAndView mv) {

		int result = bService.updateBoard(b);
		if (result > 0) {
			Board board = bService.selectBoard(b.getbNo(), false);
			mv.addObject("b", board).addObject("page", page).setViewName("boardDetail");
		} else {
			throw new BoardException("게시글 수정에 실패하였습니다.");
		}
		return mv;
	}

	/* board delete */
	@RequestMapping("deleteBoard.bo")
	public String deleteBoard(@RequestParam("bNo") int bNo, @RequestParam("bType") int bType,
			HttpServletRequest request) {

		int result = bService.deleteBoard(bNo);

		String path = "";
		if (result > 0) {
			switch (bType) {
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
			throw new BoardException("게시물 삭제에 실패했습니다.");
		}

		return path;
	}

	/* board community_Job 이동 */
	@RequestMapping("job.bo")
	public String job() {
		return "community_Job";
	}

	@RequestMapping("crawling.bo")
	public ModelAndView crawling() {

		String url = "https://okky.kr/articles/recruit?filter.jobType=CONTRACT";
		String baseUrl = "https://okky.kr";
		Document doc = null;

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}

//		System.out.println("doc.toString()");
//		System.out.println(doc.toString());

		Elements elements = doc.select(".list-group-item-flex");
		for (Element elem : elements) {
			elem.select(".title-link").attr("href");
			elem.select(".title-link").text();
//			System.out.println();
		}

		Elements company = doc.select(".nickname");
		Elements title = doc.select(".project");
		Elements position = doc.select(".position");
		Elements day = doc.select(".timeago");

		String jobCompany = company.text();
		String jobTitle = title.text();
		String jobPosition = position.text();
		String jobDay = day.text();

		String companyText = "";
		String companyHref = "";
		String companyTitle = "";
		String companyPosition = "";
		Date companyDay = null;
		int closeDay = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		CodeMoaDTO dto = null;
		List<CodeMoaDTO> list = new ArrayList<>();
		for (int i = 0; i < company.size() - 1; i++) {
			companyText = company.get(i + 1).text();
			companyHref = baseUrl + company.get(i + 1).attr("href");
			companyTitle = title.get(i).text();
			companyPosition = position.get(i).text();
			;
			dto = new CodeMoaDTO(companyText, companyHref, companyTitle, companyPosition, day.get(i).text());
			try {
				companyDay = sdf.parse(day.get(i).text());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			closeDay = (int) ((companyDay.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));
			dto.setCloseDay(closeDay);
			list.add(dto);
		}
		System.out.println("======================");

		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("community_Job");

		return mv;
	}

	@RequestMapping("crawling2.bo")
	public ModelAndView crawling2() {

		String url = "https://okky.kr/articles/recruit?offset=20&max=20&sort=id&order=desc&filter.jobType=CONTRACT";
		String baseUrl = "https://okky.kr";
		Document doc = null;

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}

//		System.out.println("doc.toString()");
//		System.out.println(doc.toString());

		Elements elements = doc.select(".list-group-item-flex");
		for (Element elem : elements) {
			elem.select(".title-link").attr("href");
			elem.select(".title-link").text();
		}

		Elements company = doc.select(".nickname");
		Elements title = doc.select(".project");
		Elements position = doc.select(".position");
		Elements day = doc.select(".timeago");

		String jobCompany = company.text();
		String jobTitle = title.text();
		String jobPosition = position.text();
		String jobDay = day.text();

		String companyText = "";
		String companyHref = "";
		String companyTitle = "";
		String companyPosition = "";
		Date companyDay = null;
		int closeDay = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		CodeMoaDTO dto = null;
		List<CodeMoaDTO> list = new ArrayList<>();
		for (int i = 0; i < company.size() - 1; i++) {
			companyText = company.get(i + 1).text();
			companyHref = baseUrl + company.get(i + 1).attr("href");
			companyTitle = title.get(i).text();
			companyPosition = position.get(i).text();
			;
			dto = new CodeMoaDTO(companyText, companyHref, companyTitle, companyPosition, day.get(i).text());
			try {
				companyDay = sdf.parse(day.get(i).text());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			closeDay = (int) ((companyDay.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));
			dto.setCloseDay(closeDay);
			list.add(dto);
		}
		System.out.println("======================");

		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("community_Job");

		return mv;
	}

	@RequestMapping("crawling3.bo")
	public ModelAndView crawling3() {

		String url = "https://okky.kr/articles/recruit?offset=40&max=20&sort=id&order=desc&filter.jobType=CONTRACT";
		String baseUrl = "https://okky.kr";
		Document doc = null;

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}

//		System.out.println("doc.toString()");
//		System.out.println(doc.toString());

		Elements elements = doc.select(".list-group-item-flex");
		for (Element elem : elements) {
			elem.select(".title-link").attr("href");
			elem.select(".title-link").text();
		}

		Elements company = doc.select(".nickname");
		Elements title = doc.select(".project");
		Elements position = doc.select(".position");
		Elements day = doc.select(".timeago");

		String jobCompany = company.text();
		String jobTitle = title.text();
		String jobPosition = position.text();
		String jobDay = day.text();

		String companyText = "";
		String companyHref = "";
		String companyTitle = "";
		String companyPosition = "";
		Date companyDay = null;
		int closeDay = 0;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		CodeMoaDTO dto = null;
		List<CodeMoaDTO> list = new ArrayList<>();
		for (int i = 0; i < company.size() - 1; i++) {
			companyText = company.get(i + 1).text();
			companyHref = baseUrl + company.get(i + 1).attr("href");
			companyTitle = title.get(i).text();
			companyPosition = position.get(i).text();
			;
			dto = new CodeMoaDTO(companyText, companyHref, companyTitle, companyPosition, day.get(i).text());
			try {
				companyDay = sdf.parse(day.get(i).text());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			closeDay = (int) ((companyDay.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));
			dto.setCloseDay(closeDay);
			list.add(dto);
		}
		System.out.println("======================");

		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("community_Job");

		return mv;
	}

	@ResponseBody
	@RequestMapping("like.bo")
	public String likeCount(@RequestParam("bno") int bno, @RequestParam("userId") String userId) {

		Likey likey = likeyIs(bno, userId);

		Likey ll = new Likey(0, userId, bno);
		int result = 0;

		if (likey == null) {
			result = bService.insertLike(ll);
			return "plus";
		} else {
			result = bService.deleteLike(ll);
			return "minus";
		}
	}

	public Likey likeyIs(int bno, String userId) {

		Likey l = new Likey(0, userId, bno);

		if (userId == null) {
			userId = "";
		}

		Likey likey = bService.selectLike(l);

		System.out.println(likey);

		return likey;
	}

}

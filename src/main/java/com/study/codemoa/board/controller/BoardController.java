package com.study.codemoa.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
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

import com.google.gson.JsonObject;
import com.study.codemoa.board.exception.BoardException;
import com.study.codemoa.board.model.service.BoardService;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.common.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	/* 게시판 이동 */
	@RequestMapping("boardList{boardName}.bo")
	public ModelAndView boardList(@PathVariable String boardName, @RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="standard", required=false) String standard, ModelAndView mv) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
	
		if(standard == null) {
			standard = "bNo";
		}
		
		int listCount = 0;
		int bType = 0;
		
		switch (boardName) {
		case "Faq" : bType = 1; break;
		case "Tips" : bType = 2; break;
		case "Study" : bType = 3; break;
//		case "Job" : boardName = "boardListJob"; break;
//		case "Calendar" : boardName = "boardListCalendar"; break;
		default: throw new BoardException("게시판 열람에 실패하였습니다.");		
		}
	
		listCount = bService.getListCount(bType);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		HashMap<String, String> map = new HashMap<>();
		map.put("bType", bType+"");
		map.put("standard", standard);
		
		ArrayList<Board> list = bService.selectList(pi, map);
	
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).addObject("bType", bType);
			mv.setViewName("boardList");
		} else {
			throw new BoardException("게시글 전체 조회에 실패했습니다.");
		}
		
		return mv;

	}
		
	/*board insertForm 이동*/
	@RequestMapping("insertBoardForm.bo")
	public String insertBoardForm() {
		return "insertBoardForm";
	}
	
	/*board insert*/
	@RequestMapping("insertBoard.bo")
	public String insertBoard(@ModelAttribute Board b) {
		int result = bService.insertBoard(b);
		
		if(result > 0) {
			
			String path = "";
			switch(b.getbType()) {
			case 1 : path = "redirect:boardListFaq.bo"; break;
			case 2 : path = "redirect:boardListTips.bo"; break;
			case 3 : path = "redirect:boardListStudy.bo"; break;
			}
			
			return path;
		} else {
			throw new BoardException("게시글 등록에 실패했습니다.");
		}	
	}
	
	/*써머노트 insert*/
	@RequestMapping(value="/uploadSummernoteImageFile.bo", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile file, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();

		String root = request.getSession().getServletContext().getRealPath("/");
		String fileRoot = root+"/resources/fileupload/";
		
		File folder = new File(fileRoot);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originalFileName = file.getOriginalFilename();
		String savedFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		
		//String renamePath = folder + "\\" + savedFileName;
		
		File targetFile = new File(fileRoot + savedFileName);
		
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/codemoa/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	/*board 상세보기*/
	@RequestMapping("boardDetail.bo")
	public ModelAndView boardDetail(@RequestParam("bNo") int bNo, @RequestParam("page") int page, ModelAndView mv) {
		Board board = bService.selectBoard(bNo, true);
		if(board != null) {
			mv.addObject("b", board).addObject("page", page).setViewName("boardDetail");
		} else {
			throw new BoardException("게시글 상세조회에 실패했습니다.");
		}
		return mv;
	}
	
	/*board UpdateForm 이동*/
	@RequestMapping("updateBoardForm.bo")
	public String updateBoardForm(@RequestParam("bNo") int bNo,
			@RequestParam("page") int page, Model model) {
		Board board = bService.selectBoard(bNo, false);
		model.addAttribute("b", board).addAttribute("page", page);
		return "updateBoardForm";
	}
	/*board update*/
	@RequestMapping("updateBoard.bo")
	public ModelAndView boardUpdate(@ModelAttribute Board b,
			@RequestParam("page") int page,
			HttpServletRequest request, ModelAndView mv) {
		
		int result = bService.updateBoard(b);
		if(result > 0) {
			Board board = bService.selectBoard(b.getbNo(), false);
			mv.addObject("b", board).addObject("page", page).setViewName("boardDetail");
		} else {
			throw new BoardException("게시글 수정에 실패하였습니다.");
		}
		return mv;
	}
	/*board delete*/
	@RequestMapping("deleteBoard.bo")
	public String deleteBoard(@RequestParam("bNo") int bNo, @RequestParam("bType") int bType, HttpServletRequest request) {

		int result = bService.deleteBoard(bNo);
		
		String path = "";
		if (result > 0) {
			switch(bType) {
			case 1 : path = "redirect:boardListFaq.bo"; break;
			case 2 : path = "redirect:boardListTips.bo"; break;
			case 3 : path = "redirect:boardListStudy.bo"; break;
			}
		} else {
			throw new BoardException("게시물 삭제에 실패했습니다.");
		}
		
		return path;
	}
		
	
	
}

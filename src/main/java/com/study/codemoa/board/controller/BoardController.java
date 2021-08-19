package com.study.codemoa.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.codemoa.board.model.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	/* tech-qna이동 */
	@RequestMapping("techqnalist.bo")
	public String techQnaList() {
		return "techQnaList";
	}
	
	/* tech-tips이동 */
	@RequestMapping("techtipslist.bo")
	public String techTipsList() {
		return "techTipsList";
	}
	
	/*board 글쓰기 폼 이동*/
	@RequestMapping("insertBoardForm.bo")
	public String insertBoardForm() {
		return "insertBoardForm";
	}
	
	
	
	
	/* communityp-study이동 */
	@RequestMapping("communitystudylist.bo")
	public String communityStudyList() {
		return "communityStudyList";
	}
	
	/* communityp-job이동 */
	@RequestMapping("communityjoblist.bo")
	public String communityJobList() {
		return "communityJobList";
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

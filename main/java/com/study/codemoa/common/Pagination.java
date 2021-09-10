package com.study.codemoa.common;

import com.study.codemoa.board.model.vo.PageInfo;

public class Pagination {
	
<<<<<<< HEAD
public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		int pageLimit = 10;
		int boardLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit + 1;
		if (endPage > maxPage) {
=======
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		int pageLimit = 10;
		int boardLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit +1;
		int endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
<<<<<<< HEAD
		
		return pi;
	}

=======
		return pi;
	}
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
}

package com.study.codemoa.admin.model.vo;


public class BoardPagination {
	
	public static BoardInfo getBoardInfo(int currentPageB, int listCountB) {
		
		int pageLimitB = 10;
		int boardLimitB = 7;
		int maxPageB = (int)Math.ceil((double)listCountB/boardLimitB);
		int startPageB = (currentPageB - 1) / pageLimitB * pageLimitB +1;
		int endPageB = startPageB + pageLimitB -1;
		if(endPageB > maxPageB) {
			endPageB = maxPageB;
		}
		
		BoardInfo bi = new BoardInfo(currentPageB, listCountB, pageLimitB, maxPageB, startPageB, endPageB, boardLimitB);
		return bi;
	}
}

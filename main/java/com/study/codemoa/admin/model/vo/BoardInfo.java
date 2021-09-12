package com.study.codemoa.admin.model.vo;

public class BoardInfo {
	private int currentPageB;
	private int listCountB;
	private int pageLimitB;
	private int maxPageB;
	private int startPageB;
	private int endPageB;
	private int boardLimitB;
	
	public BoardInfo() {}

	public BoardInfo(int currentPageB, int listCountB, int pageLimitB, int maxPageB, int startPageB, int endPageB,
			int boardLimitB) {
		super();
		this.currentPageB = currentPageB;
		this.listCountB = listCountB;
		this.pageLimitB = pageLimitB;
		this.maxPageB = maxPageB;
		this.startPageB = startPageB;
		this.endPageB = endPageB;
		this.boardLimitB = boardLimitB;
	}
	
	

	public int getCurrentPageB() {
		return currentPageB;
	}

	public void setCurrentPageB(int currentPageB) {
		this.currentPageB = currentPageB;
	}

	public int getListCountB() {
		return listCountB;
	}

	public void setListCountB(int listCountB) {
		this.listCountB = listCountB;
	}

	public int getPageLimitB() {
		return pageLimitB;
	}

	public void setPageLimitB(int pageLimitB) {
		this.pageLimitB = pageLimitB;
	}

	public int getMaxPageB() {
		return maxPageB;
	}

	public void setMaxPageB(int maxPageB) {
		this.maxPageB = maxPageB;
	}

	public int getStartPageB() {
		return startPageB;
	}

	public void setStartPageB(int startPageB) {
		this.startPageB = startPageB;
	}

	public int getEndPageB() {
		return endPageB;
	}

	public void setEndPageB(int endPageB) {
		this.endPageB = endPageB;
	}

	public int getBoardLimitB() {
		return boardLimitB;
	}

	public void setBoardLimitB(int boardLimitB) {
		this.boardLimitB = boardLimitB;
	}

	@Override
	public String toString() {
		return "BoardInfo [currentPageB=" + currentPageB + ", listCountB=" + listCountB + ", pageLimitB=" + pageLimitB
				+ ", maxPageB=" + maxPageB + ", startPageB=" + startPageB + ", endPageB=" + endPageB + ", boardLimitB="
				+ boardLimitB + "]";
	}
	
	
}

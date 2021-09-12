package com.study.codemoa.admin.model.vo;

public class ReportInfo {
	private int currentPageP;
	private int listCountP;
	private int pageLimitP;
	private int maxPageP;
	private int startPageP;
	private int endPageP;
	private int boardLimitP;
	
	public ReportInfo() {}

	public ReportInfo(int currentPageP, int listCountP, int pageLimitP, int maxPageP, int startPageP, int endPageP,
			int boardLimitP) {
		super();
		this.currentPageP = currentPageP;
		this.listCountP = listCountP;
		this.pageLimitP = pageLimitP;
		this.maxPageP = maxPageP;
		this.startPageP = startPageP;
		this.endPageP = endPageP;
		this.boardLimitP = boardLimitP;
	}

	public int getCurrentPageP() {
		return currentPageP;
	}

	public void setCurrentPageP(int currentPageP) {
		this.currentPageP = currentPageP;
	}

	public int getListCountP() {
		return listCountP;
	}

	public void setListCountP(int listCountP) {
		this.listCountP = listCountP;
	}

	public int getPageLimitP() {
		return pageLimitP;
	}

	public void setPageLimitP(int pageLimitP) {
		this.pageLimitP = pageLimitP;
	}

	public int getMaxPageP() {
		return maxPageP;
	}

	public void setMaxPageP(int maxPageP) {
		this.maxPageP = maxPageP;
	}

	public int getStartPageP() {
		return startPageP;
	}

	public void setStartPageP(int startPageP) {
		this.startPageP = startPageP;
	}

	public int getEndPageP() {
		return endPageP;
	}

	public void setEndPageP(int endPageP) {
		this.endPageP = endPageP;
	}

	public int getBoardLimitP() {
		return boardLimitP;
	}

	public void setBoardLimitP(int boardLimitP) {
		this.boardLimitP = boardLimitP;
	}

	@Override
	public String toString() {
		return "ReportInfo [currentPageP=" + currentPageP + ", listCountP=" + listCountP + ", pageLimitP=" + pageLimitP
				+ ", maxPageP=" + maxPageP + ", startPageP=" + startPageP + ", endPageP=" + endPageP + ", boardLimitP="
				+ boardLimitP + "]";
	}
	
	
}

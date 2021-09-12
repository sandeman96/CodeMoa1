package com.study.codemoa.admin.model.vo;

public class MemberInfo {
	private int currentPageM;
	private int listCountM;
	private int pageLimitM;
	private int maxPageM;
	private int startPageM;
	private int endPageM;
	private int boardLimitM;
	
	public MemberInfo() {}

	public MemberInfo(int currentPageM, int listCountM, int pageLimitM, int maxPageM, int startPageM, int endPageM,
			int boardLimitM) {
		super();
		this.currentPageM = currentPageM;
		this.listCountM = listCountM;
		this.pageLimitM = pageLimitM;
		this.maxPageM = maxPageM;
		this.startPageM = startPageM;
		this.endPageM = endPageM;
		this.boardLimitM = boardLimitM;
	}

	public int getCurrentPageM() {
		return currentPageM;
	}

	public void setCurrentPageM(int currentPageM) {
		this.currentPageM = currentPageM;
	}

	public int getListCountM() {
		return listCountM;
	}

	public void setListCountM(int listCountM) {
		this.listCountM = listCountM;
	}

	public int getPageLimitM() {
		return pageLimitM;
	}

	public void setPageLimitM(int pageLimitM) {
		this.pageLimitM = pageLimitM;
	}

	public int getMaxPageM() {
		return maxPageM;
	}

	public void setMaxPageM(int maxPageM) {
		this.maxPageM = maxPageM;
	}

	public int getStartPageM() {
		return startPageM;
	}

	public void setStartPageM(int startPageM) {
		this.startPageM = startPageM;
	}

	public int getEndPageM() {
		return endPageM;
	}

	public void setEndPageM(int endPageM) {
		this.endPageM = endPageM;
	}

	public int getBoardLimitM() {
		return boardLimitM;
	}

	public void setBoardLimitM(int boardLimitM) {
		this.boardLimitM = boardLimitM;
	}

	@Override
	public String toString() {
		return "MemberInfo [currentPageM=" + currentPageM + ", listCountM=" + listCountM + ", pageLimitM=" + pageLimitM
				+ ", maxPageM=" + maxPageM + ", startPageM=" + startPageM + ", endPageM=" + endPageM + ", boardLimitM="
				+ boardLimitM + "]";
	}


	
	
}

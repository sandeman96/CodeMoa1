package com.study.codemoa.board.model.vo;

import java.sql.Date;

public class Board {
	private int bNo;
	private int bType;
	private String bTitle;
	private String bContent;
	private String nickName;
	private Date bDate;
	private int bCount;
	private String bStatus;
	private String bFirst;
	private String bWriter;
	private int lCount;

	public Board() {
	}

	public Board(int bNo, int bType, String bTitle, String bContent, String nickName, Date bDate, int bCount,
			String bStatus, String bFirst, String bWriter, int lCount) {
		super();
		this.bNo = bNo;
		this.bType = bType;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.nickName = nickName;
		this.bDate = bDate;
		this.bCount = bCount;
		this.bStatus = bStatus;
		this.bFirst = bFirst;
		this.bWriter = bWriter;
		this.lCount = lCount;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public String getbFirst() {
		return bFirst;
	}

	public void setbFirst(String bFirst) {
		this.bFirst = bFirst;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public int getlCount() {
		return lCount;
	}

	public void setlCount(int lCount) {
		this.lCount = lCount;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bType=" + bType + ", bTitle=" + bTitle + ", bContent=" + bContent
				+ ", nickName=" + nickName + ", bDate=" + bDate + ", bCount=" + bCount + ", bStatus=" + bStatus
				+ ", bFirst=" + bFirst + ", bWriter=" + bWriter + ", lCount=" + lCount + "]";
	}

}

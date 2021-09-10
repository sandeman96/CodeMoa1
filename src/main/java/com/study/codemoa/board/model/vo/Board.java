package com.study.codemoa.board.model.vo;

import java.sql.Date;

public class Board {
	private int bNo;
<<<<<<< HEAD
	private String bType;
	private String bTitle;
	private String bContent;
	private Date bDate;
	private int bCount;
=======
	private int bType;
	private String bTitle;
	private String bContent;
	private Date bDate;
	private String bCount;
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
	private String bStatus;
	private String bFirst;
	private String bWriter;
	
<<<<<<< HEAD
	public Board() {
	}

	public Board(int bNo, String bType, String bTitle, String bContent, Date bDate, int bCount, String bStatus,
=======
	public Board() {}

	public Board(int bNo, int bType, String bTitle, String bContent, Date bDate, String bCount, String bStatus,
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
			String bFirst, String bWriter) {
		super();
		this.bNo = bNo;
		this.bType = bType;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bCount = bCount;
		this.bStatus = bStatus;
		this.bFirst = bFirst;
		this.bWriter = bWriter;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

<<<<<<< HEAD
	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
=======
	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
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

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

<<<<<<< HEAD
	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
=======
	public String getbCount() {
		return bCount;
	}

	public void setbCount(String bCount) {
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
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

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bType=" + bType + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bDate="
				+ bDate + ", bCount=" + bCount + ", bStatus=" + bStatus + ", bFirst=" + bFirst + ", bWriter=" + bWriter
				+ "]";
	}
<<<<<<< HEAD

}
=======
	
	
	
	
	
}
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5

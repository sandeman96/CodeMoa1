package com.study.codemoa.member.model.vo;

import java.sql.Date;

public class Report {
	private int pNo;
	private int pType;
	private String pTitle;
	private String pContent;
	private Date pDate;
	private String pStatus;
	private int pBNo;
	private String pReceiver;
	private String pReporter;
	
	public Report() {

	}

	public Report(int pNo, int pType, String pTitle, String pContent, Date pDate, String pStatus, int pBNo,
			String pReceiver, String pReporter) {
		super();
		this.pNo = pNo;
		this.pType = pType;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pDate = pDate;
		this.pStatus = pStatus;
		this.pBNo = pBNo;
		this.pReceiver = pReceiver;
		this.pReporter = pReporter;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getpType() {
		return pType;
	}

	public void setpType(int pType) {
		this.pType = pType;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	public int getpBNo() {
		return pBNo;
	}

	public void setpBNo(int pBNo) {
		this.pBNo = pBNo;
	}

	public String getpReceiver() {
		return pReceiver;
	}

	public void setpReceiver(String pReceiver) {
		this.pReceiver = pReceiver;
	}

	public String getpReporter() {
		return pReporter;
	}

	public void setpReporter(String pReporter) {
		this.pReporter = pReporter;
	}

	@Override
	public String toString() {
		return "Report [pNo=" + pNo + ", pType=" + pType + ", pTitle=" + pTitle + ", pContent=" + pContent + ", pDate="
				+ pDate + ", pStatus=" + pStatus + ", pBNo=" + pBNo + ", pReceiver=" + pReceiver + ", pReporter="
				+ pReporter + "]";
	}
	

}

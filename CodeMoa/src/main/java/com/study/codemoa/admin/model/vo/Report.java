package com.study.codemoa.admin.model.vo;

import java.sql.Date;

public class Report {
	private int pNo;
	private int pType;
	private String pTitle;
	private String pContent;
	private Date pDate;
	private String pStatus;
	private int pBno;
	private String pReceiver;
	private String pReporter;
	private String pBpage;
	private String pMnick;
	private String pBtype;
	
	public Report() {}

	public Report(int pNo, int pType, String pTitle, String pContent, Date pDate, String pStatus, int pBno,
			String pReceiver, String pReporter, String pBpage, String pMnick, String pBtype) {
		super();
		this.pNo = pNo;
		this.pType = pType;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pDate = pDate;
		this.pStatus = pStatus;
		this.pBno = pBno;
		this.pReceiver = pReceiver;
		this.pReporter = pReporter;
		this.pBpage = pBpage;
		this.pMnick = pMnick;
		this.pBtype = pBtype;
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

	public int getpBno() {
		return pBno;
	}

	public void setpBno(int pBno) {
		this.pBno = pBno;
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

	public String getpBpage() {
		return pBpage;
	}

	public void setpBpage(String pBpage) {
		this.pBpage = pBpage;
	}

	public String getpMnick() {
		return pMnick;
	}

	public void setpMnick(String pMnick) {
		this.pMnick = pMnick;
	}

	public String getpBtype() {
		return pBtype;
	}

	public void setpBtype(String pBtype) {
		this.pBtype = pBtype;
	}

	@Override
	public String toString() {
		return "Report [pNo=" + pNo + ", pType=" + pType + ", pTitle=" + pTitle + ", pContent=" + pContent + ", pDate="
				+ pDate + ", pStatus=" + pStatus + ", pBno=" + pBno + ", pReceiver=" + pReceiver + ", pReporter="
				+ pReporter + ", pBpage=" + pBpage + ", pMnick=" + pMnick + ", pBtype=" + pBtype + "]";
	}

	

}

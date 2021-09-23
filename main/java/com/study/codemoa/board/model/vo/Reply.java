package com.study.codemoa.board.model.vo;

import java.sql.Date;

public class Reply {

	private int rNo;
	private Date rDate;
	private String rContent;
	private String rStatus;
	private String rWriter;
	private int rBNo;
	private String nickName;
	private String bTitle;

	public Reply() {
	}

	public Reply(int rNo, Date rDate, String rContent, String rStatus, String rWriter, int rBNo, String nickName,
			String bTitle) {
		super();
		this.rNo = rNo;
		this.rDate = rDate;
		this.rContent = rContent;
		this.rStatus = rStatus;
		this.rWriter = rWriter;
		this.rBNo = rBNo;
		this.nickName = nickName;
		this.bTitle = bTitle;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}

	public int getrBNo() {
		return rBNo;
	}

	public void setrBNo(int rBNo) {
		this.rBNo = rBNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	@Override
	public String toString() {
		return "Reply [rNo=" + rNo + ", rDate=" + rDate + ", rContent=" + rContent + ", rStatus=" + rStatus
				+ ", rWriter=" + rWriter + ", rBNo=" + rBNo + ", nickName=" + nickName + ", bTitle=" + bTitle + "]";
	}

}

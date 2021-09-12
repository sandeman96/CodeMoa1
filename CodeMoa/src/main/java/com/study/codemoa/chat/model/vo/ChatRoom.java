package com.study.codemoa.chat.model.vo;

import java.sql.Date;

public class ChatRoom {
	private int crNo; 			// 방 번호
	private String crTitle;		// 방 제목
	private Date crDate;		// 개설일
	private String crSecret;	// 비밀방 여부
	private String crPwd;		// 비밀번호
	private String crMaker;		// 개설자

	public ChatRoom() {

	}

	public ChatRoom(int crNo, String crTitle, Date crDate, String crSecret, String crPwd, String crMaker) {
		super();
		this.crNo = crNo;
		this.crTitle = crTitle;
		this.crDate = crDate;
		this.crSecret = crSecret;
		this.crPwd = crPwd;
		this.crMaker = crMaker;
	}

	public int getCrNo() {
		return crNo;
	}

	public void setCrNo(int crNo) {
		this.crNo = crNo;
	}

	public String getCrTitle() {
		return crTitle;
	}

	public void setCrTitle(String crTitle) {
		this.crTitle = crTitle;
	}

	public Date getCrDate() {
		return crDate;
	}

	public void setCrDate(Date crDate) {
		this.crDate = crDate;
	}

	public String getCrSecret() {
		return crSecret;
	}

	public void setCrSecret(String crSecret) {
		this.crSecret = crSecret;
	}

	public String getCrPwd() {
		return crPwd;
	}

	public void setCrPwd(String crPwd) {
		this.crPwd = crPwd;
	}

	public String getCrMaker() {
		return crMaker;
	}

	public void setCrMaker(String crMaker) {
		this.crMaker = crMaker;
	}

	@Override
	public String toString() {
		return "ChatRoom [crNo=" + crNo + ", crTitle=" + crTitle + ", crDate=" + crDate + ", crSecret=" + crSecret
				+ ", crPwd=" + crPwd + ", crMaker=" + crMaker + "]";
	}

}

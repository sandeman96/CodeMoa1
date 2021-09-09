package com.study.codemoa.chat.model.vo;

import java.sql.Date;

public class ChatRoom {
	private int crNo;
	private String crTitle;
	private String crDetail;
	private Date crDate;
	private String crSecret;
	private String crPwd;
	private String crMaker;
	private String crMember;

	public ChatRoom() {

	}

	public ChatRoom(int crNo, String crTitle, String crDetail, Date crDate, String crSecret, String crPwd,
			String crMaker, String crMember) {
		super();
		this.crNo = crNo;
		this.crTitle = crTitle;
		this.crDetail = crDetail;
		this.crDate = crDate;
		this.crSecret = crSecret;
		this.crPwd = crPwd;
		this.crMaker = crMaker;
		this.crMember = crMember;
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

	public String getCrDetail() {
		return crDetail;
	}

	public void setCrDetail(String crDetail) {
		this.crDetail = crDetail;
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

	public String getCrMember() {
		return crMember;
	}

	public void setCrMember(String crMember) {
		this.crMember = crMember;
	}

	@Override
	public String toString() {
		return "ChatRoom [crNo=" + crNo + ", crTitle=" + crTitle + ", crDetail=" + crDetail + ", crDate=" + crDate
				+ ", crSecret=" + crSecret + ", crPwd=" + crPwd + ", crMaker=" + crMaker + ", crMember=" + crMember
				+ "]";
	}

}

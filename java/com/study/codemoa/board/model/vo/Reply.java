package com.study.codemoa.board.model.vo;

import java.sql.Date;

public class Reply {

	private int rNo;
	private Date rDate;
	private String rContent;
	private String rStauts;
	private String rWriter;
	private String rBNo;

	public Reply() {
	}

	public Reply(int rNo, Date rDate, String rContent, String rStauts, String rWriter, String rBNo) {
		super();
		this.rNo = rNo;
		this.rDate = rDate;
		this.rContent = rContent;
		this.rStauts = rStauts;
		this.rWriter = rWriter;
		this.rBNo = rBNo;
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

	public String getrStauts() {
		return rStauts;
	}

	public void setrStauts(String rStauts) {
		this.rStauts = rStauts;
	}

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}

	public String getrBNo() {
		return rBNo;
	}

	public void setrBNo(String rBNo) {
		this.rBNo = rBNo;
	}

	@Override
	public String toString() {
		return "Reply [rNo=" + rNo + ", rDate=" + rDate + ", rContent=" + rContent + ", rStauts=" + rStauts
				+ ", rWriter=" + rWriter + ", rBNo=" + rBNo + "]";
	}

}

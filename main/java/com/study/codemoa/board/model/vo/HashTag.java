package com.study.codemoa.board.model.vo;

import java.sql.Date;

public class HashTag {
	
	private int hNo;
	private String hTag;
	private int hBNo;
	
	public HashTag() {}

	public int gethNo() {
		return hNo;
	}

	public void sethNo(int hNo) {
		this.hNo = hNo;
	}

	public String gethTag() {
		return hTag;
	}

	public void sethTag(String hTag) {
		this.hTag = hTag;
	}

	public int gethBNo() {
		return hBNo;
	}

	public void sethBNo(int hBNo) {
		this.hBNo = hBNo;
	}

	public HashTag(int hNo, String hTag, int hBNo) {
		super();
		this.hNo = hNo;
		this.hTag = hTag;
		this.hBNo = hBNo;
	}
}

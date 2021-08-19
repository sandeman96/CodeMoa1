package com.study.codemoa.board.model.vo;

public class Likey {
	private int lNo;
	private String lId;
	private int lBNo;

	public Likey() {
	}

	public Likey(int lNo, String lId, int lBNo) {
		super();
		this.lNo = lNo;
		this.lId = lId;
		this.lBNo = lBNo;
	}

	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	public String getlId() {
		return lId;
	}

	public void setlId(String lId) {
		this.lId = lId;
	}

	public int getlBNo() {
		return lBNo;
	}

	public void setlBNo(int lBNo) {
		this.lBNo = lBNo;
	}

	@Override
	public String toString() {
		return "Likey [lNo=" + lNo + ", lId=" + lId + ", lBNo=" + lBNo + "]";
	}

}

package com.study.codemoa.chat.model.vo;

import java.sql.Date;

public class Message {
	private int mgNo;
	private Date mgDate;
	private String mgContent;
	private String mgStatus;
	private String mgOpen;
	private String mgReciver;
	private String mgSender;
	
	public Message() {

	}

	public Message(int mgNo, Date mgDate, String mgContent, String mgStatus, String mgOpen, String mgReciver,
			String mgSender) {
		super();
		this.mgNo = mgNo;
		this.mgDate = mgDate;
		this.mgContent = mgContent;
		this.mgStatus = mgStatus;
		this.mgOpen = mgOpen;
		this.mgReciver = mgReciver;
		this.mgSender = mgSender;
	}

	public int getMgNo() {
		return mgNo;
	}

	public void setMgNo(int mgNo) {
		this.mgNo = mgNo;
	}

	public Date getMgDate() {
		return mgDate;
	}

	public void setMgDate(Date mgDate) {
		this.mgDate = mgDate;
	}

	public String getMgContent() {
		return mgContent;
	}

	public void setMgContent(String mgContent) {
		this.mgContent = mgContent;
	}

	public String getMgStatus() {
		return mgStatus;
	}

	public void setMgStatus(String mgStatus) {
		this.mgStatus = mgStatus;
	}

	public String getMgOpen() {
		return mgOpen;
	}

	public void setMgOpen(String mgOpen) {
		this.mgOpen = mgOpen;
	}

	public String getMgReciver() {
		return mgReciver;
	}

	public void setMgReciver(String mgReciver) {
		this.mgReciver = mgReciver;
	}

	public String getMgSender() {
		return mgSender;
	}

	public void setMgSender(String mgSender) {
		this.mgSender = mgSender;
	}

	@Override
	public String toString() {
		return "Message [mgNo=" + mgNo + ", mgDate=" + mgDate + ", mgContent=" + mgContent + ", mgStatus=" + mgStatus
				+ ", mgOpen=" + mgOpen + ", mgReciver=" + mgReciver + ", mgSender=" + mgSender + "]";
	}

}
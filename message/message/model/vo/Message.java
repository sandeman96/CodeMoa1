package com.study.codemoa.message.model.vo;

import java.sql.Date;

public class Message {
	private int mgNo;
	private String mgReceiver;
	private String mgSender;
	private String mgContent;
	private String mgDate;
	private String mgOpen;
	private String mgRStatus;
	private String mgSStatus;
	private String mgNick;

	public Message() {

	}

	public Message(int mgNo, String mgReceiver, String mgSender, String mgContent, String mgDate, String mgOpen,
			String mgRStatus, String mgSStatus, String mgNick) {
		super();
		this.mgNo = mgNo;
		this.mgReceiver = mgReceiver;
		this.mgSender = mgSender;
		this.mgContent = mgContent;
		this.mgDate = mgDate;
		this.mgOpen = mgOpen;
		this.mgRStatus = mgRStatus;
		this.mgSStatus = mgSStatus;
		this.mgNick = mgNick;
	}

	public int getMgNo() {
		return mgNo;
	}

	public void setMgNo(int mgNo) {
		this.mgNo = mgNo;
	}

	public String getMgReceiver() {
		return mgReceiver;
	}

	public void setMgReceiver(String mgReceiver) {
		this.mgReceiver = mgReceiver;
	}

	public String getMgSender() {
		return mgSender;
	}

	public void setMgSender(String mgSender) {
		this.mgSender = mgSender;
	}

	public String getMgContent() {
		return mgContent;
	}

	public void setMgContent(String mgContent) {
		this.mgContent = mgContent;
	}

	public String getMgDate() {
		return mgDate;
	}

	public void setMgDate(String mgDate) {
		this.mgDate = mgDate;
	}

	public String getMgOpen() {
		return mgOpen;
	}

	public void setMgOpen(String mgOpen) {
		this.mgOpen = mgOpen;
	}

	public String getMgRStatus() {
		return mgRStatus;
	}

	public void setMgRStatus(String mgRStatus) {
		this.mgRStatus = mgRStatus;
	}

	public String getMgSStatus() {
		return mgSStatus;
	}

	public void setMgSStatus(String mgSStatus) {
		this.mgSStatus = mgSStatus;
	}

	public String getMgNick() {
		return mgNick;
	}

	public void setMgNick(String mgNick) {
		this.mgNick = mgNick;
	}

	@Override
	public String toString() {
		return "Message [mgNo=" + mgNo + ", mgReceiver=" + mgReceiver + ", mgSender=" + mgSender + ", mgContent="
				+ mgContent + ", mgDate=" + mgDate + ", mgOpen=" + mgOpen + ", mgRStatus=" + mgRStatus + ", mgSStatus="
				+ mgSStatus + ", mgNick=" + mgNick + "]";
	}

}

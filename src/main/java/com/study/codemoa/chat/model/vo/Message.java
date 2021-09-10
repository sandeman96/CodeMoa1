package com.study.codemoa.chat.model.vo;

import java.sql.Date;

public class Message {
	private int mgNo;
	private Date mgDate;
	private String mgContent;
	private String mgStatus;
	private String mgOpen;
<<<<<<< HEAD
	private String mgReciver;
=======
	private String mgReceiver;
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
	private String mgSender;
	
	public Message() {

	}

<<<<<<< HEAD
	public Message(int mgNo, Date mgDate, String mgContent, String mgStatus, String mgOpen, String mgReciver,
=======
	public Message(int mgNo, Date mgDate, String mgContent, String mgStatus, String mgOpen, String mgReceiver,
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
			String mgSender) {
		super();
		this.mgNo = mgNo;
		this.mgDate = mgDate;
		this.mgContent = mgContent;
		this.mgStatus = mgStatus;
		this.mgOpen = mgOpen;
<<<<<<< HEAD
		this.mgReciver = mgReciver;
=======
		this.mgReceiver = mgReceiver;
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
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

<<<<<<< HEAD
	public String getMgReciver() {
		return mgReciver;
	}

	public void setMgReciver(String mgReciver) {
		this.mgReciver = mgReciver;
=======
	public String getmgReceiver() {
		return mgReceiver;
	}

	public void setmgReceiver(String mgReceiver) {
		this.mgReceiver = mgReceiver;
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
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
<<<<<<< HEAD
				+ ", mgOpen=" + mgOpen + ", mgReciver=" + mgReciver + ", mgSender=" + mgSender + "]";
	}

}
=======
				+ ", mgOpen=" + mgOpen + ", mgReceiver=" + mgReceiver + ", mgSender=" + mgSender + "]";
	}

}
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5

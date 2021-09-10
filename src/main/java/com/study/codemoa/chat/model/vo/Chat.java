package com.study.codemoa.chat.model.vo;

import java.sql.Date;

public class Chat {
	private String cNo;
	private Date cDate;
	private String cChat;
	private int cRNo;
	private String cSender;

	public Chat() {

	}

	public Chat(String cNo, Date cDate, String cChat, int cRNo, String cSender) {
		super();
		this.cNo = cNo;
		this.cDate = cDate;
		this.cChat = cChat;
		this.cRNo = cRNo;
		this.cSender = cSender;
	}

	public String getcNo() {
		return cNo;
	}

	public void setcNo(String cNo) {
		this.cNo = cNo;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public String getcChat() {
		return cChat;
	}

	public void setcChat(String cChat) {
		this.cChat = cChat;
	}

	public int getcRNo() {
		return cRNo;
	}

	public void setcRNo(int cRNo) {
		this.cRNo = cRNo;
	}

	public String getcSender() {
		return cSender;
	}

	public void setcSender(String cSender) {
		this.cSender = cSender;
	}

	@Override
	public String toString() {
		return "Chat [cNo=" + cNo + ", cDate=" + cDate + ", cChat=" + cChat + ", cRNo=" + cRNo + ", cSender=" + cSender
				+ "]";
	}

<<<<<<< HEAD
}
=======
}
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5

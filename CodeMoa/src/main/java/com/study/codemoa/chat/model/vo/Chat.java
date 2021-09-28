package com.study.codemoa.chat.model.vo;

public class Chat {
	private String cNo;		// 채팅 번호
	private String cDate;	// 작성 시간
	private String cChat;	// 내용
	private int crNo;		// 방 번호
	private String cSender;	// 보낸 사람

	public Chat() {

	}

	public Chat(String cNo, String cDate, String cChat, int crNo, String cSender) {
		super();
		this.cNo = cNo;
		this.cDate = cDate;
		this.cChat = cChat;
		this.crNo = crNo;
		this.cSender = cSender;
	}

	public String getcNo() {
		return cNo;
	}

	public void setcNo(String cNo) {
		this.cNo = cNo;
	}

	public String getcDate() {
		return cDate;
	}

	public void setcDate(String cDate) {
		this.cDate = cDate;
	}

	public String getcChat() {
		return cChat;
	}

	public void setcChat(String cChat) {
		this.cChat = cChat;
	}

	public int getcRNo() {
		return crNo;
	}

	public void setcRNo(int cRNo) {
		this.crNo = cRNo;
	}

	public String getcSender() {
		return cSender;
	}

	public void setcSender(String cSender) {
		this.cSender = cSender;
	}

	@Override
	public String toString() {
		return "Chat [cNo=" + cNo + ", cDate=" + cDate + ", cChat=" + cChat + ", crNo=" + crNo + ", cSender=" + cSender
				+ "]";
	}

}

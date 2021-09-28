package com.study.codemoa.chat.model.exception;

public class ChatException extends RuntimeException {

	public ChatException() {
	}
	
	public ChatException(String msg) {
		super(msg);
	}
}
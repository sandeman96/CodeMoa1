package com.study.codemoa.chat.model.service;

import java.util.ArrayList;

import com.study.codemoa.chat.model.vo.Chat;
import com.study.codemoa.chat.model.vo.ChatRoom;

public interface ChatService {

	int insertRoom(ChatRoom cr);

	ArrayList<ChatRoom> getRoomList();

	int pwdCheck(ChatRoom room);

	int makerCheck(String id);

	int deleteRoom(int crNo);

	int insertChat(Chat chat);

	ArrayList<Chat> getChatting(int crNo);

	String getNickName(String cSender);



	

}

package com.study.codemoa.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.message.model.vo.Message;

public interface MessageService {

	int insertMessage(Message message);

	ArrayList<Message> receiveBox(PageInfo pi, String userId);

	ArrayList<Message> sendeBox(PageInfo pi, String userId);

	int readMessage(Message message);

	int deleteMessage(HashMap<String, String> map);

	int selectList(HashMap<String, String> map);

	String selectNick(String nick);
	
	ArrayList<Message> searchMessage(HashMap<String, String> map);

	int msgAlarm(String id);

	ArrayList<String> nickList();

}

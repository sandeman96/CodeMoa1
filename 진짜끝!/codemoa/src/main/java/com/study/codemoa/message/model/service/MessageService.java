package com.study.codemoa.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.study.codemoa.message.model.vo.Message;

public interface MessageService {

	int insertMessage(Message message);

	ArrayList<Message> receiveBox(String userId);

	ArrayList<Message> sendeBox(String userId);

	int readMessage(Message message);

	int deleteMessage(HashMap<String, String> map);

}

package com.study.codemoa.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.codemoa.message.model.dao.MessageDAO;
import com.study.codemoa.message.model.vo.Message;

@Service("msgService")
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MessageDAO msgDao;

	@Override
	public int insertMessage(Message message) {

		return msgDao.insertMessage(sqlSession, message);
	}

	@Override
	public ArrayList<Message> receiveBox(String userId) {
		
		return msgDao.receiveBox(sqlSession, userId);
	}

	@Override
	public ArrayList<Message> sendeBox(String userId) {
		
		return msgDao.sendBox(sqlSession, userId);
	}

	@Override
	public int readMessage(Message message) {

		return msgDao.readMessage(sqlSession, message);
	}

	@Override
	public int deleteMessage(HashMap<String, String> map) {

		return msgDao.deleteMessage(sqlSession, map);
	}

}

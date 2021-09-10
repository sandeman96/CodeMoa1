package com.study.codemoa.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.codemoa.chat.model.dao.ChatDAO;
import com.study.codemoa.chat.model.vo.Chat;
import com.study.codemoa.chat.model.vo.ChatRoom;

@Service("cService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDAO cDAO;

	@Override
	public int insertRoom(ChatRoom cr) {
		return cDAO.insertRoom(sqlSession, cr);
	}

	@Override
	public ArrayList<ChatRoom> getRoomList() {
		return cDAO.getRoomList(sqlSession);
	}

	@Override
	public int pwdCheck(ChatRoom room) {
		return cDAO.pwdCheck(sqlSession, room);
	}

	@Override
	public int makerCheck(String id) {
		return cDAO.makerCheck(sqlSession, id);
	}
	
	@Override
	public int deleteRoom(int crNo) {
		cDAO.deleteChat(sqlSession, crNo);
		return cDAO.deleteRoom(sqlSession, crNo);
	}

	@Override
	public int insertChat(Chat chat) {
		return cDAO.insertChat(sqlSession, chat);
	}

	@Override
	public ArrayList<Chat> getChatting(int crNo) {
		return cDAO.getChatting(sqlSession, crNo);
	}

	@Override
	public String getNickName(String cSender) {
		return cDAO.getNickName(sqlSession, cSender);
	}

	

	


	
	
	
	

}

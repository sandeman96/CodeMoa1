package com.study.codemoa.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.study.codemoa.chat.model.vo.Chat;
import com.study.codemoa.chat.model.vo.ChatRoom;

@Repository("cDAO")
public class ChatDAO {

	public int insertRoom(SqlSessionTemplate sqlSession, ChatRoom cr) {
		return sqlSession.insert("chatMapper.insertRoom", cr);
	}

	public ArrayList<ChatRoom> getRoomList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatMapper.getRoomList");
	}

	public int pwdCheck(SqlSessionTemplate sqlSession, ChatRoom room) {
		return sqlSession.selectOne("chatMapper.pwdCheck", room);
	}

	public int makerCheck(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("chatMapper.makerCheck", id);
	}

	public int deleteRoom(SqlSessionTemplate sqlSession, int crNo) {
		return sqlSession.delete("chatMapper.deleteRoom", crNo);
	}

	public int insertChat(SqlSessionTemplate sqlSession, Chat chat) {
		return sqlSession.insert("chatMapper.insertChat", chat);
	}

	public ArrayList<Chat> getChatting(SqlSessionTemplate sqlSession, int crNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.getChatting", crNo);
	}

	public String getNickName(SqlSessionTemplate sqlSession, String cSender) {
		return sqlSession.selectOne("chatMapper.getNickName", cSender);
	}

	public int deleteChat(SqlSessionTemplate sqlSession, int crNo) {
		return sqlSession.delete("chatMapper.deleteChat", crNo);
	}


	

}

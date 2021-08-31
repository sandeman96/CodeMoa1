package com.study.codemoa.message.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.message.model.vo.Message;

@Repository("msgDao")
public class MessageDAO {

	public int insertMessage(SqlSessionTemplate sqlSession, Message message) {

		return sqlSession.insert("messageMapper.insertMessage", message);
	}

	public ArrayList<Message> receiveBox(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {

		int offset = pi.getBoardLimit() * (pi.getCurrentPage() - 1);
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("messageMapper.receiveBox", userId, rowBounds);
	}

	public ArrayList<Message> sendBox(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {

		int offset = pi.getBoardLimit() * (pi.getCurrentPage() - 1);
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("messageMapper.sendBox", userId, rowBounds);
	}

	public int readMessage(SqlSessionTemplate sqlSession, Message message) {

		return sqlSession.update("messageMapper.readMessage", message);
	}

	public int deleteMessage(SqlSessionTemplate sqlSession, HashMap<String, String> map) {

		return sqlSession.update("messageMapper.deleteMessage", map);
	}

	public int selectList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {

		return sqlSession.selectOne("messageMapper.selectList", map);
	}

	public String selectNick(SqlSessionTemplate sqlSession, String nick) {

		return sqlSession.selectOne("messageMapper.selectNick", nick);
	}

	public ArrayList<Message> searchMessage(SqlSessionTemplate sqlSession, HashMap<String, String> map) {

		return (ArrayList) sqlSession.selectList("messageMapper.searchMessage", map);
	}

	public int msgAlarm(SqlSessionTemplate sqlSession, String id) {
		
		return sqlSession.selectOne("messageMapper.msgAlarm", id);
	}

	public ArrayList<String> nickList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("messageMapper.nickList");
	}



}

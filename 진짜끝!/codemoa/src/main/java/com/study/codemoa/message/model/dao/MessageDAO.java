package com.study.codemoa.message.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.study.codemoa.message.model.vo.Message;

@Repository("msgDao")
public class MessageDAO {

	public int insertMessage(SqlSessionTemplate sqlSession, Message message) {

		return sqlSession.insert("messageMapper.insertMessage", message);
	}

	public ArrayList<Message> receiveBox(SqlSessionTemplate sqlSession, String userId) {

		return (ArrayList)sqlSession.selectList("messageMapper.receiveBox", userId);
	}

	public ArrayList<Message> sendBox(SqlSessionTemplate sqlSession, String userId) {

		return (ArrayList)sqlSession.selectList("messageMapper.sendBox", userId);
	}

	public int readMessage(SqlSessionTemplate sqlSession, Message message) {

		return sqlSession.update("messageMapper.readMessage", message);
	}

	public int deleteMessage(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.update("messageMapper.deleteMessage", map);
	}

}

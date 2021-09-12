package com.study.codemoa.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.stereotype.Repository;

import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.Reply;
import com.study.codemoa.member.model.vo.Member;

@Repository("mDao")
public class MemberDAO {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member login(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("memberMapper.login", m);
	}

	public Member memberInfo(SqlSessionTemplate sqlSession, String user) {

		return sqlSession.selectOne("memberMapper.memberInfo", user);
	}

	public int introduceUpdate(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("memberMapper.updateIntroduce", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {

		return sqlSession.update("memberMapper.updatePwd", map);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String email) {

		return sqlSession.update("memberMapper.deleteMember", email);
	}

	public int selectNickName(SqlSessionTemplate sqlSession, String nickName) {

		return sqlSession.selectOne("memberMapper.selectNickName", nickName);
	}

	public int selectId(SqlSessionTemplate sqlSession, String id) {

		return sqlSession.selectOne("memberMapper.selectId", id);
	}

	public int selectEmail(SqlSessionTemplate sqlSession, String email) {

		return sqlSession.selectOne("memberMapper.selectEmail", email);
	}

	public ArrayList<Board> selectMyBoard(SqlSessionTemplate sqlSession, String userId) {

		return (ArrayList) sqlSession.selectList("memberMapper.selectMyBoard", userId);
	}

	public ArrayList<Reply> selectMyReply(SqlSessionTemplate sqlSession, String userId) {

		return (ArrayList) sqlSession.selectList("memberMapper.selectMyReply", userId);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int no) {

		return sqlSession.update("memberMapper.deleteBoard", no);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int no) {

		return sqlSession.update("memberMapper.deleteReply", no);
	}

	public int updateNick(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("memberMapper.updateNick", m);
	}

}

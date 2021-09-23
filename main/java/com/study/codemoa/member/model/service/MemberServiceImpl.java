package com.study.codemoa.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.Reply;
import com.study.codemoa.member.model.dao.MemberDAO;
import com.study.codemoa.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MemberDAO mDao;

	@Override
	public Member login(Member m) {

		return mDao.login(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {

		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public Member memberInfo(String user) {

		return mDao.memberInfo(sqlSession, user);
	}

	@Override
	public int introduceUpdate(Member m) {

		return mDao.introduceUpdate(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {

		return mDao.updateMember(sqlSession, m);
	}

	@Override
	public int updatePwd(HashMap<String, String> map) {

		return mDao.updatePwd(sqlSession, map);
	}

	@Override
	public int deleteMember(String email) {

		return mDao.deleteMember(sqlSession, email);
	}

	@Override
	public int selectNickName(String nickName) {

		return mDao.selectNickName(sqlSession, nickName);
	}
	
	@Override
	public int selectEmail(String email) {
		
		return mDao.selectEmail(sqlSession, email);
	}

	@Override
	public int selectId(String id) {
		
		return mDao.selectId(sqlSession, id);
	}

	@Override
	public ArrayList<Board> selectMyBoard(String userId) {

		return mDao.selectMyBoard(sqlSession, userId);
	}

	@Override
	public ArrayList<Reply> selectMyReply(String userId) {

		return mDao.selectMyReply(sqlSession, userId);
	}

	@Override
	public int deleteBoard(int no) {

		return mDao.deleteBoard(sqlSession, no);
	}

	@Override
	public int deleteReply(int no) {

		return mDao.deleteReply(sqlSession, no);
	}

	@Override
	public int updateNick(Member m) {

		return mDao.updateNick(sqlSession, m);
	}

}

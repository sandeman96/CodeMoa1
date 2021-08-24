package com.study.codemoa.member.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


}

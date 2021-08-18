package com.study.codemoa.member.model.service;

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


}

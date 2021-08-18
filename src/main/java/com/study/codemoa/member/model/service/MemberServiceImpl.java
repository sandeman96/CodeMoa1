package com.study.codemoa.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.codemoa.member.model.dao.MemberDAO;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO dao;
}

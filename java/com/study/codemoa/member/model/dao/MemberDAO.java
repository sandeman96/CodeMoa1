package com.study.codemoa.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.study.codemoa.member.model.vo.Member;

@Repository("mDao")
public class MemberDAO {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member login(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.login", m);
	}

}

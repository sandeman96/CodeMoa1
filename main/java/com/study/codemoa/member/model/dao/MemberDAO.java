package com.study.codemoa.member.model.dao;

import java.util.HashMap;

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

}

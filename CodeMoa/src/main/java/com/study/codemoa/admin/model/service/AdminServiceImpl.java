package com.study.codemoa.admin.model.service;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.codemoa.admin.model.dao.AdminDAO;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.admin.model.vo.MemberInfo;
import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.member.model.vo.Member;


@Service("adService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO adDAO;

	@Override
	public int getListCount() {
		return adDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectBoard(Board b, PageInfo pi) {
		return adDAO.selectBoard(sqlSession, b, pi);
	}


	@Override
	public ArrayList<Member> selectMember(Member m, MemberInfo mi) {
		return adDAO.selectMember(sqlSession, m, mi);
	}

	@Override
	public int getListCountM() {
		return adDAO.getListCountM(sqlSession);
	}

	
}

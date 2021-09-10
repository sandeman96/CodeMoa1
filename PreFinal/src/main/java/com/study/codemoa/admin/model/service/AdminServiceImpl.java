package com.study.codemoa.admin.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.codemoa.admin.model.dao.AdminDAO;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.Likey;
import com.study.codemoa.board.model.vo.Reply;
import com.study.codemoa.admin.model.vo.MemberInfo;
import com.study.codemoa.admin.model.vo.BoardInfo;
import com.study.codemoa.member.model.vo.Member;


@Service("adService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO adDAO;

	@Override
	public int getListCountB() {
		return adDAO.getListCountB(sqlSession);
	}

	@Override
	public ArrayList<Board> selectBoard(Board b, BoardInfo bi) {
		return adDAO.selectBoard(sqlSession, b, bi);
	}
	
	@Override
	public int getListCountM() {
		return adDAO.getListCountM(sqlSession);
	}
	
	@Override
	public ArrayList<Member> selectMember(Member m, MemberInfo mi) {
		return adDAO.selectMember(sqlSession, m, mi);
	}
	
	// -------------------

	@Override
	public int getListCountM(HashMap<String, String> map) {
		return adDAO.getListCountM(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectMember(HashMap<String, String> map, MemberInfo mi) {
		return adDAO.selectMember(sqlSession, map, mi);
	}

	@Override
	public int getListCountB(HashMap<String, String> map) {
		return adDAO.getListCountB(sqlSession, map);
	}

	@Override
	public ArrayList<Board> selectBoard(HashMap<String, String> map, BoardInfo bi) {
		return adDAO.selectBoard(sqlSession, map, bi);
	}

	@Override
	public Member pwdCheck(Member m) {
		return adDAO.pwdCheck(sqlSession, m);
	}

	@Override
	public int updateBoard(HashMap<String, String> map) {
		return adDAO.updateBoard(sqlSession, map);
	}

	@Override
	public int updateAdminMember(HashMap<String, String> map) {
		return adDAO.updateAdminMember(sqlSession, map);
	}

	@Override
	public int updateStatusMember(HashMap<String, String> map) {
		return adDAO.updateStatusMember(sqlSession, map);
	}


}

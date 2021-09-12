package com.study.codemoa.admin.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.codemoa.admin.model.dao.AdminDAO;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.admin.model.vo.BoardInfo;
import com.study.codemoa.admin.model.vo.MemberInfo;
import com.study.codemoa.admin.model.vo.Report;
import com.study.codemoa.admin.model.vo.ReportInfo;
import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.member.model.vo.Member;


@Service("adService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO adDAO;
	
	@Override
	public int getListCountM() {
		return adDAO.getListCountM(sqlSession);
	}
	
	@Override
	public int getListCountB() {
		return adDAO.getListCountB(sqlSession);
	}
	
	@Override
	public int getListCountP() {
		return adDAO.getListCountP(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMember(Member m, MemberInfo mi) {
		return adDAO.selectMember(sqlSession, m, mi);
	}

	@Override
	public ArrayList<Board> selectBoard(Board b, Report p, BoardInfo bi) {
		return adDAO.selectBoard(sqlSession, b, p, bi);
	}
	
	@Override
	public ArrayList<Report> selectReport(Report p, ReportInfo rpi) {
		return adDAO.getListCountP(sqlSession, p, rpi);
	}

	@Override
	public int insertReport(Report p) {
		return adDAO.insertReport(sqlSession, p);
	}

	
	
	@Override
	public ArrayList<Report> selectBoardReport(ReportInfo rpi, Report p) {
		return adDAO.selectBoardReport(sqlSession, rpi, p);
	}

	@Override
	public ArrayList<Report> selectMemberReport(ReportInfo rpi, Report p) {
		return adDAO.selectMemberReport(sqlSession, rpi, p);
	}



	@Override
	public int deleteBoardReport(String pNo) {
		return adDAO.deleteBoardReport(sqlSession, pNo);
	}

	@Override
	public Report detailReport(int pNo) {
		return adDAO.detailReport(sqlSession, pNo);
	}

	@Override
	public ArrayList<Board> selectReportB(Board b) {
		return adDAO.selectReportB(sqlSession, b);
	}

//	@Override
//	public void deleteBoardReport(String string) {
//		return adDAO.deleteBoardReport(sqlSession, string);
//		
//	}

	
}

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
	public int getListCountM() { // 이름 겹침
		return adDAO.getListCountM(sqlSession);
	}
	
	@Override
	public int getListCountB() { // 이름 겹침
		return adDAO.getListCountB(sqlSession);
	}
	
	@Override
	public int getListCountP() { 
		return adDAO.getListCountP(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMember(Member m, MemberInfo mi) { // 이름 겹침
		return adDAO.selectMember(sqlSession, m, mi);
	}

	@Override
	public ArrayList<Board> selectBoard(Board b, Report p, BoardInfo bi) { // 이름 겹침
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

	@Override
	public ArrayList<Member> selectReportM(Member m) {
		return adDAO.selectReportM(sqlSession, m);
	}

	@Override
	public int userEnable(String id) {
		return adDAO.userEnable(sqlSession, id);
	}

	@Override
	public int deleteReportB(String bNo) {
		return adDAO.deleteReportB(sqlSession, bNo);
	}
	
	/* -----------------------본---------------------- */
	
	@Override
	public int getListCountM2(HashMap<String, String> map) {
		return adDAO.getListCountM2(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectMember2(HashMap<String, String> map, MemberInfo mi) {
		return adDAO.selectMember2(sqlSession, map, mi);
	}

	@Override
	public int getListCountB2(HashMap<String, String> map) {
		return adDAO.getListCountB2(sqlSession, map);
	}

	@Override
	public ArrayList<Board> selectBoard2(HashMap<String, String> map, BoardInfo bi) {
		return adDAO.selectBoard2(sqlSession, map, bi);
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

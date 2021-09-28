package com.study.codemoa.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.study.codemoa.admin.model.vo.BoardInfo;
import com.study.codemoa.admin.model.vo.MemberInfo;
import com.study.codemoa.admin.model.vo.Report;
import com.study.codemoa.admin.model.vo.ReportInfo;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.member.model.vo.Member;

public interface AdminService {

	ArrayList<Member> selectMember(Member m, MemberInfo mi);

	ArrayList<Board> selectBoard(Board b, Report p, BoardInfo bi);
	
	ArrayList<Report> selectReport(Report p, ReportInfo rpi);

	int getListCountM();

	int getListCountB();

	int getListCountP();
	
	int insertReport(Report p);

	ArrayList<Report> selectBoardReport(ReportInfo rpi, Report p);
	
	ArrayList<Report> selectMemberReport(ReportInfo rpi, Report p);

	int deleteBoardReport(String pNo);

	Report detailReport(int pNo);

	ArrayList<Board> selectReportB(Board b);

	ArrayList<Member> selectReportM(Member m);

	int userEnable(String id);

	int deleteReportB(String bNo);
	
	// -------------
	int getListCountM(HashMap<String, String> map);

	ArrayList<Member> selectMember(HashMap<String, String> map, MemberInfo mi);

	int getListCountB(HashMap<String, String> map);

	ArrayList<Board> selectBoard(HashMap<String, String> map, BoardInfo bi);

	Member pwdCheck(Member m);

	int updateBoard(HashMap<String, String> map);

	int updateAdminMember(HashMap<String, String> map);

	int updateStatusMember(HashMap<String, String> map);



}

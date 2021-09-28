package com.study.codemoa.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.study.codemoa.admin.model.vo.BoardInfo;
import com.study.codemoa.admin.model.vo.MemberInfo;
import com.study.codemoa.admin.model.vo.Report;
import com.study.codemoa.admin.model.vo.ReportInfo;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.member.model.vo.Member;


@Repository("adDAO")
public class AdminDAO {

	/* 관리자 메인 화면 게시글 총합 */
	public int getListCountB(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCount");
	}
	
	/* 관리자 메인 화면 멤버 총합 */
	public int getListCountM(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getMemberCount");
	}
	
	/* 관리자 메인 화면 신고 총합 */
	public int getListCountP(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getReportCount");
	}


	/* 관리자 메인 화면 멤버 부분 */
	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession, Member m, MemberInfo mi) {
		int offset = mi.getBoardLimitM() * (mi.getCurrentPageM() -1);
		RowBounds rbM = new RowBounds(offset, mi.getBoardLimitM());
		
		ArrayList<Member> mList = (ArrayList)sqlSession.selectList("adminMapper.selectMember", m, rbM);
		
		return mList;
	}
	
	/* 관리자 메인 화면 게시글 부분 */
	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession, Board b, Report p, BoardInfo bi) {
		int offset = bi.getBoardLimitB() * (bi.getCurrentPageB() -1);
		RowBounds rbB = new RowBounds(offset, bi.getBoardLimitB());
		
		ArrayList<Board> bList = (ArrayList)sqlSession.selectList("adminMapper.selectBoard", b, rbB);
		
		return bList;
	}
	
	/* 관리자 메인 화면 신고 부분 */
	public ArrayList<Report> getListCountP(SqlSessionTemplate sqlSession, Report p, ReportInfo rpi) {
		int offset = rpi.getBoardLimitP() * (rpi.getCurrentPageP()-1);
		RowBounds rbP = new RowBounds(offset, rpi.getBoardLimitP());
		
		ArrayList<Report> pList =  (ArrayList)sqlSession.selectList("adminMapper.selectReport", p, rbP);
		return pList;
	}	
	
	/* 신고 insert */
	public int insertReport(SqlSessionTemplate sqlSession, Report p) {
		return sqlSession.insert("adminMapper.insertReport", p);
	}

	/* 관리자 신고 게시글 메인 */
	public ArrayList<Report> selectBoardReport(SqlSessionTemplate sqlSession, ReportInfo rpi, Report p) {
		int offset = rpi.getBoardLimitP() * (rpi.getCurrentPageP()-1);
		RowBounds rbP = new RowBounds(offset, rpi.getBoardLimitP());
		
		ArrayList<Report> pList =  (ArrayList)sqlSession.selectList("adminMapper.selectReportBoardList", p, rbP);
		return pList;
	}

	/* 관리자 신고 유저 메인 */
	public ArrayList<Report> selectMemberReport(SqlSessionTemplate sqlSession, ReportInfo rpi, Report p) {
		int offset = rpi.getBoardLimitP() * (rpi.getCurrentPageP()-1);
		RowBounds rbP = new RowBounds(offset, rpi.getBoardLimitP());
		
		ArrayList<Report> pList =  (ArrayList)sqlSession.selectList("adminMapper.selectReportMemberList", p, rbP);
		return pList;
	}
	
	/* 게시글 상세 조회 */
	public Report detailReport(SqlSessionTemplate sqlSession, int pNo) {
		return sqlSession.selectOne("adminMapper.selectReportBoard", pNo);
	}

	/* 게시글 삭제*/
	public int deleteBoardReport(SqlSessionTemplate sqlSession, String pNo) {
		return sqlSession.update("adminMapper.deleteReport", pNo);
	}
	
	/* 신고 리스트에 보드 보내기 */
	public ArrayList<Board> selectReportB(SqlSessionTemplate sqlSession, Board b) {
		ArrayList<Board> bList =  (ArrayList)sqlSession.selectList("adminMapper.selectReportB", b);
		return bList;
	}
	
	/* adminReportMember에 member 사용 */
	public ArrayList<Member> selectReportM(SqlSessionTemplate sqlSession, Member m) {
		ArrayList<Member> mList = (ArrayList)sqlSession.selectList("adminMapper.selectReportM", m);
		return mList;
	}
	
	/* 유저 정지시키는 dao */
	public int userEnable(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("adminMapper.userEnable", id);
	}
	
	/* 신고보드 삭제용 */
	public int deleteReportB(SqlSessionTemplate sqlSession, String bNo) {
		return sqlSession.update("adminMapper.deleteReportB", bNo);
	}
	
	// -------------------
	public int getListCountM(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.getMemberCountM", map);
	}

	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession, HashMap<String, String> map, MemberInfo mi) {
		int offset = mi.getBoardLimitM() * (mi.getCurrentPageM() -1);
		RowBounds rbM = new RowBounds(offset, mi.getBoardLimitM());
		
		ArrayList<Member> mList = (ArrayList)sqlSession.selectList("adminMapper.selectMemberM", map, rbM);
		
		return mList;
	}

	public int getListCountB(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.getBoardListCountB", map);
	}

	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession, HashMap<String, String> map, BoardInfo bi) {
		int offset = bi.getBoardLimitB() * (bi.getCurrentPageB() -1);
		RowBounds rb = new RowBounds(offset, bi.getBoardLimitB());
		
		ArrayList<Board> bList = (ArrayList)sqlSession.selectList("adminMapper.selectBoardB", map, rb);
		
		return bList;
	}
	
	public Member pwdCheck(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("adminMapper.pwdCheck", m);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("adminMapper.updateBoard", map);
	}

	public int updateAdminMember(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("adminMapper.updateAdminMember", map);
	}

	public int updateStatusMember(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("adminMapper.updateStatusMember", map);
	}

}

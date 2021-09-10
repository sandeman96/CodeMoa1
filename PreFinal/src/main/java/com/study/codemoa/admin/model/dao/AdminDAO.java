package com.study.codemoa.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.Likey;
import com.study.codemoa.board.model.vo.Reply;
import com.study.codemoa.admin.model.vo.MemberInfo;
import com.study.codemoa.admin.model.vo.BoardInfo;
import com.study.codemoa.member.model.vo.Member;


@Repository("adDAO")
public class AdminDAO {

	public int getListCountB(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCountB");
	}

	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession, Board b, BoardInfo bi) {
		int offset = bi.getBoardLimitB() * (bi.getCurrentPageB() -1);
		RowBounds rb = new RowBounds(offset, bi.getBoardLimitB());
		
		ArrayList<Board> bList = (ArrayList)sqlSession.selectList("adminMapper.selectBoard", b, rb);
		
		return bList;
	}
	
	public int getListCountM(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getMemberCount");
	}
	
	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession, Member m, MemberInfo mi) {
		int offset = mi.getBoardLimitM() * (mi.getCurrentPageM() -1);
		RowBounds rbM = new RowBounds(offset, mi.getBoardLimitM());
		
		ArrayList<Member> mList = (ArrayList)sqlSession.selectList("adminMapper.selectMember", m, rbM);
		
		return mList;
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

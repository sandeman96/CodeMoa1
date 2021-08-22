package com.study.codemoa.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.admin.model.vo.MemberInfo;
import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.member.model.vo.Member;


@Repository("adDAO")
public class AdminDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCount");
	}

//	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
//		int offset = pi.getBoardLimit() * (pi.getCurrentPage() -1);
//		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
//		
//		ArrayList<Board> list = (ArrayList)sqlSession.selectList("adminMapper.getListCount", null, rb);
//		
//		return list;
//	}


	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession, Member m, MemberInfo mi) {
		int offset = mi.getBoardLimitM() * (mi.getCurrentPageM() -1);
		RowBounds rbM = new RowBounds(offset, mi.getBoardLimitM());
		
		ArrayList<Member> mList = (ArrayList)sqlSession.selectList("adminMapper.selectMember", m, rbM);
		
		return mList;
	}

	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession, Board b, PageInfo pi) {
		int offset = pi.getBoardLimit() * (pi.getCurrentPage() -1);
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Board> bList = (ArrayList)sqlSession.selectList("adminMapper.selectBoard", b, rb);
		
		return bList;
	}

	public int getListCountM(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getMemberCount");
	}
	
}

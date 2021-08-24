package com.study.codemoa.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.PageInfo;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession, int bType) {
		return sqlSession.selectOne("boardMapper.getListCount", bType);
		
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int bType) {
		int offset = pi.getBoardLimit() * (pi.getCurrentPage()-1);
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("boardMapper.selectList", bType, rowBounds);
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int addCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.addCount", bNo);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", bNo);
	}
	

}

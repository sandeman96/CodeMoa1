package com.study.codemoa.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.codemoa.board.model.dao.BoardDAO;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;

	@Override
	public int getListCount(int bType) {
		return bDAO.getListCount(sqlSession, bType);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi, int bType) {
		return bDAO.selectList(sqlSession, pi, bType);
	}
	
	@Override
	public int insertBoard(Board b) {
		return bDAO.insertBoard(sqlSession, b);
	}

	@Override
	@Transactional	
	public Board selectBoard(int bNo, boolean check) {
		int result= 0;
		Board b = null;
		
		if(check) {
			result = bDAO.addCount(sqlSession, bNo);	
			if(result > 0) {
				b = bDAO.selectBoard(sqlSession, bNo);
			}
		} else {
			b = bDAO.selectBoard(sqlSession, bNo);
		}

		return b;
	}
}

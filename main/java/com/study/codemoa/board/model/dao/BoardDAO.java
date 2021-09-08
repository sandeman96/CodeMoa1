package com.study.codemoa.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.Likey;
import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.board.model.vo.Reply;
import com.study.codemoa.dto.BoardDTO;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession, int bType) {
		return sqlSession.selectOne("boardMapper.getListCount", bType);
	}

	public List<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = pi.getBoardLimit() * (pi.getCurrentPage() - 1);
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("boardMapper.selectList", map, rowBounds);
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

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.deleteBoard", bNo);
	}

	public Likey selectLike(SqlSessionTemplate sqlSession, Likey likey) {
		return sqlSession.selectOne("boardMapper.selectLike", likey);
	}

	public int insertLike(SqlSessionTemplate sqlSession, Likey likey) {
		return sqlSession.insert("boardMapper.insertLike", likey);
	}

	public int deleteLike(SqlSessionTemplate sqlSession, Likey likey) {
		return sqlSession.delete("boardMapper.deleteLike", likey);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public List<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectList("boardMapper.selectReplyList", bNo);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("boardMapper.updateReply", r);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.update("boardMapper.deleteReply", rNo);
	}

	public List<BoardDTO> getBoardCountList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("boardMapper.selectCountList");
	}

	public List<BoardDTO> getBoardLikeList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("boardMapper.selectLikeList");
	}
}
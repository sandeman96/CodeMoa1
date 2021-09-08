package com.study.codemoa.board.model.service;

import java.util.HashMap;
import java.util.List;

import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.Likey;
import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.board.model.vo.Reply;
import com.study.codemoa.dto.BoardDTO;

public interface BoardService {

	int getListCount(int bType);

	List<Board> selectList(PageInfo pi, HashMap<String, Object> map);

	int insertBoard(Board b);

	Board selectBoard(int bNo, boolean b);

	int updateBoard(Board b);

	int deleteBoard(int bNo);

	Likey selectLike(Likey l);

	int insertLike(Likey likey);

	int deleteLike(Likey likey);

	int insertReply(Reply r);

	List<Reply> selectReplyList(int bNo);

	int updateReply(Reply r);

	int deleteReply(int rNo);

	List<BoardDTO> getBoardCountList();
	
	List<BoardDTO> getBoardLikeList();
}
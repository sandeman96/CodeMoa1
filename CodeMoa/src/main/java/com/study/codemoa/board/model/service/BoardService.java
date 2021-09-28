package com.study.codemoa.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.HashTag;
import com.study.codemoa.board.model.vo.Likey;
import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.board.model.vo.Reply;
import com.study.codemoa.dto.BoardDTO;

public interface BoardService {

	int getListCount(HashMap<String, String> map);

	ArrayList<Board> selectList(PageInfo pi, HashMap<String, String> map);

	int insertBoard(Board b);

	Board selectBoard(int bNo, boolean check);

	int updateBoard(Board b);

	int deleteBoard(int bNo);

	Likey selectLike(Likey l);

	int insertLike(Likey likey);

	int deleteLike(Likey likey);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int bNo);

	int updateReply(Reply r);

	int deleteReply(int rNo);

	ArrayList<HashTag> selectTagList();

	int insertHashTag(ArrayList<HashTag> hList2);
	
	List<BoardDTO> getBoardCountList();
	
	List<BoardDTO> getBoardLikeList();
}

package com.study.codemoa.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.Likey;
import com.study.codemoa.board.model.vo.PageInfo;

public interface BoardService {

	int getListCount(int bType);

	ArrayList<Board> selectList(PageInfo pi, HashMap<String, String> map);

	int insertBoard(Board b);

	Board selectBoard(int bNo, boolean b);

	int updateBoard(Board b);

	int deleteBoard(int bNo);

	Likey selectLike(Likey l);

	int insertLike(Likey likey);

	int deleteLike(Likey likey);


}

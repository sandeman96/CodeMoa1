package com.study.codemoa.board.model.service;

import java.util.ArrayList;

import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.PageInfo;

public interface BoardService {

	int getListCount(int bType);

	ArrayList<Board> selectList(PageInfo pi, int bType);

	int insertBoard(Board b);

	Board selectBoard(int bNo, boolean b);


}

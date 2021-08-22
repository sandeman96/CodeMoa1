package com.study.codemoa.admin.model.service;

import java.util.ArrayList;

import com.study.codemoa.admin.model.vo.MemberInfo;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.member.model.vo.Member;

public interface AdminService {

	int getListCount();

	ArrayList<Member> selectMember(Member m, MemberInfo mi);

	ArrayList<Board> selectBoard(Board b, PageInfo pi);

	int getListCountM();



}

package com.study.codemoa.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.study.codemoa.admin.model.vo.MemberInfo;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.Likey;
import com.study.codemoa.board.model.vo.Reply;
import com.study.codemoa.admin.model.vo.BoardInfo;
import com.study.codemoa.member.model.vo.Member;

public interface AdminService {

	int getListCountB();

	ArrayList<Board> selectBoard(Board b, BoardInfo bi);

	int getListCountM();
	
	ArrayList<Member> selectMember(Member m, MemberInfo mi);
	
	// -------------
	int getListCountM(HashMap<String, String> map);

	ArrayList<Member> selectMember(HashMap<String, String> map, MemberInfo mi);

	int getListCountB(HashMap<String, String> map);

	ArrayList<Board> selectBoard(HashMap<String, String> map, BoardInfo bi);

	Member pwdCheck(Member m);

	int updateBoard(HashMap<String, String> map);

	int updateAdminMember(HashMap<String, String> map);

	int updateStatusMember(HashMap<String, String> map);



}

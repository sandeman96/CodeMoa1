package com.study.codemoa.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.Reply;
import com.study.codemoa.member.model.vo.Member;

public interface MemberService {

	Member login(Member m);

	int insertMember(Member m);

	Member memberInfo(String user);

	int introduceUpdate(Member m);

	int updateMember(Member m);

	int updatePwd(HashMap<String, String> map);

	int deleteMember(String email);

	int selectNickName(String nickName);
	
	int selectEmail(String email);

	int selectId(String id);

	ArrayList<Board> selectMyBoard(String userId);

	ArrayList<Reply> selectMyReply(String userId);

	int deleteBoard(int no);

	int deleteReply(int no);

	int updateNick(Member m);

}

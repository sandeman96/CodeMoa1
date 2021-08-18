package com.study.codemoa.member.model.service;

import com.study.codemoa.member.model.vo.Member;

public interface MemberService {

	Member login(Member m);
	
	int insertMember(Member m);

}

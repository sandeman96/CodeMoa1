package com.study.codemoa.member.model.service;

<<<<<<< HEAD
=======

>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.study.codemoa.member.model.dao.MemberDAO;

@Service("mService") 
=======

@Service("service")
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
<<<<<<< HEAD
	@Autowired
	private MemberDAO mDAO;
=======
	
	
>>>>>>> 86d0c34382858c0e7d4851736c88e6684481eca5
}

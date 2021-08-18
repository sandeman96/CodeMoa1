package com.study.codemoa.member.controller;

import javax.security.auth.login.LoginContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.study.codemoa.member.model.exception.MemberException;
import com.study.codemoa.member.model.service.MemberService;
import com.study.codemoa.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	public String login(@ModelAttribute Member m, Model model) {
		
		Member loginUser = mService.login(m);
		
		if (bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
		} else {
			throw new MemberException("로그인 실패");
		}
		
		return "redirect:home.do";
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus session) {
		session.setComplete();
		
		return "redirect:home.do";
	}
	
	@RequestMapping("enrollview.me")
	public String enrollView() {
		
		return "memberJoin";
	}
	
	@RequestMapping("minsert.me")
	public String memberInert(@ModelAttribute Member m) {
		
		String enPwd = bcrypt.encode(m.getPwd());
		
		m.setPwd(enPwd);
		
		int result = mService.insertMember(m);
		
		if (result > 0) {
			return "redirect:home.do";
		} else {
			throw new MemberException("회원 가입 실패");
		}
		
	}
	
	@RequestMapping("mypage.me")
	public String myPage() {
		
		return "mypage";
	}
	
}

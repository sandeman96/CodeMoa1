package com.study.codemoa.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping("loginForm.me")
	public String loginView() {
		return "loginForm";
	}

	@RequestMapping("findPwdForm.me")
	public String findPwdView() {
		return "findPwdForm";
	}

	@RequestMapping("registerForm.me")
	public String registerForm() {
		return "registerForm";
	}

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

		System.out.println(m);

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
	public ModelAndView myPage(ModelAndView mv, @RequestParam("user") String user) {

		Member m = mService.memberInfo(user);
		if (m != null) {
			mv.addObject("user", m);
		} else {
			throw new MemberException("프로필 가져오기 실패");
		}

		mv.setViewName("mypage");

		return mv;
	}

}
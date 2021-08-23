package com.study.codemoa.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
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
	public ModelAndView myPage(ModelAndView mv, @RequestParam(value="userId") String userId) {

		Member m = mService.memberInfo(userId);
		
		if (m != null) {
			mv.addObject("user", m);
		} else {
			throw new MemberException("프로필 가져오기 실패");
		}

		mv.setViewName("mypage");

		return mv;
	}
	
	@RequestMapping("introduce.me")
	@ResponseBody
	public String introduceUpdate(@ModelAttribute Member m) {
		 
		System.out.println(m);
		
		int result = mService.introduceUpdate(m);
		
		if (result > 0) {
			return "success";
		}else {
			throw new MemberException("프로필 수정 실패");
		}

	}
	
	@RequestMapping("profile.me")
	public void profile(@RequestParam("id") String id, Model model, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		Member m = mService.memberInfo(id);
		
		Gson gson = new Gson();
		
		model.addAttribute("user", m);
		try {
			gson.toJson(m, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("mUpdate.me")
	@ResponseBody
	public String updateMember(@ModelAttribute Member m, Model model) {
		System.out.println(m);
		int result = mService.updateMember(m);
		System.out.println(result);
		
		if (result > 0) {	
			model.addAttribute("user", m);
			return "success";
		}else {
			throw new MemberException("회원 정보 수정에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("mpwdupdate.me")
	public ModelAndView UpdateMemberPwd(HttpSession session, @RequestParam("pwd") String pwd, @RequestParam("newPwd") String newPwd, ModelAndView mv) {
		Member m = (Member)session.getAttribute("loginUser");
		
		String userId = m.getId();
		String userPwd = m.getPwd();
		
		String encPwd = bcrypt.encode(newPwd);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("newPwd", encPwd);
		

		
		if (bcrypt.matches(pwd, userPwd)) {
			
			int result = mService.updatePwd(map);
			
			if (result > 0) {
				mv.addObject("userId", userId);
				
				mv.setViewName("mypage");		
			} else {
				throw new MemberException("비밀번호 변경 실패1");
			}
		} else {			
			throw new MemberException("비밀번호 변경 실패2");
		}
		
		return mv;
		
	}
	
	@RequestMapping("mdelete.me")
	public String deleteMember(@RequestParam("dUser") String id, SessionStatus session) {
		int result = mService.deleteMember(id);
		
		if (result > 0) {
			session.setComplete();
		}else {
			throw new MemberException("회원탈퇴에 실패하였습니다.");
		}
		
		return "redirect:home.do";
	}

}

package com.study.codemoa.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
import com.study.codemoa.board.model.vo.Board;
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

	@Autowired
	private JavaMailSenderImpl mailSender;

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
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요");

			return "loginForm";
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
	public String memberInsert(@ModelAttribute Member m, Model model) {

		String enPwd = bcrypt.encode(m.getPwd());

		m.setPwd(enPwd);

		int result = mService.insertMember(m);

		if (result > 0) {
			model.addAttribute("loginUser", m);
			return "redirect:home.do";
		} else {
			throw new MemberException("회원 가입 실패");
		}

	}

	@RequestMapping("mypage.me")
	public ModelAndView myPage(ModelAndView mv, @RequestParam(value = "userId", required = false) String userId, HttpServletResponse response) {

		Member m = mService.memberInfo(userId);
		
		response.setContentType("application/json; charset=UTF-8");

		ArrayList<Board> bList = mService.selectMyBoard(userId);
		
		// System.out.println("boardList : "+bList);


		if (m != null) {
			mv.addObject("user", m);
			mv.addObject("bList", bList);
		} else {
			throw new MemberException("프로필 가져오기 실패");
		}

		mv.setViewName("mypage");

		return mv;
	}

	@RequestMapping("introduce.me")
	@ResponseBody
	public String introduceUpdate(@ModelAttribute Member m) {

		// System.out.println(m);

		int result = mService.introduceUpdate(m);

		if (result > 0) {
			return "success";
		} else {
			throw new MemberException("소개 수정 실패");
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
	public String updateMember(@ModelAttribute Member m, Model model) {

		int result = mService.updateMember(m);
//		System.out.println(m);
		// System.out.println(result);

		if (result > 0) {

			model.addAttribute("userId", m.getId());

			return "redirect:mypage.me";
		} else {
			throw new MemberException("회원 정보 수정에 실패하였습니다.");
		}

	}

	@RequestMapping("mpwdupdate.me")
	public String UpdateMemberPwd(HttpSession session, @RequestParam("pwd") String pwd,
			@RequestParam("newPwd") String newPwd, Model model) {

		Member m = (Member) session.getAttribute("loginUser");
 
		String userId = m.getId();
		String userPwd = m.getPwd();

		String encPwd = bcrypt.encode(newPwd);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("newPwd", encPwd);

		if (bcrypt.matches(pwd, userPwd)) {

			int result = mService.updatePwd(map);

			if (result > 0) {
				model.addAttribute("userId", userId);

				return "redirect:mypage.me";
			} else {
				throw new MemberException("비밀번호 변경 실패1");
			}
		} else {
			throw new MemberException("비밀번호 변경 실패2");
		}

	}

	@RequestMapping("mdelete.me")
	public String deleteMember(@RequestParam("dUser") String id, SessionStatus session) {
		int result = mService.deleteMember(id);

		if (result > 0) {
			session.setComplete();
		} else {
			throw new MemberException("회원탈퇴에 실패하였습니다.");
		}

		return "redirect:home.do";
	}

	@RequestMapping("sendemail.me")
	@ResponseBody
	public void sendEmail(@RequestParam("mail") String email, @RequestParam("what") String what,
			HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=UTF-8");

		String rand = "";
		for (int i = 0; i < 6; i++) {
			rand += (int) (Math.random() * 9 + 1);
		}
		System.out.println("이메일인증번호" + rand);

		String mailContent = "<div style='text-align: center;'><h1>코드모아 " + what + "이메일 인증</h1>";
		mailContent += "<h3>인증번호를 입력해주세요</h3>";
		mailContent += "<div style='background : #333; color: #ffffff; padding: 15px;'><h5>" + rand
				+ "</h5></div></div>";

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			mail.setSubject("[CodeMoa] 이메일을 인증하세요 ", "utf-8");
			mail.setText(mailContent, "utf-8", "html");
			mail.setFrom(new InternetAddress(mailSender.getUsername()));
			mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
			response.getWriter().println(rand);
			System.out.println("========================== 전송완료! =============================");
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping("idCheck.me")
	public void selectId(HttpServletResponse response, @RequestParam("id") String id) {
		
		int result = mService.selectId(id);
		
		try {
			PrintWriter out = response.getWriter();
			
			if (result == 0) {
				out.println(0);
			} else {
				out.println(1);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@RequestMapping("nickNameCheck.me")
	public void selectNickName(HttpServletResponse response, @RequestParam("nickName") String nickName) {

		int result = mService.selectNickName(nickName);

		try {
			PrintWriter out = response.getWriter();

			if (result == 0) {
				out.println(0);
			} else {
				out.println(1);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "kakaoLogin.me", produces = "application/test; charset=UTF-8")
	@ResponseBody
	public String kakaoLogin(HttpServletResponse response, Member m, Model model,
						   @RequestParam("email") String email, @RequestParam("pwd") String pwd, @RequestParam("nickName") String nickName) {
		
		System.out.println("email : " + email);
		System.out.println("pwd : " + pwd);
		System.out.println("nickName : " + nickName);
		
		String[] str = email.split("@");
		String id = str[0];
		m.setId(id);
		m.setEmail(email);
		m.setNickName(nickName);
		m.setPwd(pwd);
		
		int emailCheck = mService.selectEmail(email);
		
		if(emailCheck == 0) { // 이메일 중복 X -> 회원가입
			int nickCheck = mService.selectNickName(nickName);
			int idCheck = mService.selectId(id);
			
			if(nickCheck > 0) {
				m.setNickName(nickName + "1");
			}
			if(idCheck > 0) {
				m.setId(id + "1");
			}
			
			int result = mService.insertMember(m);
			
			if(result > 0) { // 정상 회원가입
				Member loginUser = mService.login(m);
				
				if(loginUser != null) {
					model.addAttribute("loginUser", loginUser);
					return "home.do";
				} else {
					throw new MemberException("로그인 실패");
				}
			} else {
				throw new MemberException("카카오 회원가입 실패");
			}
		} else { // 로그인
			Member loginUser = mService.login(m);
			if(loginUser != null) {
				model.addAttribute("loginUser", loginUser);
				return "home.do";
			} else {
				throw new MemberException("로그인 실패");
			}
		}
	}

}

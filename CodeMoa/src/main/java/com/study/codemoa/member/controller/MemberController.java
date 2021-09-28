package com.study.codemoa.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.study.codemoa.board.model.vo.Board;
import com.study.codemoa.board.model.vo.Reply;
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
	public String login(@ModelAttribute Member m, Model model, @RequestParam("id") String id,
			@RequestParam("pwd") String pwd) {

		Member loginUser = mService.login(m);

		if (loginUser != null) {
			if (bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
				model.addAttribute("loginUser", loginUser);
				if (loginUser.getAdmin().equals("Y")) {
					return "redirect:adminPage.ad";
				}

				if (loginUser.getEnable().equals("0")) {
					return "redirect:main.do";
				} else if (loginUser.getEnable().equals("1")) {
					model.addAttribute("msg", "부적절한 닉네임으로 신고 되었습니다, 닉네임을 바꿔주세요");
					return "/loginError";
				}

			} else {
				model.addAttribute("msg", "failed");
				return "loginForm";
			}
		} else {
			model.addAttribute("msg", "failed");
			return "loginForm";
		}

		return "redirect:main.do";
	}

	@RequestMapping("logout.me")
	public String logout(SessionStatus session) {
		session.setComplete();

		return "redirect:main.do";
	}

	@RequestMapping("minsert.me")
	public String memberInsert(@ModelAttribute Member m, Model model) {

		String enPwd = bcrypt.encode(m.getPwd());

		m.setPwd(enPwd);

		int result = mService.insertMember(m);

		if (result > 0) {
			model.addAttribute("loginUser", m);
			return "redirect:main.do";
		} else {
			throw new MemberException("회원 가입 실패");
		}

	}

	@RequestMapping("mypage.me")
	public ModelAndView myPage(ModelAndView mv, @RequestParam(value = "userId") String userId,
			HttpServletResponse response) {

		Member m = mService.memberInfo(userId);

		ArrayList<Board> bList = mService.selectMyBoard(userId);
		ArrayList<Reply> rList = mService.selectMyReply(userId);

		String userImg = fileIs(userId);

		if (m != null) {
			mv.addObject("user", m);
			mv.addObject("bList", bList);
			mv.addObject("rList", rList);
			mv.addObject("userImg", userImg);
		} else {
			throw new MemberException("프로필 가져오기 실패");
		}

		mv.setViewName("mypage");

		return mv;
	}

	@RequestMapping("introduce.me")
	@ResponseBody
	public String introduceUpdate(@ModelAttribute Member m) {

		int result = mService.introduceUpdate(m);

		if (result > 0) {
			return "success";
		} else {
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

//	@RequestMapping("mUpdate.me")
//	@ResponseBody
//	public String updateMember(@ModelAttribute Member m, Model model) {
//		
//		int result = mService.updateMember(m);
//
//		if (result > 0) {
//			model.addAttribute("user", m);
//			return "success";
//		} else {
//			throw new MemberException("회원 정보 수정에 실패하였습니다.");
//		}
//
//	}

	@RequestMapping("mUpdate.me")
	public String updateMember(@ModelAttribute Member m, Model model) {

		int result = mService.updateMember(m);
//		System.out.println(m);
		// System.out.println(result);

		if (result > 0) {
			model.addAttribute("userId", m.getId());
			model.addAttribute("loginUser", m);
			return "redirect:mypage.me";
		} else {
			throw new MemberException("회원 정보 수정에 실패하였습니다.");
		}

	}

//	@RequestMapping("mpwdupdate.me")
//	public ModelAndView UpdateMemberPwd(HttpSession session, @RequestParam("pwd") String pwd,
//			@RequestParam("newPwd") String newPwd, ModelAndView mv) {
//		Member m = (Member) session.getAttribute("loginUser");
//
//		String userId = m.getId();
//		String userPwd = m.getPwd();
//
//		String encPwd = bcrypt.encode(newPwd);
//
//		HashMap<String, String> map = new HashMap<String, String>();
//		map.put("userId", userId);
//		map.put("newPwd", encPwd);
//
//		if (bcrypt.matches(pwd, userPwd)) {
//
//			int result = mService.updatePwd(map);
//
//			if (result > 0) {
//				mv.addObject("userId", userId);
//
//				mv.setViewName("mypage");
//			} else {
//				throw new MemberException("비밀번호 변경 실패1");
//			}
//		} else {
//			throw new MemberException("비밀번호 변경 실패2");
//		}
//
//		return mv;
//
//	}

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

	@RequestMapping("nickUpdate.me")
	public String updateNick(@ModelAttribute Member m) {
		System.out.println(m);

		m.setEnable("0");

		int result = mService.updateNick(m);
		System.out.println(result);

		if (result > 0) {

			return "redirect:logout.me";
		} else {
			throw new MemberException("닉네임 변경 실패");
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

		return "redirect:main.do";
	}

	@RequestMapping("sendemail.me")
	@ResponseBody
	public void sendEmail(@RequestParam("mail") String email, @RequestParam("what") String what,
			HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=UTF-8");

		System.out.println("email : " + email);

		String rand = "";
		for (int i = 0; i < 6; i++) {
			rand += (int) (Math.random() * 9 + 1);
		}

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
	public String kakaoLogin(HttpServletResponse response, Member m, Model model, @RequestParam("email") String email,
			@RequestParam("pwd") String pwd, @RequestParam("nickName") String nickName) {

		String[] str = email.split("@");
		String id = str[0];
		m.setId(id);
		m.setEmail(email);
		m.setNickName(nickName);
		m.setPwd(pwd);

		int emailCheck = mService.selectEmail(email);

		if (emailCheck == 0) { // 이메일 중복 X -> 회원가입
			int nickCheck = mService.selectNickName(nickName);
			int idCheck = mService.selectId(id);

			if (nickCheck > 0) {
				m.setNickName(nickName + "1");
			}
			if (idCheck > 0) {
				m.setId(id + "1");
			}

			int result = mService.insertMember(m);

			if (result > 0) { // 정상 회원가입

				Member loginUser = mService.login(m);

				if (loginUser != null) {
					model.addAttribute("loginUser", loginUser);
					return "index";
				} else {
					throw new MemberException("로그인 실패");
				}
			} else {
				throw new MemberException("카카오 회원가입 실패");
			}
		} else { // 로그인
			Member loginUser = mService.login(m);
			if (loginUser != null) {
				model.addAttribute("loginUser", loginUser);
				return "index";
			} else {
				throw new MemberException("로그인 실패");
			}
		}
	}

	@RequestMapping("pwdReset.me")
	public String pwdReset(@RequestParam(value = "email", required = false) String email,
			@RequestParam("pwd") String pwd) {
		String[] str = email.split("@");
		String userId = str[0];
		String encPwd = bcrypt.encode(pwd);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("newPwd", encPwd);

		int result = mService.updatePwd(map);

		if (result > 0) {
			return "loginForm";
		} else {
			throw new MemberException("비밀번호 변경 실패");
		}
	}

	@RequestMapping("deleteBoard.me")
	@ResponseBody
	public String deleteBoard(@RequestParam("no") int[] no) {

		int result = 0;
		for (int i = 0; i < no.length; i++) {
			result += mService.deleteBoard(no[i]);
		}

		if (result == no.length) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping("deleteReply.me")
	@ResponseBody
	public String deleteReply(@RequestParam("no") int[] no) {

		int result = 0;
		for (int i = 0; i < no.length; i++) {
			result += mService.deleteReply(no[i]);
		}

		if (result == no.length) {
			return "success";
		} else {
			return "fail";
		}
	}

	public String fileIs(String userId) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();

		String root = request.getSession().getServletContext().getRealPath("resources") + "/userProfile";

		File file = new File(root);

		String userImg = "none";

		if (file.isDirectory()) {
			File[] fList = file.listFiles();
			for (int i = 0; i < fList.length; i++) {
				String fileName = fList[i].getName().substring(0, fList[i].getName().lastIndexOf("."));
				if (userId.equals(fileName)) {
					userImg = fList[i].getName();
				}
			}
		}
		return userImg;
	}

	@RequestMapping("uploadImg.me")
	public String uploadImg(@RequestParam("profileImg") MultipartFile uploadFile, HttpSession session,
			HttpServletRequest request, Model m) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/userProfile";

		System.out.println(savePath);

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		String originFileName = uploadFile.getOriginalFilename();

		String renameFileName = ((Member) session.getAttribute("loginUser")).getId();

		String renamePath = folder + "\\" + renameFileName + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		try {
			uploadFile.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러");
			e.printStackTrace();
		}

		m.addAttribute("userId", renameFileName);
		return "redirect:mypage.me";

	}

	@RequestMapping("deleteImg.me")
	public String deleteImg(@RequestParam("userImg") String userImg, HttpServletRequest request, HttpSession session,
			Model m) {
		String renameFileName = ((Member) session.getAttribute("loginUser")).getId();
		String root = request.getSession().getServletContext().getRealPath("resources") + "/userProfile";
		File dFile = new File(root + "\\" + userImg);
		System.out.println(userImg);

		if (dFile.exists()) {
			dFile.delete();
			System.out.println("파일 삭제");
		} else {
			System.out.println("파일이 존재하지 않습니다.");
		}

		m.addAttribute("userId", renameFileName);
		return "redirect:mypage.me";
	}

	@RequestMapping("profileImg.me")
	@ResponseBody
	public String profileImg(@RequestParam("userId") String userId) {
		String userImg = fileIs(userId);

		return userImg;
	}
}

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
	   public String login(@ModelAttribute Member m, Model model) {

		Member loginUser = mService.login(m);

		if (loginUser != null && bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			
			if (loginUser.getAdmin().equals("Y")) {
				return "redirect:adminPage.ad";
			}
			
			return "../../../index";
		} else {
			model.addAttribute("msg", "���̵� �Ǵ� ��й�ȣ�� Ȯ�����ּ���");

			return "loginForm";
		}
	   }

	@RequestMapping("logout.me")
	public String logout(SessionStatus session) {
		session.setComplete();

		return "redirect:/";
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
			return "redirect:/";
		} else {
			throw new MemberException("ȸ�� ���� ����");
		}

	}

	@RequestMapping("mypage.me")
	public ModelAndView myPage(ModelAndView mv, @RequestParam(value = "userId") String userId, String side, HttpServletResponse response) {

		Member m = mService.memberInfo(userId);

		// response.setContentType("application/json; charset=UTF-8");

		ArrayList<Board> bList = mService.selectMyBoard(userId);

		ArrayList<Reply> rList = mService.selectMyReply(userId);

		String userImg = fileIs(userId);
		
		if (m != null) {
			mv.addObject("user", m);
			mv.addObject("bList", bList);
			mv.addObject("rList", rList);
			mv.addObject("userImg", userImg);
			mv.addObject("side", side);
		} else {
			throw new MemberException("������ �������� ����");
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
			throw new MemberException("�Ұ� ���� ����");
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
			model.addAttribute("loginUser", m);
			return "redirect:mypage.me";
		} else {
			throw new MemberException("ȸ�� ���� ������ �����Ͽ����ϴ�.");
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
				throw new MemberException("��й�ȣ ���� ����1");
			}
		} else {
			throw new MemberException("��й�ȣ ���� ����2");
		}

	}

	@RequestMapping("mdelete.me")
	public String deleteMember(@RequestParam("dUser") String id, SessionStatus session) {
		int result = mService.deleteMember(id);

		if (result > 0) {
			session.setComplete();
		} else {
			throw new MemberException("ȸ��Ż�� �����Ͽ����ϴ�.");
		}

		return "redirect:/";
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

		String mailContent = "<div style='text-align: center;'><h1>�ڵ��� " + what + "�̸��� ����</h1>";
		mailContent += "<h3>������ȣ�� �Է����ּ���</h3>";
		mailContent += "<div style='background : #333; color: #ffffff; padding: 15px;'><h5>" + rand
				+ "</h5></div></div>";

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			mail.setSubject("[CodeMoa] �̸����� �����ϼ��� ", "utf-8");
			mail.setText(mailContent, "utf-8", "html");
			mail.setFrom(new InternetAddress(mailSender.getUsername()));
			mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
			response.getWriter().println(rand);
			System.out.println("�̸���������ȣ : " + rand);
			System.out.println("========================== ���ۿϷ�! =============================");
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

	@RequestMapping("emailCheck.me")
	public void selectEmail(HttpServletResponse response, @RequestParam("email") String email) {

		int result = mService.selectEmail(email);

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

		System.out.println("email : " + email);
		System.out.println("pwd : " + pwd);
		System.out.println("nickName : " + nickName);

		String[] str = email.split("@");
		String id = str[0];

		String enPwd = bcrypt.encode(pwd);
		System.out.println("pwd : " + enPwd);

		m.setPwd(enPwd);
		m.setId(id);
		m.setEmail(email);
		m.setNickName(nickName);
		// m.setPwd(pwd);

		int emailCheck = mService.selectEmail(email);

		if (emailCheck == 0) { // �̸��� �ߺ� X -> ȸ������
			int nickCheck = mService.selectNickName(nickName);
			int idCheck = mService.selectId(id);

			if (nickCheck > 0) {
				m.setNickName(nickName + "1");
			}
			if (idCheck > 0) {
				m.setId(id + "1");
			}

			int result = mService.insertMember(m);

			if (result > 0) { // ���� ȸ������
				Member loginUser = mService.login(m);

				if (loginUser != null) {
					model.addAttribute("loginUser", loginUser);
					return "redirect:/";
				} else {
					throw new MemberException("�α��� ����");
				}

			} else {
				throw new MemberException("īī�� ȸ������ ����");
			}

		} else { // �α���
			Member loginUser = mService.login(m);

			if (bcrypt.matches(pwd, loginUser.getPwd())) {
				model.addAttribute("loginUser", loginUser);
				return "index.jsp";
			} else {
				model.addAttribute("msg", "���̵� �Ǵ� ��й�ȣ�� Ȯ�����ּ���");
				throw new MemberException("�α��� ����");
			}

//			if(loginUser != null) {
//				model.addAttribute("loginUser", loginUser);
//				return "redirect:/";
//			} else {
//				throw new MemberException("�α��� ����");
//			}
		}
	}

	@RequestMapping("deleteBoard.me")
	@ResponseBody
	public String deleteBoard(@RequestParam("no") int[] no) {

		int result = 0;
		for (int i = 0; i < no.length; i++) {
			result += mService.deleteBoard(no[i]);
			// System.out.println(no[i]);
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
			// System.out.println(no[i]);
		}

		if (result == no.length) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	public String fileIs(String userId) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();

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
		
		String side = request.getParameter("side");
		
		System.out.println(side);

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		String originFileName = uploadFile.getOriginalFilename();

		String renameFileName = ((Member) session.getAttribute("loginUser")).getId();

		String renamePath = folder + "\\" + renameFileName + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		// System.out.println(renamePath);

		try {
			uploadFile.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("���� ���� ����");
			e.printStackTrace();
		}

		return "redirect:mypage.me?userId=" + renameFileName + "&side=" + side;

	}

	@RequestMapping("deleteImg.me")
	public String deleteImg(@RequestParam("userImg") String userImg, HttpServletRequest request, HttpSession session, Model m, String side) {
		String renameFileName = ((Member) session.getAttribute("loginUser")).getId();
		String root = request.getSession().getServletContext().getRealPath("resources") + "/userProfile";
		File dFile = new File(root + "\\" + userImg);
		System.out.println(userImg);

		if (dFile.exists()) {
			dFile.delete();
			System.out.println("���� ����");
		} else {
			System.out.println("������ �������� �ʽ��ϴ�.");
		}

		return "redirect:mypage.me?userId=" + renameFileName + "&side=" + side;
	}
	
	@RequestMapping("profileImg.me")
	@ResponseBody
	public String profileImg(@RequestParam("userId") String userId) {
		String userImg = fileIs(userId);
		
		return userImg;
	}

}
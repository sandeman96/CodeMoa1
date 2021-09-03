package com.study.codemoa.message.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.study.codemoa.board.model.vo.PageInfo;
import com.study.codemoa.common.Pagination;
import com.study.codemoa.member.model.vo.Member;
import com.study.codemoa.message.exception.MessageException;
import com.study.codemoa.message.model.service.MessageService;
import com.study.codemoa.message.model.vo.Message;

@SessionAttributes("loginUser")
@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;

	@RequestMapping("messageBox.ms")
	public String messageForm(Model model, HttpSession session,
			@RequestParam(value = "receiver", required = false) String receiver,
			@RequestParam(value = "page", required = false) Integer page) {

		if (receiver == null) {
			receiver = "";
		}

		String userId = ((Member) session.getAttribute("loginUser")).getId();

		// 페이징
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", "receive");
		map.put("userId", userId);

		PageInfo pi = listCount(page, map);

		ArrayList<Message> mList = msgService.receiveBox(pi, userId);

		if (mList != null) {
			// System.out.println("받은 쪽지 : " + mList);
			model.addAttribute("type", "receive");
			model.addAttribute("mList", mList);
			model.addAttribute("pi", pi);
			model.addAttribute("receiver", receiver);
			return "messageBox";
		} else {
			throw new MessageException("쪽지 불러오기에 실패하였습니다.");
		}
	}

	@RequestMapping("sendBox.ms")
	public String sendBox(Model model, HttpSession session,
			@RequestParam(value = "page", required = false) Integer page) {

		String userId = ((Member) session.getAttribute("loginUser")).getId();

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", "send");
		map.put("userId", userId);

		PageInfo pi = listCount(page, map);

		ArrayList<Message> mList = msgService.sendeBox(pi, userId);

		if (mList != null) {
			// System.out.println("보낸 쪽지 : " + mList);
			model.addAttribute("type", "send");
			model.addAttribute("pi", pi);
			model.addAttribute("sList", mList);
			return "messageBox";
		} else {
			throw new MessageException("쪽지 불러오기에 실패하였습니다.");
		}
	}

	@RequestMapping("sendMessage.ms")
	public String sendMessage(@ModelAttribute Message message) {
		String rId = selectNick(message.getMgNick());
		message.setMgReceiver(rId);
		int result = msgService.insertMessage(message);
		// System.out.println(message);
		if (result > 0) {

			return "redirect:messageBox.ms";
		} else {
			throw new MessageException("쪽지 전송 실패");
		}
	}

	@RequestMapping("msgRead.ms")
	@ResponseBody
	public String readMessage(@ModelAttribute Message message) {

		int result = msgService.readMessage(message);
		// System.out.println(result);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping("deleteMessage.ms")
	@ResponseBody
	public String deleteMessage(@RequestParam("no") String[] no, @RequestParam("type") String type) {
		
		int result = 0;
		for (int i = 0; i < no.length; i++) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("no", no[i]);
			map.put("type", type);
			result += msgService.deleteMessage(map);	
		}

		if (result == no.length) {
			return "success";
		} else {
			return "fail";
		}

	}

	@RequestMapping("searchMessage.ms")
	public ModelAndView searchMessage(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam("keyword") String keyword, @RequestParam("type") String type, @RequestParam("id") String id, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("userId", id);
		map.put("keyword", keyword);
		
		ArrayList<Message> m = msgService.searchMessage(map);
		
		
		if (m != null) {
			if (type.equals("receive")) {
				mv.addObject("mList", m);
			} else {				
				mv.addObject("sList", m);
			}
			mv.addObject("type", type);
			mv.setViewName("messageBox");
		} else {
			throw new MessageException("검색 실패");
		}
		return mv;

	}

	@RequestMapping("nickCheck.ms")
	@ResponseBody
	public String nickCheck(@RequestParam("nick") String nick, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		String id = selectNick(nick);

		if (id != null) {
			return "Yes";
		} else {
			return "No";
		}

	}

	@RequestMapping(value = "nickList.ms")
	@ResponseBody
	public void nickList(HttpServletResponse response) {

		response.setContentType("application/json; charset=UTF-8");

		ArrayList<String> nickList = msgService.nickList();

		JSONArray jArr = new JSONArray();

		for (int i = 0; i < nickList.size(); i++) {

			jArr.add(nickList.get(i));
		}

		try {
			response.getWriter().println(jArr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("msgAlarm.ms")
	@ResponseBody
	public int msgAlarm(@RequestParam("id") String id) {
		int result = msgService.msgAlarm(id);

		return result;
	}

	public PageInfo listCount(Integer page, HashMap<String, String> map) {
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = msgService.selectList(map);
		// System.out.println(listCount);

		return Pagination.getPageInfo(currentPage, listCount);
	}

	public String selectNick(String nick) {

		String id = msgService.selectNick(nick);

		return id;

	}

}

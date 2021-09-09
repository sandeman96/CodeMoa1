package com.study.codemoa.message.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	public String messageForm(Model model, HttpSession session, @RequestParam(value = "receiver", required = false) String receiver) {
		
		if (receiver == null) {
			receiver = "";
		}
		
		String userId = ((Member) session.getAttribute("loginUser")).getId();
		ArrayList<Message> mList = msgService.receiveBox(userId);

		if (mList != null) {
			// System.out.println("받은 쪽지 : " + mList);
			model.addAttribute("type", "receive");
			model.addAttribute("mList", mList);
			model.addAttribute("receiver", receiver);
			return "messageBox";
		} else {
			throw new MessageException("쪽지 불러오기에 실패하였습니다.");
		}
	}

	@RequestMapping("sendMessage.ms")
	public String sendMessage(@ModelAttribute Message message) {
		int result = msgService.insertMessage(message);
		// System.out.println(message);
		return "redirect:messageBox.ms";
	}

	@RequestMapping("sendBox.ms")
	public String sendBox(Model model, HttpSession session) {
		String userId = ((Member) session.getAttribute("loginUser")).getId();
		ArrayList<Message> mList = msgService.sendeBox(userId);
		if (mList != null) {
			// System.out.println("보낸 쪽지 : " + mList);
			model.addAttribute("type", "send");
			model.addAttribute("sList", mList);
			return "messageBox";
		} else {
			throw new MessageException("쪽지 불러오기에 실패하였습니다.");
		}
	}
	
	@RequestMapping("msgRead.ms")
	@ResponseBody
	public String readMessage(@ModelAttribute Message message) {
		
		int result = msgService.readMessage(message);
		// System.out.println(result);
		if (result > 0) {
			return "success";
		}else {
			throw new MessageException("메세지 상태 전환 실패");
		}
	}
	
	@RequestMapping("deleteMessage.ms")
	@ResponseBody
	public String deleteMessage(@RequestParam("no") String no, @RequestParam("type") String type) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("no", no);
		map.put("type", type);
		System.out.println(map);
		int result = msgService.deleteMessage(map);
		// System.out.println(result);
		if (result > 0) {
			
			return "success";
		}else {
			throw new MessageException("쪽지 삭제 실패");
		}
		
	}

}

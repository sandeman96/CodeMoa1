package com.study.codemoa.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.study.codemoa.chat.model.exception.ChatException;
import com.study.codemoa.chat.model.service.ChatService;
import com.study.codemoa.chat.model.vo.Chat;
import com.study.codemoa.chat.model.vo.ChatRoom;


@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	@RequestMapping("chat.ch")
	public ModelAndView goChat(@RequestParam("crNo") int crNo, 
							   @RequestParam("crTitle") String crTitle) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("crNo", crNo);
		mv.addObject("crTitle", crTitle);
		
		mv.setViewName("chat");
		
		return mv;
	}
	
	@RequestMapping("goRoom.ch")
	public ModelAndView goRoom() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("room");
		return mv;
	}
	
	// 방 정보 가져오기
	@RequestMapping("getRoom.ch")
	@ResponseBody
	public ArrayList<ChatRoom> getRoom(@RequestParam HashMap<Object, Object> params){
		return cService.getRoomList();
	}
	
	// 채팅방 생성
	@RequestMapping("createRoom.ch")
	@ResponseBody
	public ArrayList<ChatRoom> createRoom(@RequestParam HashMap<Object, Object> params,
										  @RequestParam("crTitle") String crTitle,
										  @RequestParam("crMaker") String crMaker,
										  @RequestParam("crPwd") String crPwd){
		ArrayList<ChatRoom> roomList = null;
		
		ChatRoom cr = new ChatRoom();
		cr.setCrTitle(crTitle);
		cr.setCrMaker(crMaker);
		cr.setCrPwd(crPwd);
		
		int result = cService.insertRoom(cr);
		
		if(result > 0) {
			roomList = cService.getRoomList();
			
			if(roomList == null) {
				throw new ChatException("채팅방 목록 조회 실패");
			}
		} else {
			throw new ChatException("채팅방 목록 조회 실패");
		}
		return roomList;
	}
	
	// 방 비밀번호 확인
	@RequestMapping("pwdCheck.ch")
	@ResponseBody
	public String pwdCheck(@RequestParam("crPwd") String crPwd,
						   @RequestParam("crNo") int crNo) {
		ChatRoom room = new ChatRoom();
		room.setCrPwd(crPwd);
		room.setCrNo(crNo);
		
		int result = cService.pwdCheck(room);
		
		if(result > 0 ) {
			return "true";
		} else {
			return "false";
		}
	}
	
	@RequestMapping("makerCheck.ch")
	@ResponseBody
	public String makerCheck(@RequestParam("id") String id) {
		int result = cService.makerCheck(id);
		
		if(result > 0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	@RequestMapping("deleteRoom.ch")
	@ResponseBody
	public String deleteRoom(@RequestParam("crNo") int crNo) {
		
		int result = cService.deleteRoom(crNo);
		
		if(result > 0) {
			return "true";
		} else {
			throw new ChatException("채팅방 삭제를 실패하였습니다");
		}
	}
	
	@RequestMapping(value = "getChatting.ch", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getChatting(@RequestParam("crNo") int crNo) {
		
		ArrayList<Chat> chatList = cService.getChatting(crNo);
		JSONArray jArr = new JSONArray();
		for(Chat c : chatList) {
			JSONObject jObj = new JSONObject();
			jObj.put("cNo", c.getcNo());
			jObj.put("cDate", c.getcDate());
			jObj.put("cChat", c.getcChat());
			jObj.put("crNo", c.getcRNo());
			jObj.put("cSender", c.getcSender());
			
			jArr.add(jObj);
		}
		
		return jArr.toJSONString();
	}
}

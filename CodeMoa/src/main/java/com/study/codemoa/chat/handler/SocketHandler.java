package com.study.codemoa.chat.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.study.codemoa.chat.model.exception.ChatException;
import com.study.codemoa.chat.model.service.ChatService;
import com.study.codemoa.chat.model.vo.Chat;

@Controller
public class SocketHandler extends TextWebSocketHandler {
	
	@Autowired
    ChatService cService;
	
	ArrayList<HashMap<String, Object>> rls = new ArrayList<>(); // 웹소켓 세션을 담는 리스트
	
	// 메시지 발송
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		String msg = message.getPayload();
		JSONObject obj = jsonToObjectParser(msg);
		
		String crNo = (String) obj.get("crNo");
		String cChat = (String) obj.get("msg");
		String cSender = (String) obj.get("id");
		
		Chat chat = new Chat();
		chat.setcRNo(Integer.parseInt(crNo));
		chat.setcChat(cChat);
		chat.setcSender(cSender);
		
		// 채팅 내용 저장
		if(cService.insertChat(chat) <= 0 ) {
			throw new ChatException("채팅 저장에 실패하였습니다");
		}
		
		// id -> nickName으로 변경
		String nickName = cService.getNickName(cSender);
		obj.remove("id");
		obj.put("nickName", nickName);
		
		HashMap<String, Object> temp = new HashMap<String, Object>();
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String sessionCrNo = (String) rls.get(i).get("crNo"); // 세션리스트에 저장된 방 번호를 가져옴
				if(sessionCrNo.equals(crNo)) { // 같은 값의 방이 존재하면
					temp = rls.get(i); // 해당 방 번호의 세션리스트에 존재하는 모든 object값 가져옴
					break;
				}
			}
			
			// 해당 방의 세션들만 찾아서 메시지 발송
			for(String k : temp.keySet()) { 
				if(k.equals("crNo")) { // 방 번호일 경우 건너뜀
					continue;
				}
				
				WebSocketSession wss = (WebSocketSession) temp.get(k);
				if(wss != null) {
					try {
						wss.sendMessage(new TextMessage(obj.toJSONString()));
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	//소켓 연결
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		System.out.println("session : " + session);
		boolean flag = false;
		String url = session.getUri().toString();
		
		String crNo = url.split("/chatting/")[1];
		int idx = rls.size(); //방의 사이즈를 조사한다.
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String rN = (String) rls.get(i).get("crNo");
				if(rN.equals(crNo)) {
					flag = true;
					idx = i;
					break;
				}
			}
		}
		
		if(flag) { // 존재하는 방은 세션만 추가
			HashMap<String, Object> map = rls.get(idx);
			map.put(session.getId(), session);
		}else { // 새로 만드는 방은 방번호, 세션 추가
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("crNo", crNo);
			map.put(session.getId(), session);
			rls.add(map);
		}
		
		// 세션등록 후 세션id 발송
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toJSONString()));
	}
			
	//소켓 종료
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		if(rls.size() > 0) { //소켓이 종료되면 해당 세션값들을 찾아서 지운다.
			for(int i=0; i<rls.size(); i++) {
				rls.get(i).remove(session.getId());
			}
		}
		super.afterConnectionClosed(session, status);
	}
	
	private static JSONObject jsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
}
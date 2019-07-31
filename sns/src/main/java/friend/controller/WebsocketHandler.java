package friend.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import friend.domain.FriendVO;
import friend.service.FriendServiceImpl;





public class WebsocketHandler extends TextWebSocketHandler{
	FriendServiceImpl friendService;
	FriendVO friendVO = new FriendVO();
	FileWriter file;
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	private Map<String, String> sessionList = new HashMap<String, String>();
	
	public void setFriendService(FriendServiceImpl friendService) {
		this.friendService = friendService;
	}

	

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> map = session.getAttributes();
		System.out.println("session = "+map.values());
		boolean check = true;
		if(sessionList.containsKey(map.get("myId").toString())) {
			check = false;
		}
		if(check) {
			System.out.println("하나의 클라이언트 연결 됨");
			sessionList.put(map.get("myId").toString(), session.getId());
			list.add(session);
		}
		friendVO.setEmail1(map.get("myId").toString());
		friendVO.setEmail2(map.get("friendId").toString());
		String chatFile = friendService.checkChat(friendVO);
		if(chatFile == null) {
			System.out.println("새로생성");
			String fileName = System.currentTimeMillis() + ".txt";
			file = new FileWriter("D:/반응형웹개발자/Project/kyh90-master/kyh90-master/sns/src/main/webapp/chatLog/"+fileName,true);
			friendVO.setChat(fileName);
			friendService.updateChat(friendVO);
			friendVO.setEmail1(map.get("friendId").toString());
			friendVO.setEmail2(map.get("myId").toString());
			friendService.updateChat(friendVO);
		}else {
			System.out.println("이미 존재");
			BufferedReader reader = new BufferedReader(new FileReader("D:/반응형웹개발자/Project/kyh90-master/kyh90-master/sns/src/main/webapp/chatLog/"+chatFile));
			for(int i = 0; i<30; i++) {
				String msg = reader.readLine();
				if(msg != null) {
					for(WebSocketSession s : list) {
						if(s.getId().toString().equals(sessionList.get(map.get("myId").toString()))) {
							s.sendMessage(new TextMessage(msg));
						}
					}
				}
			}
			reader.close();
		}

	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, Object> map = session.getAttributes();
		String msg = message.getPayload();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		msg = sdf.format(date)+msg;
		System.out.println(msg);
		String chatFile = friendService.checkChat(friendVO);
		file = new FileWriter("D:/반응형웹개발자/Spring/springwork/project/src/main/webapp/chatLog/"+chatFile,true);
		BufferedWriter bf = new BufferedWriter(file);
		bf.append(msg+"\r\n");
		for(WebSocketSession s : list) {
			if(s.getId().toString().equals(sessionList.get(map.get("friendId").toString()))) {
				s.sendMessage(new TextMessage(msg));
			}else if (s.getId().toString().equals(sessionList.get(map.get("myId").toString()))){
				s.sendMessage(new TextMessage(msg));
			}
		}
		bf.close();
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> map = session.getAttributes();
		System.out.println("해제 됨");
		sessionList.remove(map.get("myId").toString());
		list.remove(session);
	}
}

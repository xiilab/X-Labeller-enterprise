package com.xlabeller.chat;

import com.google.gson.Gson;
import com.xlabeller.models.MessageVO;
import com.xlabeller.models.UserVO;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

 
public class ChatHandler extends TextWebSocketHandler {
 
    private Logger logger = LoggerFactory.getLogger(ChatHandler.class);
 
    /**
     * 서버에 연결한 사용자들을 저장하는 리스트
     */

    private Map<String,List<WebSocketSession>> connectedUsers;
//    private Map<String,UserVO> userMap;
    
    //룸의 개념이 들어가면....중간에 한뎁스 더 추가
    private JSONObject userObj;
    
    public ChatHandler() {
    	connectedUsers = new HashMap<String,List<WebSocketSession>>();
    	userObj = new JSONObject();
    	
    }
 
    private String getRoom(WebSocketSession session){
    	String query = session.getUri().getQuery();
    	String room = query.split("=")[1];
    	return room;
    }
    
    /**
     * 접속과 관련된 Event Method
     *
     * @param WebSocketSession
     *            접속한 사용자
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	
    	Map<String,Object> map = session.getAttributes();
    	UserVO userVO = (UserVO)map.get("userInfo");
    	if(userVO == null){
    		return;
    	}
    	
    	String room = getRoom(session);
    	if(connectedUsers.get(room) == null){
    		List<WebSocketSession> userList = new ArrayList<WebSocketSession>();
    		connectedUsers.put(room, userList);
    		connectedUsers.get(room).add(session);
    	}else{
    		connectedUsers.get(room).add(session);
    	}
    	
    	
    	
    	String nickname = userVO.getAccount();
    	if(userObj.get(nickname) == null){
    		JSONObject temp = new JSONObject();
    		temp.put(session.getId(), session);
    		userObj.put(nickname,temp);
    	}else{
    		JSONObject temp = (JSONObject)userObj.get(nickname);
    		temp.put(session.getId(), session);
    	}
    	
    	List<String> nicknameList = new ArrayList<String>(userObj.keySet());
    	String nicknameJson = new Gson().toJson(nicknameList);
    	JSONObject msgVO = new JSONObject();
    	msgVO.put("type","add");
    	msgVO.put("message",nicknameJson);
    	
    	session.sendMessage(new TextMessage(msgVO.toJSONString()));
    	
    	List<String> oneNicknameList = new ArrayList<String>();
    	oneNicknameList.add(nickname);
    	String oneNicknameJson = new Gson().toJson(oneNicknameList);
    	JSONObject oneMsgVO = new JSONObject();
    	oneMsgVO.put("type","add");
    	oneMsgVO.put("message",oneNicknameJson);
    	
    	for (WebSocketSession webSocketSession : connectedUsers.get(room)) {
    		if (!session.getId().equals(webSocketSession.getId())) {
              webSocketSession.sendMessage(new TextMessage(oneMsgVO.toJSONString()));
    		}
    	}
    	
    	
    	
        logger.info(session.getId() + "님이 접속했습니다.");
        logger.info("연결 IP : " + session.getRemoteAddress().getHostName());
    }
 
    /**
     * 두 가지 이벤트를 처리
     *
     * 1. Send : 클라이언트가 서버에게 메시지를 보냄
     * 2. Emit : 서버에 연결되어 있는 클라이언트에게 메시지를 보냄
     *
     * @param WebSocketSession
     *            메시지를 보낸 클라이언트
     * @param TextMessage
     *            메시지의 내용
     */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
 
        MessageVO messageVO = MessageVO.converMessage(message.getPayload());
        String hostName = "";
        String room = getRoom(session);
        
        Map<String,Object> map = session.getAttributes();
    	UserVO userVO = (UserVO)map.get("userInfo");
    	
    	if(userVO == null){
    		return;
    	}
    	
    	JSONObject sendMsg = new JSONObject();
    	sendMsg.put("nickname",userVO.getAccount());
    	sendMsg.put("message",messageVO.getMessage());
    	sendMsg.put("type",messageVO.getType());
    	
    	String msg = sendMsg.toJSONString();
        
    	
        
        for (WebSocketSession webSocketSession : connectedUsers.get(room)) {
            if (messageVO.getType().equals("all")) {
            	webSocketSession.sendMessage(new TextMessage(msg));
//                if (!session.getId().equals(webSocketSession.getId())) {
//                    webSocketSession.sendMessage(
//                            new TextMessage(session.getRemoteAddress().getHostName() + " ▶ " + messageVO.getMessage()));
//                }
            } 
            else {
                hostName = webSocketSession.getRemoteAddress().getHostName();
                if (messageVO.getTo().equals(hostName)) {
                    webSocketSession.sendMessage(
                            new TextMessage(msg) );
                    break;
                }
            }
        }
 
        /*
         * Payload : 사용자가 보낸 메시지
         */
        logger.info(session.getId() + "님의 메시지 : " + message.getPayload());
    }
 
    /**
     * 클라이언트가 서버와 연결을 끊었을때 실행되는 메소드
     *
     * @param WebSocketSession
     *            연결을 끊은 클라이언트
     * @param CloseStatus
     *            연결 상태(확인 필요함)
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	Map<String,Object> map = session.getAttributes();
    	UserVO userVO = (UserVO)map.get("userInfo");
    	if(userVO == null){
    		String room = getRoom(session);
        	connectedUsers.get(room).remove(session);
    		return;
    	}
    	
    	String room = getRoom(session);
    	String nickname = userVO.getAccount();
    	//여기 좀비 될가능성잇을듯..http세션 끈긴상태에서 wssession제거가 안될수도...
    	((JSONObject)userObj.get(nickname)).remove(session.getId());
    	connectedUsers.get(room).remove(session);
    	
    	if(((JSONObject)userObj.get(nickname)).isEmpty()){
    		((JSONObject)userObj).remove(nickname);
        	//메시지 전달(if userObj에 nickname내부에 아무것도 연결이 없을때만
        	List<String> oneNicknameList = new ArrayList<String>();
        	oneNicknameList.add(nickname);
        	String oneNicknameJson = new Gson().toJson(oneNicknameList);
        	JSONObject msgVO = new JSONObject();
        	msgVO.put("type","pop");
        	msgVO.put("message",oneNicknameJson);
        	
        	for (WebSocketSession webSocketSession : connectedUsers.get(room)) {
                if (!session.getId().equals(webSocketSession.getId())) {
                    webSocketSession.sendMessage(new TextMessage(msgVO.toJSONString()));
                }
            }

    		
    	}
    	
 
    }
}



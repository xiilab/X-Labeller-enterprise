package com.xlabeller.models;

import com.google.gson.Gson;


public class MessageVO {
	
	private String nickname;
	private String message;
	private String type;
	private String to;
	private String room;
	 
	public static MessageVO converMessage(String source) {
	    MessageVO message = new MessageVO();
	    Gson gson = new Gson();
	    message = gson.fromJson(source, MessageVO.class);
	 
	    return message;
	}

	
	
	
	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
	}




	public String getRoom() {
		return room;
	}



	public void setRoom(String room) {
		this.room = room;
	}



	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}
	
	
	
}
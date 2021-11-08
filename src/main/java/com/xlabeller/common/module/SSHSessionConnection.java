package com.xlabeller.common.module;

import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

import java.util.concurrent.Callable;

public class SSHSessionConnection implements Callable<Session>{
	private String userName;
	private int port;
	private String host;
	private String pw;
	private Session session;
	
	public SSHSessionConnection(String userName, int port, String host, String pw) {
		this.userName = userName;
		this.port = port;
		this.host = host;
		this.pw = pw;
	}
	
	@Override
	public Session call() {
		
		JSch jsch = new JSch();
		//long beforeTime = System.currentTimeMillis();
		//Session session = null;
		try {
			session = jsch.getSession(userName, host, port);
			session.setPassword(pw);
			
			java.util.Properties config = new java.util.Properties();
			
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			session.connect();
			
			System.out.println(this.host + " conneciton!");
			return session;
			//System.out.println("connection!");
			//long afterTime = System.currentTimeMillis();
			
			//System.out.println("afterTime second is "+ (afterTime / 1000) % 60);
			//System.out.println("afterTime minute is "+ (afterTime / (1000 * 60)) % 60 );
			//System.out.println("afterTime hour is "+ (afterTime / (1000 * 60 * 60)) % 24);
			
			//System.out.println( "실행 시간 : " + ( afterTime - beforeTime )/1000.0 + "초"); 
			
//			totalTime += ( afterTime - beforeTime )/1000.0;
			//출처: https://emmadeveloper.tistory.com/25 [emmaiswatson Developer]
			//System.out.println("After Time : " + afterTime);
		} catch (JSchException e) {
			System.out.println("JSchException 에러 발생!" + e);
		}
		return null;
	}
	
	public Session getSession() {
		return this.session;
	}
	
	public void sessionClose() {
		if (this.session != null) {
			this.session.disconnect();
		}
	}	
}


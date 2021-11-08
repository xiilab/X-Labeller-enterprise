package com.xlabeller.sshSession;

import com.jcraft.jsch.Session;
import com.xlabeller.gpuNode.GpuNodeDao;
import com.xlabeller.models.GpuNodeVO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.*;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

@Component
public class SessionSingletone {
	// private static SessionSingleTone sessionSingleTone = null;

	@Autowired
	public GpuNodeDao gpuNodeDao;

	private static GpuNodeDao gpuDao;

	// SessionSingletone이 로드된 이후에 gpuNodeDao가 생성되기 때문에 먼저 Autowired 인스턴스 필드를 만들고
	// 할당해주어야 함.
	@PostConstruct
	private void initGpuDao() {
		gpuDao = this.gpuNodeDao;
	}

	private volatile static SessionSingletone uniqueInstance;
	private static Map<String, Session> sessionMap = null;

	private static Logger logger = Logger.getLogger(SessionSingletone.class);

	private SessionSingletone() {
	}

	public static SessionSingletone getInstance() {
		if (uniqueInstance == null) {
			synchronized (SessionSingletone.class) {
				if (uniqueInstance == null) {
					uniqueInstance = new SessionSingletone();
				}
				if (sessionMap == null || sessionMap.isEmpty()) {
					sessionMap = new HashMap<String, Session>();
				}

			}
		}

		GpuNodeVO inGpuNodeVO = new GpuNodeVO();
		inGpuNodeVO.setType("worker");
		List<GpuNodeVO> gpuList = gpuDao.getGpuNodeList(inGpuNodeVO);

		Collection sshCmdList = new ArrayList();

		synchronized (uniqueInstance) {
			// DB에서 GpuList를 불러와 연결상태를 확인
			for (int i = 0; i < gpuList.size(); i++) {
				String ip = gpuList.get(i).getAddress();
				String userName = gpuList.get(i).getAccount();
				int port = 0;
				try {
					port = Integer.parseInt(gpuList.get(i).getPort());
				} catch (NumberFormatException e) {
					logger.error("NumberFormatException Error!", e);
					continue;
				}

				String pw = gpuList.get(i).getPassword();
				// Map에 Ip가 키값으로 존재하지 않을 경우, 연결을 위해 콜렉션에 추가
				if (sessionMap.get(ip) == null) {
					sessionMap.remove(ip);
					sshCmdList.add(new SSHSessionConnection(userName, port, ip, pw));
					// 키값이 IP주소이고 값이 세션타입일 경우, 세션의 연결상태를 확인
				} else if (sessionMap.get(ip) instanceof Session) {
					//System.out.println("2 add!");
					Session session = sessionMap.get(ip);
					// 세션이 null이거나, 연결이 안되어 있을 경우
					if (session == null || session.isConnected() == false) {
						sessionMap.remove(ip);
						sshCmdList.add(new SSHSessionConnection(userName, port, ip, pw));
					} else {
						session = null;
						continue;
					}
				}
			}

			List<Future<Session>> sshSessionList = null;
			if (!sshCmdList.isEmpty()) {
				sshSessionList = new ArrayList<Future<Session>>();
				// sshSessionList = new ArrayList<Future<Session>>();
				ExecutorService executorService = Executors.newFixedThreadPool(10);
				try {
					sshSessionList = executorService.invokeAll(sshCmdList);
				} catch (Exception e) {
					if (e instanceof InterruptedException) {
						System.out.println("InterruptedException Execption Error!" + e);
					} else {
						System.out.println("Exception Error!" + e);
					}
				} finally {
					executorService.shutdown();
				}
			}

			if (sshSessionList == null || sshSessionList.size() <= 0 || sshSessionList.isEmpty()) {
				return uniqueInstance;
			}

			for (int i = 0; i < sshSessionList.size(); i++) {
				Session sshSession = null;
				try {
					sshSession = sshSessionList.get(i).get();
					if (sshSession == null || sshSession.isConnected() == false) {
						continue;
					}
					sessionMap.put(sshSession.getHost(), sshSession);
				} catch (InterruptedException | ExecutionException e) {
					if (e instanceof InterruptedException) {
						logger.error("InterruptedException error!", e);
					} else if (e instanceof ExecutionException) {
						logger.error("ExecutionException", e);
					} else {
						logger.error("Exception Error!", e);
					}

					continue;
				} finally {
					sshSession = null;
				}
			}
		}

		return uniqueInstance;
	}

	public Map<String, Session> getSessionMap() {
		return sessionMap;
	}
	
	public static Session getSession(String host) {
		return sessionMap.get(host);
	}
}

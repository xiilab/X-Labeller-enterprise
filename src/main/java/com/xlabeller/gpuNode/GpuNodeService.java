package com.xlabeller.gpuNode;

import com.jcraft.jsch.Session;
import com.xlabeller.common.module.Output;
import com.xlabeller.common.module.SessionUtil;
import com.xlabeller.models.*;
import com.xlabeller.project.ProjectDao;
import com.xlabeller.sshSession.SessionCmdExecute;
import com.xlabeller.sshSession.SessionSingletone;
import com.xlabeller.task.TaskDao;
import com.xlabeller.task.TaskService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

@Service
public class GpuNodeService {
	@Autowired
	private GpuNodeDao gpuNodeDao;
	@Autowired
	private TaskDao taskDao;
	@Autowired
	private ProjectDao projectDao;
	

	@Value("#{globalProperty['grpc.address']}")
	private String GRPC_ADDRESS;
	
	@Value("#{globalProperty['grpc.port']}")
	private int GRPC_PORT;
	
	private static Logger logger = Logger.getLogger(TaskService.class);
	public Object getGpuNodeList(GpuNodeVO gpuNodeVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
		}
		Object result = gpuNodeDao.getGpuNodeList(gpuNodeVO);
		return Output.JsonOutput("200", result);
	}
	
	public Object getGpuNodeStatusList(GpuNodeVO gpuNodeVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
		}
		gpuNodeVO.setType("worker");
		List<GpuNodeVO> resultList = gpuNodeDao.getGpuNodeStatusList(gpuNodeVO);
		return Output.JsonOutput("200", resultList);
	}
	
	
	public Object insertGpuNode(GpuNodeVO gpuNodeVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
		}
		
		int cnt = gpuNodeDao.insertGpuNode(gpuNodeVO);
		if(cnt != 1){
			throw new Exception("4001#등록이 올바르지 않습니다.");
		}
		return Output.JsonOutput("200", "등록이 완료되었습니다");
		
	}
	
	public Object deleteGpuNode(GpuNodeVO gpuNodeVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
		}
		
		int cnt = gpuNodeDao.deleteGpuNode(gpuNodeVO);
		if(cnt != 1){
			throw new Exception("5091#삭제가 올바르지 않습니다.");
		}
		
		
		return Output.JsonOutput("200", "삭제가 완료되었습니다.");
	}
        
	
	public Object updateGpuNode(GpuNodeVO gpuNodeVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
		}
		
		int cnt = gpuNodeDao.updateGpuNode(gpuNodeVO);
		if(cnt == 1){
			return Output.JsonOutput("200", "업데이트가 완료되었습니다");
		}else{
			return Output.JsonOutput("4500", "업데이트가 올바르지 않습니다");
		}
	}
	
	public Object getGpuNodeById(GpuNodeVO gpuNodeVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
		}
		
		Object result = gpuNodeDao.getGpuNodeById(gpuNodeVO);
		return Output.JsonOutput("200", result);
	}

	// s.kim 수정 
//	public Object getServiceList() {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
//		}
//		
//		GrpcUtils gu = new GrpcUtils();
//		List<DockerServiceVO> result = (List<DockerServiceVO>)gu.serviceList(GRPC_ADDRESS, GRPC_PORT);
//		 
//		ProjectTaskVO tempProjectTaskVO = new ProjectTaskVO();
//		ProjectTaskVO tempResult = null;
//		for(int i = 0 ; i < result.size();i++) {
//			String taskId = result.get(i).getId();
//			String projectId = result.get(i).getProject_id();
//			tempProjectTaskVO.setProject_id(projectId);
//			tempProjectTaskVO.setTask_id(taskId);
//			tempResult = taskDao.getProjectTaskById(tempProjectTaskVO);
//			if(tempResult != null) {
//				result.get(i).setProject_title(tempResult.getProject_title());
//				result.get(i).setTask_title(tempResult.getTask_title());
//			}
//		}
//	
//		
//		return Output.JsonOutput("200", result);
//	}
	//
	// s.kim 추가 
	
	public Object getServiceList() {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        List<DockerServiceVO> result = new ArrayList<DockerServiceVO>();
        
        GpuNodeVO inGpuNodeVO = new GpuNodeVO();
        inGpuNodeVO.setType("worker");
        List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);
        
        Object sessionObj = getSSHSessionList(gpuList);
		if(sessionObj instanceof JsonOutputVO) {
			return Output.JsonOutput("300", "현재 동작중인 GPU가 존재하지 않습니다.");
		}
		
		List<Session> sessionList = (List<Session>)sessionObj;
		
		if(sessionList.size() <= 0 || sessionList.isEmpty()) {
            //return Output.JsonOutput("3454", "연결된 노드가 없습니다.\nSetup에서 worker 노드를 연결 후 다시 시도하세요.");
			return Output.JsonOutput("300", "현재 동작중인 GPU가 존재하지 않습니다.");
        }
	
		Collection runTaskListCmd = new ArrayList();
		// 이미지 체크의 결과를 반환받는 리스트
		List<Future<DockerServiceVO>> runTaskList = new ArrayList();

		for (int i = 0; i < sessionList.size(); i++) {
			SSHSessionVO sshSessionVO = new SSHSessionVO();
			sshSessionVO.setCommnad("runTaskList");
			// 이미지 체크 명령어, 이미지 이름을 넘겨주고 객체를 생성해 콜렉션에 추가
			runTaskListCmd.add(new SessionCmdExecute(sessionList.get(i), sshSessionVO));
		}

		ExecutorService executorService = Executors.newFixedThreadPool(10);
		try {
			// 콜렉션에 생성된 객체를 쓰레드로 실행시킴, 명령어를 실행해 성공한 경우에만 리스트에 추가함.
			runTaskList = executorService.invokeAll(runTaskListCmd);
		} catch (Exception e) {
			if (e instanceof InterruptedException) {
				logger.error("InterruptedException Error!", e);
			} else {
				logger.error("Exception Error!", e);
			}
		} finally {
			executorService.shutdown();
		}

		if (runTaskList.size() <= 0 || runTaskList.isEmpty()) {
			executorService.shutdown();
			return null;
		}
        //List<SSHCmdExecute> sshList = (List<SSHCmdExecute>) getSSHSessionList(gpuList);
        
//        for(int i = 0; i < gpuList.size(); i++) {
//            String account = gpuList.get(i).getAccount();
//            String address = gpuList.get(i).getAddress();
//            String password = gpuList.get(i).getPassword(); 
//            int port = 0;
//    		try {
//    			port = Integer.valueOf(gpuList.get(i).getPort());
//    		} catch (NumberFormatException e) {
//    			logger.error("GPU Node의 포트번호가 잘못된 형태입니다.\nDB에서 수정해주세요.");
//    			logger.error("NumberFormatException Error!", e);
//    			continue;
//    			//return Output.JsonOutput("801", "해당 GPU Node의 port번호가 올바르지 않습니다.\nGPU Node의 Port번호를 수정해주세요.");
//    		}
//            
//            SSHCmdExecute sshCmdExcute = new SSHCmdExecute(account, port, address, password);
//            sshList.add(sshCmdExcute);
//        }
        
        // s.kim 수 (2021-01-26)
        // 기존 grpc 를 ssh 로 변
//        List<DockerServiceVO> result = new ArrayList<DockerServiceVO>();
//        for(int i = 0; i < sshList.size(); i++) {
//            //sshList.get(i).cmdExcute(command)
//            SSHCmdExecute sshSession = sshList.get(i);
//            List<DockerServiceVO> list = sshSession.runTaskList();
//            if (list != null && list.size() != 0) {             
//                for (int j = 0; j < list.size(); j++) {
//                    result.add(list.get(j));
//                }
//            }
//        }
        
//		List<DockerServiceVO> result = new ArrayList<DockerServiceVO>();
        ProjectTaskVO tempProjectTaskVO = new ProjectTaskVO();
        ProjectTaskVO tempResult = null;
        for(int i = 0; i < runTaskList.size(); i++) {
        	try {
        		List<DockerServiceVO> taskList = (List<DockerServiceVO>) runTaskList.get(i).get();
        		if(taskList == null || taskList.size() <= 0) {
        			continue;
        		} 
        		for(int j = 0; j < taskList.size(); j++) {
        			DockerServiceVO dockerServiceVO = taskList.get(j);
        			String taskId = dockerServiceVO.getId();
                	String projectId = dockerServiceVO.getProject_id();
                	tempProjectTaskVO.setProject_id(projectId);
                	tempProjectTaskVO.setTask_id(taskId);
                	tempResult = taskDao.getProjectTaskById(tempProjectTaskVO);
                	if(tempResult != null) {
                		dockerServiceVO.setProject_title(tempResult.getProject_title());
                		dockerServiceVO.setTask_title(tempResult.getTask_title());
                	}
                	result.add(dockerServiceVO);
        		}
			} catch (Exception e) {
				if(e instanceof InterruptedException) {
					logger.error("InterruptedException Error!", e);
				} else if(e instanceof ExecutionException) {
					logger.error("ExecutionException Error!", e);
				} else {
					logger.error("Exception Error!", e);
				}
				
				continue;
			}
        }
        
        return Output.JsonOutput("200", result);
    }
	
	private Object getSSHSessionList(List<GpuNodeVO> gpuList) {
		List<Session> sessionList = new ArrayList<Session>();
		SessionSingletone sessionSingletone = SessionSingletone.getInstance();
		Map<String, Session> sessionMap = sessionSingletone.getSessionMap();
		if(sessionMap == null || sessionMap.isEmpty()) {
			return Output.JsonOutput("3454", "원격 접속 가능한 GPU Server가 존재하지 않습니다.\nSetup 또는 서버상태를 확인하세요.");
		}
		
		for(int i = 0; i < gpuList.size(); i++) {
			Session session = sessionMap.get(gpuList.get(i).getAddress());
			if(session == null || session.isConnected() == false) {
				continue;
			}
			sessionList.add(session);
		}
		
		if(sessionList == null || sessionList.size() <= 0 || sessionList.isEmpty()) {
			logger.error("원격 접속 가능한 세션 없음! Setup을 확인하세요.");
			return Output.JsonOutput("3454", "원격 접속 가능한 GPU Server가 존재하지 않습니다.\nSetup 또는 서버상태를 확인하세요.");
		}
		
		return sessionList;
			
	}
	
		
	
	
}
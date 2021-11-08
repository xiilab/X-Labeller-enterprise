package com.xlabeller.project;

import com.xlabeller.common.module.CustomException;
import com.xlabeller.common.module.FileUtils;
import com.xlabeller.common.module.Output;
import com.xlabeller.common.module.SessionUtil;
import com.xlabeller.gpuNode.GpuNodeService;
import com.xlabeller.models.*;
import com.xlabeller.task.TaskDao;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;

@Service
public class ProjectService {
	@Autowired
	private GpuNodeService gpuNodeService;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private TaskDao taskDao;
	
	private String WORKSPACE_PATH = "/usr/local/uploadFile/xlabeller/workspace/";
	
	private static Logger logger = Logger.getLogger(ProjectService.class);
	
	public Object getProjectList(ProjectVO projectVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		//페이징
		int count = projectDao.getProjectTotalCount(projectVO);
		int size = 9999;
		int pageStart = 0;
		if(projectVO.getPage_num() != null && !projectVO.getPage_num().equals("")) {
			try {
				pageStart = Integer.valueOf(projectVO.getPage_num()).intValue();
			} catch (NumberFormatException e) {
				logger.error("NumberFormatException Error!", e);
				pageStart = 0;
			}
		}
		
		
		projectVO.setPage_num(String.valueOf(pageStart * size));
		projectVO.setPage_size(String.valueOf(size));
		projectVO.setTotal_size(String.valueOf(count));
		
		
		Object result = projectDao.getProjectList(projectVO);
		return Output.JsonOutput("200", result);
	}
	
	public Object insertProject(ProjectVO projectVO) throws CustomException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		projectVO.setUser_id(userInfo.getUser_id());
		projectVO.setIs_fixed("0");
		int cnt = projectDao.insertProject(projectVO);
		if(cnt != 1){
			return Output.JsonOutput("4001", "프로젝트 등록이 올바르지 않습니다.");
		}
		
		//
		String path = WORKSPACE_PATH;
		File f = new File(path+projectVO.getProject_id());
		boolean isMake = f.mkdir();
		if(!isMake) {
			throw new CustomException("4002#등록이 올바르지 않습니다.");
		}
		//
		
		return Output.JsonOutput("200", "등록이 완료되었습니다");
	}
	
	public Object deleteProject(ProjectVO projectVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		
		String projectId = projectVO.getProject_id();

		//is_fixed 체크
		ProjectVO outputProjectVO = projectDao.getProjectById(projectVO);
		if(outputProjectVO.getIs_fixed() != null && outputProjectVO.getIs_fixed().equals("1")) {
			return Output.JsonOutput("5098", "삭제가 불가능한 프로젝트입니다.");
		}
		
		TaskVO task = new TaskVO();
		task.setProject_id(projectVO.getProject_id());
		task.setPage_num("0");
		task.setPage_size("9999");
		List<TaskVO> taskList = taskDao.getTaskList(task);
		
		JsonOutputVO taskServiceCheck = (JsonOutputVO)gpuNodeService.getServiceList();
		List<DockerServiceVO> serviceList = (List<DockerServiceVO>) taskServiceCheck.getData();
		for (int i = 0; i < serviceList.size(); i++) {
			DockerServiceVO service = serviceList.get(i);
			for(int j = 0; j < taskList.size(); j++) {
				if(taskList.get(j).getTask_id() != null && taskList.get(j).getTask_id().equals(service.getId())) {
					return Output.JsonOutput("4505", "프로젝트에 현재 동작하고 있는 Task과 포함되어 있어 삭제할 수 없습니다.");
				}
			}
		}
		
		
		TaskVO taskVO = new TaskVO();
		
		taskVO.setProject_id(projectId);
		int deleteCnt = taskDao.deleteTaskByProject(taskVO);
		if(deleteCnt < 0) {
			throw new Exception("5091#삭제가 올바르지 않습니다.");
		}
		int cnt = projectDao.deleteProject(projectVO);
		if(cnt != 1){
			throw new Exception("5091#삭제가 올바르지 않습니다.");
		}
		String delPath = WORKSPACE_PATH + projectId + "/";
		FileUtils.delete(delPath);
		return Output.JsonOutput("200", "삭제가 완료되었습니다.");
	}
        
	
	public Object updateProject(ProjectVO projectVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		
		//is_fixed 체크
		ProjectVO outputProjectVO = projectDao.getProjectById(projectVO);
		if(outputProjectVO.getIs_fixed() != null && outputProjectVO.getIs_fixed().equals("1")) {
			return Output.JsonOutput("5098", "수정이 불가능한 프로젝트입니다");
		}
		
		
		
		int cnt = projectDao.updateProject(projectVO);
		if(cnt == 1){
			return Output.JsonOutput("200", "업데이트가 완료되었습니다");
		}else{
			return Output.JsonOutput("4500", "업데이트가 올바르지 않습니다");
		}
	}
	
	public Object getProjectById(ProjectVO projectVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		
		Object result = projectDao.getProjectById(projectVO);
		return Output.JsonOutput("200", result);
	}
	
	
		
	
	
}
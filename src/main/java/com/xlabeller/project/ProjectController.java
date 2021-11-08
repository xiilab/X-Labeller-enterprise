package com.xlabeller.project;

import com.xlabeller.common.module.Output;
import com.xlabeller.models.ProjectVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;






@Controller
@RequestMapping("/project")
public class ProjectController {
	

	@Autowired
	private ProjectService projectService;  
	
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);


	/**
	 * Project List 가져오기
	 * 
	 * 검색조건
	 * user_id
	 * title
	 * contents
	 * solution_type
	 * 
	 * @param projectVO
	 * @return
	 */
	@RequestMapping("/getProjectList")
	public ModelAndView getProjectsetList(ProjectVO projectVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = projectService.getProjectList(projectVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Project ID로 가져오기
	 * 
	 * 검색조건
	 * id
	 * 
	 * @param projectVO
	 * @return
	 */
	@RequestMapping("/getProjectById")
	public ModelAndView getProjectById(ProjectVO projectVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = projectService.getProjectById(projectVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Project 등록
	 * 
	 * title
	 * contents
	 * solution_type
	 * 
	 * @param projectVO
	 * @param session
	 * @return
	 */
	@RequestMapping("/insertProject")
	public ModelAndView insertProject(ProjectVO projectVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = projectService.insertProject(projectVO);
		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
			}
		}
		
		
		
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	
	/**
	 * Project 삭제
	 * 
	 * id : project id
	 * 
	 * @param projectVO
	 * @param session
	 * @return
	 */
	@RequestMapping("/deleteProject")
	public ModelAndView deleteProject(ProjectVO projectVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();	
		
		Object result;
		try {
			result = projectService.deleteProject(projectVO);
		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}

	/**
	 * Project 수정
	 * 
	 * title 
	 * contents
	 * solution_type 
	 * 
	 * @param projectVO
	 * @param session
	 * @return
	 */
	@RequestMapping("/updateProject")
	public ModelAndView updateProject(ProjectVO projectVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = projectService.updateProject(projectVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	

	
	
	
}
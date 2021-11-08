package com.xlabeller.gpuNode;

import com.xlabeller.common.module.Output;
import com.xlabeller.models.GpuNodeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;






@Controller
@RequestMapping("/gpuNode")
public class GpuNodeController {
	

	@Autowired
	private GpuNodeService gpuNodeService;  
	
	
	private static final Logger logger = LoggerFactory.getLogger(GpuNodeController.class);


	/**
	 * GpuNode List 가져오기
	 * 
	 * 필터링조건
	 * type : worker
	 * 
	 * 
	 * @param gpuNodeVO
	 * @return
	 */
	@RequestMapping("/getGpuNodeList")
	public ModelAndView getGpuNodeList(GpuNodeVO gpuNodeVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = gpuNodeService.getGpuNodeList(gpuNodeVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * GpuNode List GPU 상태포함 가져오기
	 * 
	 * 필터링조건
	 * type : worker
	 * 
	 * 
	 * @param gpuNodeVO
	 * @return
	 */
	@RequestMapping("/getGpuNodeStatusList")
	public ModelAndView getGpuNodeStatusList(GpuNodeVO gpuNodeVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = gpuNodeService.getGpuNodeStatusList(gpuNodeVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	/**
	 * GpuNode ID로 가져오기
	 * 
	 * 검색조건
	 * id
	 * 
	 * @param gpuNodeVO
	 * @return
	 */
	@RequestMapping("/getGpuNodeById")
	public ModelAndView getGpuNodeById(GpuNodeVO gpuNodeVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = gpuNodeService.getGpuNodeById(gpuNodeVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * GpuNode 등록
	 * 
	 * address
	 * account
	 * password
	 * type : master or worker
	 * 
	 * 
	 * @param gpuNodeVO
	 * @param session
	 * @return
	 */
	@RequestMapping("/insertGpuNode")
	public ModelAndView insertGpuNode(GpuNodeVO gpuNodeVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = gpuNodeService.insertGpuNode(gpuNodeVO);
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
	 * GpuNode 삭제
	 * 
	 * id : gpuNode id
	 * 
	 * @param gpuNodeVO
	 * @param session
	 * @return
	 */
	@RequestMapping("/deleteGpuNode")
	public ModelAndView deleteGpuNode(GpuNodeVO gpuNodeVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();	
		
		Object result;
		try {
			result = gpuNodeService.deleteGpuNode(gpuNodeVO);
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
	 * GpuNode 수정
	 * 
	 * address 
	 * account
	 * password 
	 * type : master or worker
	 * 
	 * @param gpuNodeVO
	 * @param session
	 * @return
	 */
	@RequestMapping("/updateGpuNode")
	public ModelAndView updateGpuNode(GpuNodeVO gpuNodeVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = gpuNodeService.updateGpuNode(gpuNodeVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * project / task 기반으로 실행중인 서비스 상태 가져옴
	 * 
	 * 
	 * @return
	 */
	@RequestMapping("/getServiceList")
	public ModelAndView getServiceList() {
		ModelAndView modelAndView = new ModelAndView();
		Object result = gpuNodeService.getServiceList();
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	
	
}
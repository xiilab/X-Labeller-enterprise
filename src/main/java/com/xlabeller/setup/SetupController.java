package com.xlabeller.setup;

import com.xlabeller.models.SetupVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;






@Controller
@RequestMapping("/setup")
public class SetupController {
	

	@Autowired
	private SetupService setupService;  
	
	
	private static final Logger logger = LoggerFactory.getLogger(SetupController.class);


	/**
	 * PreRequirement 설치
	 */
	@RequestMapping("/installRequirement")
	public ModelAndView installRequirement(SetupVO setupVO) throws IOException, InterruptedException {
		ModelAndView modelAndView = new ModelAndView();
		Object result = setupService.installRequirement(setupVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	/**
	 * PreRequirement 확인
	 */
	@RequestMapping("/isInstallRequirement")
	public ModelAndView isInstallRequirement() throws IOException, InterruptedException {
		ModelAndView modelAndView = new ModelAndView();
		Object result = setupService.isInstallRequirement();
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
	/**
	 * deploy 확인
	 * id : gpuNodeId
	 */
	@RequestMapping("/isDeployInstallFile")
	public ModelAndView isDeployInstallFile(SetupVO setupVO, HttpSession httpSession) throws IOException, InterruptedException {
		ModelAndView modelAndView = new ModelAndView();
		Object result = setupService.isDeployInstallFile(setupVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}

	/**
	 * deploy install file
	 * id : gpuNodeId
	 */
	@RequestMapping("/deployInstallFile")
	public ModelAndView deployInstallFile(SetupVO setupVO, HttpSession httpSession) throws IOException, InterruptedException {
		ModelAndView modelAndView = new ModelAndView();
		Object result = setupService.deployInstallFile(setupVO,httpSession);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}

	/**
	 * install 확인
	 * id : gpuNodeId
	 */
	@RequestMapping("/isInstallFile")
	public ModelAndView isInstallFile(SetupVO setupVO, HttpSession httpSession) throws IOException, InterruptedException {
		ModelAndView modelAndView = new ModelAndView();
		Object result = setupService.isInstallFile(setupVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
	/**
	 * install 시작
	 * id : gpuNodeId
	 */
	@RequestMapping("/installFile")
	public ModelAndView installFile(SetupVO setupVO, HttpSession httpSession) throws IOException, InterruptedException {
		ModelAndView modelAndView = new ModelAndView();
		Object result = setupService.installFile(setupVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
	
//	/**
//	 * gpu node swarm join 시작
//	 * id : gpuNodeId
//	 */
//	@RequestMapping("/joinSwarm")
//	public ModelAndView joinSwarm(SetupVO setupVO, HttpSession httpSession) throws IOException, InterruptedException {
//		ModelAndView modelAndView = new ModelAndView();
//		Object result = setupService.joinSwarm(setupVO);
//		modelAndView.addObject("result",  result);
//		return modelAndView;
//	}
//	
//	
//	
//	/**
//	 * gpu node swarm join 상태 확인
//	 * id : gpuNodeId
//	 */
//	@RequestMapping("/isJoinSwarm")
//	public ModelAndView isJoinSwarm(SetupVO setupVO, HttpSession httpSession) throws IOException, InterruptedException {
//		ModelAndView modelAndView = new ModelAndView();
//		Object result = setupService.isJoinSwarm(setupVO);
//		modelAndView.addObject("result",  result);
//		return modelAndView;
//	}
	
	// s.kim 추가 
	/**
	 * gpu node swarm join 상태 확인
	 * id : gpuNodeId
	 */
	@RequestMapping("/isJoinNfs")
	public ModelAndView isJoinNfs(SetupVO setupVO, HttpSession httpSession) throws IOException, InterruptedException {
		ModelAndView modelAndView = new ModelAndView();
		Object result = setupService.isJoinNfs(setupVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
	// s.kim 추가 
	/**
	 * gpu node swarm join 상태 확인
	 * id : gpuNodeId
	 */
	@RequestMapping("/joinNfs")
	public ModelAndView joinNfs(SetupVO setupVO, HttpSession httpSession) throws IOException, InterruptedException {
		ModelAndView modelAndView = new ModelAndView();
		Object result = setupService.joinNfs(setupVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
//	/**
//	 */
//	@RequestMapping("/installNode")
//	public ModelAndView installNode(SetupVO setupVO, HttpSession httpSession) throws IOException, InterruptedException {
//		ModelAndView modelAndView = new ModelAndView();
//		Object result = setupService.installNode(setupVO,httpSession);
//		modelAndView.addObject("result",  result);
//		return modelAndView;
//		
//	}
	
//	/**
//	 */
//	@RequestMapping("/cmd")
//	public ModelAndView cmd(SetupVO setupVO) throws IOException, InterruptedException {
//		ModelAndView modelAndView = new ModelAndView();
//		Object result = setupService.cmd(setupVO);
//		modelAndView.addObject("result",  result);
//		return modelAndView;
//		
//	}
//	
	
	
	
}
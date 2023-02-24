package com.xlabeller.algorithm;

import com.xlabeller.common.module.Output;
import com.xlabeller.models.AlgorithmVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;





@Controller
@RequestMapping("/algorithm")
public class AlgorithmController {
	

	@Autowired
	private AlgorithmService algorithmService;  
	
	
	private static final Logger logger = LoggerFactory.getLogger(AlgorithmController.class);
//	
	/**
	 * Algorithm 리스트 가져옴.
	 * INPUT : 	
	 * 		title
	 * 		description
	 * 		user_id
	 * 		page_num
	 * OUTPUT : 
	 * 	 
	 */
	@RequestMapping("/getAlgorithmList")
	public ModelAndView getAlgorithmList(AlgorithmVO algorithmVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = algorithmService.getAlgorithmList(algorithmVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	/**
	 * Algorithm ID로 하나 가져옴.
	 * INPUT : 
	 * 		algorithm_id
	 * OUTPUT :
	 * 
	 * 
	 */
	@RequestMapping("/getAlgorithmById")
	public ModelAndView getAlgorithmById(AlgorithmVO algorithmVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = algorithmService.getAlgorithmById(algorithmVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
		
	
	/**
	 * Algorithm 삭제
	 * INPUT :
	 * 		algorithm_id
	 * OUTPUT : 
	 * 
	 * */
	@RequestMapping("/deleteAlgorithm")
	public ModelAndView deleteAlgorithm(AlgorithmVO algorithmVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = algorithmService.deleteAlgorithm(algorithmVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}


	
	/**
	 * Algorithm 업데이트
	 * INPUT : 
			title
			description
			docker_cmd
			train_param
			inference_param
			base_image
			train_func_name
			load_func_name
			inference_func_name
			upload_file : multipart/file
		OUTPUT : 
		
	 * 
	 * */
	
	@RequestMapping("/updateAlgorithm")
	public ModelAndView updateAlgorithm(AlgorithmVO algorithmVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		
		Object result;
		try {
			result = algorithmService.updateAlgorithm(algorithmVO);
		} catch (Exception e) {
//			e.printStackTrace();
			logger.error("updateAlgorithm Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "정상적인 접근이 아닙니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생시 문의 부탁드립니다");
				logger.error("updateAlgorithm Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "정상적인 접근이 아닙니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생시 문의 부탁드립니다");
				logger.error("updateAlgorithm Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("updateAlgorithm Error!", e);
			}
		}
		
		algorithmVO.setUpload_file(null);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Algorithm 등록
	 * INPUT : 
		title
		description
		docker_cmd
		train_param
		inference_param
		base_image
		train_func_name
		load_func_name
		inference_func_name
		upload_file : multipart/file
	 * OUTPUT :
	 * 	
	 * */
	@RequestMapping("/insertAlgorithm")
	public ModelAndView insertAlgorithm(AlgorithmVO algorithmVO){
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = algorithmService.insertAlgorithm(algorithmVO);
		} catch (Exception e) {
//			e.printStackTrace();
			logger.error("InsertAlgorithm Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "정상적인 접근이 아닙니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생시 문의 부탁드립니다");
				logger.error("InsertAlgorithm Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "정상적인 접근이 아닙니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생시 문의 부탁드립니다");
				logger.error("InsertAlgorithm Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("InsertAlgorithm Error!", e);
			}
		}
		
		algorithmVO.setUpload_file(null);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	/**
	 * Algorithm GPU Server에 배포
	 * INPUT : 
	 * 		algorithm_id
	 * OUTPUT : 
	 * 
	 * */
	@RequestMapping("/deployAlgorithm")
	public ModelAndView deployAlgorithm(AlgorithmVO algorithmVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = algorithmService.deployAlgorithm(algorithmVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}

	/**
	 * AlgorithmID를 통해 Task검색, 알고리즘 삭제할 경우 해당 알고리즘을 통해 생성된 Task가 있다면 삭제 불가, 없다면 삭제가능
	 * INPUT : 
	 * 		algorithm_id
	 * OUTPUT : 
	 * 	code : 200
	 *  data : List<TaksVO>
	 * 
	 */
//	@RequestMapping("/getTaskListByAlgorithmID")
//	public ModelAndView getTaskByAlgorithmID(AlgorithmVO algorithmVO) {
//		ModelAndView modelAndView = new ModelAndView();		
//		Object result = algorithmService.getTaskListByAlgorithmId(algorithmVO);
//		modelAndView.addObject("result",  result);
//		return modelAndView;
//	}
	
	

}
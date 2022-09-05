package com.xlabeller.visualization;

import com.xlabeller.common.module.Output;
import com.xlabeller.models.AlgorithmVO;
import com.xlabeller.models.VisualizationVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;





@Controller
@RequestMapping("/visualization")
public class VisualizationController {
	@Autowired
	private VisualizationService algorithmService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(VisualizationController.class);
//	
	/**
	 * 해상도별 데이터 수량
	 * INPUT : 	
	 * 		visualizationVO
	 * OUTPUT : (resultCode : 200, data : visualizationVO)
	 * 	 
	 */
	@GetMapping("/getDataQuantityPerResolution")
	public ModelAndView getDataQuantityPerResolution(VisualizationVO visualizationVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = algorithmService.getDataQuantityPerResolution(visualizationVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}

	/**
	 * 클래스별 데이터 수량
	 * INPUT :
	 * 		visualizationVO
	 * OUTPUT : (resultCode : 200, data : visualizationVO)
	 *
	 */
	@GetMapping("/getDataQuantityPerClass")
	public ModelAndView getDataQuantityPerClass(VisualizationVO visualizationVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = algorithmService.getDataQuantityPerClass(visualizationVO);
		modelAndView.addObject("result",  result);
		return modelAndView;

	}

	/**
	 * 해상도별 객체 수량
	 * INPUT :
	 * 		visualizationVO
	 * OUTPUT : (resultCode : 200, data : visualizationVO)
	 *
	 */
	@GetMapping("/getClassQuantityPerResolution")
	public ModelAndView getClassQuantityPerResolution(VisualizationVO visualizationVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = algorithmService.getClassQuantityPerResolution(visualizationVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
}
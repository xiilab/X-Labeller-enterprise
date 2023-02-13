package com.xlabeller.visualization;

import com.xlabeller.models.VisualizationVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/visualization")
public class VisualizationController {
	@Autowired
	private VisualizationService visualizationService;
	
	
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
		Object result = visualizationService.getDataQuantityPerResolution(visualizationVO);
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
		Object result = visualizationService.getDataQuantityPerClass(visualizationVO);
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
		Object result = visualizationService.getClassQuantityPerResolution(visualizationVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}

	/**
	 * 오브젝트 크기별 분포
	 * @param visualizationVO : datasetId
	 * @return Double 2D Array => [[0.35,0.22], [0.5,0.4], ...]
	 * */
	@GetMapping("/getDistributionByObjectSize")
	public ModelAndView getDistributionByObjectSize(VisualizationVO visualizationVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = visualizationService.getDistributionByObjectSize(visualizationVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}

	/**
	 * width별 수량
	 * @param visualizationVO : datasetId
	 * @return Map<Double, Integer> => (Key : [score], value : [count])
	 * ex) (0.25, 1), (0.27, 3), (0.55, 4), ...
	 * */
	@GetMapping("/getLabelCountByWidth")
	public ModelAndView getLabelCountByWidth(VisualizationVO visualizationVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = visualizationService.getLabelCountByWidth(visualizationVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
}
package com.xlabeller.annotation;

import com.xlabeller.models.AnnotationVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





@Controller
@RequestMapping("/annotation")
public class AnnotationController {
	

	@Autowired
	private AnnotationService annotationService;  
	
	
	private static final Logger logger = LoggerFactory.getLogger(AnnotationController.class);
//	
	/**
	 * Annotation 리스트 가져옴.
	 * INPUT :  
	 * 		title
	 * 		contents
	 * 		user_id
	 * OUTPUT : 
	 * 
	 */
	@RequestMapping("/getAnnotationList")
	public ModelAndView getAnnotationList(AnnotationVO annotationVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = annotationService.getAnnotationList(annotationVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	/**
	 * Annotation id로 하나 가져옴.
	 * INPUT : 	
	 * 		annotation_id
	 * OUTPUT : 
	 * 		
	 */
	@RequestMapping("/getAnnotationById")
	public ModelAndView getAnnotationById(AnnotationVO annotationVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = annotationService.getAnnotationById(annotationVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Annotation id로 video가져옴 (getAnnotationById는 data를 가져오지만 이 메소드는 가져오지 않음.)
	 * INPUT : 
	 * 		annotation_id
	 * OUTPUT :
	 * 		
	 */
	@RequestMapping("/getVideoAnnotationById")
	public ModelAndView getVideoAnnotationById(AnnotationVO annotationVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = annotationService.getVideoAnnotationById(annotationVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
		
	
		
	
	/**
	 * annotation 삭제
	 * INPUT :
	 * 		annotation_id
	 * */
	@RequestMapping("/deleteAnnotation")
	public ModelAndView deleteAnnotation(AnnotationVO annotationVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = annotationService.deleteAnnotation(annotationVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}


	
	/**
	 * annotation 업데이트.
	 * INPUT : 
	 * 		annotation_id 
	 * 		title
	 * 		contents
	 * 		data
	 * OUTPUT : 
	 * 		
	 * */
	
	@RequestMapping("/updateAnnotation")
	public ModelAndView updateAnnotation(AnnotationVO annotationVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = annotationService.updateAnnotation(annotationVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * annotation 등록
	 * INPUT : 
	 * 		title
	 * 		contents
	 * 		data
	 * OUTPUT : 
	 * 		
	 * */
	@RequestMapping("/insertAnnotation")
	public ModelAndView insertAnnotation(AnnotationVO annotationVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Object result = annotationService.insertAnnotation(annotationVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	/**
	 * annotation 데이터 export
	 * INPUT : 
	 * 		annotation_id
	 * OUTPUT : 
	 * 		
	 * */
	@RequestMapping("/exportAnnotation")
	public Object exportAnnotation(AnnotationVO annotationVO,HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Object result;
		result = annotationService.exportAnnotation(annotationVO,response);
//		if(result instanceof JsonOutputVO) {
//			JsonOutputVO json = (JsonOutputVO)result; 
//			if(json != null || json.getCode() != null || json.getCode().equals("3059")) {
//				String msg = "<script>alert(\""+ json.getData() + "\"); </script>";
////				modelAndView.addObject("msg", json.getData());
////				modelAndView.setViewName("annotation/annotation");
//				return msg;
//			}
//		}
		modelAndView.addObject("result",  result);
		return modelAndView;
	
	}
	
	
	/**
	 * 
	 * id
	 * 
	 * */
//	@RequestMapping("/testAnnotation")
//	public ModelAndView testAnnotation(AnnotationVO annotationVO) throws Exception {
//		ModelAndView modelAndView = new ModelAndView();
//		Object result = annotationService.testAnnotation(annotationVO);
//		modelAndView.addObject("result",  result);
//		return modelAndView;
//	
//	}
	
	
}
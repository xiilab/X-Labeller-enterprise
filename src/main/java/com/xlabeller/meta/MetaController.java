package com.xlabeller.meta;

import com.xlabeller.common.module.Output;
import com.xlabeller.models.MetaVO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;



@Controller
@RequestMapping("/meta")
public class MetaController {
 
	@Autowired
	private MetaService metaService;  
	
	private static Logger logger = Logger.getLogger(MetaController.class);
	
	
	/**
	 * MetaData ID List 가져오기 sorted by data_id, meta_id
	 * check this function 
	 * 
	 * data_id : 데이터아이디
	 * 
	 */	
	@RequestMapping("/getMetaByDataId")
	public Object getMetaByDataId(MetaVO metaVO) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result = metaService.getMetaByDataId(metaVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
	/**
	 * MetaData ID List 가져오기 sorted by meta_id
	 * check this function 
	 * 
	 * meta_id : 메타아이디
	 * 
	 */	
	@RequestMapping("/getMetaByMetaId")
	public Object getMetaByMetaId(MetaVO metaVO) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result = metaService.getMetaByMetaId(metaVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
	
	/**
	 * MetaData 저장
	 * 
	 * label_type : 라벨타입(IMAGE_BBOX,IMAGE_SEGMENTATION,VIDEO_BBOX)
	 * data_id : 데이터 아이디
	 * data : [
	 * 		{
	 * 			meta_id : 메타아이디 
	 * 			label : 라벨명
	 * 			info : {객체정보}
	 * 		}		
	 *      ..... 
	 * ]
	 * 
	 */
	@RequestMapping("/insertMeta")
	public ModelAndView insertMeta(MetaVO metaVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = metaService.insertMeta(metaVO);
		} catch (Exception e) {
			logger.error("insertMetaData Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null) {
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생시 관리자에게 문의 부탁드립니다");
				logger.error("insertMetaData Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생시 관리자에게 문의 부탁드립니다");
				logger.error("insertMetaData Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("insertMetaData Error!", e);
			}
		}
		
		
		metaVO.setInfo(null);
		metaVO.setData(null);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
	/**
	 * delete Meta Data By meta_id
	 * 
	 * meta_id : 메타아이디
	 * 
	 */
	@RequestMapping("/deleteMetaById")
	public ModelAndView deleteMetaById(MetaVO metaVO,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = metaService.deleteMetaById(metaVO);		
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
	
}
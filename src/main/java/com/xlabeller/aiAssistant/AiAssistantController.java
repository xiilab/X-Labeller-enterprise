package com.xlabeller.aiAssistant;

import com.xlabeller.models.AiAssistantVO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;


@Controller
@RequestMapping("/aiAssistant")
public class AiAssistantController {
	@Autowired
	private AiAssistantService aiAssistantService;
	private static Logger logger = Logger.getLogger(AiAssistantController.class);
	
//	@RequestMapping("/runAiAssistant")
//	public ModelAndView runAiAssistant(AiAssistantVO aiAssistantVO) throws IOException {
//		ModelAndView modelAndView = new ModelAndView();
//		Object result = aiAssistantService.runAiAssistant(aiAssistantVO);
//		modelAndView.addObject("result",  result);
//		return modelAndView;
//	}
	
}

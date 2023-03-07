package com.xlabeller.imExport;

import com.xlabeller.common.module.Output;
import com.xlabeller.models.GpuNodeVO;
import com.xlabeller.models.ImExportVO;
import com.xlabeller.models.ProjectVO;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@Controller
@RequestMapping("/imExport")
public class ImExportController {
	private ImExportService imExportService;

	public ImExportController(ImExportService imExportService) {
		this.imExportService = imExportService;
	}

	private static final Logger logger = LoggerFactory.getLogger(ImExportController.class);

	@GetMapping("/export/coco")
	public ModelAndView exportCoco(ImExportVO imExportVO, HttpServletResponse response) throws IOException {
		ModelAndView modelAndView = new ModelAndView();
		imExportService.exportCoco(imExportVO, response);
		modelAndView.addObject("result",  "COCO형식으로 Export가 완료되었습니다.");
		return modelAndView;
	}

	@PostMapping("/import/coco")
	public ModelAndView importCoco(ImExportVO imExportVO) throws IOException {
		ModelAndView modelAndView = new ModelAndView();
		Object result = imExportService.importCoco(imExportVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}

	@GetMapping("/export/voc")
	public ModelAndView exportVoc(ImExportVO imExportVO, HttpServletResponse response) throws IOException {
		ModelAndView modelAndView = new ModelAndView();
		imExportService.exportVoc(imExportVO, response);
		modelAndView.addObject("result",  "VOC형식으로 Export가 완료되었습니다.");
		return modelAndView;
	}

	@PostMapping("/import/voc")
	public ModelAndView importVoc(ImExportVO imExportVO, HttpServletResponse response) throws IOException {
		ModelAndView modelAndView = new ModelAndView();
		Object result = imExportService.importVoc(imExportVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}

}
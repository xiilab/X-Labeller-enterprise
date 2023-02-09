package com.xlabeller.common.configuration;
import com.xlabeller.common.exception.HandlerCustomException;
import com.xlabeller.common.module.Output;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 *
 * 에러처리 Advice
 *
 * @author kws
 * @since 2017. 9. 26.
 * @version 1.0
 * @see
 *
 * <pre>
 *
 * 개정이력(Modification Information)
 *
 * 수정일      수정자   수정내용
 * --------------------------------------------------
 * 2017. 9. 26. kws	최초 생성
 * 2018. 7. 27.	kws	리팩토링 및 Exception Stacktrace 로깅 추가.
 *
 * </pre>
 */
@ControllerAdvice
public class AnnotationExceptionHandler {

	// private static final Logger LOG = LoggerFactory.getLogger(AnnotationExceptionHandler.class);
	private static Logger logger = Logger.getLogger(AnnotationExceptionHandler.class);


	@Value("#{globalProperty['error.log.saveYn']}")
	private String errorLogSaveYn;

	/**
	 * IllegalStateException 처리
	 *
	 * @param e
	 *
	 */
	@ExceptionHandler(HandlerCustomException.class)
	public Object handleCustomException(HandlerCustomException e) {
		if(e.getMessage() == null || e.getMessage().isEmpty()) {
//			errorMap.put("resultCode", "500");
//			errorMap.put("resultMsg", "NPException 오류!");
			logger.error(e.getMessage());
			return Output.JsonOutput("4061","파라미터가 전달되지 않았습니다.\n새로고침 후 다시 시도해주시고 지속적을 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}

		logger.error(e.getMessage());
		return Output.JsonOutput(e.getCode(), e.getMessage());
	}
}

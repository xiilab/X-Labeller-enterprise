package com.xlabeller.quartz;

import com.xlabeller.process.ProcessService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class DayTask{
	
	@Autowired
	private ProcessService processService;
	
	private static Logger logger = Logger.getLogger(DayTask.class);
//	private boolean LOCK = false;
	
	public void check(QuartzLock quartzLock) throws Exception{
//		processService.procDataUpload(quartzLock);
//		Thread.sleep(10000);
		
		
//		logger.info("[quartz] LOCK IS : " + String.valueOf(LOCK));
//		if(LOCK == true) {
//			return;
//		}else {
//			LOCK = true;
//			logger.info("quartz test....");
//			processService.procDataUpload();
//
//			logger.info("quartz test end....");
//			LOCK = false;
//			
//		}
	}
	
	
    
}
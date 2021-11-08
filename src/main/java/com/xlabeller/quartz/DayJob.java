package com.xlabeller.quartz;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.SchedulerException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class DayJob extends QuartzJobBean{
	private DayTask dayTask;
	private QuartzLock quartzLock;
	
	private static Logger logger = Logger.getLogger(DayJob.class);
//	private static boolean LOCK = false;
	
	
	
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {		
		try {		
//			logger.info("quartz test....");
			dayTask.check(quartzLock);
//			logger.info("quartz test end....");	
		} catch (SchedulerException e1) {
			// TODO Auto-generated catch block
			logger.error("executeInternal",e1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error("executeInternal",e);
		}
	}
	
//	@Override
//	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {		
//		try {
//			boolean lock = quartzLock.get();
//			logger.info("[quartz] LOCK IS : " + String.valueOf(lock));
//			if(lock == true) {
//				return;
//			}else {
//				quartzLock.lock();
//				logger.info("quartz test....");
//				dayTask.check();
//				logger.info("quartz test end....");
//				quartzLock.unlock();				
//			}
//	
//		} catch (SchedulerException e1) {
//			// TODO Auto-generated catch block
//			logger.error("executeInternal",e1);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			logger.error("executeInternal",e);
//		}
//	}
//	
	
	
	public void setDayTask(DayTask dayTask) {
        this.dayTask = dayTask;
    }
	
	public void setQuartzLock(QuartzLock quartzLock) {
        this.quartzLock = quartzLock;
    }
    
    
}




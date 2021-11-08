package com.xlabeller.quartz;

import org.apache.log4j.Logger;


public class QuartzLock{
	private static Logger logger = Logger.getLogger(QuartzLock.class);
	private static boolean LOCK = false;
	
	private static int CURRENT_EXECUTOR = 0;
	private static int LIMIT_EXECUTOR = 4;
	
	
	
	public void lock() {
		this.LOCK = true;
	}
	public void unlock() {
		this.LOCK = false;
	}
	public boolean get() {
		return this.LOCK;
	}
	
	public boolean startExecute() {
		if(this.CURRENT_EXECUTOR < this.LIMIT_EXECUTOR ) {
			this.CURRENT_EXECUTOR++;
			logger.info("START CURRENT_EXECUTOR :: " + String.valueOf(this.CURRENT_EXECUTOR));
			return true;
		}else {
			logger.info("START CURRENT_EXECUTOR :: " + String.valueOf(this.CURRENT_EXECUTOR));
			return false;
		}
	}
	public void releaseExecute() {
		this.CURRENT_EXECUTOR--;
		logger.info("RELEASE CURRENT_EXECUTOR :: " + String.valueOf(this.CURRENT_EXECUTOR));
		
	}
	
	public int getCurrentExecute() {
		return this.CURRENT_EXECUTOR;
	}
	
	
	
	
	
}




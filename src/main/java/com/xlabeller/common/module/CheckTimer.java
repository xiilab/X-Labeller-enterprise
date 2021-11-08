package com.xlabeller.common.module;

public class CheckTimer{
	
	private static long previousTime = 0;
	private static long term = 15000;
	
	public static long getPreviousTime() {
		long time = System.currentTimeMillis() ; 
		return time;
    }
	
	public static int getRunnableTime() {
		long curTime = System.currentTimeMillis() ;
		long remainTime = (curTime - previousTime);
		
		if( term - remainTime < 0 ) {
			previousTime = curTime;
			return -1;
		}else {
			return (int)((term - remainTime)/1000);
		}
    }
	
	
	
	
}
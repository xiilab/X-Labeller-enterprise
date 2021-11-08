package com.xlabeller.data;

public class AsyncProcess2 extends Thread {
    
	private Runnable toRun = null;
	
	public AsyncProcess2(Runnable toRun) {
		this.toRun = toRun;
	}
    public void run() {
    	try {
			toRun.run();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    
}
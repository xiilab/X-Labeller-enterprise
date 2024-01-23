package com.xlabeller.common.module;

import org.apache.log4j.Logger;
import org.bytedeco.javacv.FFmpegFrameGrabber;

public class VideoMetaUtil {
	private int width = 0;
	private int height = 0;
	private int total_frame = 0;
	private double duration = 0;
	private double fps = 0;
	private boolean isAvailable = false;
	
	private static Logger logger = Logger.getLogger(VideoMetaUtil.class);
	
	public VideoMetaUtil(String path) {	
		open(path);
	}
	
	public void open(String path) {
		isAvailable = false;
	    try (FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(path)){
			grabber.start();
			width = grabber.getImageWidth();
			height = grabber.getImageHeight();
			total_frame = grabber.getLengthInFrames();
			duration = grabber.getLengthInTime() / (double)1000000;
			fps = grabber.getVideoFrameRate();
		    isAvailable = true;
		} catch (Exception e) {
			logger.error("VideoMetaUtil>>open()",e);
			isAvailable = false;
		}
	}
	
	
	public boolean isAvailable() {
		return isAvailable;
	}
	
	public int getWidth() {
		return width;
	}
	
	public int getHeight() {
		return height;
	}
	
	public int getTotalFrame() {
		return total_frame;
	}
	
	public double getDuration() {
		return duration;
	}
	
	public double getFps() {
		return fps;
	}
		
	
}

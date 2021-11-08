package com.xlabeller.common.module;

import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;




public class FileUtils{
	
	private static Logger logger = Logger.getLogger(FileUtils.class);
	
	public static List<String> fileList(String path) {
		File f = null;
    	f = new File(path);
    	String[] list = f.list();
    	List<String> result = Arrays.asList(list);
    	return result;
    	
    }
	
	
	public static void delete(String path) {
		File f = null;
    	f = new File(path);
    	try {
			org.apache.commons.io.FileUtils.forceDelete(f);
		} catch (IOException e) {
			logger.error(e);
		}
    	return;
    	
    }
	
	public static void deleteFileInDir(String path) {
		File f = new File(path);
		String[] fileList = f.list();
		if(fileList == null || fileList.length <= 0) {
			return ;
		}
		for(int i = 0 ; i < fileList.length ; i++) {
			f = new File(path+"/"+fileList[i]);
			f.delete();
		}
    	return;
    }
	
	public static void mkdir(String path) {
		File f = null;
    	f = new File(path);
    	try {
			org.apache.commons.io.FileUtils.forceMkdir(f);
		} catch (IOException e) {
			logger.error(e);
		}
    	return;
    	
    }
	
}
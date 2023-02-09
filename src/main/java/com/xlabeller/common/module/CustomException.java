package com.xlabeller.common.module;

import org.apache.log4j.Logger;

public class CustomException extends Exception{
	private static Logger logger = Logger.getLogger(CustomException.class);
	
	public CustomException(String errorMessage) {
		super(errorMessage);
		logger.error(errorMessage);
	}

	public CustomException(String errorMessage, String s) {

	}
}

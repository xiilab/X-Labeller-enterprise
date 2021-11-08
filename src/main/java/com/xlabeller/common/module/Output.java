package com.xlabeller.common.module;

import com.xlabeller.models.JsonOutputVO;




public class Output{
	public Output(){
		
	}
	
	public static Object JsonOutput(String code, Object obj){
		JsonOutputVO jsonOutput = new JsonOutputVO();
		jsonOutput.setCode(code);
		jsonOutput.setData(obj);
		return jsonOutput;
	}
	
	
}
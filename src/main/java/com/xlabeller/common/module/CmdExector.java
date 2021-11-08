package com.xlabeller.common.module;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;



public class CmdExector {
	
	
	
	public String byProcessBuilderRedirect(String[] command)  
            throws IOException, InterruptedException {
        ProcessBuilder builder = new ProcessBuilder(command);
//        builder.redirectOutput(Redirect.INHERIT);
//        builder.redirectError(Redirect.INHERIT);
        
        String envPath = builder.environment().get("PATH");
        builder.environment().put("PATH", envPath + ":/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin");
        
        
        Process proc = builder.start();
        
        
        BufferedReader stdOut = new BufferedReader( new InputStreamReader(proc.getInputStream()) );
        String str;
        StringBuilder sb = new StringBuilder();
        while( (str = stdOut.readLine()) != null) {
        	sb.append(str+"\n");
        	
        }
        
        proc.waitFor();
        proc.destroy();
        return sb.toString();
        

        
    }
	
	
	
	
}
	
	


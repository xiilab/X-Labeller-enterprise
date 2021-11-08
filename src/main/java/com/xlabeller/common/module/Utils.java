package com.xlabeller.common.module;

import org.apache.commons.codec.digest.DigestUtils;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

public class Utils{
	public Utils(){
		
	}
	
	
	public static String encryptPassword(String password){
		password = new StringBuilder(password).reverse().toString();
    	
    	String[] passwordArr = password.split("");
    	List<String> passwordList = Arrays.asList(passwordArr);
    	
    	int sum = 0;
    	
    	for(int i = 0 ; i < password.length() ; i++){
    		sum += Character.getNumericValue(password.charAt(i));
        }
    	
    	
    	int loopNum = Math.abs(sum % 5);
    	
    	String hash = DigestUtils.sha256Hex("xiirocks");
    	for(int i = 0 ; i < loopNum ; i++){
    		hash = DigestUtils.sha256Hex(hash);
    	}
    	
    	String passwordHash = DigestUtils.sha256Hex(password);
    	
//    	System.out.println(hash);
//    	System.out.println(passwordHash);
    	
    	StringBuilder passwordEncrypt = new StringBuilder();
    	
    	
    	
    	for(int i = 0 ; i < passwordHash.length() ; i++){
//    		System.out.print( (char)((passwordHash.charAt(i)+hash.charAt(i))/2) );
    		passwordEncrypt.append((char)((passwordHash.charAt(i)+hash.charAt(i))/2));
    		
    		
    	}
//    	System.out.println("");
//    	System.out.println(passwordEncrypt.toString());
    	
    	return passwordEncrypt.toString();

	}
	
	public static int generateRandomInteger(int min, int max) {
    	Random generator = new Random();
        int randomNum = generator.nextInt((max - min) + 1) + min;
        return randomNum;
    }
}
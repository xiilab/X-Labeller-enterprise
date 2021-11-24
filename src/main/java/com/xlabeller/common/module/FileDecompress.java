package com.xlabeller.common.module;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.mozilla.universalchardet.UniversalDetector;

import java.io.*;
import java.text.Normalizer;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipInputStream;

public class FileDecompress{
	private String targetDirPath;
	private  ZipInputStream zis = null;
	private byte[] buffer = null;
	private ZipEntry ze = null;
	private JSONArray metaJson = null;	
	private String isNew;
	private HashMap<String,String> fileNameMap = null;
	private HashMap<String,String> originalFileNameMap = null;
	private String imgDir = null;
	private static Logger logger = Logger.getLogger(FileDecompress.class);
	public void proc() {
		try {
			Calendar c = Calendar.getInstance();
			long currentTime = c.getTimeInMillis();		
			
			int i = 0;
			while((ze = zis.getNextEntry()) != null){
				System.out.println("!!!"+ze.getName());
				if( ze.getName().indexOf("MACOSX") > -1) {
					continue;
				}
				
				if(ze.isDirectory()) {
					continue;
				}
				
				
//				if(ze.getName().indexOf(imgDir) != -1) {
				if(ze.getName().indexOf(".png") != -1 || ze.getName().indexOf(".jpg") != -1 || ze.getName().indexOf(".jpeg") != -1) {
					if(ze.getName().contains("/.") == true) {
						continue;
					}
					
					String fileFullName = ze.getName().split("/")[ze.getName().split("/").length-1];
					fileFullName = encodingText(fileFullName);
					String originalFileName = fileFullName; 
					// 원본이름을 저장
					String format = fileFullName.split("\\.")[fileFullName.split("\\.").length-1];
					fileFullName = fileFullName.replaceAll(",", "_");
					if(format == null || format.length() <= 0) {
						this.fileNameMap.clear();
						this.fileNameMap = null;
						this.originalFileNameMap.clear();
						this.originalFileNameMap = null;
						break;
					}
					format = format.toLowerCase();
					if(!(format.equals("png") || format.equals("jpg") || format.equals("jpeg") || format.equals("mp4") || format.equals("mp3"))) {
						this.fileNameMap.clear();
						this.fileNameMap = null;
						this.originalFileNameMap.clear();
						this.originalFileNameMap = null;
						break;
					}
					String fileName = fileFullName.split("\\.")[0];
					String fileCFullName = fileName+"_"+String.valueOf(i)+"_"+String.valueOf(currentTime)+"."+format; 
					
					String tempTargetDirPath = targetDirPath + fileFullName;
					if(isNew.equals("true")) {
						fileNameMap.put(ze.getName(), imgDir+fileCFullName);
						originalFileNameMap.put(imgDir+fileCFullName, originalFileName);
						tempTargetDirPath = targetDirPath + fileCFullName;
					}else if(isNew.equals("false")){
						if(!isFile(tempTargetDirPath)){
							fileNameMap.put(ze.getName(), imgDir+fileCFullName);
							originalFileNameMap.put(imgDir+fileCFullName, originalFileName);
							tempTargetDirPath = targetDirPath + fileCFullName;
						}else {
							fileNameMap.put(ze.getName(), ze.getName());
							this.originalFileNameMap.put(imgDir+fileCFullName, originalFileName);
							tempTargetDirPath = targetDirPath + fileFullName;
							continue;
						}
					}
					
					FileOutputStream fos = new FileOutputStream(tempTargetDirPath);
					int len;
		            while ((len = zis.read(buffer)) > 0) {
		                fos.write(buffer, 0, len);
		            }
		            fos.close();
		            i++;
						
				}else if(ze.getName().indexOf(".json") != -1) {
					JSONParser jp = new JSONParser();
					InputStreamReader isr = new InputStreamReader(zis);
					String path = ze.getName().replace(".json",".png");
//					metaJson = (JSONArray) jp.parse(isr);
					//hc.park zwnbsp 해결위해 string 변환후 replace처리
					Stream<String> streamOfString = new BufferedReader(isr).lines();
					String streamToString = streamOfString.collect(Collectors.joining());
					streamToString = streamToString.replaceAll("[\\p{Cf}]", "");
					JSONArray tempArr = (JSONArray) jp.parse(streamToString);
					JSONObject tempObj = (JSONObject) tempArr.get(0);
					tempObj.put("path", path);
					//hc.park
					//마지막 label만 추가되는 부분 fix
					metaJson.add(tempObj);
				}else {
					
					
				}
				
				
			}
			
			zis.closeEntry();
			zis.close();
		
		
		
		} catch (Exception e) {
			if(e instanceof ZipException) {
				logger.error("ZipException Error!", e);
				return ;
			}
			if(e instanceof IOException) {
				logger.error("IOException Error!", e);
				return ;
			}
		}
    	
    
	}
	
	
	
	
	
	private boolean isFile(String filePath) {
		File f = new File(filePath);

	    // 파일 존재 여부 판단
	    if (f.isFile()) {
	    	return true;
	    } else {
	    	return false;
	    }

	}
	
	
	public void open(InputStream source, String target, String imgDir, String isNew) {
		zis = new ZipInputStream(source);
		targetDirPath = target;
//		zipPath = "file/package.zip";
//		targetDirPath = "file/";
		buffer = new byte[1024];
		metaJson = new JSONArray();
		this.isNew = isNew;
		fileNameMap = new HashMap<String,String>();
		originalFileNameMap = new LinkedHashMap<String, String>();
		this.imgDir = imgDir;
		
	}
	
	public JSONArray getMeta() {
		JSONObject tempObj = null;
		
		for(int i = 0 ; i < metaJson.size() ; i++) {
			tempObj = (JSONObject)metaJson.get(i);
			tempObj.put("path", ( fileNameMap.get(tempObj.get("path")) ) );
			// 211123 - k.park : SHOULD MODIFY CODE BELOW
			tempObj.put("label_type", "#IMAGE_BBOX" );
		}
//		return metaJson;
		return metaJson;
	}
	
	
	public List<String> getPath() {
		if(fileNameMap == null || fileNameMap.isEmpty() || fileNameMap.size() <= 0) {
			return null;
		}
		// 원본이름을 저장한 map의 크기와 변환된 제목을 저장한 map의 크기가 다르면 오류발생
		if(fileNameMap.size() != originalFileNameMap.size()) {
			return null;
		}
		List<String> list = new ArrayList<String>(fileNameMap.values());
		return list;
	}
	
	public HashMap<String, String> getOriginalPath() {
		if(originalFileNameMap == null || originalFileNameMap.isEmpty() || originalFileNameMap.size() <= 0) {
			return null;
		}
		// 원본이름을 저장한 map의 크기와 변환된 제목을 저장한 map의 크기가 다르면 오류발생
		if(fileNameMap.size() != originalFileNameMap.size()) {
			return null;
		}
		//List<String> list = new ArrayList<String>(originalFileNameMap.values());
		//HashMap<String, String> list = originalFileNameMap;
		return originalFileNameMap;
	}
	
	public String encodingText(String text) {
		if(!Normalizer.isNormalized(text, Normalizer.Form.NFC)) {
			text = Normalizer.normalize(text, Normalizer.Form.NFC);
		}
		
		byte[] str_byte = text.getBytes();
		UniversalDetector detector = new UniversalDetector(null);
		detector.handleData(str_byte, 0, str_byte.length);
		detector.dataEnd();
		String encoding = detector.getDetectedCharset();
		
		if(encoding == null || !encoding.equals("UTF-8")) {
			try {
				text = new String(str_byte, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return text;
	}
}


//package com.xlabeller.common.module;
//
//import java.io.File;
//import java.io.FileOutputStream;
//import java.io.InputStream;
//import java.io.InputStreamReader;
//import java.util.ArrayList;
//import java.util.Calendar;
//import java.util.HashMap;
//import java.util.List;
//import java.util.zip.ZipEntry;
//import java.util.zip.ZipInputStream;
//
//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//import org.json.simple.parser.JSONParser;
//
//public class FileDecompress{
//	private String targetDirPath;
//	private  ZipInputStream zis = null;
//	private byte[] buffer = null;
//	private ZipEntry ze = null;
//	private JSONArray metaJson = null;	
//	private String isNew;
//	private HashMap<String,String> fileNameMap = null;
//	private String imgDir = null;
//	
//	public void proc() {
//		try {
//			Calendar c = Calendar.getInstance();
//			long currentTime = c.getTimeInMillis();		
//			
//			int i = 0;
//			while((ze = zis.getNextEntry()) != null){
//				if(ze.isDirectory()) {
//					continue;
//				}
//				
//				
//				
//				if(ze.getName().indexOf(imgDir) != -1) {
//					String fileFullName = ze.getName().split("/")[ze.getName().split("/").length-1];
//					String format = fileFullName.split("\\.")[fileFullName.split("\\.").length-1];
//					String fileName = fileFullName.split("\\.")[0];
//					String fileCFullName = fileName+"_"+String.valueOf(i)+"_"+String.valueOf(currentTime)+"."+format;
//					
//					
//					String tempTargetDirPath = targetDirPath + fileFullName;
//					if(isNew.equals("true")) {
//						fileNameMap.put(ze.getName(), imgDir+fileCFullName);
//						tempTargetDirPath = targetDirPath + fileCFullName;
//					}else if(isNew.equals("false")){
//						if(!isFile(tempTargetDirPath)){
//							fileNameMap.put(ze.getName(), imgDir+fileCFullName);
//							tempTargetDirPath = targetDirPath + fileCFullName;
//						}else {
//							fileNameMap.put(ze.getName(), ze.getName());
//							tempTargetDirPath = targetDirPath + fileFullName;
//							continue;
//						}
//					}
//					
//					FileOutputStream fos = new FileOutputStream(tempTargetDirPath);
//					int len;
//		            while ((len = zis.read(buffer)) > 0) {
//		                fos.write(buffer, 0, len);
//		            }
//		            fos.close();
//		            i++;
//						
//				}else if(ze.getName().indexOf("data.json") != -1) {
//					JSONParser jp = new JSONParser();
//					InputStreamReader isr = new InputStreamReader(zis);
//					metaJson = (JSONArray)jp.parse(isr);
//				}else {
//					
//					
//				}
//				
//				
//			}
//			
//			zis.closeEntry();
//			zis.close();
//		
//		
//		
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//    	
//    
//	}
//	
//	
//	
//	
//	
//	private boolean isFile(String filePath) {
//		File f = new File(filePath);
//
//	    // 파일 존재 여부 판단
//	    if (f.isFile()) {
//	    	return true;
//	    } else {
//	    	return false;
//	    }
//
//	}
//	
//	
//	public void open(InputStream source, String target, String imgDir, String isNew) {
//		zis = new ZipInputStream(source);
//		targetDirPath = target;
////		zipPath = "file/package.zip";
////		targetDirPath = "file/";
//		buffer = new byte[1024];
//		metaJson = new JSONArray();
//		this.isNew = isNew;
//		fileNameMap = new HashMap<String,String>();
//		this.imgDir = imgDir;
//		
//	}
//	
//	public JSONArray getMeta() {
//		JSONObject tempObj = null;
//		for(int i = 0 ; i < metaJson.size() ; i++) {
//			tempObj = (JSONObject)metaJson.get(i);
//			tempObj.put("path", ( fileNameMap.get(tempObj.get("path")) ) );
//		}
//		return metaJson;
//	}
//	
//	
//	public List<String> getPath() {
//		List<String> list = new ArrayList<String>(fileNameMap.values());
//		return list;
//	}
//	
//    
//}
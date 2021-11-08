package com.xlabeller.common.module;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.mozilla.universalchardet.UniversalDetector;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.*;




public class CocoUtil{
	
	private List<String> imageList = new ArrayList<String>();
	private Map<String,Integer> imageMap = new HashMap<String,Integer>();
	
	private List<String> categoryList = new ArrayList<String>();
	private Map<String,Integer> categoryMap = new HashMap<String,Integer>();
	
	
	private String NFS_MOUNT_ROOT_PATH = "/xlabeller";
//	private String NFS_MOUNT_ROOT_PATH = "/usr/local/uploadFile/xlabeller";
	private String WORKSPACE_PATH = "/usr/local/uploadFile";
	
	public JSONObject createAll(JSONArray dataArr) {
		JSONObject resultObj = new JSONObject();
		
		
		if(dataArr == null || dataArr.size() <= 0) {
			return null;
		}
		
		initData(dataArr);
		
		resultObj.put("info", createInfo());
		resultObj.put("licenses", createLicenses());
		resultObj.put("categories", createCategories(this.categoryList));
		resultObj.put("images", createImages(this.imageList));
		resultObj.put("annotations",createAnnotation(dataArr));
		
		return resultObj;
	}
	
	
	
	public void initData(JSONArray dataArr) {
		JSONObject tempObj = null;
		for(int i = 0 ; i < dataArr.size() ; i++) {
			tempObj = (JSONObject)dataArr.get(i);
			String label = tempObj.get("label").toString();
			String encoding_path = tempObj.get("path").toString();
//			String path = NFS_MOUNT_ROOT_PATH+"/"+encoding_path;
			String path = NFS_MOUNT_ROOT_PATH+"/"+encoding_path;
			
			
			if(imageMap.get(path) == null) {
				imageMap.put(path, imageList.size());
				imageList.add(path);
			}
			if(categoryMap.get(label) == null) {
				categoryMap.put(label, categoryList.size());
				categoryList.add(label);
			}			
		}		
	}
	
	
	
	public JSONObject createInfo() {
		JSONObject resultObj = new JSONObject();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		
		resultObj.put("year", date.getYear());
		resultObj.put("version", "1.0");
		resultObj.put("description", "dataset");
		resultObj.put("contributor", "Xiilab");
		resultObj.put("url", "https://xiilab.com");
		resultObj.put("date_created", dateFormat.format(date));
		
		return resultObj;
		
    }
	
	public JSONArray createLicenses() {
		JSONArray resultArr = new JSONArray();
		
		JSONObject licenseObj = new JSONObject(); 
		
		licenseObj.put("id", 1);
		licenseObj.put("name", "Unknown License");
		licenseObj.put("url", "http://unknown.io");
		resultArr.add(licenseObj);
		
		return resultArr;
		
    }
	
	
	public static JSONArray createCategories(List<String> categoryList) {
		JSONArray resultArr = new JSONArray();		
		
		for(int i = 0 ; i < categoryList.size();i++) {
			JSONObject categoryObj = new JSONObject(); 			
			categoryObj.put("id", i);
			categoryObj.put("name", categoryList.get(i));
			categoryObj.put("supercategory", "");
			resultArr.add(categoryObj);
		}
		
		
		return resultArr;
		
    }
	
	public JSONArray createImages(List<String> imageList) {
		try {
			JSONArray resultArr = new JSONArray();		
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String dateCaptured = dateFormat.format(date);
			
			BufferedImage bi = null;
			for(int i = 0 ; i < imageList.size();i++) {
				JSONObject imageObj = new JSONObject();
				bi = ImageIO.read(new File(WORKSPACE_PATH + imageList.get(i)));   
				imageObj.put("id", i);
				imageObj.put("width", bi.getWidth());
				imageObj.put("height", bi.getHeight());
				imageObj.put("file_name", imageList.get(i));
				imageObj.put("license", 1);
				imageObj.put("date_captured", dateCaptured);
				
				resultArr.add(imageObj);
			}
			
			return resultArr;
		}catch(Exception e) {
			e.printStackTrace();	
			return null;
		}
		
    }
	
	
	public JSONArray createAnnotation(JSONArray dataArr) {
		try {
			JSONArray resultArr = new JSONArray();		
			JSONObject tempObj = null;
			
			for(int i = 0 ; i < dataArr.size();i++) {
				JSONObject annotationObj = new JSONObject();
				
				tempObj = (JSONObject)dataArr.get(i);
				String label = tempObj.get("label").toString();
				String path = NFS_MOUNT_ROOT_PATH+"/"+tempObj.get("path").toString();
							
				int imageId = imageMap.get(path).intValue();
				int categoryId = categoryMap.get(label).intValue();
				JSONArray bbox = new JSONArray();
				
				double x = Double.valueOf(tempObj.get("x").toString()).doubleValue();
				double y = Double.valueOf(tempObj.get("y").toString()).doubleValue();
				double w = Double.valueOf(tempObj.get("w").toString()).doubleValue();
				double h = Double.valueOf(tempObj.get("h").toString()).doubleValue();
				
				
				JsonParser jp = new JsonParser();
				JSONParser jp1 = new JSONParser();
				
				String strSegmentation = tempObj.get("segmentation").toString();
				
				JsonArray tempJa = jp.parse(strSegmentation).getAsJsonArray();
				JSONArray tempSegmentation = (JSONArray)jp1.parse(tempJa.toString());
				
				bbox.add(x);
				bbox.add(y);
				bbox.add(w);
				bbox.add(h);
				
				
				JSONArray seg = new JSONArray();
				JSONArray segWrap = new JSONArray();
				
				for(int j = 0 ; j < tempSegmentation.size();j++) {
					JSONObject tempSegObj = (JSONObject)tempSegmentation.get(j);
					seg.add(tempSegObj.get("x"));
					seg.add(tempSegObj.get("y"));
				}
				segWrap.add(seg);
				
				annotationObj.put("segmentation",segWrap);
				annotationObj.put("area", w*h);
				annotationObj.put("image_id",imageId );
				annotationObj.put("bbox", bbox);
				annotationObj.put("category_id",categoryId );
				
				
				annotationObj.put("id", i);
				annotationObj.put("iscrowd", 0);
				
				
				resultArr.add(annotationObj);
			}
			return resultArr;
		}catch(Exception e) {
			e.printStackTrace();	
			return null;
		}
		
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
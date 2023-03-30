package com.xlabeller.common.module;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class JSONReader {
	private String path;
	
	private static Logger logger = Logger.getLogger(JSONReader.class);
	
	public JSONReader(String path) {
		this.path = path;
	}
	
	public List<String> read() {
		List<String> result = new ArrayList<String>();
		JSONParser parser = new JSONParser();
		String s = "";
		try {
			// segmentations.json 파싱
			Object obj = null;
			obj = parser.parse(new FileReader(path));
			
			JSONObject jsonObject = (JSONObject) obj;
			if(jsonObject == null) {
				return null;
			}
			
			// 필요한 키값 가져오기
			JSONArray annotations = (JSONArray)jsonObject.get("annotations");
			JSONArray images = (JSONArray)jsonObject.get("images");
			JSONArray categories = (JSONArray)jsonObject.get("categories");
			HashMap<String, String> categoriMap = new HashMap<String,String>();
			HashMap<String, String> imageMap = new HashMap<String,String>();
			
			// annotations키에 있는 categori_id, categories키에 있는 id 매핑, label_name을 알기 위함
			for(int k = 0; k < categories.size(); k++) {
				JSONObject json = (JSONObject) categories.get(k);
				categoriMap.put(json.get("id").toString(), json.get("name").toString());
			}
			
			for(int j = 0; j < images.size(); j++) {
				JSONObject json = (JSONObject) images.get(j);
				imageMap.put(json.get("id").toString(), json.get("file_name").toString()); 
			}
			
			for(int i = 0; i < annotations.size(); i++) {
				s = "";
				JSONObject annotationJson = (JSONObject)annotations.get(i); 
//				String fileName = ((JSONObject)images.get(i)).get("file_name").toString(); 
				String info = String.valueOf(annotationJson.get("bbox"));
				String category_id = String.valueOf(annotationJson.get("category_id"));
						//((JSONObject)annotations.get(i)).get("category_id").toString();
				String label_name = categoriMap.get(category_id);
				String fileName = imageMap.get(String.valueOf(annotationJson.get("image_id")));
						//imageMap.get(((JSONObject)annotations.get(i)).get("image_id").toString());
				info = info.replace("[", "");
				info = info.replace("]", "");
				String[] split_info = info.split(",");
//				int x1 = Integer.parseInt(split_info[0]);
//				int y1 = Integer.parseInt(split_info[1]);
//				int w = Integer.parseInt(split_info[2]);
//				int h = Integer.parseInt(split_info[3]);
//				int x2 = x1 + w;
//				int y2 = y1 + h;
				double x1 = 0.0;
				double y1 = 0.0;
				double w = 0.0;
				double h = 0.0;
				try {
					x1 = Double.parseDouble(split_info[0]);
					y1 = Double.parseDouble(split_info[1]);
					w = Double.parseDouble(split_info[2]);
					h = Double.parseDouble(split_info[3]);
				} catch (NumberFormatException e) {
					logger.error("NumberFormatException Error!", e);
					continue;
				}
				double x2 = x1 + w;
				double y2 = y1 + h;
				
				s = fileName + "," + x1 + "," + y1 +"," + x2 + "," + y2 + "," + label_name;
				result.add(s);
			}
			
			
		} catch (Exception e) {
			if(e instanceof IOException) {
				logger.error("IOException Error!", e);
				return null;
			} else if(e instanceof ParseException) {
				logger.error("ParseException Error!", e);
				return null;
			} 
		}
//		List<Review> data = gson.fromJson(reader, REVIEW_TYPE); // contains the whole reviews list
//		data.toScreen(); // prints to screen some values
		return result;
	}
	
	public List<String> videoBoxread() {
		List<String> result = new ArrayList<String>();
		JSONParser parser = new JSONParser();
		String s = "";
		try {
//			// segmentations.json 파싱
//			Object obj = null;
//			obj = parser.parse(new FileReader(path));
			
			JSONArray jsonArray = (JSONArray) parser.parse(new FileReader(path));
			if(jsonArray == null || jsonArray.size() <= 0 || jsonArray.isEmpty()) {
				return null;
			}
		
			
			for(int i = 0; i < jsonArray.size(); i++) {
				JSONObject jsonObject = (JSONObject)jsonArray.get(i);
				JSONArray metasArray = null;
				if(jsonObject == null || jsonObject.isEmpty()) {
					return null;
				}
				if(jsonObject.get("video_path") == null || ((String)jsonObject.get("video_path")).length() <= 0) {
					continue;
				}
				
				metasArray = (JSONArray)parser.parse(jsonObject.get("metas").toString());
				if(((JSONObject)metasArray.get(0)).get("label") == null || ((String)((JSONObject)metasArray.get(0)).get("label")).length() <= 0) {
					continue;
				}
				String file_name = (String)jsonObject.get("video_path"); 
				String label_name = (String)((JSONObject)metasArray.get(0)).get("label");
				logger.info("metasArray : " + label_name);
				
				StringBuffer sb = new StringBuffer();
				sb.append(file_name);
				sb.append(",-,-,-,-,");
				sb.append(label_name);
				result.add(sb.toString());
				
			}
//			// 필요한 키값 가져오기
//			JSONArray annotations = (JSONArray)jsonObject.get("annotations");
//			JSONArray images = (JSONArray)jsonObject.get("images");
//			JSONArray categories = (JSONArray)jsonObject.get("categories");
//			HashMap<String, String> categoriMap = new HashMap<String,String>();
//			HashMap<String, String> imageMap = new HashMap<String,String>();
//			
//			// annotations키에 있는 categori_id, categories키에 있는 id 매핑, label_name을 알기 위함
//			for(int k = 0; k < categories.size(); k++) {
//				JSONObject json = (JSONObject) categories.get(k);
//				categoriMap.put(json.get("id").toString(), json.get("name").toString());
//			}
//			
//			for(int j = 0; j < images.size(); j++) {
//				JSONObject json = (JSONObject) images.get(j);
//				imageMap.put(json.get("id").toString(), json.get("file_name").toString()); 
//			}
//			
//			for(int i = 0; i < annotations.size(); i++) {
//				s = "";
////				String fileName = ((JSONObject)images.get(i)).get("file_name").toString(); 
//				String info = ((JSONObject)annotations.get(i)).get("bbox").toString();
//				String category_id = ((JSONObject)annotations.get(i)).get("category_id").toString();
//				String label_name = categoriMap.get(category_id);
//				String fileName = imageMap.get(((JSONObject)annotations.get(i)).get("image_id").toString());
//				info = info.replace("[", "");
//				info = info.replace("]", "");
//				String[] split_info = info.split(",");
//				int x1 = Integer.parseInt(split_info[0]);
//				int y1 = Integer.parseInt(split_info[1]);
//				int w = Integer.parseInt(split_info[2]);
//				int h = Integer.parseInt(split_info[3]);
//				int x2 = x1 + w;
//				int y2 = y1 + h;
//				
//				s = fileName + "," + x1 + "," + y1 +"," + x2 + "," + y2 + "," + label_name;
//				result.add(s);
//			}
			
			
		} catch (IOException | ParseException e) {
			if(e instanceof IOException) {
				logger.error("IOException Error!", e);
				return null;
			}
			if(e instanceof ParseException) {
				logger.error("ParseException Error!", e);
				return null;
			}
		}
//		List<Review> data = gson.fromJson(reader, REVIEW_TYPE); // contains the whole reviews list
//		data.toScreen(); // prints to screen some values
		return result;
	}
	
	public Map<String, String> videoBoxInferenceRead() {
		Map<String, String> result = new LinkedHashMap<String, String>();
		JSONParser parser = new JSONParser();
		String s = "";
		try {
//			// segmentations.json 파싱
//			Object obj = null;
//			obj = parser.parse(new FileReader(path));
			
			JSONArray jsonArray = (JSONArray) parser.parse(new FileReader(path));
			if(jsonArray == null || jsonArray.size() <= 0 || jsonArray.isEmpty()) {
				return null;
			}
			
			for(int i = 0; i < jsonArray.size(); i++) {
				JSONObject elementResult = new JSONObject();
				JSONObject jsonObject = (JSONObject)jsonArray.get(i);
				if(jsonObject == null || jsonObject.isEmpty()) {
					continue;
				}
				JSONArray metasArray = (JSONArray)parser.parse(jsonObject.get("metas").toString());
				if(metasArray == null || metasArray.size() <= 0 ) {
					continue;
				}
				JSONObject metas = (JSONObject)metasArray.get(0);
				if(metas == null || metas.size() <= 0) {
					continue;
				}
				String bboxList = metas.get("bbox_list").toString();
				// [[]] -> []
				bboxList = bboxList.substring(1, bboxList.length());
				String[] split_bboxList = bboxList.split("],");
				JSONArray jsonRectData = new JSONArray();
				
				for(int j = 0; j < split_bboxList.length; j++) {
					String rectData = split_bboxList[j];
					JSONObject rectElement = new JSONObject();
					// [x1,y1,x2,y2] -> x1,y1,x2,y2 
					
					if(j < split_bboxList.length - 1) {
						rectData = rectData.substring(1, rectData.length());
					} else if(j == split_bboxList.length - 1){
						rectData = rectData.substring(1, rectData.length() - 2);
					}
					// ㅌ
					String[] split_rectData = rectData.split(",");
					double x1 = Double.parseDouble(split_rectData[0]);
					double y1 = Double.parseDouble(split_rectData[1]);
					double x2 = Double.parseDouble(split_rectData[2]);
					double y2 = Double.parseDouble(split_rectData[3]);
					double w = x2 - x1;
					double h = y2 - y1;
					rectElement.put("top", y1);
					rectElement.put("left", x1);
					rectElement.put("width", w);
					rectElement.put("height", h);
					int status = 0;
					if(j == 0 || j == split_bboxList.length - 1) {
						status = 1;
					}
					rectElement.put("status", status);
					jsonRectData.add(rectElement);
				}
				
				elementResult.put("startFrame", (long)metas.get("start_frame"));
				elementResult.put("endFrame", (long)metas.get("end_frame"));
				elementResult.put("rectData", jsonRectData);
				result.put(elementResult.toString(), (String)jsonObject.get("video_path"));
				
			}
//			// 필요한 키값 가져오기
//			JSONArray annotations = (JSONArray)jsonObject.get("annotations");
//			JSONArray images = (JSONArray)jsonObject.get("images");
//			JSONArray categories = (JSONArray)jsonObject.get("categories");
//			HashMap<String, String> categoriMap = new HashMap<String,String>();
//			HashMap<String, String> imageMap = new HashMap<String,String>();
//			
//			// annotations키에 있는 categori_id, categories키에 있는 id 매핑, label_name을 알기 위함
//			for(int k = 0; k < categories.size(); k++) {
//				JSONObject json = (JSONObject) categories.get(k);
//				categoriMap.put(json.get("id").toString(), json.get("name").toString());
//			}
//			
//			for(int j = 0; j < images.size(); j++) {
//				JSONObject json = (JSONObject) images.get(j);
//				imageMap.put(json.get("id").toString(), json.get("file_name").toString()); 
//			}
//			
//			for(int i = 0; i < annotations.size(); i++) {
//				s = "";
////				String fileName = ((JSONObject)images.get(i)).get("file_name").toString(); 
//				String info = ((JSONObject)annotations.get(i)).get("bbox").toString();
//				String category_id = ((JSONObject)annotations.get(i)).get("category_id").toString();
//				String label_name = categoriMap.get(category_id);
//				String fileName = imageMap.get(((JSONObject)annotations.get(i)).get("image_id").toString());
//				info = info.replace("[", "");
//				info = info.replace("]", "");
//				String[] split_info = info.split(",");
//				int x1 = Integer.parseInt(split_info[0]);
//				int y1 = Integer.parseInt(split_info[1]);
//				int w = Integer.parseInt(split_info[2]);
//				int h = Integer.parseInt(split_info[3]);
//				int x2 = x1 + w;
//				int y2 = y1 + h;
//				
//				s = fileName + "," + x1 + "," + y1 +"," + x2 + "," + y2 + "," + label_name;
//				result.add(s);
//			}
			
			
		} catch (IOException | ParseException e) {
			if(e instanceof IOException) {
				logger.error("IOException Error!", e);
				return null;
			}
			if(e instanceof ParseException) {
				logger.error("ParseException Error!", e);
				return null;
			}
		}
//		List<Review> data = gson.fromJson(reader, REVIEW_TYPE); // contains the whole reviews list
//		data.toScreen(); // prints to screen some values
		return result;
	}

}

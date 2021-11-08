package com.xlabeller.aiAssistant;

import com.xlabeller.common.module.Output;
import com.xlabeller.common.module.SessionUtil;
import com.xlabeller.models.AiAssistantVO;
import com.xlabeller.models.UserVO;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Service
public class AiAssistantService {
	
	//private String XLABELLER_ROOT_PATH = "/usr/local/uploadFile/xlabeller/";
	private static Logger logger = Logger.getLogger(AiAssistantService.class);
	
	
	public String flask(URL url, Map<String,Object> params) throws IOException {
        StringBuilder postData = new StringBuilder();
        for(Map.Entry<String,Object> param : params.entrySet()) {
            if(postData.length() != 0) postData.append('&');
            postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
            postData.append('=');
            postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
        }
        byte[] postDataBytes = postData.toString().getBytes("UTF-8");
 
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
        conn.setDoOutput(true);
        conn.getOutputStream().write(postDataBytes); // POST 호출
 
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
 
        String inputLine = null;
        String response = "";
        while((inputLine = in.readLine()) != null) { // response 출력
            response = inputLine;
        }
 
        in.close();
        response = response.replace("\"", "");
        return response;
	}
	
	
	public Object runAiAssistant(AiAssistantVO aiAssistantVO){
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		
		if (aiAssistantVO.getPath() == null || aiAssistantVO.getPath().isEmpty() || aiAssistantVO.getPath().length() <= 0) {
			return Output.JsonOutput("4061", "DATA 경로가 존재 하지 않습니다.");
		}
		if (aiAssistantVO.getType() == null || aiAssistantVO.getType().isEmpty() || aiAssistantVO.getType().length() <= 0) {
			return Output.JsonOutput("4061", "Type이 존재 하지 않습니다.");
		}
		if (aiAssistantVO.getLeft() == null || aiAssistantVO.getLeft().isEmpty() || aiAssistantVO.getLeft().length() <= 0) {
			//return Output.JsonOutput("4061", "BOX Left 값이 존재 하지 않습니다.");
			aiAssistantVO.setLeft("0");
		}
		if (aiAssistantVO.getTop() == null || aiAssistantVO.getTop().isEmpty() || aiAssistantVO.getTop().length() <= 0) {
			//return Output.JsonOutput("4061", "BOX Top 값이 존재 하지 않습니다.");
			aiAssistantVO.setTop("0");
		}
		if (aiAssistantVO.getWidth() == null || aiAssistantVO.getWidth().isEmpty() || aiAssistantVO.getWidth().length() <= 0) {
			//return Output.JsonOutput("4061", "BOX Width 값이 존재 하지 않습니다.");
			aiAssistantVO.setWidth("0");
		}
		if (aiAssistantVO.getHeight() == null || aiAssistantVO.getHeight().isEmpty() || aiAssistantVO.getHeight().length() <= 0) {
			//return Output.JsonOutput("4061", "BOX Height 값이 존재 하지 않습니다.");
			aiAssistantVO.setHeight("0");
		}
		if (aiAssistantVO.getDistance() == null || aiAssistantVO.getDistance().isEmpty() || aiAssistantVO.getDistance().length() <= 0) {
			aiAssistantVO.setDistance("1");
		}

		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("path", aiAssistantVO.getPath());
		params.put("type", aiAssistantVO.getType());
		JSONObject box = new JSONObject();
		box.put("left", aiAssistantVO.getLeft());
		box.put("top", aiAssistantVO.getTop());
		box.put("width", aiAssistantVO.getWidth());
		box.put("height", aiAssistantVO.getHeight());
		params.put("box", box.toJSONString());
		params.put("distance", aiAssistantVO.getDistance());
		logger.info(params.toString());
		URL url = null;
		try {
			url = new URL("http://172.17.0.1:5000/aiAssistant");
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage());
		}
		String response = null;
		try {
			response = flask(url, params);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage());
		}
		if (response==null) {
			return Output.JsonOutput("4051", "객체를 찾을 수 없습니다.");
		} 
		
		String[] temp = response.split(",");
		Object result = null;
		if (aiAssistantVO.getType().equals("IMAGE_BBOX")) {
			JSONObject jsonResult = new JSONObject();
			jsonResult.put("left", temp[0]);
			jsonResult.put("top", temp[1]);
			jsonResult.put("width", temp[2]);
			jsonResult.put("height", temp[3]);
			result = jsonResult.toJSONString();
		} else if (aiAssistantVO.getType().equals("IMAGE_SEGMENTATION")){
			JSONArray jsonResult = new JSONArray();
			for (int i=0; i<temp.length; i+=2) {
				JSONObject tempJson = new JSONObject();
				tempJson.put("x", temp[i]);
				tempJson.put("y", temp[i+1]);
				jsonResult.add(tempJson);
			}
			result = jsonResult.toJSONString();
		} else {
			return Output.JsonOutput("4051", "TYPE이 올바르지 않습니다.");
		}
		logger.info(result.toString());
		return Output.JsonOutput("200", result);
	}
}

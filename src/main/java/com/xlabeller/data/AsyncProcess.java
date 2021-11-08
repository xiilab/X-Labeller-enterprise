package com.xlabeller.data;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class AsyncProcess extends Thread {
    
	private String data = null;
			
	public AsyncProcess(String data) {
		this.data = data;
	}
    public void run() {
    	try {
			inference();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public Object inference() throws Exception{
    	return httpPostJson();
	}
    
    
    public Object test1(){
		String RequestUrl = "http://localhost:8080/etriPortal/data/test2.json";
//		String KEY = "3226997091948919";
//		String SECRET = "4pUE9FwxWL9QJSSGYN6QJgPpcI5GgZEkoyZxdv5ahe107TH6GOWp5MPhuUYKUC5ia4QoAVyRazShtAn9";
//		
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
//		nameValuePairs.add(new BasicNameValuePair("imp_key",KEY));
//		nameValuePairs.add(new BasicNameValuePair("imp_secret",SECRET));
		JSONObject result = (JSONObject)httpPost(RequestUrl,nameValuePairs,null);
		System.out.println(result);
		return (String)((JSONObject)result).get("response");
			
	}
	private Object httpPost(String url,List<NameValuePair> nameValuePairs,String accessToken){
		try {   
			HttpClient client = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost(url);
			post.setEntity(new UrlEncodedFormEntity(nameValuePairs)); 
			if(accessToken != null){
				post.addHeader("Authorization", accessToken);
			}
			
			HttpResponse response = client.execute(post);
			
			int responseCode = response.getStatusLine().getStatusCode();
			if(responseCode == 200){
				JSONParser jp = new JSONParser();
				String json_string = EntityUtils.toString(response.getEntity());
				JSONObject jobj = (JSONObject)jp.parse(json_string);
				return jobj;
			}
			return null;
		}catch(Exception e){			
		}
		
		return null;
	}
	
	private Object httpPostJson() throws Exception {
		URL url = new URL("http://192.168.1.74:5000/image/");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestMethod("POST"); // 보내는 타입
		conn.setRequestProperty("Accept-Language", "ko-kr,ko;q=0.8,en-us;q=0.5,en;q=0.3");
		// 데이터
		String param = this.data;
		// 전송
		OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream());
		osw.write(param);
		osw.flush();
		// 응답
		BufferedReader br = null;
		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

		String line = null;
		while ((line = br.readLine()) != null) {
			System.out.println(line);
		}
		
		// 닫기
		osw.close();
		br.close();
		return null;
	}
}
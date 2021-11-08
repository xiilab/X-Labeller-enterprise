package com.xlabeller.annotation;

import com.xlabeller.common.module.FileCompress;
import com.xlabeller.common.module.Output;
import com.xlabeller.common.module.SessionUtil;
import com.xlabeller.meta.MetaDao;
import com.xlabeller.models.AnnotationVO;
import com.xlabeller.models.MetaVO;
import com.xlabeller.models.UserVO;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mozilla.universalchardet.UniversalDetector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StreamUtils;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.Normalizer;
import java.util.HashMap;
import java.util.List;

@Service
public class AnnotationService {
	@Autowired
	private AnnotationDao annotationDao;
	@Autowired
	private MetaDao metaDao;
	
	private String XLABELLER_ROOT_PATH = "/usr/local/uploadFile/xlabeller/";
	
	private static Logger logger = Logger.getLogger(AnnotationService.class);
	public Object getAnnotationList(AnnotationVO annotationVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		//페이징
		int count = annotationDao.getAnnotationTotalCount(annotationVO);
		int size = 9999;
		int pageStart = 0;
		if(annotationVO.getPage_num() != null && !annotationVO.getPage_num().equals("")) {
			try {
				pageStart = Integer.valueOf(annotationVO.getPage_num()).intValue();
			} catch (NumberFormatException e) {
				logger.error("NumberFormatException", e);
				pageStart = 0;
			}
		}
		
		
		annotationVO.setPage_num(String.valueOf(pageStart * size));
		annotationVO.setPage_size(String.valueOf(size));
		annotationVO.setTotal_size(String.valueOf(count));
		annotationVO.setLabel_type(annotationVO.getLabel_type());
		
		Object result = annotationDao.getAnnotationList(annotationVO);
		return Output.JsonOutput("200", result);
	}
	
	public Object getAnnotationById(AnnotationVO annotationVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		if(annotationVO.getAnnotation_id() == null || annotationVO.getAnnotation_id().length() <= 0) {
			return Output.JsonOutput("4061", "Annotation ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		Object result = annotationDao.getAnnotationById(annotationVO);
		return Output.JsonOutput("200", result);
	}
	
	public Object getVideoAnnotationById(AnnotationVO annotationVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		if(annotationVO.getAnnotation_id() == null || annotationVO.getAnnotation_id().length() <= 0) {
			return Output.JsonOutput("4061", "Annotation ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		Object result = annotationDao.getVideoAnnotationById(annotationVO);
		return Output.JsonOutput("200", result);
	}
	
	
	public Object deleteAnnotation(AnnotationVO annotationVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		if(annotationVO.getAnnotation_id() == null || annotationVO.getAnnotation_id().length() <= 0) {
			return Output.JsonOutput("4061", "Annotation ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		int cnt = annotationDao.deleteAnnotation(annotationVO);
		if(cnt == 1){
			return Output.JsonOutput("200", "삭제가 완료되었습니다.");
		}else{
			return Output.JsonOutput("4001", "삭제가 올바르지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
	}
        
	
	public Object updateAnnotation(AnnotationVO annotationVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		boolean videoBboxState = true;
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		if(annotationVO.getAnnotation_id() == null || annotationVO.getAnnotation_id().length() <= 0) {
			return Output.JsonOutput("4061", "Annotation ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		if(annotationVO.getData() == null || annotationVO.getData().length() <= 0) {
			return Output.JsonOutput("4061", "Annotation Data 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		if(annotationVO.getLabel_type() == null || annotationVO.getLabel_type().length() <= 0) {
			return Output.JsonOutput("4061", "Annotation 라벨타입 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		// VIDEO_BBOX일 경우, getData를 바로 insertAnnotation하는 것이 아니라 가공 후 insert해야함
		JSONParser parser = new JSONParser();
		JSONArray jArray = null;
		try {
			jArray = (JSONArray)parser.parse(annotationVO.getData());
		} catch (ParseException e) {
			logger.error("ParseException Error! annotation_id : " + annotationVO.getAnnotation_id(), e);
			return Output.JsonOutput("4091", "Annotation Data를 JSON형태로 변환하는데 실패했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		if(jArray.isEmpty() || jArray.size() <= 0) {
			return Output.JsonOutput("300", "Annotation을 생성하는 과정에서 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		
		if(annotationVO.getLabel_type().equals("VIDEO_BBOX")) {
			JSONArray datajArray = new JSONArray();
			for(int i = 0; i < jArray.size(); i++) {
				JSONObject jObj = (JSONObject)jArray.get(i);
				if((String)jObj.get("meta_id") == null || ((String)jObj.get("meta_id")).length() <= 0) {					
					continue;
				}
				if((String)jObj.get("label_type") == null || ((String)jObj.get("label_type")).length() <= 0) {					
					continue;
				}
				if((String)jObj.get("label") == null || ((String)jObj.get("label")).length() <= 0) {					
					continue;
				}
				if((String)jObj.get("path") == null || ((String)jObj.get("path")).length() <= 0) {					
					continue;
				}
				if((String)jObj.get("label_type") == null || ((String)jObj.get("label_type")).length() <= 0) {					
					continue;
				}
				if(!((String)jObj.get("label_type")).equals("#VIDEO_BBOX")) {					
					continue;
				}
				JSONObject jsonElement = new JSONObject();
				jsonElement.put("path", (String)jObj.get("path"));
				jsonElement.put("label", (String)jObj.get("label"));
				jsonElement.put("label_type", (String)jObj.get("label_type"));
				jsonElement.put("meta_id", (String)jObj.get("meta_id"));
				String metaId = (String)jObj.get("meta_id");
				MetaVO metaVO = new MetaVO();
				metaVO.setMeta_id(metaId);
				MetaVO findMetaVO = metaDao.getMetaByMetaId(metaVO);
				if(findMetaVO == null || findMetaVO.getInfo() == null || findMetaVO.getInfo().length() <= 0) {
					AnnotationVO annotation = new AnnotationVO();
					annotation.setAnnotation_id(annotationVO.getAnnotation_id());
					AnnotationVO findAnnotationVO = annotationDao.getAnnotationById(annotation);
					JSONArray jsonArray = null; 
					try {
						jsonArray = (JSONArray)parser.parse(findAnnotationVO.getData());
					} catch (ParseException e) {
						logger.error("parserException Error!", e);
						return Output.JsonOutput("4091", "Annotation Data를 JSON형태로 변환하는데 실패했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
					}
					
					for(int j = 0; j < jsonArray.size(); j++) {
						JSONObject json = (JSONObject)jsonArray.get(j);
						if(json.get("meta_id") == null || ((String)json.get("meta_id")).length() <= 0) {
							continue;
						}
						if(((String)json.get("meta_id")).equals(metaId)) {
							jsonElement.put("metas", (String)json.get("metas"));
							break;
						}
					}
					
				} else {
					jsonElement.put("metas", findMetaVO.getInfo());
				}
				datajArray.add(jsonElement);
			}			
			annotationVO.setData(datajArray.toJSONString());			
		}
		
		int cnt = annotationDao.updateAnnotation(annotationVO);
		if(cnt == 1){
			return Output.JsonOutput("200", "업데이트가 완료되었습니다.");
		}else{
			return Output.JsonOutput("4001", "업데이트가 올바르지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
	}
	
	
	
	
	public Object insertAnnotation(AnnotationVO annotationVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		boolean videoBboxState = true;
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		
		if(annotationVO.getTitle() == null) {
			return Output.JsonOutput("4061","제목을 입력해주세요.");
		}
		
		if(annotationVO.getContents() == null) {
			return Output.JsonOutput("4061","설명을 입력해주세요.");
		}
		
		if(annotationVO.getTitle().length() > 100) {
			return Output.JsonOutput("4061","제목의 길이는 100자를 초과할 수 없습니다.\n다른 제목을 입력해주세요.");
		} 
		
		if(annotationVO.getContents().length() > 300) {
			return Output.JsonOutput("4061","설명의 길이는 300자를 초과할 수 없습니다.\n다른 설명을 입력해주세요.");
		}
		
		if(annotationVO.getData() == null || annotationVO.getData().length() <= 0) {
			return Output.JsonOutput("4061","Annotation으로 생성할 데이터가 없습니다.\n라벨을 추가 후 다시 시도해주세요.");
		}
		
		List<AnnotationVO> list = annotationDao.getCheckAnnotationName(annotationVO);
		if(list.size() > 0) {
			return Output.JsonOutput("300", "중복된 Annotation명입니다.");
		}
		
		annotationVO.setUser_id(userInfo.getUser_id());
		
		// VIDEO_BBOX일 경우, getData를 바로 insertAnnotation하는 것이 아니라 가공 후 insert해야함
		JSONParser parser = new JSONParser();
		JSONArray jArray = null;
		try {
			jArray = (JSONArray)parser.parse(annotationVO.getData());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			logger.error("ParseException Error!", e);
			return Output.JsonOutput("4091", "Annotation Data를 JSON형태로 변환하는데 실패했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		
		if(annotationVO.getLabel_type().equals("VIDEO_BBOX")) {
			JSONArray datajArray = new JSONArray();
			for(int i = 0; i < jArray.size(); i++) {
				JSONObject jObj = (JSONObject)jArray.get(i);
				if((String)jObj.get("meta_id") == null || ((String)jObj.get("meta_id")).length() <= 0) {					
					continue;
				}
				if((String)jObj.get("label_type") == null || ((String)jObj.get("label_type")).length() <= 0) {					
					continue;
				}
				if((String)jObj.get("label") == null || ((String)jObj.get("label")).length() <= 0) {					
					continue;
				}
				if((String)jObj.get("path") == null || ((String)jObj.get("path")).length() <= 0) {					
					continue;			
				}
				if((String)jObj.get("label_type") == null || ((String)jObj.get("label_type")).length() <= 0) {
					continue;			
				}
				if(!((String)jObj.get("label_type")).equals("#VIDEO_BBOX")) {					
					continue;
				}
				JSONObject jsonElement = new JSONObject();
				jsonElement.put("path", encodingText((String)jObj.get("path")));
				jsonElement.put("label", (String)jObj.get("label"));
				jsonElement.put("label_type", (String)jObj.get("label_type"));
				jsonElement.put("meta_id", (String)jObj.get("meta_id"));
				String metaId = (String)jObj.get("meta_id");
				MetaVO metaVO = new MetaVO();
				metaVO.setMeta_id(metaId);
				MetaVO findMetaVO = metaDao.getMetaByMetaId(metaVO);
				jsonElement.put("metas", findMetaVO.getInfo());
				datajArray.add(jsonElement);
			}
			
			annotationVO.setData(datajArray.toJSONString());
			
		}
		
	
		int cnt = annotationDao.insertAnnotation(annotationVO);
		if(cnt == 1){
			return Output.JsonOutput("200", "등록이 완료되었습니다.");
		} else {
			logger.error("insertAnnotation InsertAnnotation Error! user_id : " + annotationVO.getUser_id());
			return Output.JsonOutput("4001", "등록이 올바르지 않습니다.\n다시 시도해주세요.");
		}
	}
	
	public Object exportAnnotation(AnnotationVO annotationVO,HttpServletResponse response) throws Exception{
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		
		if(annotationVO.getAnnotation_id() == null || annotationVO.getAnnotation_id().length() <= 0) {
			return Output.JsonOutput("4061", "Annotation ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		AnnotationVO annVO = annotationDao.getAnnotationById(annotationVO);
		if(annVO.getData() == null || annVO.getData().length() <= 0 ) {
			logger.error("AnnotationVO.getData() is null! annotation_id : " + annVO.getAnnotation_id());
			return Output.JsonOutput("4071", "데이터가 존재하지 않습니다");
		}

		//데이터 가져옴
		JSONParser jp = new JSONParser();
		JSONArray jArr = null;
		try {
			jArr = (JSONArray)jp.parse(annVO.getData());
		} catch (ParseException e) {
			logger.error("Export Annotation ParseException Error! annotation_id : " + annVO.getAnnotation_id(), e);
			return Output.JsonOutput("4091", "Annotation Data를 JSON형태로 변환하는데 실패했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		//(JSONArray)jp.parse(annVO.getData());
		if(jArr == null || jArr.isEmpty() || jArr.size() <= 0) {
			logger.error("Export Annotation JSONArray Error! annotation_id : " + annVO.getAnnotation_id());
			return Output.JsonOutput("300", "Annotation을 생성하는 과정에서 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		} 
			
		//파일로 저장
		response.setContentType("application/zip");
		response.setHeader("Content-Disposition", "attachment; filename = package.zip");
		ServletOutputStream out;
		
		out = response.getOutputStream();
		
		FileCompress fc = new FileCompress(out);
		
		String path = null;
		String fileName = null;
		JSONObject jObj = null;
		fc.mkdir("dataset/");
		
		HashMap<String,String> dupMap = new HashMap<String,String>();
		
		for(int i = 0 ; i < jArr.size() ; i++) {
			jObj = (JSONObject)jArr.get(i);
			if(jObj == null || jObj.isEmpty() || jObj.size() <= 0) {
				logger.error("exportAnnotaion JSONObject Error!");
				//return Output.JsonOutput("300", "Annotation을 생성하는 과정에서 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
				return Output.JsonOutput("300", "Annotation을 export하는 과정에서 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}
			if((String)jObj.get("path") == null || ((String)jObj.get("path")).length() <= 0) {
				logger.error("exportAnnotaion jObj.get(\"path\") Error!");
				logger.error("jObj.get(\"path\") : " + jObj.get("path"));
				continue;
				//return Output.JsonOutput("4071", "Annotation을 export하는 과정에서 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}
			path = XLABELLER_ROOT_PATH + (String)jObj.get("path");
			fileName = ((String)jObj.get("path"));
			fileName = encodingText(fileName);
			
			if(dupMap.get(fileName) == null) {
				dupMap.put(fileName, "1");
			}else {
				continue;
			}
			
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(path);
				fc.append(fileName,StreamUtils.copyToByteArray(fis));
			} catch(FileNotFoundException e) {
				logger.error("FileNotFoundException Error!", e);
				continue;
//				response.resetBuffer();
//				response.reset();
//				return Output.JsonOutput("4071", "Annotation을 export하는 과정에서 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			} catch (IOException e) {
				logger.error("IOException Error!", e);
				continue;
//				response.resetBuffer();
//				response.reset();
//				return Output.JsonOutput("4071", "Annotation을 export하는 과정에서 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			} finally {		
				if(fis != null) {
					fis.close();
				} 
			}
		}
		
    	ByteArrayOutputStream b = new ByteArrayOutputStream();
    	b.write(annVO.getData().getBytes());
    	fc.append("data.json",b.toByteArray());
		
    	try {
    		if(b != null) {
    			b.flush();
    			b.close();
    		}
    		if(out != null) {
    			out.flush();
    			out.close();
    		}
    		if(fc != null) {
    			fc.close();
    		}
		} catch (Exception e) {
			if(e instanceof IOException) {
				logger.error("IOException Erorr!", e);
			} else {
				logger.error("Exception Error!", e);
			}
		}
    	
    	
    	
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
////			e.printStackTrace();
//			logger.error("exportAnnotation Exception Error!", e);
//		} 
		
		return null;

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
				logger.error("encodingText UnsupportedEncodingException Error!", e);
			} finally {
				str_byte = null;
			}
		}
		
		return text;
	}
	
	
//	public Object testAnnotation(AnnotationVO annotationVO) throws ParseException {
//		
//		AnnotationVO result = annotationDao.getAnnotationById(annotationVO);
//		String data = result.getData();
//		JSONParser jp = new JSONParser();
//		JSONArray dataArr = (JSONArray)jp.parse(data);
//		CocoUtil cu = new CocoUtil();
//		Object resultJson = cu.createAll(dataArr);
//
//		return resultJson;
//	}

}
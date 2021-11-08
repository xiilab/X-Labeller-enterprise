package com.xlabeller.meta;

import com.xlabeller.common.module.Output;
import com.xlabeller.common.module.SessionUtil;
import com.xlabeller.data.DataDao;
import com.xlabeller.models.DataVO;
import com.xlabeller.models.MetaVO;
import com.xlabeller.models.UserVO;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MetaService {
	@Autowired
	private MetaDao metaDao;
	
	@Autowired
	private DataDao dataDao;
	
	private static Logger logger = Logger.getLogger(MetaService.class);
	
	public Object getMetaByDataId(MetaVO metaVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		MetaVO selectMetaVO = new MetaVO();		
		if(metaVO.getData_id() == null || metaVO.getData_id().isEmpty()) {
			return Output.JsonOutput("4301","데이터 아이디가 선택 되지 않았습니다.");
		}		
//		selectMetaVO.setUser_id(userInfo.getUser_id());
		selectMetaVO.setData_id(metaVO.getData_id());
		List<MetaVO> metaList = metaDao.getMetaByDataId(selectMetaVO);
				
		return Output.JsonOutput("200",metaList);
	}
	
	public Object getMetaByMetaId(MetaVO metaVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		MetaVO selectMetaVO = new MetaVO();		
		if(metaVO.getData_id() == null || metaVO.getData_id().isEmpty()) {
			return Output.JsonOutput("4301","데이터 아이디가 선택 되지 않았습니다.");
		}		
//		selectMetaVO.setUser_id(userInfo.getUser_id());
		selectMetaVO.setData_id(metaVO.getData_id());
		List<MetaVO> metaList = metaDao.getMetaByDataId(selectMetaVO);
				
		return Output.JsonOutput("200",metaList);
	}
	
	
	public Object insertMeta(MetaVO metaVO) throws Exception {
		// 
		MetaVO insertMetaVO = new MetaVO();
		UserVO userInfo = SessionUtil.getUserInfo();
		//세션 체크
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		
		
		// 유효성검증
		String dataId = metaVO.getData_id();
		String labelType = metaVO.getLabel_type();
		
		if(dataId == null || dataId.isEmpty()) {
			return Output.JsonOutput("5005", "타겟 데이터 파라미터가 존재하지 않습니다.");
		}
		if(labelType == null || labelType.isEmpty()) {
			return Output.JsonOutput("5005", "라벨 타입이 존재하지 않습니다.");
		}
		
		DataVO selectDataVO = new DataVO();
		selectDataVO.setUser_id(userInfo.getUser_id());
		selectDataVO.setStatus("1");
		selectDataVO.setData_id(dataId);		
		
		DataVO resultDataVO = dataDao.getDataById(selectDataVO);
		if(resultDataVO == null || resultDataVO.getData_id() == null || !dataId.equals(resultDataVO.getData_id())) {
			return Output.JsonOutput("5005", "할당된 타겟 데이터 정보가 존재하지 않습니다.");
		}		
		// 라벨타입을 확인해야함(Dataset)에서 확인 필요
		
		

//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Date time = new Date();
//		String time1 = format.format(time);
//		logger.info("-----------------------------------------");
//		logger.info("Datetime : " + time1);
//		logger.info("User ID : " + userInfo.getUser_id());
//		logger.info("InsertMetaData Start!");
//		logger.info("-----------------------------------------");
		JSONArray jsonArr = null;
		
		if(metaVO == null || metaVO.getData() == null || metaVO.getData().isEmpty()) {
			logger.error("getData Error! ");
			logger.error("metaVO.getData() : " + metaVO.getData());
			return Output.JsonOutput("5001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생시 관리자에게 문의 부탁드립니다.");
		}
		try {
			jsonArr = (JSONArray) new JSONParser().parse(metaVO.getData());
		} catch (ParseException e) {
			logger.error("User ID : " + userInfo.getUser_id());
			logger.error("insertMetaData ParseException Error!", e);
			throw new Exception("4007#유효하지 않은 가공 데이터입니다(데이터파싱 에러)");
		}

		for(int i=0; i<jsonArr.size(); i++) {
			JSONObject jsonObj = (JSONObject) jsonArr.get(i);
			if(jsonObj == null) {
				throw new Exception("4056#등록이 올바르지 않습니다.");
			}
			
			if(jsonObj.get("meta_id") == null || jsonObj.get("meta_id").toString().equals("")) {
				logger.error("meta_id Error!");
				logger.error("User ID : " + userInfo.getUser_id() + "meta_id : " + jsonObj.get("meta_id"));
				throw new Exception("4056#유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생시 관리자에게 문의 부탁드립니다.");
			}			
			if(jsonObj.get("info") == null || jsonObj.get("info").toString().equals("")) {
				logger.error("jsonObj.get(\"info\") Error!");
				logger.error("User ID : " + userInfo.getUser_id());
				throw new Exception("4057#유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생시 관리자에게 문의 부탁드립니다.");
			}
			
			
//			String metaId = (String) jsonObj.get("meta_id");			
//			insertMetaVO.setData_id(dataId);
//			insertMetaVO.setUser_id(userInfo.getUser_id());
//			insertMetaVO.setLabel((String) jsonObj.get("label"));
//			insertMetaVO.setLabel_type(labelType);
//			insertMetaVO.setInfo((String) jsonObj.get("info"));
			
			String metaId = (String) jsonObj.get("meta_id");			
			insertMetaVO.setData_id(dataId);
			insertMetaVO.setUser_id(userInfo.getUser_id());
			insertMetaVO.setLabel((String) jsonObj.get("label"));
			insertMetaVO.setLabel_type(labelType);
			if(labelType.equals("IMAGE_BBOX") || labelType.equals("VIDEO_BBOX")) {
				insertMetaVO.setInfo((String) jsonObj.get("info"));
			} else if(labelType.equals("IMAGE_SEGMENTATION") || labelType.equals("IMAGE_LINE")) {
				JSONParser parser = new JSONParser();
				JSONArray jArray = null;
				JSONObject jsonObject = null;
				try {
					jArray = (JSONArray) parser.parse((String) jsonObj.get("info"));
				} catch (ParseException e) {
					logger.error("parseException Error!",e);
				}
//				jsonObject.put("segementation", jArray.get(0));
//				jsonObject.put("box", jArray.get(1));
				insertMetaVO.setInfo(jArray.toJSONString());
			}
			
			int cnt = 0;
			if(metaId.indexOf("-") == -1) {//업설트				
				insertMetaVO.setMeta_id(metaId);
				cnt = metaDao.upsertMeta(insertMetaVO);
			}else {//인서트
				cnt = metaDao.insertMeta(insertMetaVO);
			}
			
			if(cnt == 0) {
				logger.error("UpdateDataByAdmin Update Error!");
				logger.error("data_id : " + insertMetaVO.getData_id() + ", user_id : " + insertMetaVO.getUser_id() + ", meta_id : " + insertMetaVO.getMeta_id());
				logger.error(jsonArr.size() + "개 중에 " + (i+1) + "번쨰 객체에서 오류 발생!");
				throw new Exception("4005#가공데이터 등록이 올바르지 않습니다.");
			}
			
			logger.info("UpdateDataByAdmin Update Success!");
			logger.info("data_id : " + insertMetaVO.getData_id() + ", user_id : " + insertMetaVO.getUser_id() + ", meta_id : " + insertMetaVO.getMeta_id());
			logger.info(jsonArr.size() + "개 중에 " + (i+1) + "번쨰 객체 Upsert 성공!");
			
			
		}
		
		metaVO = null;
		return Output.JsonOutput("200", "저장되었습니다.");	
		
		
	}
	
	
	
	public Object deleteMetaById(MetaVO metaVO){
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		
		
		if(metaVO.getMeta_id() == null || metaVO.getMeta_id().equals("")) {
			return Output.JsonOutput("3406", "삭제할 메타데이터 파라미터가 존재하지 않습니다.");
		}
		
		MetaVO deleteMetaVO = new MetaVO();
		deleteMetaVO.setMeta_id(metaVO.getMeta_id());
//		deleteMetaVO.setUser_id(userInfo.getUser_id());
		
		int cnt = 0;
		cnt = metaDao.deleteMetaById(metaVO);		
		if(cnt != 1) {
			return Output.JsonOutput("3454", "삭제할 메타 데이터가 존재하지 않습니다.");
		}
		
		return Output.JsonOutput("200", "삭제가 완료되었습니다.");
	}



	
	
	
}
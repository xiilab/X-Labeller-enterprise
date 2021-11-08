package com.xlabeller.data;

import com.xlabeller.common.module.Output;
import com.xlabeller.models.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;





@Controller
@RequestMapping("/data")
public class DataController {
	@Autowired
	private DataService dataService;  
	
	private static final Logger logger = LoggerFactory.getLogger(DataController.class);
	
	/**
	 * 데이터셋 리스트 가져오기
	 * INPUT : 
	 * 		account(계정명)
	 * 		password(패스워드)
	 * 	 	page_num
	 * OUTPUT : 
	 * 	
	 */
	@RequestMapping("/getDatasetList")
	public ModelAndView getDatasetList(DatasetVO datasetVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = dataService.getDatasetList(datasetVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * 하나의 데이터셋 객체 가져오기
	 * INPUT : 
	 * 		dataset_id
	 * OUTPUT : 
	 * 
	 */
	@RequestMapping("/getDatasetById")
	public ModelAndView getDatasetById(DatasetVO datasetVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = dataService.getDatasetById(datasetVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}

	/**
	 * 내 데이터 셋 리스트 가져오기
	 * INPUT : 
	 * 		page_num : 0~
	 * 		title : 타이틀검색시
	 * OUTPUT :
	 * 
	 */
	@RequestMapping("/getMyDatasetList")
	public ModelAndView getMyDatasetList(DatasetVO datasetVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = dataService.getMyDatasetList(datasetVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	/**
	 * 시각데이터 검색 
	 * INPUT : 
	 * 		label : 레이블 데이터명
	 * 		dataset_id : 필터링 조건
	 * OUTPUT : 
	 * 		data_id
	 * 		dataset_id
	 * 		path 
	 */
	@RequestMapping("/getSearchVisionList")
	public ModelAndView getSearchVisionList(MetaVO metaVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = dataService.getSearchVisionList(metaVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * 시각데이터 검색(어노테이션용)
	 * INPUT :  
	 * 		label : 레이블 데이터명
	 * 		dataset_id : 필터링 조건
	 * OUTPUT : 
	 * 		id
	 * 		dataset_id
	 * 		path
	 */
	@RequestMapping("/getSearchAnnotationVisionList")
	public ModelAndView getSearchAnnotationVisionList(MetaVO metaVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = dataService.getSearchAnnotationVisionList(metaVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * 시각데이터 검색(어노테이션용) 
	 * INPUT :
	 * 		label : 레이블 데이터명
	 * 		dataset_id : 필터링 조건
	 * OUTPUT : 
	 * 		id
	 * 		dataset_id
	 * 		path
	 */
	@RequestMapping("/getSearchVideoAnnotationVisionList")
	public ModelAndView getSearchVideoAnnotationVisionList(MetaVO metaVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = dataService.getSearchVideoAnnotationVisionList(metaVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	@RequestMapping("/insertDataset")
	public ModelAndView insertDataset(DatasetVO datasetVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = dataService.insertDataset(datasetVO);
		} catch (Exception e) {
			logger.error("insertDataset Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다.");
				logger.error("insertDataset Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다.");
				logger.error("insertDataset Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("insertDataset Error!", e);
			}
		}
		
		datasetVO.setFiles(null);
		
		modelAndView.addObject("result",  result);
		return modelAndView;		
	}
	
	@RequestMapping("/insertData")
	public ModelAndView insertData(DatasetVO datasetVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = dataService.insertData(datasetVO);
		} catch (Exception e) {
			logger.error("insertDataset Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다.");
				logger.error("insertDataset Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다.");
				logger.error("insertDataset Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("insertDataset Error!", e);
			}
		}
		
		datasetVO.setFiles(null);
		
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/* 데이터 복제
	 *  INPUT :
	 *  	dataset_id : dataset id
	 *  	dataset_ids : dataset_ids(복제될 데이터셋 번호)
	 *  OUTPUT : 
	 *  
	 * */
	@RequestMapping("/insertReplicaData")
	public ModelAndView insertReplicaData(DataVO dataVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = dataService.insertReplicaData(dataVO);
		} catch (Exception e) {
//			e.printStackTrace();
			logger.error("insertReplicaData Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다");
				logger.error("insertReplicaData Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다");
				logger.error("insertReplicaData Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("insertReplicaData Error!", e);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/* 하나의 데이터셋의 모든 데이터 여러 데이터셋에 복제
	 *  INPUT : 
	 *  	dataset_id : 복사할 데이터셋 ID
	 *		dataset_ids : 복제될 dataset ids (ex : 1, 2, 3, 4, 5...)
	 * 	OUTPUT : 
	 * 				
	 * */
	@RequestMapping("/insertReplicaPartData")
	public ModelAndView insertReplicaPartData(DataVO dataVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = dataService.insertReplicaPartData(dataVO);
		} catch (Exception e) {
//			e.printStackTrace();
			logger.error("insertReplicaData Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다");
				logger.error("insertReplicaData Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다");
				logger.error("insertReplicaData Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("insertReplicaData Error!", e);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/* 하나의 데이터셋의 전체 데이터와 메타를 여러 데이터셋에 복제
	 *	INPUT : 
	 *  	data_id : data ids (ex : 1,2,3,4,5)
	 *		dataset_id : 복사할 데이터셋 ID
	 *		dataset_ids : 복제될 데이터셋 ID, dataset ids (ex : 1, 2, 3, 4, 5)
	 *	OUTPUT : 
	 *				
	 * */
	@RequestMapping("/insertReplicaPartDataWithMeta")
	public ModelAndView insertReplicaPartDataWithMeta(DatasetVO datasetVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = dataService.insertReplicaPartDataWithMeta(datasetVO);
		} catch (Exception e) {
//			e.printStackTrace();
			logger.error("insertReplicaPartDataWithMeta!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다");
				logger.error("insertReplicaPartDataWithMeta!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다");
				logger.error("insertReplicaPartDataWithMeta!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("insertReplicaPartDataWithMeta!", e);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	/* 데이터셋의 모든 데이터와 메타를 데이터셋 생성 후 복제
	 * INPUT : 
	 *  	dataset_id : 복제할 Dataset ID
	 *  OUTPUT : 
	 *  		
	 * */
	@RequestMapping("/insertReplicaDataWithMeta")
	public ModelAndView insertReplicaDataWithMeta(DatasetVO datasetVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = dataService.insertReplicaDataWithMeta(datasetVO);
		} catch (Exception e) {
//			e.printStackTrace();
			logger.error("insertReplicaDataWithMeta Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다");
				logger.error("insertReplicaDataWithMeta Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다");
				logger.error("insertReplicaDataWithMeta Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("insertReplicaDataWithMeta Error!", e);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/* 데이터셋 삭제
	 * INPUT : 
	 * 		dataset_id : dataset id
	 * OUTPUT : 
	 * 
	 * */
	@RequestMapping("/deleteDataset")
	public ModelAndView deleteDataset(DatasetVO datasetVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = dataService.deleteDataset(datasetVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/* 데이터 삭제
	 * INPUT : 
	 * 		data_id
	 * OUTPUT : 
	 * 
	 * */
	@RequestMapping("/deleteData")
	public ModelAndView deleteData(DataVO dataVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result;
		try {
			result = dataService.deleteData(dataVO);
		} catch (Exception e) {
//			e.printStackTrace();
			logger.error("deleteData Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
				logger.error("insertReplicaDataWithMeta Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
				logger.error("insertReplicaDataWithMeta Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("insertReplicaDataWithMeta Error!", e);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/* 메타 삭제
	 * INPUT : 
	 * 		meta_id : meta id
	 * OUTPUT :
	 * */
	@RequestMapping("/deleteMeta")
	public ModelAndView deleteMeta(MetaVO metaVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = dataService.deleteMeta(metaVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}

	
	/* 데이터의 메타 삭제 
	 * INPUT : 
	 * 		data_id : data ids (1,2,3,4) 
	 * OUTPUT : 
	 * 
	 * */
	@RequestMapping("/deleteMetaInDataId")
	public ModelAndView deleteMetaInDataId(DataVO dataVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = dataService.deleteMetaInDataId(dataVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}

	/* 데이터셋의 모든 메타 삭제
	 * INPUT :  
	 * 		dataset_id : 데이터셋 아이디 
	 * OUTPUT : 
	 * 
	 * */
	@RequestMapping("/deleteMetaByDatasetId")
	public ModelAndView deleteMetaByDatasetId(DataVO dataVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = dataService.deleteMetaByDatasetId(dataVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}

	/* 데이터셋의 모든 데이터, 메타 삭제 
	 * INPUT :  
	 * 		dataset_id : dataset ids (1,2,3,4)
	 * OUTPUT :  
	 * 
	 * */
	@RequestMapping("/deleteDataInDatasetId")
	public ModelAndView deleteDataInDatasetId(DatasetVO datasetVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result;
		try {
			result = dataService.deleteDataInDatasetId(datasetVO);
		} catch (Exception e) {
			logger.error("deleteData Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
				logger.error("insertReplicaDataWithMeta Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
				logger.error("insertReplicaDataWithMeta Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("insertReplicaDataWithMeta Error!", e);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/*데이터셋 업데이트
	 * INPUT : 
	 * 		dataset_id :  변경할 dataset_id
	 * 		title
	 * 		contents 
	 * 		is_enable
	 * OUTPUT : 
	 * 		
	 * */
	@RequestMapping("/updateDataset")
	public ModelAndView updateDataset(DatasetVO dataVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = dataService.updateDataset(dataVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/** 데이터 리스트 가져옴 
	 * INPUT : 
	 * 		dataset_id: 데이터셋아이디
	 * 		page_num : 0~
	 * OUTPUT : 
	 * 
	 */
	@RequestMapping("/getDataList")
	public ModelAndView getDataList(DataVO dataVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = dataService.getDataList(dataVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/** 데이터 리스트 가져옴 (페이지 제한 없음)
	 * INPUT : 
	 * 		dataset_id: 데이터셋아이디
	 * 		page_num : 0~
	 * OUTPUT : 
	 * 
	 */
	@RequestMapping("/getPageNoLimitDataList")
	public ModelAndView getPageNoLimitDataList(DataVO dataVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = dataService.getPageNoLimitDataList(dataVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	/**
	 * Data 디테일 정보 가져오기(데이터 넘버링으로) 
	 * INPUT : 
	 * 		dataset_id : 데이터셋 아이디
	 * 		data_num : 데이터 넘버링
	 * 
	 */
	@RequestMapping("/getDataByNum")
	public ModelAndView getDataByNum(DataVO dataVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = dataService.getDataByNum(dataVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	
	/**
	 * 특정 Dataset_id를 가진 Data의 dataset_id를 변경
	 * 
	 * dataset_id : 특정 dataset_id
	 * target_dataset_id : 변경될 dataset_id 
	 */
	@RequestMapping("/updateDataInId")
	public ModelAndView updateDataInId(DataVO dataVO, HttpSession session) throws Exception {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = dataService.updateDataInId(dataVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	
	
	/**
	 * 데이터의 메타 리스트 가져옴 
	 * INPUT : 
	 * 		data_id
	 * 		label
	 * OUTPUT : 
	 * 		
	 **/
	@RequestMapping("/getMetaList")
	public ModelAndView getMetaList(MetaVO metaVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = dataService.getMetaList(metaVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * 메타업데이트(삭제하고 인서트)
	 * INPUT : 
	 * 		info : json string
	 * 		stay_flag : 0(기본) => 삭제하고 인서트, 1=> 인서트만, 2=> update
	 * OUTPUT : 
	 * 
	 **/
	@RequestMapping("/updateMeta")
	public ModelAndView updateMeta(MetaVO metaVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		
		Object result;
		try {
			result = dataService.updateMeta(metaVO);
		} catch (Exception e) {
//			e.printStackTrace();
			logger.error("insertReplicaDataWithMeta Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
				logger.error("insertReplicaDataWithMeta Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
				logger.error("insertReplicaDataWithMeta Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("insertReplicaDataWithMeta Error!", e);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/* 인퍼런스 결과를 메타에 추가
	 * INPUT : 
	 * 		info : json string
	 * 		ex ) info : ["/dataset/1.jpg,100,100,100,100,cat","/dataset/1.jpg,100,100,100,100,cat","/dataset/1.jpg,100,100,100,100,cat"]
	 * 		dataset_id : 데이터셋 아이디
	 * OUTPUT : 
	 * 
	 * */
	@RequestMapping("/insertMetaByInference")
	public ModelAndView insertMetaByInference(MetaVO metaVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		
		Object result;
		try {
			result = dataService.insertMetaByInference(metaVO);
		} catch (Exception e) {
//			e.printStackTrace();
			logger.error("insertMetaByInference Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생시 관리자에게 문의해주시길 바랍니다.");
				logger.error("insertMetaByInference Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생시 관리자에게 문의해주시길 바랍니다.");
				logger.error("insertMetaByInference Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("insertMetaByInference Error!", e);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	/* 메타정보 이동(일괄)
	 * INPUT : 
	 * 		source : 원본이미지 데이터의 data ids (ex : 1,2,3,4)
	 * 		target : 이동할 이미지 데이터의 data ids (ex : 5,6,7,8)
	 * 		label : 필터링해서 특정 레이블들만 옮길때, 없으면 안보내면 됨
	 * OUTPUT :
	 *  	
	 * */
	@RequestMapping("/updateMoveMetaByDataId")
	public ModelAndView updateMoveMetaByDataId(MetaMoveVO metaMoveVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		
		Object result;
		try {
			result = dataService.updateMoveMetaByDataId(metaMoveVO);
		} catch (Exception e) {
//			e.printStackTrace();
			logger.error("updateMovelMetaByDataId Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
				logger.error("updateMovelMetaByDataId Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
				logger.error("updateMovelMetaByDataId Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("updateMovelMetaByDataId Error!", e);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	/*
	 * 레이블 그룹핑 리스트 가져옴
	 * INPUT : 
	 * 		필터링 조건(두가지조건을 같이 쓰는 경우는 없을듯.)
	 * 		dataset_id : dataset id들(ex:1,2,3,5)
	 * 		data_id : data id들(ex:5,3,4)
	 * OUTPUT : 
	 * 
	 * */
	@RequestMapping("/getLabelGroup")
	public ModelAndView getLabelGroup(MetaVO metaVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = dataService.getLabelGroup(metaVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/* 데이터셋 import
	 * INPUT :
	 *		title
	 *		contents
	 *		file : multipart file. only one
	 *		is_new : true / false 완전 새롭게 복사==true, 중복된 이름 있을때 Link만 복사 == false
	 * OUTPUT : 
	 *  
	 * */
	@RequestMapping("/importDataset")
	public ModelAndView importDataset(ImportDatasetVO importDatasetVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = dataService.importDataset(importDatasetVO);
		} catch (Exception e) {
//			e.printStackTrace();
			logger.error("insertReplicaDataWithMeta Error!", e);
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다.");
				logger.error("insertReplicaDataWithMeta Error!", e);
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다.");
				logger.error("insertReplicaDataWithMeta Error!", e);
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
				logger.error("importDataset Error!", e);
			}
		}
		
		importDatasetVO.setFiles(null);
		
		modelAndView.addObject("result",  result);
		return modelAndView;	
	}
	
	/* Dataset마지막 작업위치 가져옴
	 * INPUT :
	 * 		save_data_id
	 * 		dataset_id
	 * OUTPUT : 
	 * 
	 * 
	 * */
	@RequestMapping("/getLastCursor")
	public ModelAndView getLastCursor(DatasetVO datasetVO) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		result = dataService.getLastCursor(datasetVO);
		modelAndView.addObject("result",  result);
		return modelAndView;	
	}
	
	
	/**
	 * 데이터셋 로그 리스트(50개씩)
	 * INPUT :  
	 * 		dataset_id : 데이터셋 아이디	
	 * 		page_num : 페이지
	 * OUTPUT :
	 * 
	 */
	@RequestMapping("/getDatasetLogList")
	public ModelAndView getDatasetLogList(DatasetLogVO datasetLogVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = dataService.getDatasetLogList(datasetLogVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
}
package com.xlabeller.data;

import com.xlabeller.common.module.*;
import com.xlabeller.models.*;
import com.xlabeller.task.TaskDao;
import org.apache.log4j.Logger;
import org.jcodec.api.FrameGrab;
import org.jcodec.common.model.Picture;
import org.jcodec.scale.AWTUtil;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mozilla.universalchardet.UniversalDetector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.text.Normalizer;
import java.util.*;
import java.util.Base64.Encoder;

@Service
public class DataService {
	@Autowired
	private DataDao dataDao;
	
	@Autowired
	private TaskDao taskDao;

	private String XLABELLER_ROOT_PATH = "/usr/local/uploadFile/xlabeller/";
	private String WORKSPACE_PATH = "/usr/local/uploadFile/xlabeller/workspace/";
	
	private String MID_PATH = "dataset/";
	private String TEMP_PATH = "dataset_temp/";

	private static Logger logger = Logger.getLogger(DataService.class);

	public Object getDatasetList(DatasetVO datasetVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
//		datasetVO.setStatus("1");
		
		// 페이징
		int count = dataDao.getDatasetTotalCount(datasetVO);
		int size = 9999;
		int pageStart = 0;
		if (datasetVO.getPage_num() != null && !datasetVO.getPage_num().equals("")) {
			try {
				pageStart = Integer.valueOf(datasetVO.getPage_num()).intValue();
			} catch (NumberFormatException e) {
				logger.error("DataService getDatasetList Error!", e);
				pageStart = 0;
			}
		}

		datasetVO.setPage_num(String.valueOf(pageStart * size));
		datasetVO.setPage_size(String.valueOf(size));
		datasetVO.setTotal_size(String.valueOf(count));

		Object result = dataDao.getDatasetList(datasetVO);
		return Output.JsonOutput("200", result);
	}

	public Object getMyDatasetList(DatasetVO datasetVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		datasetVO.setUser_id(userInfo.getUser_id());
		datasetVO.setStatus("1");
		// 페이징
		int count = dataDao.getDatasetTotalCount(datasetVO);
		int size = 10;
		int pageStart = 0;
		if (datasetVO.getPage_num() != null && !datasetVO.getPage_num().equals("")) {
			try {
				pageStart = Integer.valueOf(datasetVO.getPage_num()).intValue();
			} catch (Exception e) {
				logger.error("DataService getMyDatasetList Error!", e);
				pageStart = 0;
			}
		}

		datasetVO.setPage_num(String.valueOf(pageStart * size));
		datasetVO.setPage_size(String.valueOf(size));
		datasetVO.setTotal_size(String.valueOf(count));

		Object result = dataDao.getDatasetList(datasetVO);
		return Output.JsonOutput("200", result);
	}

//	public Object insertReplicaDataset(DatasetVO datasetVO) {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
//		}
//		datasetVO.setUser_id(userInfo.getUser_id());
//		// 레플리카를 하기 위해 복사하는 ID의 라벨타입을 가져와 Label_type에 설정
//		if (datasetVO.getDataset_id() != null && datasetVO.getDataset_id().length() > 0) {
//			DatasetVO dataset = dataDao.getDatasetById(datasetVO);
//			if (dataset.getLabel_type() == null || dataset.getLabel_type().length() <= 0) {
//				logger.error("Label Type is null!");
//				return Output.JsonOutput("304", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
//			}
//			if (dataset.getMedia_type() == null || dataset.getMedia_type().length() <= 0) {
//				logger.error("Media Type is null!");
//				return Output.JsonOutput("304", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
//			}
//			datasetVO.setMedia_type(dataset.getMedia_type());
//			datasetVO.setLabel_type(dataset.getLabel_type());
//			datasetVO.setStatus("1");
//		}
//
//		int cnt = dataDao.insertDataset(datasetVO);
//		if (cnt != 1) {
//			return Output.JsonOutput("300", "등록이 올바르지 않습니다.");
//		}
//
//		return Output.JsonOutput("200", "등록이 완료되었습니다.");
//	}
	
	
	/* 이전에 사용되던 데이터셋 업로드 방식
	public Object insertDataset(DatasetVO datasetVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getId() == null || userInfo.getId().length() <= 0) {
			return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
		}
		datasetVO.setUser_id(userInfo.getId());
		// 레플리카를 하기 위해 복사하는 ID의 라벨타입을 가져와 Label_type에 설정
//		if (datasetVO.getDataset_id() != null && datasetVO.getDataset_id().length() > 0) {
//			DatasetVO dataset = dataDao.getDatasetById(datasetVO);
//			if (dataset.getLabel_type() == null || dataset.getLabel_type().length() <= 0) {
//				throw new Exception("4002#복제에 실패하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
//			}
//			datasetVO.setLabel_type(dataset.getLabel_type());
//		}

		int cnt = dataDao.insertDataset(datasetVO);
		if (cnt != 1) {
			throw new Exception("4001#등록이 올바르지 않습니다.");
		}

		// 복사할 때 Dataset생성
		if (datasetVO.getFiles() == null || datasetVO.getFiles().length <= 0) {
			return Output.JsonOutput("200", "등록이 완료되었습니다.");
		}

//		throw new Exception("1021#리셋 코드 생성이 올바르지 않습니다.문의 부탁드립니다.");

		// 파일 저장
		MultipartFile[] mfArr = datasetVO.getFiles();
		Calendar c = Calendar.getInstance();
		long currentTime = c.getTimeInMillis();
		String fileName = null;
		String path = XLABELLER_ROOT_PATH;
		String midPath = "dataset/";
		List<DataVO> dataList = new ArrayList<DataVO>();

		if (mfArr.length == 1 && mfArr[0].getOriginalFilename().substring(mfArr[0].getOriginalFilename().length() - 4)
				.equals(".zip")) {
			FileDecompress fd = new FileDecompress();
//			logger.info("mfArr[0].getSize() : " + mfArr[0].getSize());
			fd.open(mfArr[0].getInputStream(), XLABELLER_ROOT_PATH + "dataset/", "", "true");
			fd.proc();
			List<String> pathList = fd.getPath();
			List<String> originalPathList = fd.getOriginalPath();
			if (pathList == null || pathList.isEmpty() || pathList.size() <= 0) {
				throw new Exception("4072#ZIP파일내에 지원하지 않는 포맷이나 손상된 파일이 포함되어있습니다.\n다른 ZIP파일로 Dataset을 등록해주세요.");
			}
			if (pathList.size() > 2000) {
				throw new Exception("4073#등록 가능한 이미지 수는 최대 2000장입니다.\n2000장 이내에 ZIP파일을 등록해주세요.");
			}
			for (int i = 0; i < pathList.size(); i++) {
				DataVO dataVO = new DataVO();
				dataVO.setDataset_id(datasetVO.getDataset_id());
				dataVO.setPath(midPath + pathList.get(i));
				dataVO.setUser_id(userInfo.getId());
				dataVO.setMedia_type("IMAGE");
				dataVO.setWidth(null);
				dataVO.setHeight(null);
				dataVO.setFps(null);
				dataVO.setConfirm_status("0");
				dataVO.setFilename(originalPathList.get(i));
				dataVO.setFrame(null);
				dataVO.setDuration(null);
				dataList.add(dataVO);
			}

		} else if (mfArr.length == 1 && mfArr[0].getOriginalFilename()
				.substring(mfArr[0].getOriginalFilename().length() - 4).equals(".mp4")) {
//			Video2Image v2i = new Video2Image();
			GstUtil gu = new GstUtil();
			String fn = mfArr[0].getOriginalFilename();
			logger.info("mfArr[0].getSize() : " + mfArr[0].getSize());
			if (mfArr[0].getSize() > 200000000) {
				throw new Exception("4073#등록 가능한 비디오 파일의 최대 크기는 200MB입니다.\n200MB를 초과하지 않는 비디오파일을 업로드해주세요.");
			}
			fn = encodingText(fn); // encoding 변환
			String format = fn.split("\\.")[fn.split("\\.").length - 1];
			String sourceFileName = fn.split("\\.")[0];
			// video_temp폴더로 이동시킬 비디오가 ','을 포함시 '_'로 변경해서 이동
			sourceFileName = sourceFileName.replaceAll(",", "_");

			// 비디오 이동
			String videoTempPath = XLABELLER_ROOT_PATH + "video_temp/" + "v_" + sourceFileName + "_"
					+ String.valueOf(currentTime) + "." + format;
			mfArr[0].transferTo(new File(videoTempPath));
			gu.convertVideotoJPG(videoTempPath, XLABELLER_ROOT_PATH + "dataset/", sourceFileName,
					String.valueOf(currentTime), 1);
			FileUtils.delete(videoTempPath);

			List<String> pathList = gu.getPath();
//			cnt = v2i.convertVideotoJPG(mfArr[0].getInputStream(),XLABELLER_ROOT_PATH+"dataset/",sourceFileName,String.valueOf(currentTime), "jpg",10);
//			if(cnt <= 0) {
//				throw new Exception("4072#등록이 올바르지 않습니다.");
//			}
//			List<String> pathList = v2i.getPath();
			if (pathList == null || pathList.isEmpty() || pathList.size() <= 0) {
				throw new Exception("4072#등록이 올바르지 않습니다.");
			}
			for (int i = 0; i < pathList.size(); i++) {
				DataVO dataVO = new DataVO();
				dataVO.setDataset_id(datasetVO.getDataset_id());
				dataVO.setPath(midPath + pathList.get(i));
				dataVO.setUser_id(userInfo.getId());
				dataVO.setMedia_type("IMAGE");
				dataVO.setWidth(null);
				dataVO.setHeight(null);
				dataVO.setFps(null);
				dataVO.setConfirm_status("0");
				dataVO.setFilename(fn);
				dataVO.setFrame(null);
				dataVO.setDuration(null);
				dataList.add(dataVO);
			}

		} else {
			for (int i = 0; i < mfArr.length; i++) {
				String fn = mfArr[i].getOriginalFilename();
				fn = encodingText(fn); // encoding 변환
				String format = fn.split("\\.")[fn.split("\\.").length - 1];
				String sourceFileName = fn.split("\\.")[0];

				fileName = sourceFileName + "_" + String.valueOf(i) + "_" + String.valueOf(currentTime) + "." + format;
				fileName = fileName.replaceAll(",", "_");
				File convFile = new File(path + midPath + fileName);
				try {
					mfArr[i].transferTo(convFile);
				} catch (IOException e) {
					logger.error("IOException Error!", e);
					throw new Exception("4072#등록이 올바르지 않습니다.");
				}

				DataVO dataVO = new DataVO();
				dataVO.setDataset_id(datasetVO.getDataset_id());
				dataVO.setPath(midPath + fileName);
				dataVO.setUser_id(userInfo.getId());
				dataVO.setMedia_type("IMAGE");
				dataVO.setWidth(null);
				dataVO.setHeight(null);
				dataVO.setFps(null);
				dataVO.setConfirm_status("0");
				dataVO.setFilename(fileName);
				dataVO.setFrame(null);
				dataVO.setDuration(null);
				dataList.add(dataVO);

			}
		}

		// 썸네일
		String tempPath = null;
		StringBuffer sb = null;
		if (dataList == null || dataList.isEmpty() || dataList.size() <= 0) {
			throw new Exception("4072#등록할 데이터가 존재하지 않습니다.\n업로드할 데이터를 등록해주세요.");
		}
		for (int i = 0; i < dataList.size(); i++) {
			tempPath = dataList.get(i).getPath();
			sb = new StringBuffer(tempPath);
			int lastIndex = sb.lastIndexOf(".");
			sb.insert(lastIndex, "_tb");

			Thumbnails.of(new File(XLABELLER_ROOT_PATH + tempPath)).size(100, 100).outputQuality(0.8)
					.toFile(new File(XLABELLER_ROOT_PATH + sb));
		}

		HashMap<String, Object> hm = new HashMap<String, Object>();

		hm.put("dataList", dataList);

		cnt = dataDao.insertData(hm);
		if (cnt != dataList.size()) {
			throw new Exception("4002#등록이 올바르지 않습니다.");
		}

//		//api call
//		JSONObject apiJson = new JSONObject();
//		
//		String datasetId = datasetVO.getId();
//		DataVO dataVO = new DataVO();
//		dataVO.setDataset_id(datasetId);
//		List<DataVO> dataSelectList = dataDao.getDataList(dataVO);
//		JSONArray jArr = new JSONArray();
//		for(int i = 0 ; i < dataSelectList.size() ; i++) {
//			JSONObject tObj = new JSONObject();
//			tObj.put("data_id", dataSelectList.get(i).getId());
//			tObj.put("path", dataSelectList.get(i).getPath());
//			jArr.add(tObj);
//		}
//		apiJson.put("dataset_id", datasetId);
//		apiJson.put("data", jArr);
//		
//		System.out.println(apiJson);
//		
//		AsyncProcess ap = new AsyncProcess(apiJson.toJSONString());
//		ap.start();

		return Output.JsonOutput("200", "등록이 완료되었습니다");

	}
	*/
	
	public Object insertDataset(DatasetVO datasetVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
//		if(userInfo == 9null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
//		}
		
		// 유효성검사.
		if(datasetVO.getTitle() == null || datasetVO.getTitle().length() <= 0) {
			return Output.JsonOutput("4061","타이틀(제목)을 입력해주세요.");
		}
		if(datasetVO.getContents() == null || datasetVO.getContents().length() <= 0) {
			return Output.JsonOutput("4061","컨텐츠(내용)를 입력해주세요.");
		}
		if(datasetVO.getFiles() == null || datasetVO.getFiles().length <= 0) {
			return Output.JsonOutput("4061","첨부파일이 존재하지 않습니다");
		}
		if(datasetVO.getMedia_type() == null || datasetVO.getMedia_type().length() <= 0) {
			return Output.JsonOutput("4061","미디어 타입을 선택해주세요.");
		}
		if(datasetVO.getLabel_type() == null || datasetVO.getLabel_type().length() <= 0) {
			return Output.JsonOutput("4061","라벨 타입을 선택해주세요.");
		}
		
		String mediaType = datasetVO.getMedia_type();
		String labelType = datasetVO.getLabel_type();
		
		if(!mediaType.equals("IMAGE") && !mediaType.equals("VIDEO")) {
			return Output.JsonOutput("4061","미디어 타입의 값이 유효하지 않습니다.");
		}
		if(!labelType.equals("IMAGE_BBOX") && !labelType.equals("IMAGE_SEGMENTATION") && !labelType.equals("VIDEO_BBOX") && !labelType.equals("IMAGE_LINE")) {
			return Output.JsonOutput("4061","라벨의 값이 유효하지 않습니다.");
		}
		if(!labelType.split("_")[0].equals(mediaType)) {
			return Output.JsonOutput("4061","미디어 타입과 라벨 타입이 일치하지 않습니다.");
		}
		
		DatasetVO insertDatasetVO = new DatasetVO(); 
		insertDatasetVO.setTitle(datasetVO.getTitle());
		insertDatasetVO.setContents(datasetVO.getContents());
//		insertDatasetVO.setMedia_type(datasetVO.getMedia_type());
//		insertDatasetVO.setLabel_type(datasetVO.getLabel_type());
		insertDatasetVO.setMedia_type("IMAGE");
//		insertDatasetVO.setLabel_type("IMAGE_BBOX");
		insertDatasetVO.setLabel_type(datasetVO.getLabel_type());
//		insertDatasetVO.setUser_id(userInfo.getUser_id());
		insertDatasetVO.setStatus("1");
		
		// 파일 체크
		MultipartFile[] mfArr = datasetVO.getFiles();
		if(mfArr == null || mfArr.length == 0) {
			return Output.JsonOutput("4061","첨부파일이 존재하지 않습니다");
		}

		if(mfArr.length > 50000) {
			return Output.JsonOutput("4061","한번에 등록 가능한 이미지 데이터의 최대 개수는 100개입니다.");
		}

		List<MultipartFile> mfList = new ArrayList<MultipartFile>();
		// 파일 유효성 체크
		for(int i = 0 ; i < mfArr.length ; i++) {			
			String format = mfArr[i].getOriginalFilename().split("\\.")[mfArr[i].getOriginalFilename().split("\\.").length-1];
			if ( format == null || format.length() <= 0 ) {
				continue;
			}
			format = format.toLowerCase();
			if(format.equals("mp4") || format.equals("jpg") || format.equals("jpeg") || format.equals("zip") || format.equals("png")) {
				mfList.add(mfArr[i]);
			} else {
				return Output.JsonOutput("4061","지원하지 않는 형식의 데이터 포맷이 포함되어 있습니다.");
			}
		}
		
		// 데이터셋 생성
		// 데이터셋 DB에 insert
		int cnt = dataDao.insertDataset(insertDatasetVO);
		if(cnt != 1){
			throw new CustomException("4001#데이터셋을 등록하는 과정중에 오류가 발생하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		String datasetId = insertDatasetVO.getDataset_id();
		datasetVO.setDataset_id(datasetId);
		if(datasetId == null || datasetId.length() <= 0) {
			return Output.JsonOutput("4071","데이터셋을 등록하는 중에 오류가 발생하였습니다.\n새로고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}

		// 디렉토리 존재 여부 확인 후 삭제 s.kim
		File f = new File(XLABELLER_ROOT_PATH + TEMP_PATH + datasetId);
		if(f.isDirectory()){
			FileUtils.delete(XLABELLER_ROOT_PATH + TEMP_PATH + datasetId);
		}
		f = null;

//		// 임시 폴더 삭제
//		FileUtils.delete(XLABELLER_ROOT_PATH + TEMP_PATH + datasetId);
		
		// 폴더 생성
		FileUtils.mkdir(XLABELLER_ROOT_PATH + TEMP_PATH + datasetId);
		
		// 파일 이동
		for(int i = 0 ; i < mfList.size() ; i++) {
			try {
				mfList.get(i).transferTo(new File(XLABELLER_ROOT_PATH + TEMP_PATH + datasetId + "/" + mfList.get(i).getOriginalFilename()));
			} catch (Exception e) {
				throw new Exception("4001#데이터셋 등록에 실패하였습니다.\n새로고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}
		}

		//hc.park
		//ai_hub 실제 업로드 로직 추가
		String tempDirPath = XLABELLER_ROOT_PATH + TEMP_PATH + insertDatasetVO.getDataset_id();

		List<String> fileList = null;
		try {
			fileList = directoryInFileList(tempDirPath);
		}catch (Exception e) {
			//임시폴더 접근이 안될때
			logger.error("directoryInFileList",e);
			throw new Exception("4001#등록이 올바르지 않습니다.");
		}

		if(fileList == null || fileList.size() <= 0 ) { //처리할 임시파일이 없는경우
			// 디렉토리 삭제
			FileUtils.delete(tempDirPath);
			throw new Exception("4001#등록이 올바르지 않습니다.");
		}
		int successCnt = 0;

		//mediaType에 따라 분기처리
		if ( mediaType.equals("IMAGE")){
			successCnt = imageUploadLogic(XLABELLER_ROOT_PATH + TEMP_PATH + datasetId + "/", fileList, insertDatasetVO);
		} else if ( mediaType.equals("VIDEO")){
			successCnt = videoUploadLogic(XLABELLER_ROOT_PATH + TEMP_PATH + datasetId + "/", fileList, insertDatasetVO);
		}

		if( successCnt == 0 ){
			//TODO 메시지 변경이 필요해보임
			throw new Exception("4061#모든 데이터가 지원하지 않는 형식의 데이터 포맷입니다.");
		}



//		// 상태 업데이트
//		DatasetVO updateDatasetVO = new DatasetVO();
//		updateDatasetVO.setStatus("2");
//		updateDatasetVO.setDataset_id(datasetId);
//		cnt = dataDao.updateDataset(updateDatasetVO);
//		if(cnt != 1){
//			throw new CustomException("4001#등록이 올바르지 않습니다.");
//		}
		
		String msg = "업로드 요청 데이터 "+ String.valueOf(mfArr.length) + "건 중에 정상 포맷 데이터인 " +
				String.valueOf(mfList.size()) +"건 업로드를 백그라운드에서 수행합니다.";
		
		return Output.JsonOutput("200", msg);
	}

	private void videoUpolad(String tempDir, String filename, int i,DatasetVO datasetVO) throws Exception{
		Calendar c = Calendar.getInstance();
		long currentTime = c.getTimeInMillis();
		List<DataVO> dataList = new ArrayList<DataVO>();
		String fileName = null;


		String fn = filename;
		fn = encodingText(fn); // encoding 변환
		String format = fn.split("\\.")[fn.split("\\.").length-1];
		String sourceFileName = fn.split("\\.")[0];

		if(!format.toLowerCase().equals("mp4") ) {
			throw new Exception("4072#지원하는 동영상 포맷이 아닙니다.");
		}
		if(sourceFileName == null || sourceFileName.length() <= 0) {
			throw new Exception("4061#파일명이 올바르지 않습니다.");
		}
		String covSourceFileName = sourceFileName.replaceAll("[₩,_,\\[,\\],\',\",|,<,>,!,@,#,$,%,^,&,*,?,~,(,),+,-,\\\\,;,/,.,:,{,},=]", "");
		//sourceFileName = sourceFileName.replaceAll("[!,@,#,$,%,^,&,*,?,~]", "_");
		fileName = covSourceFileName+"_"+datasetVO.getDataset_id()+"_"+String.valueOf(i)+"_"+String.valueOf(currentTime)+"."+format;
		File convFile = new File(XLABELLER_ROOT_PATH+MID_PATH+fileName);


		File fileToMove = new File(tempDir+"/"+filename);
		boolean isMoved = fileToMove.renameTo(convFile);
		if (!isMoved) {
			throw new Exception("4072#지원하는 동영상 포맷이 아닙니다.");
		}
		
//		filename.transferTo(new File(tempDir));
		
//		for (int j = 0; j < pathList.size(); j++) {
//			DataVO dataVO = new DataVO();
//			dataVO.setDataset_id(datasetVO.getDataset_id());
//			dataVO.setPath(MID_PATH + pathList.get(j));
//			dataVO.setUser_id(datasetVO.getUser_id());
//			dataVO.setMedia_type("IMAGE");
//			dataVO.setWidth(null);
//			dataVO.setHeight(null);
//			dataVO.setFps(null);
//			dataVO.setConfirm_status("0");
//			dataVO.setFilename(fn);
//			dataVO.setFrame(null);
//			dataVO.setDuration(null);
//			dataList.add(dataVO);
//			
//			if(dataList != null && !dataList.isEmpty() ) {
//				insertDataInner(dataList);
//				dataList.clear();
//			}
//		}
		
//		File fileToMove = new File(tempDir+"/"+filename);
//		boolean isMoved = fileToMove.renameTo(convFile);
//		if (!isMoved) {
//			throw new Exception("4072#지원하는 동영상 포맷이 아닙니다.");
//		}
		



		//비디오 메타정보 취득
		VideoMetaUtil vmu = new VideoMetaUtil(XLABELLER_ROOT_PATH+MID_PATH+fileName);
		if(!vmu.isAvailable()) {
			throw new Exception("4072#지원하는 동영상 포맷이 아닙니다.");
		}
		int frames = vmu.getTotalFrame();
		
		for (int j=0; j<frames; j++) {
			int frm = j*5;
			if(frm > frames) {
				break;
			}
			Picture img = FrameGrab.getFrameFromFile(convFile, frm);
			BufferedImage bi = AWTUtil.toBufferedImage(img);
			String newImgName = fileName.split(".mp4")[0]+"_"+frm+".png";
			ImageIO.write(bi,"png",new File(XLABELLER_ROOT_PATH+MID_PATH+newImgName));	
			
			DataVO dataVO = new DataVO();
			dataVO.setDataset_id(datasetVO.getDataset_id());
			dataVO.setPath(MID_PATH+newImgName);

			dataVO.setMedia_type("IMAGE");
			dataVO.setWidth(String.valueOf(img.getWidth()));
			dataVO.setHeight(String.valueOf(img.getHeight()));
			dataVO.setFps("1");
			dataVO.setFilename(newImgName);
			dataVO.setFrame("1");
			dataVO.setDuration("0");
			dataVO.setUser_id(datasetVO.getUser_id());
			
			dataList.add(dataVO);
		}
		
		
		
//
//
//		DataVO dataVO = new DataVO();
//		dataVO.setDataset_id(datasetVO.getDataset_id());
//		dataVO.setPath(MID_PATH+fileName);
//
//		dataVO.setMedia_type(datasetVO.getMedia_type());
//		dataVO.setWidth(String.valueOf(width));
//		dataVO.setHeight(String.valueOf(height));
//		dataVO.setFps(String.valueOf(vmu.getFps()));
//		dataVO.setFilename(sourceFileName+"."+format);
//		dataVO.setFrame(String.valueOf(vmu.getTotalFrame()));
//		dataVO.setDuration(String.valueOf(vmu.getDuration()));
//		dataVO.setUser_id(datasetVO.getUser_id());
//
//		dataList.add(dataVO);
//
		if(dataList != null && !dataList.isEmpty() ) {
			insertDataInner(dataList);
			dataList.clear();
		}
		return;
	}

	// 비디오 업로드 관련
	private int videoUploadLogic(String tempDirPath, List<String> fileList, DatasetVO datasetVO) {
		String filename = null;
		String format = null;
		int successCnt = 0;

		for(int i = 0 ; i < fileList.size();i++) {
			filename = fileList.get(i);
			if(filename == null || filename.length() <= 0 || filename.length() > 100) {
				continue;
			}
			format = filename.split("\\.")[filename.split("\\.").length-1];

			if(format == null || format.length() != 3) {
				// 포맷이 불명확할때
				FileUtils.delete(tempDirPath+"/"+filename);
//				insertDatasetLog("파일 포맷 오류("+filename+")");
				continue;
			}
			format = format.toLowerCase();

			if(format.equals("mp4")) {
				try {
					videoUpolad(tempDirPath,fileList.get(i),i,datasetVO);
					successCnt++;
					// dataList 널처리 필요
				}catch(Exception e){
					logger.error("videoUpolad : "+tempDirPath +"/"+ fileList.get(i),e);
//					insertDatasetLog("비디오 처리 불가능 포맷("+filename+")");
					//로그 컬럼에 추가
					//파일 여러개 이기 때문에 컬럼에 상태를 단순하게 넣는건 무의미
					//				updateDatasetStatus(datasetVO.getDataset_id(),"4");
					//				throw new Exception("4072#등록이 올바르지 않습니다.");
				}
			}else {
				// 포맷이 불명확할때
				FileUtils.delete(tempDirPath+"/"+filename);
//				insertDatasetLog("사용 불가능 파일 포맷("+filename+")");
				continue;

			}
		}
		return successCnt;
//		updateDatasetStatus("1");
	}

	private void imageUpolad(String tempDir, String filename, int i,DatasetVO datasetVO) throws Exception{
		UserVO userInfo = SessionUtil.getUserInfo();
		Calendar c = Calendar.getInstance();
		long currentTime = c.getTimeInMillis();
		List<DataVO> dataList = new ArrayList<DataVO>();
		String fileName = null;

		String fn = filename;
		fn = encodingText(fn); // encoding 변환
		//fn = fn.replaceAll(",", "_");
		String format = fn.split("\\.")[fn.split("\\.").length-1];
		//String sourceFileName = fn.split("\\.")[0];
		int pos = fn.lastIndexOf(".");
		String sourceFileName = fn.substring(0, pos);
		format = format.toLowerCase();

		if(!(format.equals("jpg") || format.equals("jpeg") || format.equals("png"))) {
			throw new Exception("4072#지원하는 포맷이 아닙니다.");
		}
		if(sourceFileName == null || sourceFileName.length() <= 0) {
			throw new Exception("4061#파일명이 올바르지 않습니다.");
		}
		//String covSourceFileName = sourceFileName.replaceAll("[₩,_,\\[,\\],\',\",|,<,>,!,@,#,$,%,^,&,*,?,~,(,),+,-,\\\\,;,/,.,:,{,},=,\" \"]", "");
		String covSourceFileName = sourceFileName.replaceAll("[₩,_,\\[,\\],\',\",|,<,>,!,@,#,$,%,^,&,*,?,~,(,),+,-,\\\\,;,/,.,:,{,},=,\" \",`,-]", "");
		//sourceFileName = sourceFileName.replaceAll("[!,@,#,$,%,^,&,*,?,~]", "_");
		fileName = covSourceFileName+"_"+datasetVO.getDataset_id()+"_"+String.valueOf(i)+"_"+String.valueOf(currentTime)+"."+format;
		File convFile = new File(XLABELLER_ROOT_PATH+MID_PATH+fileName);

		File fileToMove = new File(tempDir+"/"+filename);
		boolean isMoved = fileToMove.renameTo(convFile);
		if (!isMoved) {
			throw new Exception("4072#지원하는 이미지 포맷이 아닙니다.");
		}

		//비디오 메타정보 취득
//		VideoMetaUtil vmu = new VideoMetaUtil(XLABELLER_ROOT_PATH+MID_PATH+fileName);
//		if(!vmu.isAvailable()) {
//			throw new Exception("4072#지원하는 동영상 포맷이 아닙니다.");
//		}
//		String width = String.valueOf(vmu.getWidth());
//		String height = String.valueOf(vmu.getHeight());

		//이미지 정보 취득
		BufferedImage bimg = null;
		try {
			bimg = ImageIO.read(convFile);
		} catch (IOException e) {
			logger.error("IOException Error!", e);
			throw new Exception("4001#등록이 올바르지 않습니다.");
		}

		int width = bimg.getWidth();
		int height = bimg.getHeight();

		DataVO dataVO = new DataVO();
		dataVO.setDataset_id(datasetVO.getDataset_id());
		dataVO.setPath(MID_PATH+fileName);

		dataVO.setMedia_type(datasetVO.getMedia_type());
		dataVO.setWidth(String.valueOf(width));
		dataVO.setHeight(String.valueOf(height));
		dataVO.setFps("1");
		dataVO.setFilename(sourceFileName+"."+format);
		dataVO.setFrame("1");
		dataVO.setDuration("0");
		// s.kim 수정 아래는 기존 코드
		// dataVO.setUser_id(userInfo.getUser_id());
		dataVO.setUser_id(datasetVO.getUser_id());

		dataList.add(dataVO);

		if(dataList != null && !dataList.isEmpty() ) {
			insertDataInner(dataList);
			dataList.clear();
		}
		return;
	}

	private void insertDataInner(List<DataVO> dataList) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("dataList", dataList);

		int cnt = dataDao.insertData(hm);
	}


	// 이미지 업로드 관련
	private int imageUploadLogic(String tempDirPath, List<String> fileList, DatasetVO datasetVO) {
		String filename = null;
		String format = null;
		int successCnt = 0;

		for(int i = 0 ; i < fileList.size();i++) {
			filename = fileList.get(i);
			if(filename == null || filename.length() <= 0 || filename.length() > 100) {
				continue;
			}
			format = filename.split("\\.")[filename.split("\\.").length-1];

			if(format == null || format.length() <= 0) {
				// 포맷이 불명확할때
				FileUtils.delete(tempDirPath+"/"+filename);
//				insertDatasetLog("파일 포맷 오류("+filename+")");
				continue;
			}
			format = format.toLowerCase();

			if(format.equals("jpg") || format.equals("jpeg") || format.equals("png")) {
				try {
					imageUpolad(tempDirPath,fileList.get(i),i,datasetVO);
					successCnt++;
					// dataList 널처리 필요
				}catch(Exception e){
					logger.error("imageUpolad : "+tempDirPath +"/"+ fileList.get(i),e);
//					insertDatasetLog("비디오 처리 불가능 포맷("+filename+")");
					//로그 컬럼에 추가
					//파일 여러개 이기 때문에 컬럼에 상태를 단순하게 넣는건 무의미
					//				updateDatasetStatus(datasetVO.getDataset_id(),"4");
					//				throw new Exception("4072#등록이 올바르지 않습니다.");
				}
			}else {
				// 포맷이 불명확할때
				FileUtils.delete(tempDirPath+"/"+filename);
//				insertDatasetLog("사용 불가능 파일 포맷("+filename+")");
				continue;

			}
		}
		return successCnt;
//		updateDatasetStatus("1");
	}

	private List<String> directoryInFileList(String searchDir) throws Exception{
		File dir = new File(searchDir);
		File[] matches = dir.listFiles(new FilenameFilter(){
			public boolean accept(File dir, String name){
				return true;
			}
		});
		Arrays.sort(matches, (f1, f2) -> f1.compareTo(f2));

		List<String> pathList = new ArrayList<String>();
		for(int i = 0 ; i < matches.length;i++) {
			pathList.add(matches[i].getName());
		}
		return pathList;
	}
	
	
	

//	public Object insertData(DatasetVO datasetVO) throws Exception {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if (userInfo == null || userInfo.getId() == null || userInfo.getId().length() <= 0) {
//			return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
//		}
//		datasetVO.setUser_id(userInfo.getId());
//
////		if(datasetVO.getFiles() == null || datasetVO.getFiles().length <= 0) {
////			return Output.JsonOutput("200", "파일을 첨부해주세요.");
////		}
//		// 파일 저장
//		MultipartFile[] mfArr = datasetVO.getFiles();
//		Calendar c = Calendar.getInstance();
//		long currentTime = c.getTimeInMillis();
//		String fileName = null;
//		String path = XLABELLER_ROOT_PATH;
//		String midPath = "dataset/";
//		List<DataVO> dataList = new ArrayList<DataVO>();
//
//		if (mfArr.length == 1 && mfArr[0].getOriginalFilename().substring(mfArr[0].getOriginalFilename().length() - 4)
//				.equals(".zip")) {
//			FileDecompress fd = new FileDecompress();
//			fd.open(mfArr[0].getInputStream(), XLABELLER_ROOT_PATH + "dataset/", "", "true");
//			fd.proc();
//			List<String> pathList = fd.getPath();
//			List<String> originalPathList = fd.getPath();
////			if(pathList == null || pathList.isEmpty() || pathList.size() <= 0) {
////				throw new Exception("4072#등록이 올바르지 않습니다.");
////			}
//			if (pathList == null || pathList.isEmpty() || pathList.size() <= 0) {
//				throw new Exception("4072#ZIP파일내에 지원하지 않는 포맷이나 손상된 파일이 포함되어있습니다.\n다른 ZIP파일로 Dataset을 등록해주세요.");
//			}
//			if (pathList.size() > 2000) {
//				throw new Exception("4073#등록 가능한 이미지 수는 최대 2000장입니다.\n2000장 이내에 ZIP파일을 등록해주세요.");
//			}
//			for (int i = 0; i < pathList.size(); i++) {
//				DataVO dataVO = new DataVO();
//				dataVO.setDataset_id(datasetVO.getDataset_id());
//				dataVO.setPath(midPath + pathList.get(i));
//				dataVO.setUser_id(userInfo.getId());
//				dataVO.setMedia_type("IMAGE");
//				dataVO.setWidth(null);
//				dataVO.setHeight(null);
//				dataVO.setFps(null);
//				dataVO.setConfirm_status("0");
//				dataVO.setFilename(originalPathList.get(i));
//				dataVO.setFrame(null);
//				dataVO.setDuration(null);
//				dataList.add(dataVO);
//			}
//
//		} else if (mfArr.length == 1 && mfArr[0].getOriginalFilename()
//				.substring(mfArr[0].getOriginalFilename().length() - 4).equals(".mp4")) {
////			Video2Image v2i = new Video2Image();
//			if (mfArr[0].getSize() > 200000000) {
//				throw new Exception("4073#등록 가능한 비디오 파일의 최대 크기는 200MB입니다.\n200MB를 초과하지 않는 비디오파일을 업로드해주세요.");
//			}
//			GstUtil gu = new GstUtil();
//			String fn = mfArr[0].getOriginalFilename();
//			fn = encodingText(fn); // encoding 변환
////			fn = fn.replaceAll(",", "_");
//			String format = fn.split("\\.")[fn.split("\\.").length - 1];
//			String sourceFileName = fn.split("\\.")[0];
//			sourceFileName = sourceFileName.replaceAll(",", "_");
//
//			// 비디오 이동
//			String videoTempPath = XLABELLER_ROOT_PATH + "video_temp/" + "v_" + sourceFileName + "_"
//					+ String.valueOf(currentTime) + "." + format;
//			mfArr[0].transferTo(new File(videoTempPath));
//			gu.convertVideotoJPG(videoTempPath, XLABELLER_ROOT_PATH + "dataset/", sourceFileName,
//					String.valueOf(currentTime), 1);
//			FileUtils.delete(videoTempPath);
//
//			List<String> pathList = gu.getPath();
////			String fn = mfArr[0].getOriginalFilename();
////			fn = encodingText(fn); // encoding 변환
////			fn = fn.replaceAll(",", "_");
////			String format = fn.split("\\.")[fn.split("\\.").length-1];
////			String sourceFileName = fn.split("\\.")[0];
////			int cnt = v2i.convertVideotoJPG(mfArr[0].getInputStream(),XLABELLER_ROOT_PATH+"dataset/",sourceFileName,String.valueOf(currentTime), "jpg",10);
////			if(cnt <= 0) {
////				throw new Exception("4072#등록이 올바르지 않습니다.");
////			}
////			List<String> pathList = v2i.getPath();
//			if (pathList == null || pathList.isEmpty() || pathList.size() <= 0) {
//				throw new Exception("4072#등록이 올바르지 않습니다.");
//			}
//			for (int i = 0; i < pathList.size(); i++) {
//				DataVO dataVO = new DataVO();
//				dataVO.setDataset_id(datasetVO.getDataset_id());
//				dataVO.setPath(midPath + pathList.get(i));
//				dataVO.setUser_id(userInfo.getId());
//				dataVO.setMedia_type("IMAGE");
//				dataVO.setWidth(null);
//				dataVO.setHeight(null);
//				dataVO.setFps(null);
//				dataVO.setConfirm_status("0");
//				dataVO.setFilename(fn);
//				dataVO.setFrame(null);
//				dataVO.setDuration(null);
//				dataList.add(dataVO);
//			}
//
//		} else {
//			for (int i = 0; i < mfArr.length; i++) {
//				String fn = mfArr[i].getOriginalFilename();
//				fn = encodingText(fn); // encoding 변환
//				String format = fn.split("\\.")[fn.split("\\.").length - 1];
//				String sourceFileName = fn.split("\\.")[0];
//
//				fileName = sourceFileName + "_" + String.valueOf(i) + "_" + String.valueOf(currentTime) + "." + format;
//				fileName = fileName.replaceAll(",", "_");
//				File convFile = new File(path + midPath + fileName);
//				try {
//					mfArr[i].transferTo(convFile);
//				} catch (IOException e) {
//					logger.error("insertData IOException Error!", e);
//					throw new Exception("4072#등록이 올바르지 않습니다.");
//				}
//
//				DataVO dataVO = new DataVO();
//				dataVO.setDataset_id(datasetVO.getDataset_id());
//				dataVO.setPath(midPath + fileName);
//				dataVO.setUser_id(userInfo.getId());
//				dataVO.setMedia_type("IMAGE");
//				dataVO.setWidth(null);
//				dataVO.setHeight(null);
//				dataVO.setFps(null);
//				dataVO.setConfirm_status("0");
//				dataVO.setFilename(fileName);
//				dataVO.setFrame(null);
//				dataVO.setDuration(null);
//				dataList.add(dataVO);
//
//			}
//		}
//
//		// 썸네일
//		String tempPath = null;
//		StringBuffer sb = null;
//		for (int i = 0; i < dataList.size(); i++) {
//			tempPath = dataList.get(i).getPath();
//			sb = new StringBuffer(tempPath);
//			int lastIndex = sb.lastIndexOf(".");
//			sb.insert(lastIndex, "_tb");
//
//			Thumbnails.of(new File(XLABELLER_ROOT_PATH + tempPath)).size(100, 100).outputQuality(0.8)
//					.toFile(new File(XLABELLER_ROOT_PATH + sb));
//		}
//
//		HashMap<String, Object> hm = new HashMap<String, Object>();
//
//		hm.put("dataList", dataList);
//
//		int cnt = dataDao.insertData(hm);
//		if (cnt != dataList.size()) {
//			throw new Exception("4002#등록이 올바르지 않습니다.");
//		}
//
//		return Output.JsonOutput("200", "등록이 완료되었습니다");
//
//	}

	//수정됨
	public Object insertData(DatasetVO datasetVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다.");
		}
		if(userInfo.getLevel_cd() == null || userInfo.getLevel_cd().length() <= 0) {
			return Output.JsonOutput("4051","로그인한 사용자가 데이터를 추가할 권한이 없습니다.");
		}

		// 유효성검사.
		if(datasetVO.getDataset_id() == null || datasetVO.getDataset_id().length() <= 0) {
			return Output.JsonOutput("4061","데이터셋 ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		if(datasetVO.getFiles() == null || datasetVO.getFiles().length <= 0) {
			return Output.JsonOutput("4061","데이터셋에 추가할 데이터를 업로드해주세요.");
		}
		
		// 데이터셋 가져옴
		// 데이터셋 등록한 사용자만 데이터 추가 가능 (나중에 삭제해야 됨)
		DatasetVO selectDatasetVO = new DatasetVO();
		selectDatasetVO.setDataset_id(datasetVO.getDataset_id());
		//selectDatasetVO.setUser_id(userInfo.getUser_id());
		
		DatasetVO myDatasetVO = dataDao.getMyDatasetById(selectDatasetVO);

		//hc.park
		//ai_hub의 권한 로직 처리 추가
		if(userInfo.getLevel_cd().equals("1")) {
			selectDatasetVO.setUser_id(userInfo.getUser_id());
			myDatasetVO = dataDao.getCheckOwnerDatasetById(selectDatasetVO);
			if(myDatasetVO == null || myDatasetVO.getUser_id() == null || myDatasetVO.getUser_id().length() <= 0) {
				return Output.JsonOutput("4051","로그인한 사용자가 해당 데이터셋에 데이터를 추가할 권한이 없습니다.");
			}
		}else {
			myDatasetVO = dataDao.getMyDatasetById(selectDatasetVO);
			if(myDatasetVO == null || myDatasetVO.getDataset_id() == null || myDatasetVO.getDataset_id().isEmpty() ) {
				return Output.JsonOutput("4051","로그인한 사용자가 해당 데이터셋에 데이터를 추가할 권한이 없습니다.");
			}
		}

		if(myDatasetVO == null || myDatasetVO.getDataset_id() == null || myDatasetVO.getDataset_id().isEmpty() ) {
			return Output.JsonOutput("4071","본인이 등록한 데이터셋에만 데이터를 추가할 수 있습니다.");
		}
		
		if(myDatasetVO.getStatus() == null ) {
			return Output.JsonOutput("4071","데이터셋 상태정보가 누락되었습니다. 운영자에게 문의부탁드립니다.");
		}else if(myDatasetVO.getStatus().equals("2")) {
			return Output.JsonOutput("4071","이미 해당 데이터셋에 적재 요청중 입니다. 적재 완료후 다시 시도 부탁드립니다.");
		}else if(myDatasetVO.getStatus().equals("3")) {
			return Output.JsonOutput("4071","이미 해당 데이터셋에 적재 프로세스가 진행중입니다. 적재 완료후 다시 시도 부탁드립니다.");
		}
				
		String mediaType = myDatasetVO.getMedia_type();
		String labelType = myDatasetVO.getLabel_type();
		
		if(!mediaType.equals("IMAGE") && !mediaType.equals("VIDEO")) {
			return Output.JsonOutput("4071","미디어 타입 선택이 올바르지 않습니다");
		}
//		if(!labelType.equals("IMAGE_BBOX") && !labelType.equals("IMAGE_SEGMENTATION") && !labelType.equals("VIDEO_BBOX")) {
//			return Output.JsonOutput("4071","라벨링 타입 선택이 올바르지 않습니다");
//		}
	
		if(!labelType.split("_")[0].equals(mediaType)) {
			return Output.JsonOutput("4071","미디어 타입과 라벨링 타입 조합이 잘못되었습니다");
		}
		
		// 파일 체크
		MultipartFile[] mfArr = datasetVO.getFiles();
		if(mfArr == null || mfArr.length == 0) {
			return Output.JsonOutput("4061","첨부파일이 존재하지 않습니다");
		}

		if(mfArr.length > 100) {
			return Output.JsonOutput("4061","한번에 등록 가능한 영상 데이터의 최대 개수는 100개입니다.");
		}
		
		List<MultipartFile> mfList = new ArrayList<>();
		
		// 파일 유효성 체크
		for(int i = 0 ; i < mfArr.length ; i++) {			
			String format = mfArr[i].getOriginalFilename().split("\\.")[mfArr[i].getOriginalFilename().split("\\.").length-1];
			if( format == null || format.length() <= 0 ) {
				continue;
			}
			format = format.toLowerCase();

			if(format.equals("mp4") || format.equals("jpg") || format.equals("jpeg") || format.equals("png")) {
				mfList.add(mfArr[i]);
			} else {
				return Output.JsonOutput("4061", "지원하지 않는 형식의 데이터 포맷이 포함되어 있습니다.");
			}

		}
		
		String datasetId = selectDatasetVO.getDataset_id();
		if(datasetId == null || datasetId.length() <= 0) {
			return Output.JsonOutput("4061","데이터셋의 아이디가 올바르지 않습니다.\n운영자에게 문의 부탁드립니다.");
		}

		// 임시 폴더 삭제
		FileUtils.delete(XLABELLER_ROOT_PATH + TEMP_PATH + datasetId);
		
		// 폴더 생성
		FileUtils.mkdir(XLABELLER_ROOT_PATH + TEMP_PATH + datasetId);

		// 파일 이동
		for(int i = 0 ; i < mfList.size() ; i++) {
			try {
				mfList.get(i).transferTo(new File(XLABELLER_ROOT_PATH + TEMP_PATH + datasetId + "/" + mfList.get(i).getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				logger.error("insertData() 파일 전송 중 에러 발생!", e);
				continue;
			}
		}

		//hc.park
		//ai_hub 실제 업로드 로직
		//데이터셋 ID를 가지고 와서 임시폴더 경로 정의
		String tempDirPath = XLABELLER_ROOT_PATH+TEMP_PATH+myDatasetVO.getDataset_id();

		List<String> fileList = null;
		try {
			fileList = directoryInFileList(tempDirPath);
		}catch (Exception e){
			//임시폴더 접근이 안될 때
			logger.error("directoryInFileList");
			throw new Exception("4001#등록이 올바르지 않습니다.");
		}

		if (fileList == null || fileList.size() <=0) { //처리할 임시파일이 없는 경우
			//디렉토리 삭제
			FileUtils.delete(tempDirPath);
			throw new Exception("4001#등록이 올바르지 않습니다.");
		}

		int successCnt = 0;

		if (mediaType.equals("IMAGE")){ // mediaType이 이미지 일때
			successCnt = imageUploadLogic(XLABELLER_ROOT_PATH + TEMP_PATH + datasetId + "/" ,fileList, myDatasetVO);
		} else { //mediaType이 비디오 일때
			successCnt = videoUploadLogic(XLABELLER_ROOT_PATH + TEMP_PATH + datasetId + "/" ,fileList, myDatasetVO);
		}

		if ( successCnt == 0 ) {
			throw new Exception("4061#모든 데이터가 지원하지 않는 형식의 데이터 포맷 입니다.");
		}

		String msg = "업로드 요청 데이터 "+ String.valueOf(mfArr.length) + "건 중에 정상 포맷 데이터인 " +
				String.valueOf(successCnt) +"건 업로드를 완료하였습니다.";


//		// 상태 업데이트
//		DatasetVO updateDatasetVO = new DatasetVO();
//		updateDatasetVO.setStatus("2");
//		updateDatasetVO.setDataset_id(datasetId);
//		int cnt = dataDao.updateDataset(updateDatasetVO);
//		if(cnt != 1){
//			throw new CustomException("4001#데이터를 추가하는 과정에서 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
//		}
//
//		String msg = "업로드 요청 데이터 "+ String.valueOf(mfArr.length) + "건 중에 정상 포맷 데이터인 " +
//				String.valueOf(mfList.size()) +"건 업로드를 백그라운드에서 수행합니다.";
		
		mfList.clear();
		mfList = null;

		return Output.JsonOutput("200", msg);
	}
	

//	public Object insertReplicaData(DataVO dataVO) throws Exception {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
//		}
//		if (dataVO == null) {
//			return Output.JsonOutput("505", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
//		}
//		if (dataVO.getData_id() == null || dataVO.getData_id().length() <= 0) {
//			return Output.JsonOutput("505", "복사할 Data가 없습니다.");
//		}
//		if (dataVO.getDataset_id() == null || dataVO.getDataset_id().length() <= 0) {
//			return Output.JsonOutput("505", "복사할 Dataset을 선택해주세요.");
//		}
////		DatasetVO datasetVO = new DatasetVO();
////		datasetVO.setUser_id(userInfo.getId());
////		// 레플리카를 하기 위해 복사하는 ID의 라벨타입을 가져와 Label_type에 설정
////		if (datasetVO.getDataset_id() != null && datasetVO.getDataset_id().length() > 0) {
////			DatasetVO dataset = dataDao.getDatasetById(datasetVO);
////			if (dataset.getLabel_type() == null || dataset.getLabel_type().length() <= 0) {
////				return Output.JsonOutput("304", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
////			}
////			datasetVO.setLabel_type(dataset.getLabel_type());
////		}
////
////		int cnt = dataDao.insertDataset(datasetVO);
////		if (cnt != 1) {
////			return Output.JsonOutput("300", "등록이 올바르지 않습니다.");
////		}
//		
//		String[] splitDataSetID = dataVO.getDataset_id().split(",");
//		// 복사할 이미지 
//		String[] splitDataID = dataVO.getData_id().split(",");
//
//		if (splitDataSetID == null || splitDataSetID.length <= 0) {
//			return Output.JsonOutput("505", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
//		}
//		if (splitDataID == null || splitDataID.length <= 0) {
//			return Output.JsonOutput("505", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
//		}
//
//		List<DataVO> dataList = dataDao.getDataInId(dataVO);
//		List<DataVO> resultList = new ArrayList<>();
//		HashMap<Integer, String> originalImagePath = new HashMap<Integer, String>();
//		HashMap<String, String> copyImagePath = new HashMap<String, String>();
//
//		if (dataList == null || dataList.isEmpty() || dataList.size() <= 0) {
//			return Output.JsonOutput("505", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
//		}
//		for (int i = 0; i < dataList.size(); i++) {
//			originalImagePath.put(i, dataList.get(i).getPath());
//		}
//		for (int i = 0; i < splitDataSetID.length; i++) {
//			DataVO copyData = new DataVO();
//			copyData.setDataset_id(splitDataSetID[i]);
//			List<DataVO> copyDataList = dataDao.getDataList(copyData);
//			for (int j = 0; j < copyDataList.size(); j++) {
//				copyImagePath.put(copyDataList.get(j).getPath(), copyDataList.get(j).getData_id());
//			}
//
//			for (int k = 0; k < originalImagePath.size(); k++) {
//				if (copyImagePath.containsKey(originalImagePath.get(k))) {
//					continue;
//				}
//				DataVO findData = new DataVO();
//				findData.setData_id(splitDataID[k]);
//				DataVO findDataVO = dataDao.getDataById(findData);
//				DataVO data = new DataVO();
//				data.setDataset_id(splitDataSetID[i]);
//				data.setPath(originalImagePath.get(k));
//				data.setUser_id(userInfo.getUser_id());
//				data.setMedia_type(findDataVO.getMedia_type());
//				data.setWidth(findDataVO.getWidth());
//				data.setHeight(findDataVO.getHeight());
//				data.setFps(findDataVO.getFps());
//				data.setStatus("1");
//				data.setConfirm_status("0");
//				data.setFilename(findDataVO.getFilename());
//				data.setFrame(findDataVO.getFrame());
//				data.setDuration(findDataVO.getDuration());
//				resultList.add(data);
//			}
//		}
//
//		if (resultList.isEmpty() || resultList.size() <= 0) {
//			return Output.JsonOutput("500", "복사하는 이미지가 이미 존재합니다.");
//		}
//
//		HashMap<String, Object> hm = new HashMap<String, Object>();
//
//		hm.put("dataList", resultList);
//
//		int cnt = dataDao.insertData(hm);
//		if (cnt != resultList.size()) {
//			throw new Exception("4002#등록이 올바르지 않습니다.");
//		}
//
//		return Output.JsonOutput("200", "등록이 완료되었습니다");
//
//	}
	// 수정됨
	// status 0인거 제외, 
//	public Object insertReplicaPartData(DataVO dataVO) throws Exception {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
//		}
//		if (dataVO == null) {
//			return Output.JsonOutput("505", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
//		}
//		if (dataVO.getData_id() == null || dataVO.getData_id().length() <= 0) {
//			return Output.JsonOutput("505", "복사할 Data가 없습니다.");
//		}
//		if (dataVO.getDataset_id() == null || dataVO.getDataset_id().length() <= 0) {
//			return Output.JsonOutput("505", "복사할 Dataset을 선택해주세요.");
//		}
//		
//		String[] splitDataSetID = dataVO.getDataset_id().split(",");
//		// 복사할 이미지 
//		String[] splitDataID = dataVO.getData_id().split(",");
//
//		if (splitDataSetID == null || splitDataSetID.length <= 0) {
//			return Output.JsonOutput("505", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
//		}
//		if (splitDataID == null || splitDataID.length <= 0) {
//			return Output.JsonOutput("505", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
//		}
//
//		List<DataVO> dataList = dataDao.getDataInId(dataVO);
//		List<DataVO> resultList = new ArrayList<>();
//		// 복사할 원본 데이터 path, 중복데이터를 path로 검사
//		Map<Integer, String> originalImagePath = new LinkedHashMap<Integer, String>();
//		// 복사할 원본 데이터 ID, 복사할 ID의 정보를 IN절로 가져와 복사
//		Map<Integer, String> originalImageId = new LinkedHashMap<Integer, String>();
//		// 타겟 데이터셋의 데이터, 동일한 path를 가지면 복사 제외 
//		Map<String, String> copyImagePath = new LinkedHashMap<String, String>();
//
//		if (dataList == null || dataList.isEmpty() || dataList.size() <= 0) {
//			return Output.JsonOutput("505", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
//		}
//		for (int i = 0; i < dataList.size(); i++) {
//			originalImagePath.put(i, dataList.get(i).getPath());
//			originalImageId.put(i, dataList.get(i).getData_id());
//		}
//		for (int i = 0; i < splitDataSetID.length; i++) {
//			DataVO copyData = new DataVO();
//			copyData.setDataset_id(splitDataSetID[i]);
//			copyData.setPage_num("0");
//			copyData.setPage_size("99999");
//			List<DataVO> copyDataList = dataDao.getDataList(copyData);
//			
//			// data_id 삽입
//			StringBuffer sb = new StringBuffer();
//			// 타겟 데이터셋 path Map 생성, 중복되는 데이터 제외하기 위함
//			for (int j = 0; j < copyDataList.size(); j++) {
//				copyImagePath.put(copyDataList.get(j).getPath(), copyDataList.get(j).getData_id());
//				
//			}
//
//			for (int k = 0; k < originalImagePath.size(); k++) {
//				if (copyImagePath.containsKey(originalImagePath.get(k))) {
//					continue;
//				}
//				
//				if(sb.length() <= 0) {
//					sb.append(originalImageId.get(k));
//				} else {
//					sb.append(",");
//					sb.append(originalImageId.get(k));
//				}
//			}
//			
//			if(sb.length() <= 0) {
//				continue;
//			}
//			DataVO data = new DataVO();
//			data.setUser_id(userInfo.getUser_id());
//			data.setDataset_id(splitDataSetID[i]);
//			data.setData_id(sb.toString());
//			String[] insertCntCheck = sb.toString().split(",");
//			int cnt = dataDao.insertDataInId(data);
//			if (cnt != insertCntCheck.length) {
//				throw new Exception("4002#등록이 올바르지 않습니다.");
//			}
//		}
//
//		return Output.JsonOutput("200", "중복된 데이터를 제외하고 등록이 완료되었습니다.");
//
//	}
	// 수정됨 (위에 주석된 소스는 기존 DATA_ID를 통해 복제하는 소스)

	// 복사
	public Object insertReplicaPartData(DataVO dataVO) throws CustomException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		
		if(dataVO.getDataset_id() == null || dataVO.getDataset_id().length() <= 0) {
			return Output.JsonOutput("4061", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
		}
		
		if(dataVO.getDataset_ids() == null || dataVO.getDataset_ids().length() <= 0) {
			return Output.JsonOutput("4061", "복제할 데이터셋을 선택해주세요.");
		}
		
		String[] splitDatasetID = dataVO.getDataset_ids().split(",");
		if(splitDatasetID.length <= 0) {
			return Output.JsonOutput("4061", "복제할 데이터셋을 선택해주세요.");
		}
		
		DatasetVO datasetVO = new DatasetVO();
		datasetVO.setDataset_id(dataVO.getDataset_id());
		
		// 데이터셋 id로 검색
		DatasetVO sourceDataset = dataDao.getDatasetById(datasetVO);
		if (sourceDataset == null) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 존재하지 않습니다.");
		}
		if(sourceDataset.getTitle() == null || sourceDataset.getTitle().length() <= 0) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 손상되었습니다.");
		}
		if(sourceDataset.getContents() == null || sourceDataset.getContents().length() <= 0) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 손상되었습니다.");
		}
		if(sourceDataset.getLabel_type() == null || sourceDataset.getLabel_type().length() <= 0) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 손상되었습니다.");
		}
		if(sourceDataset.getMedia_type() == null || sourceDataset.getMedia_type().length() <= 0) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 손상되었습니다.");
		}
		if(sourceDataset.getDataset_id() == null || sourceDataset.getDataset_id().length() <= 0) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 손상되었습니다.");
		}
		
		DataVO selectDataVO = new DataVO();
		selectDataVO.setDataset_id(sourceDataset.getDataset_id());
		selectDataVO.setStatus("1");
		selectDataVO.setPage_num("0");
		selectDataVO.setPage_size("99999");
		List<DataVO> sourceDataList = dataDao.getDataList(selectDataVO);
		if (sourceDataList == null || sourceDataList.isEmpty() || sourceDataList.size() <= 0) {
			throw new CustomException("4001#복사할 데이터가 존재하지 않습니다.");
		}
		
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < sourceDataList.size(); i++) {
			if(i == 0) {
				sb.append(sourceDataList.get(i).getData_id());
			} else {
				sb.append(",");
				sb.append(sourceDataList.get(i).getData_id());
			}
		}
		
		
		for(int i = 0; i < splitDatasetID.length; i++) {
			DataVO insertDataVO = new DataVO();
			insertDataVO.setDataset_id(splitDatasetID[i]);
			insertDataVO.setData_id(sb.toString());
			insertDataVO.setUser_id(userInfo.getUser_id());
			dataDao.insertDataInId(insertDataVO);
		}

		return Output.JsonOutput("200", "등록이 완료되었습니다");

	}
	
	//(복제)
	public Object insertReplicaData(DataVO dataVO) throws CustomException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		
		if(dataVO.getDataset_id() == null || dataVO.getDataset_id().length() <= 0) {
			return Output.JsonOutput("4061", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
		}
		DatasetVO datasetVO = new DatasetVO();
		datasetVO.setDataset_id(dataVO.getDataset_id());
		// 데이터셋 id로 검색
		DatasetVO sourceDataset = dataDao.getDatasetById(datasetVO);
		if (sourceDataset == null) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 손상되었습니다.");
		}
		if(sourceDataset.getTitle() == null || sourceDataset.getTitle().length() <= 0) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 손상되었습니다.");
		}
		if(sourceDataset.getContents() == null || sourceDataset.getContents().length() <= 0) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 손상되었습니다.");
		}
		if(sourceDataset.getLabel_type() == null || sourceDataset.getLabel_type().length() <= 0) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 손상되었습니다.");
		}
		if(sourceDataset.getMedia_type() == null || sourceDataset.getMedia_type().length() <= 0) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 손상되었습니다.");
		}
		
		// 복제 데이터셋 생성
		DatasetVO targetDataset = new DatasetVO();
		targetDataset.setTitle(sourceDataset.getTitle() + "_replica");
		targetDataset.setContents(sourceDataset.getContents());
		targetDataset.setUser_id(userInfo.getUser_id());
		targetDataset.setLabel_type(sourceDataset.getLabel_type());
		targetDataset.setMedia_type(sourceDataset.getMedia_type());
		targetDataset.setStatus("1");
		int cnt = dataDao.insertDataset(targetDataset);
		if (cnt != 1) {
			throw new CustomException("4001#데이터셋을 등록하는 과정에서 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		String targetDatasetId = targetDataset.getDataset_id();

		//
		DataVO selectDataVO = new DataVO();
		selectDataVO.setDataset_id(sourceDataset.getDataset_id());
		selectDataVO.setStatus("1");
		selectDataVO.setPage_num("0");
		selectDataVO.setPage_size("99999");
		List<DataVO> sourceDataList = dataDao.getDataList(selectDataVO);
		if (sourceDataList == null || sourceDataList.isEmpty() || sourceDataList.size() <= 0) {
			throw new CustomException("4001#복사할 데이터가 존재하지 않습니다.");
		}
		
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < sourceDataList.size(); i++) {
			if(i == 0) {
				sb.append(sourceDataList.get(i).getData_id());
			} else {
				sb.append(",");
				sb.append(sourceDataList.get(i).getData_id());
			}
		}
		
		DataVO insertDataVO = new DataVO();
		insertDataVO.setDataset_id(targetDatasetId);
		insertDataVO.setData_id(sb.toString());
		insertDataVO.setUser_id(userInfo.getUser_id());
		dataDao.insertDataInId(insertDataVO);

		return Output.JsonOutput("200", "등록이 완료되었습니다");

	}
	// dataset_ids
	// 수정됨
	

//	public Object insertReplicaPartDataWithMeta(DataVO dataVO) throws Exception {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
//		}
//		if (dataVO.getData_id() == null || dataVO.getData_id().length() <= 0) {
//			return Output.JsonOutput("505", "복사할 Data를 선택해주세요.");
//		}
//		if (dataVO.getDataset_id() == null || dataVO.getDataset_id().length() <= 0) {
//			return Output.JsonOutput("505", "복사할 Dataset을 선택해주세요.");
//		}
//
//		String[] splitDataSetID = dataVO.getDataset_id().split(",");
//		String[] splitDataID = dataVO.getData_id().split(",");
//
//		// 복사할 데이터
//		List<DataVO> dataList = dataDao.getDataInId(dataVO);
//		if (dataList == null || dataList.isEmpty() || dataList.size() <= 0) {
//			logger.error("dataList Error! DB Select result null");
//			return Output.JsonOutput("505", "복사할 데이터가 없습니다.");
//		}
//		DatasetVO findDatasetVO = new DatasetVO();
//		findDatasetVO.setDataset_id(dataList.get(0).getDataset_id());
//		// Data의 Dataset ID를 가져옴, Label_type을 비교해 동일할 경우, meta 복사 아니면 이미지만 복사하기 위함
//		DatasetVO datasetVO = dataDao.getDatasetById(findDatasetVO);
//		if (datasetVO == null) {
//			logger.error("datasetVO null!");
//			return Output.JsonOutput("505", "복사할 데이터셋이 없습니다.");
//		}
//		// 라벨타입이 다를 경우, 복사할 Data List, meta는 복사 안함
//		List<DataVO> resultList = new ArrayList<>();
//		HashMap<String, String> originalImagePath = new HashMap<String, String>();
//		HashMap<String, String> copyImagePath = new HashMap<String, String>();
//
//		// 복사할 이미지를 Map으로 만듬
//		for (int i = 0; i < dataList.size(); i++) {
//			dataList.get(i).setDataset_id(dataVO.getDataset_id());
//			originalImagePath.put(dataList.get(i).getPath(), dataList.get(i).getData_id());
//		}
//
////		HashMap<String, Object> hm = new HashMap<String, Object>();
//
//		/////
////		for(int i = 0; i < dataList.size(); i++) {
////			originalImagePath.put(dataList.get(i).getPath(), dataList.get(i).getId());
////		}
//
//		// 타겟 데이터셋의 개수만큼 반복
//		for (int i = 0; i < splitDataSetID.length; i++) {
//			DataVO copyData = new DataVO();
//			copyData.setDataset_id(splitDataSetID[i]);
//			copyImagePath.clear();
//			// 타겟 데이터셋의 데이터를 가져옴, 중복된 데이터를 제거하기 위함
//			List<DataVO> copyDataList = dataDao.getDataList(copyData);
//			ReplicaMetaVO replicaMetaVO = new ReplicaMetaVO();
//			for (int j = 0; j < copyDataList.size(); j++) {
//				copyImagePath.put(copyDataList.get(j).getPath(), copyDataList.get(j).getData_id());
//			}
//
//			// 동일한 라벨타입이 아닐 경우, 이미지만 복사
////			DatasetVO copyDatasetVO = new DatasetVO();
////			copyDatasetVO.setId(splitDataSetID[i]);
////			DatasetVO dataset = dataDao.getDatasetById(copyDatasetVO);
////			if (!datasetVO.getLabel_type().equals(dataset.getLabel_type())) {
////				for (int q = 0; q < originalImagePath.size(); q++) {
////					if (copyImagePath.containsKey(originalImagePath.get(q))) {
////						continue;
////					}
////					DataVO data = new DataVO();
////					data.setDataset_id(splitDataSetID[i]);
////					data.setPath(originalImagePath.get(q));
////					resultList.add(data);
////				}
////				continue;
////			}
//
//			for (int k = 0; k < dataList.size(); k++) {
//				String key = dataList.get(k).getPath();
//				//
//				String fileName = originalImagePath.get(key);
//				DataVO data = new DataVO();
//				data.setData_id(dataList.get(k).getData_id());
//				DataVO findDataVO = dataDao.getDataById(data);
//				//
//				// 동일한 라벨 타입이 아닐경우 이미지만 복사
//				DatasetVO copyDatasetVO = new DatasetVO();
//				copyDatasetVO.setDataset_id(splitDataSetID[i]);
//				// 복사할 데이터셋
//				DatasetVO dataset = dataDao.getDatasetById(copyDatasetVO);
//				if (dataset == null || dataset.getLabel_type() == null || dataset.getLabel_type().length() <= 0) {
//					throw new Exception("4002#등록이 올바르지 않습니다.");
//				}
//				// label_type같고 데이터 중복되면 continue, 아니면 resultList에 추가
//				if (!datasetVO.getLabel_type().equals(dataset.getLabel_type())) {
//					if (copyImagePath.containsKey(key)) {
//						continue;
//					}
//					DataVO dataPathVO = new DataVO();
//					dataPathVO.setDataset_id(splitDataSetID[i]);
//					dataPathVO.setPath(dataList.get(k).getPath());
//					dataPathVO.setUser_id(userInfo.getUser_id());
//					dataPathVO.setMedia_type(dataList.get(k).getMedia_type());
//					dataPathVO.setWidth(dataList.get(k).getWidth());
//					dataPathVO.setHeight(dataList.get(k).getHeight());
//					dataPathVO.setFps(dataList.get(k).getFps());
//					dataPathVO.setStatus(dataList.get(k).getStatus());
//					dataPathVO.setConfirm_status(dataList.get(k).getConfirm_status());
//					dataPathVO.setFilename(dataList.get(k).getFilename());
//					dataPathVO.setFrame(dataList.get(k).getFrame());
//					dataPathVO.setDuration(dataList.get(k).getDuration());
//					resultList.add(dataPathVO);
//					continue;
//				}
//				// 데이터가 중복되면 Label만 복사
//				if (copyImagePath.containsKey(key)) {
//					replicaMetaVO.setSource_data_id(originalImagePath.get(key));
//					replicaMetaVO.setTarget_data_id(copyImagePath.get(key));
//					dataDao.insertMetaBySelectResult(replicaMetaVO);
//					continue;
//				}
//				// 데이터가 중복되지 않을 때, Data와 Label 복사
//				DataVO insertDataVO = new DataVO();
//				insertDataVO.setDataset_id(splitDataSetID[i]);
//				insertDataVO.setPath(key);
//				insertDataVO.setUser_id(userInfo.getUser_id());
//				insertDataVO.setMedia_type("IMAGE");
//				insertDataVO.setWidth(null);
//				insertDataVO.setHeight(null);
//				insertDataVO.setFps(null);
//				insertDataVO.setStatus("1");
//				insertDataVO.setConfirm_status("0");
//				insertDataVO.setFilename(findDataVO.getFilename());
//				int cnt = dataDao.insertDataOne(insertDataVO);
//				if (cnt != 1) {
//					throw new Exception("4002#등록이 올바르지 않습니다.");
//				}
//				replicaMetaVO.setSource_data_id(originalImagePath.get(key));
//				replicaMetaVO.setTarget_data_id(insertDataVO.getData_id());
//				dataDao.insertMetaBySelectResult(replicaMetaVO);
//			}
//		}
//
//		HashMap<String, Object> hm = new HashMap<String, Object>();
//
//		// Label_type다른 Dataset 데이터 복사(라벨 X)
//		if (!resultList.isEmpty()) {
//			hm.put("dataList", resultList);
//			int cnt = dataDao.insertData(hm);
//			if (cnt != resultList.size()) {
//				throw new Exception("4002#등록이 올바르지 않습니다.");
//			}
//		}
//
//		return Output.JsonOutput("200", "등록이 완료되었습니다");
//	}
	//수정됨
//	public Object insertReplicaPartDataWithMeta(DataVO dataVO) throws Exception {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
//		}
//		if (dataVO.getData_id() == null || dataVO.getData_id().length() <= 0) {
//			return Output.JsonOutput("505", "복사할 Data를 선택해주세요.");
//		}
//		if (dataVO.getDataset_id() == null || dataVO.getDataset_id().length() <= 0) {
//			return Output.JsonOutput("505", "복사할 Dataset을 선택해주세요.");
//		}
//
//		String[] splitDataSetID = dataVO.getDataset_id().split(",");
//		String[] splitDataID = dataVO.getData_id().split(",");
//
//		// 복사할 데이터
//		List<DataVO> dataList = dataDao.getDataInId(dataVO);
//		if (dataList == null || dataList.isEmpty() || dataList.size() <= 0) {
//			logger.error("dataList Error! DB Select result null");
//			return Output.JsonOutput("505", "복사할 데이터가 없습니다.");
//		}
//		// 첫번째 데이터의 라벨타입을 확인해 두 개 데이터셋의 라벨타입이 같은지 확인, 같으면 라벨도 같이 복사, 다르면 데이터만 복사 
//		DatasetVO findDatasetVO = new DatasetVO();
//		findDatasetVO.setDataset_id(dataList.get(0).getDataset_id());
//		// Data의 Dataset ID를 가져옴, Label_type을 비교해 동일할 경우, meta 복사 아니면 이미지만 복사하기 위함
//		DatasetVO datasetVO = dataDao.getDatasetById(findDatasetVO);
//		if (datasetVO == null) {
//			logger.error("datasetVO null!");
//			return Output.JsonOutput("505", "복사할 데이터셋이 없습니다.");
//		}
//		// 라벨타입이 다를 경우, 복사할 Data List, meta는 복사 안함
//		List<DataVO> resultList = new ArrayList<>();
//		HashMap<String, String> originalImagePath = new HashMap<String, String>();
//		HashMap<String, String> copyImagePath = new HashMap<String, String>();
//
//		// 복사할 이미지를 Map으로 만듬
//		for (int i = 0; i < dataList.size(); i++) {
//			dataList.get(i).setDataset_id(dataVO.getDataset_id());
//			originalImagePath.put(dataList.get(i).getPath(), dataList.get(i).getData_id());
//		}
//
//		// 타겟 데이터셋의 개수만큼 반복
//		for (int i = 0; i < splitDataSetID.length; i++) {
//			DataVO copyData = new DataVO();
//			copyData.setDataset_id(splitDataSetID[i]);
//			copyData.setPage_num("0");
//			copyData.setPage_size("99999");
//			copyImagePath.clear();
//			// 타겟 데이터셋의 데이터를 가져옴, 중복된 데이터를 제거하기 위함
//			List<DataVO> copyDataList = dataDao.getDataList(copyData);
//			ReplicaMetaVO replicaMetaVO = new ReplicaMetaVO();
//			for (int j = 0; j < copyDataList.size(); j++) {
//				copyImagePath.put(copyDataList.get(j).getPath(), copyDataList.get(j).getData_id());
//			}
//
//			for (int k = 0; k < dataList.size(); k++) {
//				String key = dataList.get(k).getPath();
//				//
//				String fileName = originalImagePath.get(key);
//				DataVO data = new DataVO();
//				data.setData_id(dataList.get(k).getData_id());
//				DataVO findDataVO = dataDao.getDataById(data);
//				//
//				// 동일한 라벨 타입이 아닐경우 이미지만 복사
//				DatasetVO copyDatasetVO = new DatasetVO();
//				copyDatasetVO.setDataset_id(splitDataSetID[i]);
//				// 복사할 데이터셋
//				DatasetVO dataset = dataDao.getDatasetById(copyDatasetVO);
//				if (dataset == null || dataset.getLabel_type() == null || dataset.getLabel_type().length() <= 0) {
//					throw new Exception("4002#등록이 올바르지 않습니다.");
//				}
//				// label_type같고 데이터 중복되면 continue, 아니면 resultList에 추가
//				if (!datasetVO.getLabel_type().equals(dataset.getLabel_type())) {
//					if (copyImagePath.containsKey(key)) {
//						continue;
//					}
//					DataVO dataPathVO = new DataVO();
//					dataPathVO.setDataset_id(splitDataSetID[i]);
//					dataPathVO.setPath(dataList.get(k).getPath());
//					dataPathVO.setUser_id(userInfo.getUser_id());
//					dataPathVO.setMedia_type(dataList.get(k).getMedia_type());
//					dataPathVO.setWidth(dataList.get(k).getWidth());
//					dataPathVO.setHeight(dataList.get(k).getHeight());
//					dataPathVO.setFps(dataList.get(k).getFps());
//					dataPathVO.setStatus(dataList.get(k).getStatus());
//					dataPathVO.setConfirm_status(dataList.get(k).getConfirm_status());
//					dataPathVO.setFilename(dataList.get(k).getFilename());
//					dataPathVO.setFrame(dataList.get(k).getFrame());
//					dataPathVO.setDuration(dataList.get(k).getDuration());
//					resultList.add(dataPathVO);
//					continue;
//				}
//				// 데이터가 중복되면 Label만 복사
//				if (copyImagePath.containsKey(key)) {
//					replicaMetaVO.setSource_data_id(originalImagePath.get(key));
//					replicaMetaVO.setTarget_data_id(copyImagePath.get(key));
//					dataDao.insertMetaBySelectResult(replicaMetaVO);
//					continue;
//				}
//				// 데이터가 중복되지 않을 때, Data와 Label 복사
//				DataVO insertDataVO = new DataVO();
//				insertDataVO.setDataset_id(splitDataSetID[i]);
//				insertDataVO.setPath(key);
//				insertDataVO.setUser_id(userInfo.getUser_id());
//				insertDataVO.setMedia_type("IMAGE");
//				insertDataVO.setWidth(null);
//				insertDataVO.setHeight(null);
//				insertDataVO.setFps(null);
//				insertDataVO.setStatus("1");
//				insertDataVO.setConfirm_status("0");
//				insertDataVO.setFilename(findDataVO.getFilename());
//				int cnt = dataDao.insertDataOne(insertDataVO);
//				if (cnt != 1) {
//					throw new Exception("4002#등록이 올바르지 않습니다.");
//				}
//				replicaMetaVO.setSource_data_id(originalImagePath.get(key));
//				replicaMetaVO.setTarget_data_id(insertDataVO.getData_id());
//				dataDao.insertMetaBySelectResult(replicaMetaVO);
//			}
//		}
//
//		HashMap<String, Object> hm = new HashMap<String, Object>();
//
//		// Label_type다른 Dataset 데이터 복사(라벨 X)
//		if (!resultList.isEmpty()) {
//			hm.put("dataList", resultList);
//			int cnt = dataDao.insertData(hm);
//			if (cnt != resultList.size()) {
//				throw new Exception("4002#등록이 올바르지 않습니다.");
//			}
//		}
//
//		return Output.JsonOutput("200", "등록이 완료되었습니다");
//	}
	// 수정됨 (복사, 위에 소스는 Data_id를 파라미터로 전달받음)
	public Object insertReplicaPartDataWithMeta(DatasetVO datasetVO) throws CustomException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		
		if(datasetVO.getDataset_ids() == null || datasetVO.getDataset_ids().length() <= 0) {
			return Output.JsonOutput("4061", "복사할 데이터셋을 선택해주세요.");
		}
		String[] splitDatasetID = datasetVO.getDataset_ids().split(",");
		if(splitDatasetID == null || splitDatasetID.length <= 0) {
			return Output.JsonOutput("4061", "복사할 데이터셋을 선택해주세요.");
		}
		// 데이터셋 id로 검색
		DatasetVO sourceDataset = dataDao.getDatasetById(datasetVO);
		if (sourceDataset == null) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 없습니다");
		}
		if(sourceDataset.getLabel_type() == null || sourceDataset.getLabel_type().length() <= 0) {
			return Output.JsonOutput("4071", "복사할 데이터셋이 손상되었습니다.");
		}
		
		DataVO selectDataVO = new DataVO();
		selectDataVO.setDataset_id(sourceDataset.getDataset_id());
		selectDataVO.setStatus("1");
		selectDataVO.setPage_num("0");
		selectDataVO.setPage_size("99999");
		List<DataVO> sourceDataList = dataDao.getDataList(selectDataVO);
		if (sourceDataList == null || sourceDataList.isEmpty() || sourceDataList.size() <= 0) {
			throw new CustomException("4001#등록이 올바르지 않습니다.");
		}
		
		// 타겟 데이터셋들 라벨타입 같은지 확인
		for(int i = 0; i < splitDatasetID.length; i++) {
			DatasetVO findDatasetVO = new DatasetVO();
			findDatasetVO.setDataset_id(splitDatasetID[i]);
			DatasetVO dataset = dataDao.getDatasetById(findDatasetVO);
			if(dataset.getLabel_type() == null || dataset.getLabel_type().length() <= 0) {
				return Output.JsonOutput("4071", "라벨 타입이 같지 않은 데이터셋이 포함되어 있어 복사할 수 없습니다.");
			}
			if(!dataset.getLabel_type().equals(sourceDataset.getLabel_type())) {
				return Output.JsonOutput("4071", "라벨 타입이 같지 않은 데이터셋이 포함되어 있어 복사할 수 없습니다.");
			}
		}
		
		DataVO insertDataVO = new DataVO();
		ReplicaMetaVO replicaMetaVO = new ReplicaMetaVO();
		for (int i = 0; i < splitDatasetID.length; i++) {
			for (int j = 0; j < sourceDataList.size(); j++) {
				DataVO findDataVO = dataDao.getDataById(sourceDataList.get(i));
				insertDataVO.setDataset_id(splitDatasetID[i]);
				insertDataVO.setPath(sourceDataList.get(j).getPath());
				insertDataVO.setUser_id(userInfo.getUser_id());
				insertDataVO.setMedia_type(findDataVO.getMedia_type());
				insertDataVO.setWidth(findDataVO.getWidth());
				insertDataVO.setHeight(findDataVO.getHeight());
				insertDataVO.setFps(findDataVO.getFps());
				insertDataVO.setStatus("1");
				insertDataVO.setConfirm_status(findDataVO.getConfirm_status());
				insertDataVO.setFilename(findDataVO.getFilename());
				insertDataVO.setFrame(findDataVO.getFrame());
				insertDataVO.setDuration(findDataVO.getDuration());

				int cnt = dataDao.insertDataOne(insertDataVO);
				if (cnt != 1) {
					//logger.error("insertReplicaPartDataWithMeta() 데이터 복제 실패!");
					continue;
					//throw new CustomException("4001#등록이 올바르지 않습니다.");
				}
				// 메타 복제
				replicaMetaVO.setSource_data_id(sourceDataList.get(j).getData_id());
				replicaMetaVO.setTarget_data_id(insertDataVO.getData_id());
				dataDao.insertMetaBySelectResult(replicaMetaVO);
			}
		}

		return Output.JsonOutput("200", "등록이 완료되었습니다");

	}

	// 복제
	public Object insertReplicaDataWithMeta(DatasetVO datasetVO) throws CustomException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		// 데이터셋 id로 검색
		DatasetVO sourceDataset = dataDao.getDatasetById(datasetVO);
		if (sourceDataset == null) {
			return Output.JsonOutput("4061", "복사할 데이터셋이 없습니다");
		}
		if(sourceDataset.getTitle() == null || sourceDataset.getTitle().length() <= 0) {
			return Output.JsonOutput("4061", "복사할 데이터셋이 손상되었습니다.");
		}
		if(sourceDataset.getContents() == null || sourceDataset.getContents().length() <= 0) {
			return Output.JsonOutput("4061", "복사할 데이터셋이 손상되었습니다.");
		}
		if(sourceDataset.getLabel_type() == null || sourceDataset.getLabel_type().length() <= 0) {
			return Output.JsonOutput("4061", "복사할 데이터셋이 손상되었습니다.");
		}
		if(sourceDataset.getMedia_type() == null || sourceDataset.getMedia_type().length() <= 0) {
			return Output.JsonOutput("4061", "복사할 데이터셋이 손상되었습니다.");
		}
		
		// 복제 데이터셋 생성
		DatasetVO targetDataset = new DatasetVO();
		targetDataset.setTitle(sourceDataset.getTitle() + "_replica");
		targetDataset.setContents(sourceDataset.getContents());
		targetDataset.setUser_id(userInfo.getUser_id());
		targetDataset.setLabel_type(sourceDataset.getLabel_type());
		targetDataset.setMedia_type(sourceDataset.getMedia_type());
		targetDataset.setStatus("1");
		int cnt = dataDao.insertDataset(targetDataset);
		if (cnt != 1) {
			throw new CustomException("4001#데이터셋을 등록하는 과정에서 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		String targetDatasetId = targetDataset.getDataset_id();

		//
		DataVO selectDataVO = new DataVO();
		selectDataVO.setDataset_id(sourceDataset.getDataset_id());
		selectDataVO.setStatus("1");
		selectDataVO.setPage_num("0");
		selectDataVO.setPage_size("99999");
		List<DataVO> sourceDataList = dataDao.getDataList(selectDataVO);
		if (sourceDataList == null || sourceDataList.isEmpty() || sourceDataList.size() <= 0) {
			throw new CustomException("4001#복사할 데이터가 존재하지 않습니다.");
		}
		
		DataVO insertDataVO = new DataVO();
		ReplicaMetaVO replicaMetaVO = new ReplicaMetaVO();
		for (int i = 0; i < sourceDataList.size(); i++) {
			DataVO findDataVO = dataDao.getDataById(sourceDataList.get(i));
			insertDataVO.setDataset_id(targetDatasetId);
			insertDataVO.setPath(sourceDataList.get(i).getPath());
			insertDataVO.setUser_id(userInfo.getUser_id());
			insertDataVO.setMedia_type(findDataVO.getMedia_type());
			insertDataVO.setWidth(findDataVO.getWidth());
			insertDataVO.setHeight(findDataVO.getHeight());
			insertDataVO.setFps(findDataVO.getFps());
			insertDataVO.setStatus("1");
			insertDataVO.setConfirm_status(findDataVO.getConfirm_status());
			insertDataVO.setFilename(findDataVO.getFilename());
			insertDataVO.setFrame(findDataVO.getFrame());
			insertDataVO.setDuration(findDataVO.getDuration());
			
			cnt = dataDao.insertDataOne(insertDataVO);
			if (cnt != 1) {
				throw new CustomException("4001#등록이 올바르지 않습니다.");
			}
			replicaMetaVO.setSource_data_id(sourceDataList.get(i).getData_id());
			replicaMetaVO.setTarget_data_id(insertDataVO.getData_id());
			dataDao.insertMetaBySelectResult(replicaMetaVO);
		}

		return Output.JsonOutput("200", "등록이 완료되었습니다");

	}


	
	public Object deleteDataset(DatasetVO datasetVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if (datasetVO == null || datasetVO.getDataset_id() == null || datasetVO.getDataset_id().length() <= 0) {
			return Output.JsonOutput("4061", "삭제할 데이터셋이 없습니다.");
		}
		DataVO dataVO = new DataVO();
		dataVO.setDataset_id(datasetVO.getDataset_id());
		dataVO.setStatus("0");

		// meta 삭제
		dataDao.deleteMetaByDatasetId(dataVO);
		// Data status 0으로 업데이트
		dataDao.updateDataByDatasetId(dataVO);

//		DatasetVO inputDatasetVO = new DatasetVO();
//		inputDatasetVO.setStatus("0");
//		inputDatasetVO.setDataset_id(datasetVO.getDataset_id());
		datasetVO.setStatus("0");
		
		// Dataset Status 0으로 업데이트
		dataDao.updateDataset(datasetVO);

		return Output.JsonOutput("200", "삭제가 완료되었습니다");

	}

	public Object deleteData(DataVO dataVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if (dataVO.getData_id() == null || dataVO.getData_id().length() <= 0) {
			return Output.JsonOutput("4061", "삭제할 데이터가 없습니다.");
		}
//		MetaVO metaVO = new MetaVO();
//		metaVO.setData_id(dataVO.getData_id());

		dataVO.setStatus("0");
//		DataVO inputDataVO = new DataVO();
//		inputDataVO.setStatus("0");
//		inputDataVO.setData_id(dataVO.getData_id());

		dataDao.updateData(dataVO);
		DatasetVO datasetVO = new DatasetVO();
		datasetVO.setDataset_id(dataVO.getDataset_id());
		datasetVO.setSave_data_id("0");
		dataDao.updateDataset(datasetVO);

		return Output.JsonOutput("200", "삭제가 완료되었습니다");
	}

	public Object deleteMeta(MetaVO metaVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		int meta_cnt = dataDao.deleteMeta(metaVO);
		if (meta_cnt == 0) {
			return Output.JsonOutput("300", "삭제할 라벨이 존재하지 않습니다.");
		}
		return Output.JsonOutput("200", "삭제가 완료되었습니다");
	}

	public Object deleteMetaInDataId(DataVO dataVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}

		dataVO.setPage_num("0");
		dataVO.setPage_size("99999");
		List<DataVO> dataList = dataDao.getDataList(dataVO);
		if(dataList == null || dataList.size() <= 0) {
			return Output.JsonOutput("4071", "삭제할 데이터가 없습니다.");
		}
		StringBuffer sb = new StringBuffer();
		
		for(int i = 0; i < dataList.size(); i++) {
			if(i == 0) {
				sb.append(dataList.get(i).getData_id());
			} else {
				sb.append(",");
				sb.append(dataList.get(i).getData_id());
			}
		}
		
		dataVO.setData_id(sb.toString());
		int meta_cnt = dataDao.deleteMetaInDataId(dataVO);
		if (meta_cnt == 0) {
			return Output.JsonOutput("300", "삭제할 라벨이 존재하지 않습니다.");
		}

		DatasetVO datasetVO = new DatasetVO();
		datasetVO.setDataset_id(dataVO.getDataset_id());
		datasetVO.setSave_data_id("0");
		dataDao.updateDataset(datasetVO);
		return Output.JsonOutput("200", "삭제가 완료되었습니다");
	}

	
	public Object deleteMetaByDatasetId(DataVO dataVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if (dataVO.getDataset_id() == null || dataVO.getDataset_id().length() <= 0) {
			return Output.JsonOutput("4061", "삭제할 데이터셋이 존재하지 않습니다.");
		}
		
		int meta_cnt = dataDao.deleteMetaByDatasetId(dataVO);
		if (meta_cnt == 0) {
			return Output.JsonOutput("300", "삭제할 라벨이 존재하지 않습니다.");
		}
		return Output.JsonOutput("200", "삭제가 완료되었습니다");
	}
	
	
	
	public Object deleteDataInDatasetId(DatasetVO datasetVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if (datasetVO == null || datasetVO.getDataset_id() == null || datasetVO.getDataset_id().length() <= 0) {
			return Output.JsonOutput("4061", "삭제할 데이터셋을 선택해주세요.");
		}
		String datasetIds = datasetVO.getDataset_id();
//		datasetVO.setStatus("0");
		String[] datasetIdArr = datasetIds.split(",");
		if (datasetIdArr == null || datasetIdArr.length <= 0) {
			return Output.JsonOutput("4061", "삭제할 데이터셋이 존재하지 않습니다.");
		}

		DataVO dataVO = new DataVO();
		dataVO.setDataset_id(datasetIds);
		dataVO.setStatus("0");
		int deleteCnt = dataDao.deleteMetaByDatasetId(dataVO);
		if(deleteCnt == 0) {
			return Output.JsonOutput("300", "삭제할 데이터가 존재하지 않습니다.");
		}

		for (int i = 0; i < datasetIdArr.length; i++) {
			dataVO = new DataVO();
			dataVO.setDataset_id(datasetIdArr[i]);
			dataVO.setStatus("0");
			dataDao.updateDataByDatasetId(dataVO);

			datasetVO.setDataset_id(datasetIdArr[i]);
			datasetVO.setSave_data_id("0");
			int datasetCnt = dataDao.updateDataset(datasetVO);
			if (datasetCnt != 1) {
				continue;
			}
		}

		return Output.JsonOutput("200", "삭제가 완료되었습니다");

	}

	public Object updateDataset(DatasetVO datasetVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		int cnt = dataDao.updateDataset(datasetVO);
		if (cnt == 1) {
			return Output.JsonOutput("200", "업데이트가 완료되었습니다");
		} else {
			return Output.JsonOutput("4061", "업데이트가 올바르지 않습니다");
		}
	}

//	public Object getDataList(DataVO dataVO) {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
//		}
//		dataVO.setStatus("1");
//		Object result = dataDao.getDataList(dataVO);
//		return Output.JsonOutput("200", result);
//	}
	
	public Object getDataList(DataVO dataVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}

		String datasetId = dataVO.getDataset_id();
		if(datasetId == null || datasetId.isEmpty()) {
			return Output.JsonOutput("4061","데이터셋 파라미터가 존재하지 않습니다");		
		}
		
		String userId = userInfo.getUser_id();
		
		//소유권에 대한 부분이 Xlabeller에서는 존재하지 않음. 만약 필요하게 되면 쓸것임.
//		DatasetVO selectDatasetVO = new DatasetVO();
//		selectDatasetVO.setDataset_id(datasetId);
//		DatasetVO resultDatasetVO = dataDao.getDatasetById(selectDatasetVO);
//		if(resultDatasetVO == null || resultDatasetVO.getUser_id() == null || !userId.equals(resultDatasetVO.getUser_id())) {
//			return Output.JsonOutput("4611","해당 데이터의 접근 권한이 없습니다.");
//		}
		
		DataVO selectDataVO = new DataVO();
		selectDataVO.setStatus("1");
		selectDataVO.setDataset_id(datasetId);
		
		//페이징
		int count = dataDao.getDataTotalCount(selectDataVO);
		int size = 50;
		int pageStart = 0;
		if(dataVO.getPage_num() != null && !dataVO.getPage_num().equals("")) {
			try {
				pageStart = Integer.valueOf(dataVO.getPage_num()).intValue();
			} catch (NumberFormatException e) {
				logger.error("DataService getDatasetList Error!", e);
				pageStart = 0;
			}
		}
		
		
		selectDataVO.setPage_num(String.valueOf(pageStart * size));
		selectDataVO.setPage_size(String.valueOf(size));
		selectDataVO.setTotal_size(String.valueOf(count));
		
		dataVO.setPage_num(String.valueOf(pageStart * size));
		dataVO.setPage_size(String.valueOf(size));
		dataVO.setTotal_size(String.valueOf(count));
		
		Object result = dataDao.getDataList(selectDataVO);
//		dataVO = selectDataVO;
		return Output.JsonOutput("200", result);
	}
	
	public Object getPageNoLimitDataList(DataVO dataVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}

		String datasetId = dataVO.getDataset_id();
		if(datasetId == null || datasetId.isEmpty()) {
			return Output.JsonOutput("4061", "데이터셋 ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");		
		}
		
		String userId = userInfo.getUser_id();
		
		//소유권에 대한 부분이 Xlabeller에서는 존재하지 않음. 만약 필요하게 되면 쓸것임.
//		DatasetVO selectDatasetVO = new DatasetVO();
//		selectDatasetVO.setDataset_id(datasetId);
//		DatasetVO resultDatasetVO = dataDao.getDatasetById(selectDatasetVO);
//		if(resultDatasetVO == null || resultDatasetVO.getUser_id() == null || !userId.equals(resultDatasetVO.getUser_id())) {
//			return Output.JsonOutput("4611","해당 데이터의 접근 권한이 없습니다.");
//		}
		
		DataVO selectDataVO = new DataVO();
		selectDataVO.setStatus("1");
		selectDataVO.setDataset_id(datasetId);

		selectDataVO.setPage_num("0");
		selectDataVO.setPage_size("99999");

		dataVO = selectDataVO;
		Object result = dataDao.getDataList(selectDataVO);
		return Output.JsonOutput("200", result);
	}
	
	

	public Object getDataByNum(DataVO dataVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}		
		
		if(dataVO.getDataset_id() == null || dataVO.getDataset_id().isEmpty()) {
			return Output.JsonOutput("4061", "데이터셋 ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			//return Output.JsonOutput("4061","데이터셋 파라미터가 존재하지 않습니다");	
			
		}
		if(dataVO.getData_num() == null || dataVO.getData_num().isEmpty()) {
			return Output.JsonOutput("4061","데이터 넘버링 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");	
		}
		
		//권한 체크
//		String userId = userInfo.getUser_id();
//		String datasetId = dataVO.getDataset_id();
//		DatasetVO selectDatasetVO = new DatasetVO();
//		selectDatasetVO.setDataset_id(datasetId);
//		DatasetVO resultDatasetVO = dataDao.getDatasetById(selectDatasetVO);
//		if(resultDatasetVO == null || resultDatasetVO.getUser_id() == null || !userId.equals(resultDatasetVO.getUser_id())) {
//			return Output.JsonOutput("4611","해당 데이터의 접근 권한이 없습니다.");
//		}
		
		dataVO.setStatus("1");
		
		Object result = dataDao.getDataByNum(dataVO);
		return Output.JsonOutput("200", result);
	}
	
	
	
	

//	public Object updateDataInId(DataVO dataVO) throws Exception {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
//		}
//
//		if (dataVO.getDataset_id() == null || dataVO.getDataset_id().length() <= 0) {
//			return Output.JsonOutput("3055", "체크된 데이터셋을 찾을 수 없습니다.\n데이터셋 선택 후 다시 시도해주세요.");
//		}
//
//		if (dataVO.getData_id() == null || dataVO.getData_id().length() <= 0) {
//			return Output.JsonOutput("3055", "이동할 데이터가 존재하지 않습니다.");
//		}
//		String[] splitDataSetID = dataVO.getDataset_id().split(",");
//		String[] splitDataID = dataVO.getData_id().split(",");
//
//		if (splitDataSetID == null || splitDataSetID.length <= 0) {
//			return Output.JsonOutput("505", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
//		}
////		if(splitDataID == null || splitDataID.length <= 0) {
////			return Output.JsonOutput("505", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
////		}
//
//		List<DataVO> dataList = dataDao.getDataInId(dataVO);
//		if (dataList == null || dataList.isEmpty() || dataList.size() <= 0) {
//			return Output.JsonOutput("3055", "업데이트할 데이터가 존재하지 않습니다.");
//		}
//		List<DataVO> resultList = new ArrayList<>();
//		HashMap<Integer, String> originalImagePath = new HashMap<Integer, String>();
//		HashMap<String, String> copyImagePath = new HashMap<String, String>();
//
//		for (int i = 0; i < dataList.size(); i++) {
//			if (dataList.get(i) == null || dataList.get(i).getPath() == null
//					|| dataList.get(i).getPath().length() <= 0) {
//				logger.error("dataList.get(i) Error! dataList.get(i).getPath() : " + dataList.get(i).getPath());
//				return Output.JsonOutput("3407", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 문의 주시길 바랍니다.");
//			}
//			originalImagePath.put(i, dataList.get(i).getPath());
//		}
//
//		for (int i = 0; i < splitDataSetID.length; i++) {
//			DataVO copyData = new DataVO();
//			copyData.setDataset_id(splitDataSetID[i]);
//			copyData.setPage_num("0");
//			copyData.setPage_size("99999");
//			List<DataVO> copyDataList = dataDao.getDataList(copyData);
//			copyImagePath.clear();
//			for (int j = 0; j < copyDataList.size(); j++) {
//				copyImagePath.put(copyDataList.get(j).getPath(), copyDataList.get(j).getData_id());
//			}
//
//			for (int k = 0; k < originalImagePath.size(); k++) {
//				if (copyImagePath.containsKey(originalImagePath.get(k))) {
//					continue;
//				}
//				DataVO data = new DataVO();
//				data.setDataset_id(splitDataSetID[i]);
//				data.setPath(originalImagePath.get(k));
//				resultList.add(data);
//			}
//		}
//
//		if (resultList.isEmpty()) {
//			return Output.JsonOutput("500", "이동하는 이미지가 이미 존재합니다.");
//		}
//
//		HashMap<String, Object> hm = new HashMap<String, Object>();
//
//		hm.put("dataList", resultList);
//
//		int insert_cnt = dataDao.insertData(hm);
//		if (insert_cnt != resultList.size()) {
////			return Output.JsonOutput("4500", "Insert에 실패했습니다.");
//			throw new Exception("4500#데이터 이동에 실패하였습니다.");
//		}
//
////		System.out.println("ddataAVo : " + dataVO.getId());
//
////		for(int i = 0; i < splitDataID.length; i++) {
////			DataVO newDataVO = new DataVO();
////			newDataVO.setId(splitDataID[i]);
////			dataDao.deleteData(newDataVO);	
////		}
//		int deleteCnt = dataDao.deleteDataInId(dataVO);
//		if (splitDataID.length != deleteCnt) {
//			return Output.JsonOutput("200", "데이터를 이동하던 중 기존 데이터셋의 파일을 삭제하는데 실패했습니다.\n삭제를 다시 시도해주세요.");
//		}
//
//		return Output.JsonOutput("200", "이동에 성공하였습니다.");
//
//	}
	
	// 데이터 이동
	public Object updateDataInId(DataVO dataVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if (dataVO.getDataset_id() == null || dataVO.getDataset_id().length() <= 0) {
			return Output.JsonOutput("4061", "데이터셋 ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		if (dataVO.getTarget_dataset_id() == null || dataVO.getTarget_dataset_id().length() <= 0) {
			return Output.JsonOutput("4061", "유효하지 않은 접근입니다. 새로 고침 후 다시 시도해주시길 바랍니다.");
		}

		String datasetId = dataVO.getDataset_id();
		String targetDatasetId= dataVO.getTarget_dataset_id();
		
		DataVO moveDataVO = new DataVO();
		moveDataVO.setDataset_id(datasetId);
		moveDataVO.setTarget_dataset_id(targetDatasetId);
		
		dataDao.updateDataByDatasetId(moveDataVO);

		return Output.JsonOutput("200", "이동에 성공하였습니다.");
	}

	public Object getMetaList(MetaVO metaVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
		}
		Object result = dataDao.getMetaList(metaVO);
		return Output.JsonOutput("200", result);
	}

	public Object updateMeta(MetaVO metaVO) throws CustomException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if(metaVO.getInfo() == null || metaVO.getInfo().length() <= 0) {
			return Output.JsonOutput("4061", "라벨을 등록해주세요.");
		}
		JSONParser jp = new JSONParser();
		JSONArray jArr = null;

		try {
			jArr = (JSONArray) jp.parse(metaVO.getInfo());
		} catch (ParseException e) {
			throw new CustomException("4091#유효하지 않은 접근입니다.\n새로고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의 해주시길 바랍니다.");
		}

		List<MetaVO> metaList = null;
		
		try {
			metaList = parseMetaInfo(jArr);
		} catch (Exception e) {
			throw new CustomException("4091#유효하지 않은 접근입니다.\n새로고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의 해주시길 바랍니다.");
		}
		
		if(metaList == null || metaList.isEmpty() || metaList.size() <= 0) {
			throw new CustomException("4091#유효하지 않은 접근입니다.\n새로고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의 해주시길 바랍니다.");
		}
	
		if (metaVO.getStay_flag() != null && metaVO.getStay_flag().equals("1")) {
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("metaList", metaList);
			int cnt = dataDao.insertMeta(hm);
			if (cnt != metaList.size()) {
				throw new CustomException("4091#유효하지 않은 접근입니다.\n새로고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의 해주시길 바랍니다.");
			}

		} else if (metaVO.getStay_flag() != null && metaVO.getStay_flag().equals("2")) { // 업데이트만
			for (int i = 0; i < metaList.size(); i++) {
				MetaVO updateMetaVO = metaList.get(i);
				int cnt = dataDao.updateMeta(updateMetaVO);
				if (cnt != 1) {
					throw new CustomException("4004#등록이 올바르지 않습니다.");
				}
			}
//			return Output.JsonOutput("200", metaList);

		} else { // 기본
			dataDao.deleteMetaList(metaVO); // 지우고
			if (jArr.size() <= 0) { // 없으면 바로 리턴
				return Output.JsonOutput("200", "등록이 완료되었습니다");
			}
			// 있으면 인서트
			if (metaList.size() <= 0) { // 있어야 하는데 없으면...
				return Output.JsonOutput("200", "등록이 완료되었습니다");
			}
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("metaList", metaList);

			int cnt = dataDao.insertMeta(hm);
			if (cnt != metaList.size()) {
				throw new CustomException("4001#등록이 올바르지 않습니다.");
			}
		}

		return Output.JsonOutput("200", "등록이 완료되었습니다");
	}
	
	private List<MetaVO> parseMetaInfo(JSONArray jArr) throws IOException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			logger.error("parseMetaInfo getUser_id() is null!");
			return null;
		}

		if (jArr == null || jArr.size() <= 0 || jArr.isEmpty()) {
			return null;
		}
		
		List<MetaVO> metaList = new ArrayList<MetaVO>();
		String gDataId = null;
		
		for (int i = 0; i < jArr.size(); i++) {
			JSONObject json = (JSONObject) jArr.get(i);
			if (json == null) {
				continue;
			}
			if(json.get("data_id") == null || ((String)json.get("data_id")).length() <= 0) {
				logger.error("parseMetaInfo data_id is null!");
				continue;
			}

			String lDataId = (String) json.get("data_id");
			
			if (gDataId == null || !lDataId.equals(gDataId)) {
				DataVO dataVO = new DataVO();
				dataVO.setData_id(lDataId);
				gDataId = lDataId;
			}

			JSONObject jObj = (JSONObject) jArr.get(i);
			if (jObj.get("meta_id") == null || ((String)jObj.get("meta_id")).length() <= 0) {
				logger.error("parseMetaInfo meta_id is null!");
				continue;
			}
			
			if (jObj.get("label") == null || ((String)jObj.get("label")).length() <= 0) {
				logger.error("parseMetaInfo label is null! meta_id : " + (String)jObj.get("meta_id"));
				continue;
			}
			if (jObj.get("label_type") == null || ((String)jObj.get("label_type")).length() <= 0) {
				logger.error("parseMetaInfo label_type is null! meta_id : " + (String)jObj.get("meta_id"));
				continue;
			}
			
			String metaId = (String) jObj.get("meta_id"); 
			String dataId = (String) jObj.get("data_id");    
			String label = (String) jObj.get("label"); 
			String label_type = (String) jObj.get("label_type");
			String segmentation = null;
					
			MetaVO metaTempVO = new MetaVO();
			metaTempVO.setMeta_id(metaId);
			metaTempVO.setData_id(dataId);
			metaTempVO.setLabel(label);
			metaTempVO.setLabel_type(label_type);
			metaTempVO.setUser_id(userInfo.getUser_id());
			
			if(label_type.equals("IMAGE_BBOX")) {
				if (jObj.get("width") == null || ((String)jObj.get("width")).length() <= 0) {
					logger.error("parseMetaInfo width is null Error! meta_id : " + (String)jObj.get("meta_id"));
					continue;
				}
				if (jObj.get("height") == null || ((String)jObj.get("height")).length() <= 0) {
					logger.error("parseMetaInfo height is null Error! meta_id : " + (String)jObj.get("meta_id"));
					continue;
				}
				if (jObj.get("left") == null || ((String)jObj.get("left")).length() <= 0) {
					logger.error("parseMetaInfo left is null Error! meta_id : " + (String)jObj.get("meta_id"));
					continue;
				}
				if (jObj.get("top") == null || ((String)jObj.get("top")).length() <= 0) {
					logger.error("parseMetaInfo top is null Error! meta_id : " + (String)jObj.get("meta_id"));
					continue;
				}
				
				String w = ((String) jObj.get("width")).split("\\.")[0];   
				String h = ((String) jObj.get("height")).split("\\.")[0];  
				String x = ((String) jObj.get("left")).split("\\.")[0];    
				String y = ((String) jObj.get("top")).split("\\.")[0];  
				metaTempVO.setInfo(x + "," + y + "," + w + "," + h);
				metaList.add(metaTempVO);
			} else if(label_type.equals("IMAGE_SEGMENTATION")) {
				JSONArray jArray = new JSONArray();
				JSONObject jsonObj = new JSONObject();

				if(jObj.get("box") == null || ((String)jObj.get("box")).length() <= 0) {
					logger.error("parseMetaInfo box is null Error! meta_id : " + (String)jObj.get("meta_id"));
					continue;
				}
		
//				segmentation = (String)jObj.get("segmentation");
//				segmentation = segmentation.substring(1, segmentation.length() - 1);
				//segmentation = segmentation.replace("\"", "");
//				System.out.println("jsonObj : " + jsonObj.toJSONString());
//				segmentation = jObj.get("segmentation").toString();
				
				jsonObj.put("segmentation",(String)jObj.get("segmentation"));
				jsonObj.put("box", (String)jObj.get("box"));
				jArray.add(jsonObj);
//				jsonObj.put("box", x+","+y+","+w+","+h);
//				MetaVO metaTempVO = new MetaVO();
//				metaTempVO.setMeta_id(metaId);
//				metaTempVO.setData_id(dataId);
//				metaTempVO.setLabel(label);
//				metaTempVO.setLabel_type(label_type);
				String jArrayString = jArray.toJSONString();
				jArrayString = jArrayString.replace("\"[", "[");
				jArrayString = jArrayString.replace("]\"", "]");
				jArrayString = jArrayString.replace("\\", "");
				metaTempVO.setInfo(jArrayString);
//				metaTempVO.setUser_id(userInfo.getUser_id());
				metaList.add(metaTempVO);	
			} else if(label_type.equals("VIDEO_BBOX")) {
				
			}

		}
		return metaList;
	}

	//////
//	
//	public Object updateMeta(MetaVO metaVO) throws Exception {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		JSONParser jp = new JSONParser();
//		JSONArray jArr = (JSONArray)jp.parse(metaVO.getInfo());
//		List<MetaVO> metaList = new ArrayList<MetaVO>();
//		if(jArr.size() <= 0) {
//			dataDao.deleteMetaList(metaVO);
//			return Output.JsonOutput("200", "등록이 완료되었습니다");
////			throw new Exception("4007#등록이 올바르지 않습니다.");
//		}
//		
//		String path = XLABELLER_ROOT_PATH;
//
//		// 메타정보의 data_id를 통해 이미지 path가져옴
//		DataVO dataVO = new DataVO();
//		dataVO.setId(   (String)((JSONObject)jArr.get(0)).get("data_id")  );
//		DataVO rDataVO = dataDao.getDataById(dataVO);
//		String imgPath = path + rDataVO.getPath();
//		String metaId = null;
//		BufferedImage originalImgage = ImageIO.read(new File(imgPath));
//				
//		for(int i = 0 ; i < jArr.size() ; i++) {
//			
//			JSONObject jObj = (JSONObject)jArr.get(i);
//			metaId = (String)jObj.get("meta_id");
//			String dataId = (String)jObj.get("data_id");
//			String w = ((String)jObj.get("width")).split("\\.")[0];
//			String h = ((String)jObj.get("height")).split("\\.")[0];
//			String x = ((String)jObj.get("left")).split("\\.")[0];
//			String y = ((String)jObj.get("top")).split("\\.")[0];
//			String label = (String)jObj.get("label");
//			String segmentation = null;
//			if(jObj.get("segmentation") != null) {
//				segmentation = (String)jObj.get("segmentation");
//			}
//			
//			
//			//크롭 base64
//			String b64 = cropImageToBase64(originalImgage,Integer.valueOf(x).intValue(), Integer.valueOf(y).intValue(), Integer.valueOf(w).intValue(), Integer.valueOf(h).intValue() );
//			
//			metaVO.setData_id(dataId);
//			
//			MetaVO metaTempVO = new MetaVO();
//			metaTempVO.setData_id(dataId);
//			metaTempVO.setLabel(label);
//			metaTempVO.setInfo(x+","+y+","+w+","+h);
//			metaTempVO.setCrop_img(b64);
//			metaTempVO.setSegmentation(segmentation);
//			metaList.add(metaTempVO);
//			
//		}
//		
//		if(metaVO.getStay_flag() == null || metaVO.getStay_flag().equals("0") || metaVO.getStay_flag().equals("")   ) {
//			dataDao.deleteMetaList(metaVO);
//		}
//		
//		HashMap<String, Object> hm = new HashMap<String, Object>();
//		hm.put("metaList", metaList);
//		if(metaList.size() <= 0) {
//			return Output.JsonOutput("200", "등록이 완료되었습니다");
////			throw new Exception("4005#등록이 올바르지 않습니다.");
//		}
//		
//		if(metaVO.getStay_flag() != null && metaVO.getStay_flag().equals("2")) {
//			MetaVO updateMetaVO = new MetaVO();
//			updateMetaVO.setId(metaId);
//			updateMetaVO.setCrop_img(metaList.get(0).getCrop_img());
//			updateMetaVO.setLabel(metaList.get(0).getLabel());
//			updateMetaVO.setInfo(metaList.get(0).getInfo());
//			updateMetaVO.setSegmentation(metaList.get(0).getSegmentation());
//			int cnt = dataDao.updateMeta(updateMetaVO);
//			if(cnt != 1) {
//				throw new Exception("4004#등록이 올바르지 않습니다.");
//			}
//			
//		}else {
//			int cnt = dataDao.insertMeta(hm);
//			if(cnt != metaList.size()) {
//				throw new Exception("4003#등록이 올바르지 않습니다.");
//			}
//		}
//		
//		
//		return Output.JsonOutput("200", "등록이 완료되었습니다");
//
//		
//		
//		
//	}

	/////

	public Object updateMoveMetaByDataId(MetaMoveVO metaMoveVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if (metaMoveVO.getSource() == null || metaMoveVO.getSource().length() <= 0) {
			logger.error("updateMoveMetaByDataId metaMoveVO.getSource is null!");
			return Output.JsonOutput("4061", "복사할 데이터 ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		if (metaMoveVO.getTarget() == null || metaMoveVO.getTarget().length() <= 0) {
			logger.error("updateMoveMetaByDataId metaMoveVO.getTarget is null!");
			return Output.JsonOutput("4061", "복제할 데이터 ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}

		MetaMoveVO mmVO = new MetaMoveVO();
		String[] srcArr = metaMoveVO.getSource().split(",");
		String[] targetArr = metaMoveVO.getTarget().split(",");

		if (srcArr == null || srcArr.length <= 0) {
			logger.error("updateMoveMetaByDataId srcArr Null!");
			return Output.JsonOutput("4061", "복사할 데이터 ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		if (targetArr == null || targetArr.length <= 0) {
			logger.error("updateMoveMetaByDataId targetArr Null!");
			return Output.JsonOutput("4061", "복제할 데이터 ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		if (srcArr.length != targetArr.length) {
			return Output.JsonOutput("4071", "이동할 데이터 개수가 올바르지 않습니다");
		}

		for (int i = 0; i < srcArr.length; i++) {
			mmVO.setLabel(metaMoveVO.getLabel());
			mmVO.setSource(srcArr[i]);
			mmVO.setTarget(targetArr[i]);
			dataDao.updateMovelMetaByDataId(mmVO);
		}

		return Output.JsonOutput("200", "등록이 완료되었습니다");
	}

	private String cropImageToBase64(BufferedImage bi, int x, int y, int w, int h) {
		BufferedImage subImgage = bi.getSubimage(x, y, w, h);
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		byte[] imageBytes = null;
		byte[] b64String = null;
		try {
			ImageIO.write(subImgage, "jpg", bos);
			imageBytes = bos.toByteArray();
			Encoder e = Base64.getEncoder();
			b64String = e.encode(imageBytes);
			bos.close();
			return new String(b64String);
		} catch (IOException e) {
//            e.printStackTrace();
			logger.error("cropImageToBase64 Error! ", e);
		} finally {
			imageBytes = null;
			b64String = null;
			subImgage = null;
			bos = null;
		}
		return null;
	}

	public Object getSearchAnnotationVisionList(MetaVO metaVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		
		Object result = dataDao.getSearchAnnotationVisionList(metaVO);
		return Output.JsonOutput("200", result);
	}
	
	public Object getSearchVideoAnnotationVisionList(MetaVO metaVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		
		Object result = dataDao.getSearchVideoAnnotationVisionList(metaVO);
		return Output.JsonOutput("200", result);
	}
	
	public Object getSearchVisionList(MetaVO metaVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		
		//페이징
		int count = dataDao.getSearchVisionListTotalCount(metaVO);
		int size = 50;
		int pageStart = 0;

		if(metaVO.getPage_num() != null && !metaVO.getPage_num().equals("")) {
			try {
				pageStart = Integer.valueOf(metaVO.getPage_num()).intValue();
			} catch (NumberFormatException e) {
				logger.error("DataService getDatasetList Error!", e);
				pageStart = 0;
			}
		}
		
		
		metaVO.setPage_num(String.valueOf(pageStart * size));
		metaVO.setPage_size(String.valueOf(size));
		metaVO.setTotal_size(String.valueOf(count));
		
		Object result = dataDao.getSearchVisionList(metaVO);
		return Output.JsonOutput("200", result);
	}

	public Object insertMetaByInference(MetaVO metaVO) throws CustomException {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(metaVO.getDataset_id() == null || metaVO.getDataset_id().length() <= 0) {
			return Output.JsonOutput("4061", "데이터셋 ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		if (metaVO == null || metaVO.getInfo() == null || metaVO.getInfo().length() <= 0) {
			return Output.JsonOutput("4061", "info 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		if (metaVO == null || metaVO.getTask_id() == null || metaVO.getTask_id().length() <= 0) {
			return Output.JsonOutput("4061", "Task ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		DatasetVO datasetVO = new DatasetVO();
		datasetVO.setDataset_id(metaVO.getDataset_id());
		DatasetVO findDatasetVO = dataDao.getDatasetById(datasetVO);
		
		if(findDatasetVO == null || findDatasetVO.getLabel_type() == null || findDatasetVO.getLabel_type().length() <= 0) {
			logger.error("label_type is null! dataset_id : " + metaVO.getDataset_id());
			return Output.JsonOutput("4071", "복제하려는 데이터셋이 손상되었습니다.");
		}
		
		if(!(findDatasetVO.getLabel_type().equals("IMAGE_SEGMENTATION") || findDatasetVO.getLabel_type().equals("IMAGE_BBOX") || findDatasetVO.getLabel_type().equals("VIDEO_BBOX"))) {
			logger.error("label_type error! dataset_id : " + metaVO.getDataset_id() + " label_type : " + metaVO.getLabel_type());
			return Output.JsonOutput("4071", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시길 바랍니다.");
		}
		
		HashMap<String, String> pathMap = new HashMap<String, String>();
		List<MetaVO> metaList = new ArrayList<MetaVO>();
		boolean check = false;
		
		JSONParser jp = new JSONParser();
		JSONArray jArr = null;

		try {
			jArr = (JSONArray) jp.parse(metaVO.getInfo());
		} catch (ParseException e) {
			//logger.error("insertMetaByInference ParseExcepton Error!", e);
			throw new CustomException("4001#메타데이터가 올바르지 않습니다.");
		}
		
		if (jArr.size() <= 0 || jArr.isEmpty()) {
			throw new CustomException("4001#등록이 올바르지 않습니다.");
		}

		DataVO dataVO = new DataVO();
		dataVO.setDataset_id(metaVO.getDataset_id());
		dataVO.setPage_num("0");
		dataVO.setPage_size("99999");

		List<DataVO> originalList = dataDao.getDataList(dataVO);
		if (originalList == null || originalList.size() <= 0 || originalList.isEmpty()) {
			throw new CustomException("4001#등록이 올바르지 않습니다.");
		}
		
		Map<String, String> dataMap = new HashMap<String, String>();
		for (int i = 0; i < originalList.size(); i++) {
			dataMap.put(originalList.get(i).getPath(), "1");
		}
		
		if (findDatasetVO.getLabel_type().equals("IMAGE_SEGMENTATION") || findDatasetVO.getLabel_type().equals("IMAGE_BBOX")) {
			TaskVO taskVO = new TaskVO();
			taskVO.setTask_id(metaVO.getTask_id());
			TaskVO findTaskVO = taskDao.getTaskById(taskVO);
			if(findTaskVO == null) {
				logger.error("findTaskVO is null! task_id : " + metaVO.getTask_id());
				return Output.JsonOutput("4071","유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시길 바랍니다.");
			}
			if(findTaskVO.getProject_id() == null || findTaskVO.getProject_id().length() <= 0) {
				logger.error("findTaskVO proejct_id is null! task_id : " + metaVO.getTask_id());
				return Output.JsonOutput("4071","유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시길 바랍니다.");
			}
			if(findTaskVO.getTask_id() == null || findTaskVO.getTask_id().length() <= 0) {
				logger.error("findTaskVO task_id is null! task_id : " + metaVO.getTask_id());
				return Output.JsonOutput("4071","유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시길 바랍니다.");
			}
			String resultPath = "";
			if("single".equals(metaVO.getType())) {
				resultPath = WORKSPACE_PATH + "semi_auto/result/" + metaVO.getPath();
			} else {
				resultPath = WORKSPACE_PATH + findTaskVO.getProject_id() + "/" + findTaskVO.getTask_id() + "/result/" + metaVO.getPath();
			}
			CsvReader cr = new CsvReader(resultPath);
			List<InferenceResultVO> resultList = cr.read();
			if (resultList == null || resultList.isEmpty() || resultList.size() <= 0) {
				return Output.JsonOutput("4071", "사용 가능한 데이터가 없습니다.");
			}

			for (int i = 0; i < resultList.size(); i++) {
				InferenceResultVO irVO = resultList.get(i);
				if(irVO.getX() == null || irVO.getX().length() <= 0) {
					continue;
				}
				if(irVO.getY() == null || irVO.getY().length() <= 0) {
					continue;				
				}
				if(irVO.getW() == null || irVO.getW().length() <= 0) {
					continue;
				}
				if(irVO.getH() == null || irVO.getH().length() <= 0) {
					continue;
				}

				String imgPath = irVO.getImg_path();
				String x = irVO.getX();
				String y = irVO.getY();
				String x2 = irVO.getW();
				String y2 = irVO.getH();
				String info = null;
				String w = null;
				String h = null;

				try {
					w = String.valueOf(Double.parseDouble(x2) - Double.parseDouble(x));
					h = String.valueOf(Double.parseDouble(y2) - Double.parseDouble(y));
				} catch (NumberFormatException e) {
					continue;
					//throw new CustomException("4091#유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시길 바랍니다.");
				}

				String label = irVO.getLabel();

				StringBuffer infoSb = new StringBuffer();
				infoSb.append(x + "," + y + "," + w + "," + h);

				info = infoSb.toString();

				if (findDatasetVO.getLabel_type().equals("IMAGE_SEGMENTATION")) {
					if (irVO.getSegmentation() == null || irVO.getSegmentation().length() <= 0) {
						continue;
					}
					JSONArray jArray = new JSONArray();
					JSONObject jObj = new JSONObject();
					String seg = irVO.getSegmentation();
					jObj.put("box", info);
					jObj.put("segmentation", seg);
					jArray.add(jObj);
					info = jArray.toJSONString();
					info = info.replace("\"[", "[");
					info = info.replace("]\"", "]");
					info = info.replace("x:", "\"x\":");
					info = info.replace("y:", "\"y\":");
				}

				pathMap.put(imgPath, "1");

				MetaVO metaTempVO = new MetaVO();
				metaTempVO.setData_id(imgPath);
				metaTempVO.setLabel(label);
				metaTempVO.setInfo(info);
				metaTempVO.setLabel_type(findDatasetVO.getLabel_type());
				metaList.add(metaTempVO);

			}
		} else if(findDatasetVO.getLabel_type().equals("VIDEO_BBOX")) {
			// VIDEO_BBOX는 데이터가 커서 json형태로 클라이언트에서 보내주지 못하기 때문에 직접 파일을 읽어 파싱
			TaskVO taskVO = new TaskVO();
			taskVO.setTask_id(metaVO.getTask_id());
			TaskVO findTaskVO = taskDao.getTaskById(taskVO);
			if(findTaskVO == null) {
				return Output.JsonOutput("4071", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시길 바랍니다.");
			}
			if(findTaskVO.getTask_id() == null || findTaskVO.getTask_id().length() <= 0) {
				return Output.JsonOutput("4071", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시길 바랍니다.");
			}
			if(findTaskVO.getProject_id() == null || findTaskVO.getProject_id().length() <= 0) {
				return Output.JsonOutput("4071", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시길 바랍니다.");
			}
			
			String projectId = findTaskVO.getProject_id();
			String taskId = findTaskVO.getTask_id();
			
			//Map<String, String> inferenceResultMap = null;
			String WORKSPACE_PATH = "/usr/local/uploadFile/xlabeller/workspace/";
			JSONReader jReader = new JSONReader(WORKSPACE_PATH + projectId + "/" + taskId + "/result/" + metaVO.getPath());
			Map<String, String> inferenceResultMap = jReader.videoBoxInferenceRead();
			
			int i = 0;
			for (String key : inferenceResultMap.keySet()) {
				if (!dataMap.containsKey(inferenceResultMap.get(key))) {
					check = true;
					continue;
				}

				String imgPath = inferenceResultMap.get(key);
				
				String jStr = (String) jArr.get(i++);
				String[] arr = jStr.split(",");
				if(arr.length != 7) { // s.kim 210603 수정 6 -> 7, seg정보때문에 info 7개임 path,좌표4,label, seg 정보 
					continue;
				}
				if(arr[5] == null || arr[5].length() <= 0) {
					continue;
				}
				
				pathMap.put(imgPath, "1");

				MetaVO metaTempVO = new MetaVO();
				metaTempVO.setData_id(imgPath);
				metaTempVO.setLabel(arr[5]);
				metaTempVO.setInfo(key);
				metaTempVO.setUser_id(userInfo.getUser_id());
				metaTempVO.setLabel_type(findDatasetVO.getLabel_type());
				metaList.add(metaTempVO);
			}
		}
		
		/////// 패스로 아이디 가져와서 매핑
		List<String> pathList = new ArrayList<String>(pathMap.keySet());
		if (pathList == null || pathList.size() <= 0 || pathList.isEmpty()) {
			throw new CustomException("4001#일치하는 데이터가 없어 Inference할 수 없습니다.");
		}
		StringBuffer sb = new StringBuffer();
		
		for (int i = 0; i < pathList.size(); i++) {
			if (i == 0) {
				sb.append("'" + pathList.get(i) + "'");
			} else {
				sb.append(",'" + pathList.get(i) + "'");
			}
		}
		
		DataVO inputDataVO = new DataVO();
		inputDataVO.setPath(sb.toString());
		inputDataVO.setDataset_id(metaVO.getDataset_id());
		List<DataVO> dataList = dataDao.getDataListInPath(inputDataVO);
		if (dataList == null || dataList.isEmpty() || dataList.size() <= 0) {
			throw new CustomException("4001#일치하는 데이터가 없어 Inference할 수 없습니다.");
		}
		
		DataVO tempDataVO = null;
		for (int i = 0; i < dataList.size(); i++) {
			tempDataVO = dataList.get(i);
			pathMap.put(tempDataVO.getPath(), tempDataVO.getData_id());
		}
		/////// 패스아이디 대신 데이터 아이디로 변환
		MetaVO tempMetaVO = null;
		for (int i = 0; i < metaList.size(); i++) {
			tempMetaVO = metaList.get(i);
			tempMetaVO.setData_id(pathMap.get(tempMetaVO.getData_id()));
		}

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("metaList", metaList);
		if (metaList.isEmpty() || metaList.size() <= 0) {
			throw new CustomException("4001#등록이 올바르지 않습니다.");
		}

		int cnt = dataDao.insertMeta(hm);
		if (cnt != metaList.size()) {
			throw new CustomException("4001#등록이 올바르지 않습니다.");
		}

		if (check == true) {
			return Output.JsonOutput("200", "삭제된 Data를 제외하고 등록이 완료되었습니다.\nDataset을 다시 확인해주세요.");
		}
		
		return Output.JsonOutput("200", "등록이 완료되었습니다.");

	}

	public Object getLabelGroup(MetaVO metaVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		Object result = dataDao.getLabelGroup(metaVO);
		return Output.JsonOutput("200", result);
	}

//	public Object importDataset(ImportDatasetVO importDatasetVO) throws Exception {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
//		}
//		if(importDatasetVO.getTitle() == null || importDatasetVO.getTitle().length() <= 0) {
//			return Output.JsonOutput("4051", "타이틀(제목)이 존재하지 않습니다.");
//		}
//		if(importDatasetVO.getContents() == null || importDatasetVO.getContents().length() <= 0) {
//			return Output.JsonOutput("4051","컨텐츠(내용)이 존재하지 않습니다");
//		}
//		DatasetVO datasetVO = new DatasetVO();
//		datasetVO.setContents(importDatasetVO.getContents());
//		datasetVO.setTitle(importDatasetVO.getTitle());
////		datasetVO.setLabel_type(importDatasetVO.getLabel_type());
//		datasetVO.setUser_id(userInfo.getUser_id());
//		datasetVO.setMedia_type("IMAGE");
//		datasetVO.setStatus("1");
//
//		int cnt = dataDao.insertDataset(datasetVO);
//		if (cnt != 1) {
//			throw new Exception("4001#등록이 올바르지 않습니다.");
//		}
//
//		if (importDatasetVO.getFiles() == null || importDatasetVO.getFiles().length <= 0) {
//			return Output.JsonOutput("200", "등록이 완료되었습니다");
//		}
//
//		if (datasetVO == null || datasetVO.getDataset_id() == null || datasetVO.getDataset_id().length() <= 0) {
//			throw new Exception("4001#등록이 올바르지 않습니다.");
//		}
//		String datasetId = datasetVO.getDataset_id();
//
//		FileDecompress fd = new FileDecompress();
//
//		fd.open(importDatasetVO.getFiles()[0].getInputStream(), XLABELLER_ROOT_PATH + "dataset/", "dataset/",
//				importDatasetVO.getIs_new());
//		fd.proc();
//		List<String> pathList = fd.getPath();
//		List<String> originalPathList = fd.getOriginalPath();
//		JSONArray jArr = fd.getMeta();
//		if (pathList == null || pathList.isEmpty() || pathList.size() <= 0) {
//			throw new Exception("4001#등록이 올바르지 않습니다.");
//		}
//		if (jArr == null || jArr.isEmpty() || jArr.size() <= 0) {
//			throw new Exception("4007#지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다.");
//		}
//		/////
//		// 썸네일
//		String tempPath = null;
//		StringBuffer sb = null;
//		for (int i = 0; i < pathList.size(); i++) {
//			tempPath = pathList.get(i);
//			sb = new StringBuffer(tempPath);
//			int lastIndex = sb.lastIndexOf(".");
//			sb.insert(lastIndex, "_tb");
//
//			Thumbnails.of(new File(XLABELLER_ROOT_PATH + tempPath)).size(100, 100).outputQuality(0.8)
//					.toFile(new File(XLABELLER_ROOT_PATH + sb));
//		}
//
//		////
//
//		////
//		HashMap<String, String> dataPathMap = new HashMap<String, String>();
//		DataVO inputDataVO = new DataVO();
//		for (int i = 0; i < pathList.size(); i++) {
//			// import 수정되어야 함.
//			inputDataVO.setDataset_id(datasetId);
//			inputDataVO.setPath(pathList.get(i));
//			inputDataVO.setMedia_type("IMAGE");
//			inputDataVO.setWidth(null);
//			inputDataVO.setHeight(null);
//			inputDataVO.setFps("1");
//			inputDataVO.setStatus("1");
//			inputDataVO.setFilename(originalPathList.get(i));
//			inputDataVO.setFrame("1");
//			inputDataVO.setDuration("0");
//			inputDataVO.setConfirm_status("1");
//			inputDataVO.setUser_id(userInfo.getUser_id());
//			cnt = dataDao.insertDataOne(inputDataVO);
//			if (cnt != 1) {
//				throw new Exception("4002#등록이 올바르지 않습니다.");
//			}
//			dataPathMap.put(pathList.get(i), inputDataVO.getData_id());
//		}
//
//		//
//
//		List<MetaVO> metaList = new ArrayList<MetaVO>();
////		if(jArr.size() <= 0) {
////			throw new Exception("4007#지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다.");
////		}
//		datasetVO.setLabel_type("IMAGE_SEGMENTATION");
//		JSONObject json = (JSONObject) jArr.get(0);
//		if (json == null) {
//			throw new Exception("4002#등록이 올바르지 않습니다.");
//		}
//		if (json.get("segmentation") == null || json.get("segmentation").toString().length() <= 0) {
//			datasetVO.setLabel_type("IMAGE_BBOX");
//		}
//		int update_cnt = dataDao.updateDataset(datasetVO);
//		if (update_cnt != 1) {
//			throw new Exception("4056#업데이트가 올바르지 않습니다.");
//		}
////		String path = XLABELLER_ROOT_PATH;
//
//		// 메타정보의 data_id를 통해 이미지 path가져옴
//
//		for (int i = 0; i < jArr.size(); i++) {
//			DataVO dataVO = new DataVO();
//			JSONObject jObj = (JSONObject) jArr.get(i);
//			String dataPath = (String) (jObj.get("path"));
//			if (dataPath == null || dataPath.length() <= 0) {
//				throw new Exception("4002#압축된 파일에 손상된 파일이 포함되어있습니다.\n파일을 확인 후 다시 시도해주세요.");
//			}
////			String dataPath = (String) (jObj.get("path"));
////			if (dataPath == null || dataPath.length() <= 0 || dataPath.equals("")) {
////				continue;
////			}
//
//			String dataId = dataPathMap.get(dataPath);
//			if (dataId == null || dataPath.length() <= 0 || dataPath.equals("")) {
//				continue;
//			}
//
//			dataVO.setData_id(dataId);
//
////			String imgPath = path + dataPath;
//
////			BufferedImage originalImgage = ImageIO.read(new File(imgPath));
//			
//			String w = (String) jObj.get("w");
//			if(w == null || w.length() <= 0) {
//				continue;
//			}
//			String h = (String) jObj.get("h");
//			if(h == null || h.length() <= 0) {
//				continue;
//			}
//			String x = (String) jObj.get("x");
//			if(x == null || x.length() <= 0) {
//				continue;
//			}
//			String y = (String) jObj.get("y");
//			if(y == null || y.length() <= 0) {
//				continue;
//			}
//			String label = (String) jObj.get("label");
//			if(label == null || label.length() <= 0) {
//				continue;
//			}
//			String seg = (String) jObj.get("segmentation");
//			String info = null;
//			if(seg != null && !(seg.length() <= 0)) {
//				String box = x + "," + y + "," + w + "," + h;
//				JSONObject segJson = new JSONObject();
//				segJson.put("box", box);
//				segJson.put("segmentation", seg);
//				info = segJson.toJSONString();
//			} else {
//				info = x + "," + y + "," + w + "," + h;
//			}
////			String w = ((String) jObj.get("w")).split("\\.")[0];
////			String h = ((String) jObj.get("h")).split("\\.")[0];
////			String x = ((String) jObj.get("x")).split("\\.")[0];
////			String y = ((String) jObj.get("y")).split("\\.")[0];
////			String seg = (String) jObj.get("segmentation");
//
//			// 크롭 base64
////			String b64 = cropImageToBase64(originalImgage,Integer.valueOf(x).intValue(), Integer.valueOf(y).intValue(), Integer.valueOf(w).intValue(), Integer.valueOf(h).intValue() );
//
//			MetaVO metaTempVO = new MetaVO();
//			metaTempVO.setData_id(dataId);
//			metaTempVO.setLabel(label);
//			metaTempVO.setInfo(info);
//			metaTempVO.setUser_id(userInfo.getUser_id());
//			metaTempVO.setLabel_type(datasetVO.getLabel_type());
////			metaTempVO.setCrop_img(b64);
////			metaTempVO.setSegmentation(null);
////			if (seg != null && !(seg.length() <= 0)) {
////				metaTempVO.setSegmentation(seg);
////			}
//			metaList.add(metaTempVO);
//
//		}
//
//		HashMap<String, Object> hm = new HashMap<String, Object>();
//		hm.put("metaList", metaList);
//		if (metaList.size() <= 0) {
//			throw new Exception("4005#등록이 올바르지 않습니다.");
//		}
//
//		cnt = dataDao.insertMeta(hm);
//		if (cnt != metaList.size()) {
//			throw new Exception("4003#등록이 올바르지 않습니다.");
//		}
//
//		return Output.JsonOutput("200", "등록이 완료되었습니다");
//
//	}
	// 수정됨 
	public Object importDataset(ImportDatasetVO importDatasetVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if(importDatasetVO.getTitle() == null || importDatasetVO.getTitle().length() <= 0) {
			return Output.JsonOutput("4061", "타이틀(제목)이 존재하지 않습니다.");
		}
		if(importDatasetVO.getContents() == null || importDatasetVO.getContents().length() <= 0) {
			return Output.JsonOutput("4061","컨텐츠(내용)이 존재하지 않습니다");
		}
		
		// 압축해제
		FileDecompress fd = new FileDecompress();
		
		fd.open(importDatasetVO.getFiles()[0].getInputStream(), XLABELLER_ROOT_PATH + "dataset/", "dataset/",
				importDatasetVO.getIs_new());
		fd.proc();
		// 압축파일의 data.json파일이 JSON형태로 반환
		
		// IMAGE_SEGMENTATION, IMAGE_BBOX용
		JSONArray jArr = fd.getMeta();
		
		if (jArr == null || jArr.isEmpty() || jArr.size() <= 0) {
			throw new Exception("4001#지원하지 않는 데이터 포맷입니다. 지속적으로 발생시 문의 부탁드립니다.");
		}
		
//		String label_type = importDatasetVO.getLabel_type();
		String label_type = (String)((JSONObject)jArr.get(0)).get("label_type");
		if(label_type == null || label_type.length() <= 0) {
			return Output.JsonOutput("4071", "import할 수 없는 파일입니다.");
		}
		
		List<MetaVO> metaList = new ArrayList<MetaVO>();
		
		if(!(label_type.equals("#IMAGE_BBOX") || label_type.equals("#IMAGE_SEGMENTATION") || label_type.equals("#VIDEO_BBOX"))) {
			return Output.JsonOutput("4071", "import할 수 없는 파일입니다.");
		}
		
		if (importDatasetVO.getFiles() == null || importDatasetVO.getFiles().length <= 0) {
			return Output.JsonOutput("200", "등록이 완료되었습니다");
		}

		List<String> pathList = fd.getPath();
		// 파일명
		HashMap<String, String> originalPathList = fd.getOriginalPath();
		if (pathList == null || pathList.isEmpty() || pathList.size() <= 0) {
			throw new Exception("4001#등록이 올바르지 않습니다.");
		}
		
		if (originalPathList == null || originalPathList.isEmpty() || originalPathList.size() <= 0) {
			throw new Exception("4001#등록이 올바르지 않습니다.");
		}
		// dataset생성까지 공통된 플로우
		if (label_type.equals("#IMAGE_BBOX") || label_type.equals("#IMAGE_SEGMENTATION")) {
			// IMAGE_BBOX, IMAGE_SEGMENTATION일 때
			label_type = label_type.substring(1);
			DatasetVO datasetVO = new DatasetVO();
			datasetVO.setContents(importDatasetVO.getContents());
			datasetVO.setTitle(importDatasetVO.getTitle());
			datasetVO.setUser_id(userInfo.getUser_id());
			datasetVO.setLabel_type(label_type);
			datasetVO.setMedia_type("IMAGE");
			datasetVO.setStatus("1");

			int cnt = dataDao.insertDataset(datasetVO);
			if (cnt != 1) {
				throw new Exception("4001#등록이 올바르지 않습니다.");
			}

			if (datasetVO == null || datasetVO.getDataset_id() == null || datasetVO.getDataset_id().length() <= 0) {
				throw new Exception("4001#등록이 올바르지 않습니다.");
			}
			
			String datasetId = datasetVO.getDataset_id();
			
			// 썸네일
//			String tempPath = null;
//			StringBuffer sb = null;
//			for (int i = 0; i < pathList.size(); i++) {
//				tempPath = pathList.get(i);
//				sb = new StringBuffer(tempPath);
//				int lastIndex = sb.lastIndexOf(".");
//				sb.insert(lastIndex, "_tb");
//
//				Thumbnails.of(new File(XLABELLER_ROOT_PATH + tempPath)).size(100, 100).outputQuality(0.8)
//						.toFile(new File(XLABELLER_ROOT_PATH + sb));
//			}

			HashMap<String, String> dataPathMap = new HashMap<String, String>();
			DataVO inputDataVO = new DataVO();
			for (int i = 0; i < pathList.size(); i++) {
				File convFile = null;
				BufferedImage bimg = null;
				
				try {			
					convFile = new File(XLABELLER_ROOT_PATH + pathList.get(i));
					bimg = ImageIO.read(convFile);
					// import 수정되어야 함.
					inputDataVO.setDataset_id(datasetId);
					inputDataVO.setPath(pathList.get(i));
					inputDataVO.setMedia_type("IMAGE");
					inputDataVO.setWidth(String.valueOf(bimg.getWidth()));
					inputDataVO.setHeight(String.valueOf(bimg.getHeight()));
					inputDataVO.setFps("1");
					inputDataVO.setStatus("1");
					if(originalPathList.get(pathList.get(i)) == null || originalPathList.get(pathList.get(i)).length() <= 0) {
						inputDataVO.setFilename(pathList.get(i));
					} else {
						inputDataVO.setFilename(originalPathList.get(pathList.get(i)));
					}
					inputDataVO.setFrame("1");
					inputDataVO.setDuration("0");
					inputDataVO.setConfirm_status("1");
					inputDataVO.setUser_id(userInfo.getUser_id());
					cnt = dataDao.insertDataOne(inputDataVO);
					if (cnt != 1) {
						continue;
						//throw new Exception("4002#등록이 올바르지 않습니다.");
					}
					dataPathMap.put(pathList.get(i), inputDataVO.getData_id());
					
				} catch (IOException e) {
					logger.error("IOException Error!", e);
					continue;
					//throw new Exception("4072#등록이 올바르지 않습니다.");
				} finally {
					bimg.flush();
					bimg = null;
				}
			}

			// 메타정보의 data_id를 통해 이미지 path가져옴

			for (int i = 0; i < jArr.size(); i++) {
				DataVO dataVO = new DataVO();
				JSONObject jObj = (JSONObject) jArr.get(i);
				String dataPath = (String) (jObj.get("path"));
				if (dataPath == null || dataPath.length() <= 0) {
					throw new Exception("4001#압축된 파일에 손상된 파일이 포함되어있습니다.\n파일을 확인 후 다시 시도해주세요.");
				}

				String dataId = dataPathMap.get(dataPath);
				if (dataId == null || dataPath.length() <= 0 || dataPath.equals("")) {
					continue;
				}

				dataVO.setData_id(dataId);

//				String w = (String) jObj.get("x1");
//				if (w == null || w.length() <= 0) {
//					continue;
//				}
//				String h = (String) jObj.get("h");
//				if (h == null || h.length() <= 0) {
//					continue;
//				}
//				String x = (String) jObj.get("x1");
//				if (x == null || x.length() <= 0) {
//					continue;
//				}
//				String y = (String) jObj.get("y1");
//				if (y == null || y.length() <= 0) {
//					continue;
//				}
				
				int x1 = Integer.valueOf(jObj.get("x1").toString());
				int x2 = Integer.valueOf(jObj.get("x2").toString());
				int y1 = Integer.valueOf(jObj.get("y1").toString());
				int y2 = Integer.valueOf(jObj.get("y2").toString());
				
				String w = String.valueOf(x2 - x1);
				if (w == null || w.length() <= 0) {
					continue;
				}
				String h = String.valueOf(y2 - y1);
				if (h == null || h.length() <= 0) {
					continue;
				}
				String x = String.valueOf(x1);
				if (x == null || x.length() <= 0) {
					continue;
				}
				String y = String.valueOf(y1);
				if (y == null || y.length() <= 0) {
					continue;
				}
				
				String label = (String) jObj.get("className");
				if (label == null || label.length() <= 0) {
					continue;
				}
				if(jObj.get("label_type") == null || ((String)jObj.get("label_type")).length() <= 0) {
					continue;
				}
				if(!(((String)jObj.get("label_type")).equals("#IMAGE_BBOX") || ((String)jObj.get("label_type")).equals("#IMAGE_SEGMENTATION"))) {
					continue;
				}
				
				
				// temperate code : 211123 - k.park
				String info = x + "," + y + "," + w + "," + h;
				
				// original code : 211123 - k.park
//				if(((String)jObj.get("label_type")).equals("#IMAGE_SEGMENTATION")) {
//					JSONArray jsonArray = new JSONArray();
//					seg = (String)jObj.get("segmentation");
//					if(seg == null || seg.length() <= 0) {
//						continue;
//					}
//					String box = x + "," + y + "," + w + "," + h;
//					JSONObject segJson = new JSONObject();
//					segJson.put("segmentation", seg);
//					segJson.put("box", box);
//					jsonArray.add(segJson);
//					String json = jsonArray.toJSONString();
//					info = json.replace("\"[", "[");
//					info = info.replace("]\"", "]");
//					info = info.replace("\\", "");
////					info = segJson.toJSONString();
//					//info = json;
//				} else if(((String)jObj.get("label_type")).equals("#IMAGE_BBOX")) {
//					info = x + "," + y + "," + w + "," + h;
//				}
				
				MetaVO metaTempVO = new MetaVO();
				metaTempVO.setData_id(dataId);
				metaTempVO.setLabel(label);
				metaTempVO.setInfo(info);
				metaTempVO.setUser_id(userInfo.getUser_id());
				String[] split_label_type = ((String)jObj.get("label_type")).split("#");
				if(split_label_type.length < 2) {
					continue;
				}
				metaTempVO.setLabel_type(split_label_type[1]);
				metaList.add(metaTempVO);
			}
		} else if(label_type.equals("#VIDEO_BBOX")) {
			DatasetVO datasetVO = new DatasetVO();
			datasetVO.setContents(importDatasetVO.getContents());
			datasetVO.setTitle(importDatasetVO.getTitle());
			datasetVO.setUser_id(userInfo.getUser_id());
			datasetVO.setLabel_type("VIDEO_BBOX");
			datasetVO.setMedia_type("VIDEO");
			datasetVO.setStatus("1");

			HashMap<String, String> dataPathMap = new HashMap<String, String>();
			int cnt = dataDao.insertDataset(datasetVO);
			if (cnt != 1) {
				throw new Exception("4001#등록이 올바르지 않습니다.");
			}
			for (int i = 0; i < pathList.size(); i++) {
				VideoMetaUtil vmu = new VideoMetaUtil(XLABELLER_ROOT_PATH + pathList.get(i));
				if (!vmu.isAvailable()) {
					continue;
					// throw new Exception("4001#지원하는 동영상 포맷이 아닙니다.");
				}

				String width = String.valueOf(vmu.getWidth());
				String height = String.valueOf(vmu.getHeight());

				DataVO dataVO = new DataVO();
				dataVO.setDataset_id(datasetVO.getDataset_id());
				dataVO.setPath(pathList.get(i));

				dataVO.setMedia_type("VIDEO");
				dataVO.setWidth(String.valueOf(width));
				dataVO.setHeight(String.valueOf(height));
				dataVO.setFps(String.valueOf(vmu.getFps()));
				dataVO.setFilename(originalPathList.get(i));
				dataVO.setStatus("1");
				dataVO.setConfirm_status("0");
				dataVO.setFrame(String.valueOf(vmu.getTotalFrame()));
				dataVO.setDuration(String.valueOf(vmu.getDuration()));
				dataVO.setUser_id(datasetVO.getUser_id());

				int insertDataCnt = dataDao.insertDataOne(dataVO);
				if (insertDataCnt != 1) {
					continue;
					//throw new Exception("4001#등록이 올바르지 않습니다.");
				}
				dataPathMap.put(pathList.get(i), dataVO.getData_id());

			}
			for (int i = 0; i < jArr.size(); i++) {
				JSONObject json = (JSONObject) jArr.get(i);
				String dataPath = (String) (json.get("path"));
				if (dataPath == null || dataPath.length() <= 0) {
					continue;
					//throw new Exception("4001#압축된 파일에 손상된 파일이 포함되어있습니다.\n파일을 확인 후 다시 시도해주세요.");
				}

				String dataId = dataPathMap.get(dataPath);
				if (dataId == null || dataPath.length() <= 0 || dataPath.equals("")) {
					continue;
				}

				String metas = (String)json.get("metas");

				MetaVO metaTempVO = new MetaVO();
				metaTempVO.setData_id(dataId);
				metaTempVO.setLabel((String) json.get("label"));
				metaTempVO.setInfo(metas);
				metaTempVO.setUser_id(userInfo.getUser_id());
				String[] split_label_type = label_type.split("#");
				if(split_label_type.length < 2) {
					continue;
				}
				metaTempVO.setLabel_type(split_label_type[1]);

				metaList.add(metaTempVO);
			}

		}
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("metaList", metaList);
		if (metaList.size() <= 0) {
			throw new Exception("4001#등록이 올바르지 않습니다.");
		}

		int insertMeta_cnt = dataDao.insertMeta(hm);
		if (insertMeta_cnt != metaList.size()) {
			throw new Exception("4001#등록이 올바르지 않습니다.");
		}

		return Output.JsonOutput("200", "등록이 완료되었습니다");

	}

//	
//	FileDecompress fd = new FileDecompress();
//	
//	fd.open(importDatasetVO.getFiles()[0].getInputStream(), XLABELLER_ROOT_PATH+"dataset/","dataset/", importDatasetVO.getIs_new());
//	fd.proc();
//	List<String> pathList = fd.getPath();
//	JSONArray jArr = fd.getMeta();
//	

//	
//	public Object test() {
//		AsyncProcess ap = new AsyncProcess();
//		ap.start();
//		System.out.println("TEST");
//		
//		return null;
//	}
//	

	public String encodingText(String text) {
		if (!Normalizer.isNormalized(text, Normalizer.Form.NFC)) {
			text = Normalizer.normalize(text, Normalizer.Form.NFC);
		}

		byte[] str_byte = text.getBytes();
		UniversalDetector detector = new UniversalDetector(null);
		detector.handleData(str_byte, 0, str_byte.length);
		detector.dataEnd();
		String encoding = detector.getDetectedCharset();

		if (encoding == null || !encoding.equals("UTF-8")) {
			try {
				text = new String(str_byte, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				logger.error("DataService encodingText Error!", e);
			} finally {
				str_byte = null;
			}
		}

		return text;
	}

	public Object getLastCursor(DatasetVO datasetVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}

		DatasetVO dataset = dataDao.getDatasetById(datasetVO);
		if (dataset == null || dataset.getSave_data_id() == null || dataset.getSave_data_id().length() <= 0) {
			return Output.JsonOutput("200", 0);
		}

		DataVO dataVO = new DataVO();
		dataVO.setDataset_id(datasetVO.getDataset_id());
		dataVO.setPage_num("0");
		dataVO.setPage_size("99999");
		dataVO.setStatus("1");
		List<DataVO> dataList = dataDao.getDataList(dataVO);
		int result = 0;
		for (int i = 0; i < dataList.size(); i++) {
			if (dataList.get(i).getData_id() == null || dataList.get(i).getData_id().length() <= 0) {
				result = 0;
				break;
			}
			if (dataset.getSave_data_id().equals(dataList.get(i).getData_id())) {
				result = i;
				break;
			}
		}

		return Output.JsonOutput("200", result);
	}

	public Object getDatasetById(DatasetVO datasetVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		if(datasetVO.getDataset_id() == null || datasetVO.getDataset_id().length() <= 0) {
			return Output.JsonOutput("4061","데이터셋 ID파라미터 값이 유효하지 않습니다.\\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
//		if(datasetVO.getStatus() == null || datasetVO.getStatus().length() <= 0) {
//			return Output.JsonOutput("304", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
//		}
//		if(!datasetVO.getStatus().equals("1")) {
//		s	return Output.JsonOutput("304", "데이터를 업로드 하는 중입니다.\n새로 고침 후 다시 시도해주시길 바랍니다.");
//		}
		Object result = dataDao.getDatasetById(datasetVO);
		return Output.JsonOutput("200", result);
	}
	
	
	
	// 데이터셋 로그 관련	
	public Object getDatasetLogList(DatasetLogVO datasetLogVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
		}
		
		//페이징
		int count = dataDao.getDatasetLogTotalCount(datasetLogVO);
		int size = 50;
		int pageStart = 0;

		if(datasetLogVO.getPage_num() != null && !datasetLogVO.getPage_num().equals("")) {
			try {
				pageStart = Integer.valueOf(datasetLogVO.getPage_num()).intValue();
			} catch (NumberFormatException e) {
				logger.error("DataService getDatasetList Error!", e);
				pageStart = 0;
			}
		}
		
		
		datasetLogVO.setPage_num(String.valueOf(pageStart * size));
		datasetLogVO.setPage_size(String.valueOf(size));
		datasetLogVO.setTotal_size(String.valueOf(count));
		
		
		Object result = dataDao.getDatasetLogList(datasetLogVO);
		return Output.JsonOutput("200", result);
	}
	
	
}
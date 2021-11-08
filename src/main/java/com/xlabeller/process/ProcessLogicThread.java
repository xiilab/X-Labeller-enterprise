package com.xlabeller.process;

import com.xlabeller.common.module.FileDecompress;
import com.xlabeller.common.module.FileUtils;
import com.xlabeller.common.module.GstUtil;
import com.xlabeller.common.module.VideoMetaUtil;
import com.xlabeller.data.DataDao;
import com.xlabeller.models.DataVO;
import com.xlabeller.models.DatasetLogVO;
import com.xlabeller.models.DatasetVO;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.log4j.Logger;
import org.mozilla.universalchardet.UniversalDetector;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.text.Normalizer;
import java.util.*;


public class ProcessLogicThread extends Thread {
	private static Logger logger = Logger.getLogger(ProcessLogicThread.class);
	
	private String XLABELLER_ROOT_PATH = "/usr/local/uploadFile/xlabeller/";
	private String MID_PATH = "dataset/";
	private String TEMP_PATH = "dataset_temp/";
	private int BATCH_SIZE = 50;
	
	
	private DatasetVO datasetVO = null;
	private DataDao dataDao = null;
	
	public ProcessLogicThread(DataDao dataDao, DatasetVO datasetVO) {
		this.dataDao = dataDao;
		this.datasetVO = datasetVO;		
	}
	
	@Override
	public void run() {
		logger.info("Upload Dataset START :: "+ datasetVO.getDataset_id());
		
		if(datasetVO == null || datasetVO.getDataset_id() == null || datasetVO.getDataset_id().isEmpty()) {
			logger.error("ProcessLogicThread>>run>>dataset_id not exist!");
			return;
		}
		if(dataDao == null ) {
			logger.error("ProcessLogicThread>>run>>dataDao not exist!");
			return;
		}
		
		// 작업 권한 획득
		// 무조건 하나의 노드에서만 처리가 되야함.		
		int isAvailable = updateDatasetAvailable();
		if(isAvailable != 1) {
			logger.info("Upload Dataset Access Fail :: "+ datasetVO.getDataset_id());
			return;			
		}
		logger.info("Upload Dataset Access OK :: "+ datasetVO.getDataset_id());
		
		
		
		// 데이터셋 미디어타입
		String mediaType = datasetVO.getMedia_type();
		if(mediaType == null || mediaType.isEmpty() ) {
			logger.error("ProcessLogicThread>>run>>mediaType not exist!");
			insertDatasetLog("데이터셋의 미디어타입이 존재 하지 않음.");
			updateDatasetStatus("4");
			return;
		}
		
		
		// 데이터셋 ID를 가지고와서 임시폴더 경로 정의
		String tempDirPath = XLABELLER_ROOT_PATH+TEMP_PATH+datasetVO.getDataset_id();
		
		List<String> fileList = null;
		try {
			fileList = directoryInFileList(tempDirPath);
		}catch(Exception e) {
			// 임시폴더 접근이 안될때			
			logger.error("directoryInFileList",e);
			insertDatasetLog("업로드 요청 데이터 임시폴더 접근 불가함.");
			updateDatasetStatus("4");
			return;
		}
		
		if(fileList == null || fileList.size() <= 0) { // 처리할 임시파일이 없는경우
			// 디렉토리 삭제
			FileUtils.delete(tempDirPath);
			// 업데이트 수행
			insertDatasetLog("업로드 요청 데이터가 존재하지 않음.");
			updateDatasetStatus("4");			
			
			// 종료
			return;
		}
		
		
		
		// 임시 파일 처리
		List<DataVO> dataList = null;
		if(mediaType.equals("IMAGE")) {  // 이미지 업로드
			imageUploadLogic(tempDirPath, fileList);
		}else if(mediaType.equals("VIDEO")) {  // 비디오 업로드
			videoUploadLogic(tempDirPath, fileList);
		}else {
			insertDatasetLog("데이터셋의 미디어 타입이 오류.");
			updateDatasetStatus("4");
		}
				
		logger.info("Upload Dataset END :: "+ datasetVO.getDataset_id());
	}
	
	private void insertData(List<DataVO> dataList) {
		HashMap<String, Object> hm = new HashMap<String, Object>();		
		hm.put("dataList", dataList);
		
		int cnt = dataDao.insertData(hm);
//		if(cnt != dataList.size()) {
//			throw new Exception("4002#등록이 올바르지 않습니다.");
//		}
	}
	
	
	private void imageUploadLogic(String tempDirPath, List<String> fileList) {
		String filename = null;
		String format = null;
		for(int i = 0 ; i < fileList.size();i++) {
			filename = fileList.get(i);
			format = filename.split("\\.")[filename.split("\\.").length-1];
			
			if(format == null || format.length() != 3 || format.length() != 3) { 
				// 포맷이 불명확할때
				insertDatasetLog("파일 포맷 오류("+filename+")");				
				FileUtils.delete(tempDirPath+"/"+filename);
				continue;
			}
			format = format.toLowerCase();
			
			if(format.equals("zip")) {
				try {
					zipToImageUpload(tempDirPath,filename,datasetVO);					
					// dataList 널처리 필요
				}catch(Exception e){					
					logger.error("zipToImageUpload : "+tempDirPath +"/"+ fileList.get(i),e);
					insertDatasetLog("잘못된 압축 파일 포맷("+filename+")");
					//로그 컬럼에 추가
					//파일 여러개 이기 때문에 컬럼에 상태를 단순하게 넣는건 무의미
//					updateDatasetStatus(datasetVO.getDataset_id(),"4");
					
				}
				
				
			}else if(format.equals("jpg") || format.equals("png")) {
				try {
					imageUpload(tempDirPath,filename,i,datasetVO);						
					// dataList 널처리 필요
				}catch(Exception e){					
					logger.error("imageUpload : "+tempDirPath +"/"+ fileList.get(i),e);
					insertDatasetLog("잘못된 이미지 파일 포맷("+filename+")");
					//로그 컬럼에 추가
					//파일 여러개 이기 때문에 컬럼에 상태를 단순하게 넣는건 무의미
//					updateDatasetStatus(datasetVO.getDataset_id(),"4");
					
				}	
				
			}else if(format.equals("mp4")) {
				try {
					videoToImageUpload(tempDirPath,filename,datasetVO);					
					// dataList 널처리 필요
				}catch(Exception e){
					logger.error("videoToImageUpload : "+tempDirPath +"/"+ fileList.get(i),e);
					insertDatasetLog("비디오 이미지 변환 오류("+filename+")");
					//로그 컬럼에 추가
					//파일 여러개 이기 때문에 컬럼에 상태를 단순하게 넣는건 무의미
//					updateDatasetStatus(datasetVO.getDataset_id(),"4");
					
				}	
			
				
			}else {
				// 포맷이 불명확할때				
				FileUtils.delete(tempDirPath+"/"+filename);
				insertDatasetLog("사용 불가능 파일 포맷("+filename+")");
				continue;
			}
			
			
			
			
			
		}
		
		updateDatasetStatus("1");
	}
	
	private void videoUploadLogic(String tempDirPath, List<String> fileList) {
		String filename = null;
		String format = null;
	
		for(int i = 0 ; i < fileList.size();i++) {
			filename = fileList.get(i);
			format = filename.split("\\.")[filename.split("\\.").length-1];
			
			if(format == null || format.length() != 3 || format.length() != 3) { 
				// 포맷이 불명확할때				
				FileUtils.delete(tempDirPath+"/"+filename);
				insertDatasetLog("파일 포맷 오류("+filename+")");	
				continue;
			}
			format = format.toLowerCase();
			
			if(format.equals("mp4")) {
				try {
					videoUpolad(tempDirPath,fileList.get(i),i,datasetVO);	
					// dataList 널처리 필요
				}catch(Exception e){
					logger.error("videoUpolad : "+tempDirPath +"/"+ fileList.get(i),e);
					insertDatasetLog("비디오 처리 불가능 포맷("+filename+")");	
					//로그 컬럼에 추가
					//파일 여러개 이기 때문에 컬럼에 상태를 단순하게 넣는건 무의미
	//				updateDatasetStatus(datasetVO.getDataset_id(),"4");
	//				throw new Exception("4072#등록이 올바르지 않습니다.");
				}
			}else {
				// 포맷이 불명확할때
				FileUtils.delete(tempDirPath+"/"+filename);
				insertDatasetLog("사용 불가능 파일 포맷("+filename+")");
				continue;
				
			}
		}
		updateDatasetStatus("1");
	}
	
	
	private int updateDatasetAvailable() {
		DatasetVO updateDatasetVO = new DatasetVO();
		updateDatasetVO.setDataset_id(datasetVO.getDataset_id());		
		int cnt = dataDao.updateDatasetAvailable(updateDatasetVO);
		return cnt;
	}
	
	
	
	private int updateDatasetStatus(String status) {
		DatasetVO updateDatasetVO = new DatasetVO();
		updateDatasetVO.setDataset_id(datasetVO.getDataset_id());
		updateDatasetVO.setStatus(status);
		int cnt = dataDao.updateDataset(updateDatasetVO);
		return cnt;
	}
	
	
	
	private int insertDatasetLog(String log) {
		DatasetLogVO insertDatasetLogVO = new DatasetLogVO();
		insertDatasetLogVO.setDataset_id(datasetVO.getDataset_id());
		insertDatasetLogVO.setLog_info(log);
		int cnt = dataDao.insertDatasetLog(insertDatasetLogVO);
		return cnt;
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
	
    
	
	private void createThumbnail(List<DataVO> dataList) throws Exception{
		//썸네일
		String tempPath = null;
		StringBuffer sb = null;
		for(int i = 0 ; i < dataList.size(); i++) {
			tempPath = dataList.get(i).getPath();
			sb = new StringBuffer(tempPath);
			int lastIndex = sb.lastIndexOf(".");
			sb.insert(lastIndex, "_tb");
			
			Thumbnails.of(new File(XLABELLER_ROOT_PATH + tempPath)) 
			.size(100, 100)
			.outputQuality(0.8)				
			.toFile(new File(XLABELLER_ROOT_PATH + sb));
		}
	}
	
	private void zipToImageUpload(String tempDir, String filename, DatasetVO datasetVO) throws Exception {
		List<DataVO> dataList = new ArrayList<DataVO>();
		FileDecompress fd = new FileDecompress();
		FileInputStream fis = new FileInputStream(tempDir+"/"+filename);		
		fd.open( fis, XLABELLER_ROOT_PATH+MID_PATH,"", "true");
		fd.proc();
		List<String> pathList = fd.getPath();
		if(pathList == null || pathList.isEmpty() || pathList.size() <= 0) {
			throw new Exception("4072#등록이 올바르지 않습니다.");
		}
		
		String[] splitStr = null;
		StringBuffer sb = null;
		
		for(int i = 0 ; i < pathList.size() ;i++) {
			DataVO dataVO = new DataVO();
			dataVO.setDataset_id(datasetVO.getDataset_id());
			dataVO.setPath(MID_PATH+pathList.get(i));			
			
			String fileFullName = pathList.get(i);
			String format = fileFullName.split("\\.")[fileFullName.split("\\.").length-1];
			
			BufferedImage bimg = null;
			bimg = ImageIO.read(new File(XLABELLER_ROOT_PATH+"dataset/"+fileFullName));			

			int width          = bimg.getWidth();
			int height         = bimg.getHeight();			
			
			dataVO.setMedia_type(datasetVO.getMedia_type());
			dataVO.setWidth(String.valueOf(width));
			dataVO.setHeight(String.valueOf(height));
			dataVO.setFps("1");
			
			sb = new StringBuffer();
			splitStr = fileFullName.split("_");
			for(int j = 0 ; j < splitStr.length - 2 ; j++) {
				if(j == 0 ) {
					sb.append(splitStr[j]); 
				}else {
					sb.append("_");
					sb.append(splitStr[j]);
				}
			}
			sb.append(".");
			sb.append(format);
			
			dataVO.setFilename(sb.toString());
			dataVO.setFrame("1");
			dataVO.setDuration("0");
			dataVO.setUser_id(datasetVO.getUser_id());			
			
			dataList.add(dataVO);
			
			
			if(i % BATCH_SIZE == BATCH_SIZE - 1) {
				createThumbnail(dataList);
				insertData(dataList);
				dataList.clear();				
			}
		}
		
		if(dataList != null && !dataList.isEmpty() ) {
			createThumbnail(dataList);
			insertData(dataList);
			dataList.clear();
		}
		
		FileUtils.delete(tempDir+"/"+filename);
		
		
		return;
	}
	
	private void videoToImageUpload(String tempDir, String filename, DatasetVO datasetVO) throws Exception{
		Calendar c = Calendar.getInstance();
		long currentTime = c.getTimeInMillis();
		List<DataVO> dataList = new ArrayList<DataVO>();
		
		GstUtil gu = new GstUtil();
		String fn = filename;
		fn = encodingText(fn); // encoding 변환
		String format = fn.split("\\.")[fn.split("\\.").length-1];
		
		String sourceFileName = fn.split("\\.")[0];
		
		
		//비디오 이동
//		String videoTempPath = XLABELLER_ROOT_PATH+"video_temp/"+"v_"+sourceFileName+"_"+String.valueOf(currentTime)+"."+format; 
//		mf.transferTo(new File(videoTempPath));
		
		String videoTempPath = tempDir+"/"+filename;
		
		//비디오 메타정보 취득
		VideoMetaUtil vmu = new VideoMetaUtil(videoTempPath);
		if(!vmu.isAvailable()) {
			throw new Exception("4072#지원하는 동영상 포맷이 아닙니다.");
		}
		String width = String.valueOf(vmu.getWidth());
		String height = String.valueOf(vmu.getHeight());
		
		// 비디오 to 이미지
		gu.convertVideotoJPG(videoTempPath, XLABELLER_ROOT_PATH+MID_PATH, sourceFileName, String.valueOf(currentTime),datasetVO.getDataset_id(), 1);
//		FileUtils.delete(videoTempPath);
		
		List<String> pathList = gu.getPath();
		
		if(pathList == null || pathList.isEmpty() || pathList.size() <= 0) {
			throw new Exception("4072#등록이 올바르지 않습니다.");
		}
		for(int i = 0 ; i < pathList.size() ;i++) {
			DataVO dataVO = new DataVO();
			dataVO.setDataset_id(datasetVO.getDataset_id());
			
			dataVO.setMedia_type(datasetVO.getMedia_type());
			dataVO.setWidth(width);
			dataVO.setHeight(height);
			dataVO.setFps("1");
			dataVO.setFilename(sourceFileName+"_"+String.valueOf(i)+".jpg");
			dataVO.setFrame("1");
			dataVO.setDuration("0");
			dataVO.setUser_id(datasetVO.getUser_id());
			
			dataVO.setPath(MID_PATH+pathList.get(i));
			dataList.add(dataVO);
			
			if(i % BATCH_SIZE == BATCH_SIZE - 1) {
				createThumbnail(dataList);
				insertData(dataList);
				dataList.clear();				
			}
		}
		
		if(dataList != null && !dataList.isEmpty() ) {
			createThumbnail(dataList);
			insertData(dataList);
			dataList.clear();
		}
		FileUtils.delete(tempDir+"/"+filename);
		
		return;
	}
	
	private void imageUpload(String tempDir, String filename,int i, DatasetVO datasetVO) throws Exception{
		Calendar c = Calendar.getInstance();
		long currentTime = c.getTimeInMillis();
		List<DataVO> dataList = new ArrayList<DataVO>();
		String fileName = null;
		
		
		String fn = filename;
		fn = encodingText(fn); // encoding 변환
		fn = fn.replaceAll(",", "_");
		String format = fn.split("\\.")[fn.split("\\.").length-1];
		String sourceFileName = fn.split("\\.")[0];
		
		fileName = sourceFileName+"_"+datasetVO.getDataset_id()+"_"+String.valueOf(i)+"_"+String.valueOf(currentTime)+"."+format;
		File convFile = new File(XLABELLER_ROOT_PATH+MID_PATH+fileName);
		BufferedImage bimg = null;
		
		
		
		File fileToMove = new File(tempDir+"/"+filename);
	    boolean isMoved = fileToMove.renameTo(convFile);
	    if (!isMoved) {
	        return;
	    }
		
		
		try {			
			bimg = ImageIO.read(convFile);
			
		} catch (IOException e) {
			logger.error("IOException Error!", e);
			throw new Exception("4072#등록이 올바르지 않습니다.");
		}
		
		int width          = bimg.getWidth();
		int height         = bimg.getHeight();
		
		
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
		dataVO.setUser_id(datasetVO.getUser_id());
		
		
		dataList.add(dataVO);	
			
		
		
		if(dataList != null && !dataList.isEmpty() ) {
			createThumbnail(dataList);
			insertData(dataList);
			dataList.clear();
		}
		
		
		
		return;
	}
	
	
	
	private void videoUpolad(String tempDir, String filename, int i,DatasetVO datasetVO) throws Exception{
		Calendar c = Calendar.getInstance();
		long currentTime = c.getTimeInMillis();
		List<DataVO> dataList = new ArrayList<DataVO>();
		String fileName = null;
		
		
		String fn = filename;
		fn = encodingText(fn); // encoding 변환
		fn = fn.replaceAll(",", "_");
		String format = fn.split("\\.")[fn.split("\\.").length-1];
		String sourceFileName = fn.split("\\.")[0];
		
//		if(!format.equals("mp4")) {
//			throw new Exception("4072#지원하는 동영상 포맷이 아닙니다.");
//		}
		
		fileName = sourceFileName+"_"+datasetVO.getDataset_id()+"_"+String.valueOf(i)+"_"+String.valueOf(currentTime)+"."+format;
		File convFile = new File(XLABELLER_ROOT_PATH+MID_PATH+fileName);
		
		
		File fileToMove = new File(tempDir+"/"+filename);
	    boolean isMoved = fileToMove.renameTo(convFile);
	    if (!isMoved) {
	        return;
	    }
		
		
		
		//비디오 메타정보 취득
		VideoMetaUtil vmu = new VideoMetaUtil(XLABELLER_ROOT_PATH+MID_PATH+fileName);
		if(!vmu.isAvailable()) {
			throw new Exception("4072#지원하는 동영상 포맷이 아닙니다.");
		}
		String width = String.valueOf(vmu.getWidth());
		String height = String.valueOf(vmu.getHeight());
		
		
		DataVO dataVO = new DataVO();
		dataVO.setDataset_id(datasetVO.getDataset_id());
		dataVO.setPath(MID_PATH+fileName);
		
		dataVO.setMedia_type(datasetVO.getMedia_type());
		dataVO.setWidth(String.valueOf(width));
		dataVO.setHeight(String.valueOf(height));
		dataVO.setFps(String.valueOf(vmu.getFps()));
		dataVO.setFilename(sourceFileName+"."+format);
		dataVO.setFrame(String.valueOf(vmu.getTotalFrame()));
		dataVO.setDuration(String.valueOf(vmu.getDuration()));
		dataVO.setUser_id(datasetVO.getUser_id());
		
		
		dataList.add(dataVO);				
	
		if(dataList != null && !dataList.isEmpty() ) {
			insertData(dataList);
			dataList.clear();
		}
		
		
		return;
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
				logger.error("DataService encodingText Error!", e);
			} finally {
				str_byte = null;
			}
		}
		
		return text;
	}
	
}

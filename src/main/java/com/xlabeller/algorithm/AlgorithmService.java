package com.xlabeller.algorithm;

import com.jcraft.jsch.Session;
import com.xlabeller.common.module.CmdExector;
import com.xlabeller.common.module.Output;
import com.xlabeller.common.module.SessionUtil;
import com.xlabeller.data.DataDao;
import com.xlabeller.gpuNode.GpuNodeDao;
import com.xlabeller.models.*;
import com.xlabeller.sshSession.SessionCmdExecute;
import com.xlabeller.sshSession.SessionSingletone;
import net.lingala.zip4j.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.*;

@Service
public class AlgorithmService {
	@Autowired
	private AlgorithmDao algorithmDao;
	
	@Autowired
	private GpuNodeDao gpuNodeDao;
	
	@Autowired
	private DataDao dataDao;
	
	private String XLABELLER_ROOT_PATH = "/usr/local/uploadFile/xlabeller/";
	
	@Value("#{globalProperty['grpc.address']}")
	private String GRPC_ADDRESS;
	
	@Value("#{globalProperty['grpc.port']}")
	private int GRPC_PORT;
	
	private static Logger logger = Logger.getLogger(AlgorithmService.class);
	
	public Object getAlgorithmList(AlgorithmVO algorithmVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		//페이징
		int count = algorithmDao.getAlgorithmTotalCount(algorithmVO);
		int size = 9999;
		int pageStart = 0;
		if(algorithmVO.getPage_num() != null && !algorithmVO.getPage_num().equals("")) {
			try {
				pageStart = Integer.valueOf(algorithmVO.getPage_num()).intValue();
			} catch (NumberFormatException e) {
				logger.error("getAlgorithmList casting Error! page_num : " + algorithmVO.getPage_num() , e);
				pageStart = 0;
			}
		}
		
		
		algorithmVO.setPage_num(String.valueOf(pageStart * size));
		algorithmVO.setPage_size(String.valueOf(size));
		algorithmVO.setTotal_size(String.valueOf(count));
		
		// Quick Training 할 때 라벨타입별 알고리즘 출력
		if(algorithmVO.getDataset_id() != null && algorithmVO.getDataset_id().length() > 0) {
			DatasetVO datasetVO = new DatasetVO();
			datasetVO.setDataset_id(algorithmVO.getDataset_id());
			DatasetVO findDatasetVO = dataDao.getDatasetById(datasetVO);
			if(findDatasetVO.getLabel_type() == null || findDatasetVO.getLabel_type().length() <= 0) {
				logger.error("해당 Dataset의 라벨타입이 존재하지 않습니다. Dataset 정보를 확인하세요. dataset_id" + algorithmVO.getDataset_id());
				return Output.JsonOutput("300", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}
			algorithmVO.setLabel_type(findDatasetVO.getLabel_type());
		}
		
		Object result = algorithmDao.getAlgorithmList(algorithmVO);
		return Output.JsonOutput("200", result);
	}
	
	public Object getAlgorithmById(AlgorithmVO algorithmVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		if(algorithmVO.getAlgorithm_id() == null || algorithmVO.getAlgorithm_id().length() <= 0) {
			return Output.JsonOutput("4061", "Algorithm ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		Object result = algorithmDao.getAlgorithmById(algorithmVO);
		return Output.JsonOutput("200", result);
	}
	
	private boolean getTaskListByAlgorithmId(AlgorithmVO algorithmVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return false;
		}
		if(algorithmVO.getAlgorithm_id() == null || algorithmVO.getAlgorithm_id().length() <= 0) {
			return false;
		}
		List<TaskVO> list = algorithmDao.getTaskListByAlgorithmId(algorithmVO);
		if(list.size() <= 0) {
			return true;
		} else {
			return false;
		}
	}
        
	
	public Object updateAlgorithm(AlgorithmVO algorithmVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		
		algorithmVO.setIs_enable(null);
		algorithmVO.setIs_fixed(null);
		
		MultipartFile mf = algorithmVO.getUpload_file();
		if(mf == null) {
			logger.error("MultiparFile is null.");
			return Output.JsonOutput("4061", "소스코드 파일을 ZIP파일 형식으로 업로드해주세요.");
		}
		
		int cnt = algorithmDao.updateAlgorithm(algorithmVO);
		if(cnt != 1){
			logger.error("업데이트 쿼리 실패! algorithm_id : " + algorithmVO.getAlgorithm_id());
			return Output.JsonOutput("4001", "업데이트가 올바르지 않습니다.\n다시 시도해주세요.");
		}
		
		// 알고리즘 코드 이동 시작
		String alId = algorithmVO.getAlgorithm_id();	
		
		String destSrc = XLABELLER_ROOT_PATH + "custom/" + alId + "/src/";
		String destZip = XLABELLER_ROOT_PATH + "custom/" + alId + "/zip/";
		boolean srcMkDir = false;
		boolean zipMkDir = false;
		
		File fDestSrc = new File(destSrc);
		File fDestZip = new File(destZip);
		try {
			if (fDestSrc.exists()) {
				org.apache.commons.io.FileUtils.forceDelete(fDestSrc);
				srcMkDir = fDestSrc.mkdirs();
				if (srcMkDir == false) {
					logger.error(destSrc + " 폴더 생성 실패!");
					throw new Exception("4001#업데이트 과정 중에 새로운 폴더를 생성하는데 실패했습니다.\n다시 시도해주세요.");
				}
			} else {
				zipMkDir = fDestSrc.mkdirs();
				if (zipMkDir == false) {
					logger.error(destSrc + " 폴더 생성 실패!");
					throw new Exception("4001#업데이트 과정 중에 새로운 폴더를 생성하는데 실패했습니다.\n다시 시도해주세요.");
				}
			}

			if (fDestZip.exists()) {
				org.apache.commons.io.FileUtils.forceDelete(fDestZip);
				zipMkDir = fDestZip.mkdirs();
				if (zipMkDir == false) {
					logger.error(destZip + " 폴더 생성 실패!");
					throw new Exception("4001#업데이트 과정 중에 새로운 폴더를 생성하는데 실패했습니다.\n다시 시도해주세요.");
				}
			} else {
				zipMkDir = fDestZip.mkdirs();
				if (zipMkDir == false) {
					logger.error(destZip + " 폴더 생성 실패!");
					throw new Exception("4001#업데이트 과정 중에 새로운 폴더를 생성하는데 실패했습니다.\n다시 시도해주세요.");
				}
			}

		} catch (IOException e) {
			if(e instanceof IOException) {
				logger.error("IOException Error!");
				throw new Exception("4001#업데이트 과정 중에 새로운 폴더를 생성하는데 실패했습니다.\n다시 시도해주세요.");
			} else {
				logger.error("Exception Error!");
				throw new Exception("4001#업데이트 과정 중에 새로운 폴더를 생성하는데 실패했습니다.\n다시 시도해주세요.");
			}
		} finally {
			fDestSrc = null;
			fDestZip = null;
		}
		
		String source = destZip+mf.getOriginalFilename();
		try {
			mf.transferTo(new File(source));
		} catch (Exception e) {
			if(e instanceof IOException) {
				logger.error("IOException Error!");
			} else if(e instanceof IllegalStateException) {
				logger.error("IllegalStateException Error!");
			} else {
				logger.error("Exception Error!");
			}
			
			throw new Exception("4001#알고리즘 소스코드 파일을 이동하는데 실패했습니다.\n다시 시도해주세요.");
			
		} finally {
			mf = null;
		}
		
		ZipFile zipFile = null;
        try {
        	 zipFile = new ZipFile(source);
             zipFile.extractAll(destSrc);
        } catch (Exception e) {
        	if(e instanceof ZipException) {
        		logger.error("ZipException Error!");
         	} else {
        		logger.error("Exception Error!");      		
        	}
        	throw new Exception("4001#알고리즘 소스코드 파일의 압축을 해제하는데 실패했습니다.\n다시 시도해주세요.");
        } finally {
        	zipFile = null;
        }
        //알고리즘 코드 이동 끝
		
        return Output.JsonOutput("200", "알고리즘 수정이 완료되었습니다.");
		
		
	}
	
	
	
	
	public Object insertAlgorithm(AlgorithmVO algorithmVO) throws Exception {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		algorithmVO.setUser_id(userInfo.getUser_id());
		
		algorithmVO.setIs_enable("1");
		algorithmVO.setIs_fixed("0");
		
		MultipartFile mf = algorithmVO.getUpload_file();
		if(mf == null) {
			logger.error("MultiparFile is null.");
			return Output.JsonOutput("4061", "소스코드 파일을 ZIP파일 형식으로 업로드해주세요.");
		}
		
		int cnt = algorithmDao.insertAlgorithm(algorithmVO);
		if(cnt != 1){
			logger.error("업데이트 쿼리 실패! algorithm_id : " + algorithmVO.getAlgorithm_id());
			return Output.JsonOutput("4001", "업데이트가 올바르지 않습니다.\n다시 시도해주세요.");
		}
		
		// 알고리즘 코드 이동 시작
		String alId = algorithmVO.getAlgorithm_id();	
		
		String destSrc = XLABELLER_ROOT_PATH + "custom/" + alId + "/src/";
		String destZip = XLABELLER_ROOT_PATH + "custom/" + alId + "/zip/";
		boolean srcMkDir = false;
		boolean zipMkDir = false;
		
		File fDestSrc = new File(destSrc);
		File fDestZip = new File(destZip);
		String source = null;
		try {
			if (fDestSrc.exists()) {
				org.apache.commons.io.FileUtils.forceDelete(fDestSrc);
				srcMkDir = fDestSrc.mkdirs();
				if (srcMkDir == false) {
					logger.error(destSrc + " 폴더 생성 실패!");
					throw new Exception("4001#알고리즘 등록 과정 중에 새로운 폴더를 생성하는데 실패했습니다.\n다시 시도해주세요.");
				}
			} else {
				srcMkDir = fDestSrc.mkdirs();
				if (srcMkDir == false) {
					logger.error(destSrc + " 폴더 생성 실패!");
					throw new Exception("4001#알고리즘 등록 과정 중에 새로운 폴더를 생성하는데 실패했습니다.\n다시 시도해주세요.");
				}
			}
			
			if (fDestZip.exists()) {
				org.apache.commons.io.FileUtils.forceDelete(fDestZip);
				zipMkDir = fDestZip.mkdirs();
				if (zipMkDir == false) {
					logger.error(destZip + " 폴더 생성 실패!");
					throw new Exception("4001#알고리즘 등록 과정 중에 새로운 폴더를 생성하는데 실패했습니다.\n다시 시도해주세요.");
				}
			} else {
				zipMkDir = fDestZip.mkdirs();
				if (zipMkDir == false) {
					logger.error(destZip + " 폴더 생성 실패!");
					throw new Exception("4001#알고리즘 등록 과정 중에 새로운 폴더를 생성하는데 실패했습니다.\n다시 시도해주세요.");
				}
			}
		} catch (Exception e) {
			if(e instanceof IOException) {
				logger.error("IOException Error!");
			} else {
				logger.error("Exception Error!");	
			}
			throw new Exception("4001#알고리즘 소스코드 파일의 압축을 해제하는데 실패했습니다.\n다시 시도해주세요.");
			
		} finally {
			fDestSrc = null;
			fDestZip = null;
		}
		
		source = destZip + mf.getOriginalFilename();
		try {
			mf.transferTo(new File(source));
		} catch (IOException e) {
			logger.error("IOException Error!");
			throw new Exception("4001#알고리즘 소스코드 파일을 이동하는데 실패했습니다.\n다시 시도해주세요.");
		} catch (IllegalStateException e){
			logger.error("IllegalStateException! Error!");
			throw new Exception("4001#알고리즘 소스코드 파일을 이동하는데 실패했습니다.\n다시 시도해주세요.");
		}finally {
			mf = null;
		}
		
		ZipFile zipFile = null;
        try {
        	 zipFile = new ZipFile(source);
             zipFile.extractAll(destSrc);
        } catch (Exception e) {
        	if(e instanceof ZipException) {
        		logger.error("ZipException Error!");
        	} else {
        		logger.error("Exception Error!");
        	}
        	throw new Exception("4001#알고리즘 소스코드 파일의 압축을 해제하는데 실패했습니다.\n다시 시도해주세요.");
        } finally {
           	zipFile = null;
        }
        
		return Output.JsonOutput("200", "알고리즘이 등록되었습니다.");

		
		
	}
	
	public Object deployAlgorithm(AlgorithmVO algorithmVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		
		if(algorithmVO.getAlgorithm_id() == null || algorithmVO.getAlgorithm_id().length() <= 0) {
			return Output.JsonOutput("4061", "Algorithm ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
	
		JSONObject jObj = getGpuListToJson();
		if(jObj == null || jObj.size() <= 0 || jObj.isEmpty()) {
			return Output.JsonOutput("300", "등록된 Worker가 없습니다. Setup을 확인해주세요.");
		}
		
		AlgorithmVO algorithmResult = algorithmDao.getAlgorithmById(algorithmVO);
		if(algorithmResult == null) {
			logger.error("AlgorithmVO is null! algorithm_id : " + algorithmVO.getAlgorithm_id());
			return Output.JsonOutput("4071", "Deploy과정 중에 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해 주시길 바랍니다.");
		}
		
		String algorithmId = algorithmResult.getAlgorithm_id();
		String imageName = "ca_"+algorithmId+":latest";
		String mappingTrain = algorithmResult.getTrain_func_name();
		String mappingInference = algorithmResult.getInference_func_name();
		String mappingModel = algorithmResult.getLoad_func_name();
		String baseDocker = algorithmResult.getBase_image();
		String folderName = algorithmId+"/src";
		String dockerCmdStr = algorithmResult.getDocker_cmd();
		if(dockerCmdStr == null || dockerCmdStr.length() <= 0) {
			return Output.JsonOutput("4071", "해당 알고리즘의 Docker File Command가 손상되었습니다.\nDocker File Command를 업데이트 해주세요.");
		}
		JSONParser jp = new JSONParser();
		JSONArray dockerCmd = null;
		try {
			dockerCmd = (JSONArray)jp.parse(dockerCmdStr);
		} catch (ParseException e) {
			logger.error("Docker file command ParseException Error! algorithm_id : " + algorithmId, e);
			return Output.JsonOutput("4071", "해당 알고리즘의 Docker File Command가 손상되었습니다.\nDocker File Command를 업데이트 해주세요.");
		}
	
		// s.kim 추가 2021-01-27
		// 1. 디렉토리 생성 ex /xlabeller/custom/1/ca_1_temp
		// 2. Dokcerfile 생성 /xlabeller/custom/1/ca_1_temp
		// 3. src 디렉토리 복사 target /xlabeller/custom/1/ca_1_temp
		// 4. server 디렉토리 복사 target /xlabeller/custom/1/ca_1_temp
		// 5. scp 명령어 모든 GPU 노드에 쏘기 
		// 쏘는게 끝나면 원격지에 붙어서 cmd 작업 ( docker build )
		
		// 임시 디렉토리 생성  
		String dirPath = null;
		dirPath = XLABELLER_ROOT_PATH + "/custom/" + algorithmId + "/ca_" + algorithmId + "_temp";
		File caDir = new File(dirPath);
		if (caDir.isDirectory()) {
			deleteFolder(dirPath);
		}
		if (caDir.mkdir()) {
			logger.info("ca_"+algorithmId+"_temp 디렉토리 생성 성공!");
		}else {
			logger.error("ca_"+algorithmId+"_temp 디렉토리 생성 실패!");
			return Output.JsonOutput("9000", "Deploy과정 중 임시폴더를 생성하는 과정에서 오류가 발생하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		CmdExector ce = new CmdExector();
		String[] cmd = { "/bin/bash", "-c",
				"chmod -R 777 " + XLABELLER_ROOT_PATH + "/custom/" + algorithmId + "/ca_" + algorithmId + "_temp/" };
		String cmdResult = "";
		try {
			cmdResult = ce.byProcessBuilderRedirect(cmd);
		} catch (Exception e) {
			if(e instanceof IOException) {
				logger.error("IOException Error!", e);
			} else if(e instanceof InterruptedException) {
				logger.error("InterruptedException Error!", e);
			} else {
				logger.error("Exception Error!", e);
			}
			
			return Output.JsonOutput("4091", "Deploy 과정 중 오류가 발생하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		} 
		
		logger.info("Command result1 : " + cmdResult); 
				
		String dirPath2 = XLABELLER_ROOT_PATH + "/custom/" + algorithmId + "/ca_" + algorithmId + "_temp/server";
		File caServerDir = new File(dirPath2);
		if (caServerDir.mkdir()) {
			System.out.println("ca_"+algorithmId+"_temp/server 디렉토리 생성 성공");
		}else {
			System.out.println("ca_"+algorithmId+"_temp/server 디렉토리 생성 실패 ");
			return Output.JsonOutput("4091", "Deploy과정 중 임시폴더를 생성하는 과정에서 오류가 발생하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		String[] cmd2 = {"/bin/bash","-c","chmod -R 777 " + XLABELLER_ROOT_PATH + "/custom/" + algorithmId + "/ca_" + algorithmId + "_temp/server"};

		cmdResult = "";
		try {
			cmdResult = ce.byProcessBuilderRedirect(cmd2);
		} catch (Exception e) {
			if(e instanceof IOException) {
				logger.error("IOException Error!", e);
			} else if(e instanceof InterruptedException) {
				logger.error("InterruptedException Error!", e);
			} else {
				logger.error("Exception Error!", e);
			}
			
			return Output.JsonOutput("4091", "Deploy 과정 중 오류가 발생하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		} 
		
		System.out.println("Command result2 : " + cmdResult);
		
		String dirPath3 = XLABELLER_ROOT_PATH + "/custom/" + algorithmId + "/ca_" + algorithmId + "_temp/src";
		File caSrcDir = new File(dirPath3);
		if (caSrcDir.mkdir()) {
			System.out.println("ca_"+algorithmId+"_temp/src 디렉토리 생성 성공");
		}else {
			System.out.println("ca_"+algorithmId+"_temp/src 디렉토리 생성 실패 ");
			return Output.JsonOutput("9000", "Deploy과정 중 임시폴더를 생성하는 과정에서 오류가 발생하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		String[] cmd3 = {"/bin/bash","-c","chmod -R 777 " + XLABELLER_ROOT_PATH + "/custom/" + algorithmId + "/ca_" + algorithmId + "_temp/src"};
		cmdResult = "";
		try {
			cmdResult = ce.byProcessBuilderRedirect(cmd3);
		} catch (Exception e) {
			if(e instanceof IOException) {
				logger.error("IOException Error!", e);
			} else if(e instanceof InterruptedException) {
				logger.error("InterruptedException Error!", e);
			} else {
				logger.error("Exception Error!", e);
			}
			
			return Output.JsonOutput("4091", "Deploy 과정 중 오류가 발생하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		logger.info("Commnad Result : " + cmdResult);
		// local test용 임시 

		//Dockerfile 작성 후 생성  
		StringBuilder str = new StringBuilder();
		str.append("FROM ");
		str.append(baseDocker + "\n");
		str.append("ENV DEBIAN_FRONTEND noninteractive\n");
		str.append("ADD ./src/. /workspace/model\n");
		str.append("ADD ./server/. /workspace/server\n");
		str.append("ENV PYTHONPATH .:/workspace/model:/workspace/server:$PYTHONPATH\n");
        
        String tempCmd = "";
		String tempType = "";
		
		for (int i = 0; i < dockerCmd.size(); i++) {
			JSONObject test = (JSONObject) dockerCmd.get(i);
			tempCmd = (String) test.get("name");
			tempType = (String) test.get("type");
			str.append(tempType + " " + tempCmd + "\n");
		}

		str.append("WORKDIR /workspace/server/\n");
		str.append("RUN python mapping.py ");
		str.append("-t " + mappingTrain);
		str.append(" -i " + mappingInference);
		str.append(" -m " + mappingModel + "\n");
		str.append("RUN pip install Pillow\n");
		str.append("RUN pip install pycocotools\n");
		str.append("RUN pip install numpy\n");
		str.append("RUN pip install scipy\n");
		str.append("RUN pip install opencv-python\n");
		str.append("RUN cp --remove-destination /workspace/server/Seoul /etc/localtime\n");
		
        //File dockerfile = new File(XLABELLER_ROOT_PATH + "custom/" + algorithmId + "/ca_" + algorithmId + "_temp/" +"Dockerfile");
		File dockerFile = null;
		try {
			dockerFile = new File(XLABELLER_ROOT_PATH + "custom/" + algorithmId + "/Dockerfile");	
		} catch (Exception e) {
			if(e instanceof NullPointerException) {
				logger.error("NullPointerException Error!", e);
			} else {
				logger.error("Exception Error!", e);
			}
			return Output.JsonOutput("4091", "알고리즘 배포 과정중에 오류가 발생했습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
        
        if (dockerFile.isFile()) {
        	// rm dockerfile
        	dockerFile.delete();
        	logger.info("Dockerfile rm!");
        } 

        
		try {
			if(dockerFile.createNewFile()) {
				logger.info("Docker file create ok!");
			}else {
				logger.info("Docker file create fail!");
			}
		} catch (IOException e) {
			logger.error("IOException Error!", e);
			return Output.JsonOutput("4091", "알고리즘 배포 과정중에 오류가 발생했습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		try {
			// private String XLABELLER_ROOT_PATH = "/usr/local/uploadFile/xlabeller/";
			FileOutputStream fOut = new FileOutputStream(XLABELLER_ROOT_PATH + "custom/" + algorithmId + "/Dockerfile");
			OutputStreamWriter osw = new OutputStreamWriter(fOut);
				try {
					osw.write(str.toString());
					osw.flush();
				} catch (Exception e) {
					if(e instanceof IOException) {
						logger.error("IOException Error!", e);
					} else {
						logger.error("Exception Error!", e);
					}
					return Output.JsonOutput("4091", "알고리즘 배포 과정중에 오류가 발생했습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
				} finally {
					try {
						if(fOut != null) {
							fOut.close();
						}
						if(osw != null) {
							osw.close();
						}
					} catch (IOException e) {
						logger.error("IOException Error!", e);
					}
				}
		} catch (FileNotFoundException e) {
			logger.error("FileNotFoundException Error!", e);
			return Output.JsonOutput("4091", "알고리즘 배포 과정중에 오류가 발생했습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		// private String XLABELLER_ROOT_PATH = "/usr/local/uploadFile/xlabeller/";
		File serverDir = null;
		File srcDir = null;
		try {
			serverDir = new File(XLABELLER_ROOT_PATH + "server/");
			srcDir = new File(XLABELLER_ROOT_PATH + "custom/" + algorithmId + "/src/" );
		} catch (Exception e) {
			if(e instanceof NullPointerException) {
				logger.error("NullPointerException Error!", e);
			} else {
				logger.error("Exception Error!", e);
			}
			return Output.JsonOutput("4091", "알고리즘 배포 과정중에 오류가 발생했습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}

		dirCopy(serverDir, caServerDir);
		dirCopy(srcDir, caSrcDir);
		File copyDockerfile = null;
		try {
			copyDockerfile = new File(dirPath+"/Dockerfile");	
		} catch (Exception e) {
			if(e instanceof NullPointerException) {
				logger.error("NullPointerException Error!", e);
			} else {
				logger.error("Exception Error!", e);
			}
			return Output.JsonOutput("4091", "알고리즘 배포 과정중에 오류가 발생했습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		fileCopy(dockerFile, copyDockerfile);
		logger.info("dockerfile copy!");

		GpuNodeVO inGpuNodeVO = new GpuNodeVO();
		inGpuNodeVO.setType("worker");
		List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);
		Collection sessionListCmd = new ArrayList();
			
		//List<SSHCmdExecute> sshList = new ArrayList<SSHCmdExecute>();
		for(int i = 0; i < gpuList.size(); i++) {
			String account = gpuList.get(i).getAccount();
			String address = gpuList.get(i).getAddress();
			String password = gpuList.get(i).getPassword(); 
			int port = 0;
    		try {
    			port = Integer.valueOf(gpuList.get(i).getPort());
    		} catch (NumberFormatException e) {
    			logger.error("GPU Node의 포트번호가 잘못된 형태입니다.\nDB에서 수정해주세요.");
				logger.error("NumberFormatException Error!", e);
    			continue;
    		}
			String temp_cmd = "sshpass -p '"+password+"' scp -r -o StrictHostKeyChecking=no "+dirPath+" root@"+address+":~/";
			
			CmdExector scpCe = new CmdExector();				
			String[] scpCmd = {"/bin/bash","-c",temp_cmd};

			//temp_skip...
			try {
				String scpResult = ce.byProcessBuilderRedirect(scpCmd);
			} catch (Exception e){
				if(e instanceof IOException) {
					logger.error("IOException Error!", e);
				} else if(e instanceof InterruptedException) {
					logger.error("InterruptedException Error!", e);
				}
				
				return Output.JsonOutput("4091", "알고리즘 배포 과정중에 오류가 발생했습니다.\n새로 고침 후, 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}
		}
		
		if (caDir.isDirectory()) {
			deleteFolder(dirPath);
		}
		
		Object sessionObj = getSSHSessionList(gpuList);
		if(sessionObj instanceof JsonOutputVO) {
			return Output.JsonOutput("300", "알고리즘을 배포할 GPU Server와 연결을 실패했습니다.\nSetup 또는 서버상태를 확인하세요.");
		}
		
		// sessionObj 메소드에서 list 크기가 0일 경우 JsonOutputVO로 반환하기 때문에 사이즈 체크 필요 X
		List<Session> sessionList = (List<Session>)sessionObj;
		
		Collection algorithmDeployCmd = new ArrayList();
		for(int i = 0; i < sessionList.size(); i++) {
			SSHSessionVO sshSessionVO = new SSHSessionVO();
			sshSessionVO.setCommnad("algorithmDeploy");
			sshSessionVO.setAlgorithmId(algorithmId);
			algorithmDeployCmd.add(new SessionCmdExecute(sessionList.get(i), sshSessionVO));
		}


		List<Future<JSONObject>> algorithmDeployResult = new ArrayList<>();
		ExecutorService executorService = Executors.newFixedThreadPool(10);
		JSONObject deployCmdResult = null;
		String resCode = "";
		JSONObject resJson = new JSONObject();
		String tempResData = "";
		String resultData = "";
		try {
			algorithmDeployResult = executorService.invokeAll(algorithmDeployCmd);	
		} catch (Exception e) {
			if (e instanceof InterruptedException) {
				logger.error("InterruptedException Error!", e);
			} else if(e instanceof NullPointerException) {
				logger.error("NullPointerException Error!", e);
			} else if(e instanceof RejectedExecutionException) {
				logger.error("RejectedExecutionException Error!", e);
			} else {
				logger.error("Exception Error!", e);
			}
		} finally {
			executorService.shutdown();
		}
		
		if(algorithmDeployResult.size() <= 0 || algorithmDeployResult.isEmpty()) {
			return Output.JsonOutput("300", "알고리즘 deploy에 실패하였습니다.\n알고리즘을 다시 deploy해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
		}
		
		for(int i = 0; i < algorithmDeployResult.size(); i++) {
			//SSHCmdExecute sshSession = sshList.get(i);
			Session sshSession = sessionList.get(i);
			try {
				deployCmdResult = algorithmDeployResult.get(i).get();
			} catch (Exception e) {
				//logger.error("Error!", e);
				if(e instanceof InterruptedException) {
					logger.error("InterruptedException Error!", e);
				} else if(e instanceof ExecutionException) {
					logger.error("ExecutionException Error!", e);
				} else {
					logger.error("Exception Error!", e);
				}
			}
			
			if(deployCmdResult == null) {
				logger.error("deployCmdResult is NULL!");
				tempResData = "배포 과정 중에 알 수 없는 에러가 발생했습니다.\n문제가 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.";
				resJson.put(sshSession.getHost(), tempResData);
				continue;
			} else if((String)deployCmdResult.get("code") == null || ((String)deployCmdResult.get("code")).length() <= 0) {
				logger.error("deployCmdResult code is NULL!");
				tempResData = "배포 과정 중에 알 수 없는 에러가 발생했습니다.\n문제가 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.";
				resJson.put(sshSession.getHost(), tempResData);
				continue;
			} else if(!((String)deployCmdResult.get("code")).equals("200")) {
				if((String)deployCmdResult.get("data") == null || ((String)deployCmdResult.get("data")).length() <= 0) {
					tempResData = "배포 과정중에 알 수 없는 에러가 발생했습니다.\n문제가 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.";
				} else {
					tempResData = (String)deployCmdResult.get("data");
				}
				resJson.put(sshSession.getHost(), tempResData);
			}
			
			//resJson.put(sshSession.getHost(), tempResData);
		}
		
		if(resJson.isEmpty() || resJson.size() <= 0) {
			resCode = "200";
			resultData = "정상 배포 되었습니다.";
		} else {
			resCode = "551";
			resultData = resJson.toJSONString();
		}
		
		return Output.JsonOutput(resCode, resultData);
		// s.kim 제거 2021-01-27
		//GrpcUtils gu = new GrpcUtils();
		//JSONObject result = (JSONObject)gu.callEnrollment(GRPC_ADDRESS, GRPC_PORT, jObj, imageName, mappingTrain, mappingInference, mappingModel, baseDocker, folderName, dockerCmd);
		//return Output.JsonOutput((String)result.get("code"), (String)result.get("data"));
	}	
	
	
	
	public Object deleteAlgorithm(AlgorithmVO algorithmVO) {
		UserVO userInfo = SessionUtil.getUserInfo();
		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
			return Output.JsonOutput("3301","로그인 세션이 만료 되었습니다");
		}
		boolean algorithmCheck = getTaskListByAlgorithmId(algorithmVO);
		JSONObject jObj = getGpuListToJson();
		
		//j.seo 추가
		if(jObj == null || jObj.size() <= 0 || jObj.isEmpty()) {
			return Output.JsonOutput("4071", "등록된 Worker가 없습니다. Setup을 확인해주세요.");
		}
		
		if(algorithmVO.getAlgorithm_id().equals("1") || algorithmVO.getAlgorithm_id().equals("2") || algorithmVO.getAlgorithm_id().equals("3")) {
			return Output.JsonOutput("300", "기본으로 제공되는 알고리즘은 삭제할 수 없습니다.");
		}
		
		if(algorithmCheck) {
				//s.kim 추가 2021-01-29
				AlgorithmVO algorithmResult = algorithmDao.getAlgorithmById(algorithmVO);
				if(algorithmResult == null) {
					return Output.JsonOutput("4071", "알고리즘을 선택해주세요.");
				}
				String algorithmId = algorithmResult.getAlgorithm_id();
				String imageName = "ca_"+algorithmId+":latest";
				
				
				GpuNodeVO inGpuNodeVO = new GpuNodeVO();
				inGpuNodeVO.setType("worker");
				List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);
				
				//
				Object sessionObj = getSSHSessionList(gpuList);
				if(sessionObj instanceof JsonOutputVO) {
					return Output.JsonOutput("4071", "알고리즘을 배포할 GPU Server와 연결을 실패했습니다.\nSetup 또는 서버상태를 확인하세요.");
				}
				
				// sessionObj 메소드에서 list 크기가 0일 경우 JsonOutputVO로 반환하기 때문에 사이즈 체크 필요 X
				List<Session> sessionList = (List<Session>)sessionObj;
				
				List<SessionCmdExecute> algorithmDeployCmd = new ArrayList();
				for(int i = 0; i < sessionList.size(); i++) {
					SSHSessionVO sshSessionVO = new SSHSessionVO();
					sshSessionVO.setCommnad("algorithmDeploy");
					sshSessionVO.setAlgorithmId(algorithmId);
					algorithmDeployCmd.add(new SessionCmdExecute(sessionList.get(i), sshSessionVO));
				}


				List<Future<JSONObject>> algorithmDeployResult = new ArrayList<>();
				ExecutorService executorService = Executors.newFixedThreadPool(10);
				for (int i = 0; i < algorithmDeployCmd.size(); i++) {
					try {
						int k = i;
						executorService.execute(() -> {
							algorithmDeployCmd.get(k).algorithmDelete(imageName);
						});
					} catch (Exception e) {
						if (e instanceof InterruptedException) {
							logger.error("InterruptedException Error!", e);
						} else if (e instanceof NullPointerException) {
							logger.error("NullPointerException Error!", e);
						} else if (e instanceof RejectedExecutionException) {
							logger.error("RejectedExecutionException Error!", e);
						} else {
							logger.error("Exception Error!", e);
						}
					} finally {
						executorService.shutdown();
					}
				}
				//
//				List<SSHCmdExecute> sshList = new ArrayList<SSHCmdExecute>();
//				for(int i = 0; i < gpuList.size(); i++) {
//					String account = gpuList.get(i).getAccount();
//					String address = gpuList.get(i).getAddress();
//					String password = gpuList.get(i).getPassword();
//					int port = 0;
//		            try {
//		            	port = Integer.valueOf(gpuList.get(i).getPort());
//					} catch (NumberFormatException e) {
//						logger.error("GPU Node의 포트번호가 잘못된 형태입니다.\nDB에서 수정해주세요.");
//						logger.error("NumberFormatException Error!", e);
//						continue;
//					}
//		            
//					SSHCmdExecute sshCmdExcute = new SSHCmdExecute(account, port, address, password);
//					sshList.add(sshCmdExcute);
//				}
//			
//				for(int i = 0; i < sshList.size(); i++) {
//					//sshList.get(i).cmdExcute(command)
//					SSHCmdExecute sshSession = sshList.get(i);
//					sshSession.algorithmDelete(imageName);
//				}
				
				int cnt = algorithmDao.deleteAlgorithm(algorithmVO);
				if(cnt != 1){
					return Output.JsonOutput("4001", "삭제가 올바르지 않습니다.\n다시 시도해주세요.");
				}
				// DIR 삭제 
				String dirPath = XLABELLER_ROOT_PATH + "/custom/" + algorithmId;
				deleteFolder(dirPath);
				return Output.JsonOutput("200", "알고리즘이 삭제되었습니다.");
			} 
		else {
			return Output.JsonOutput("300", "알고리즘이 등록된 Task가 존재해 삭제가 불가능합니다.");
		}
	}
	
	private JSONObject getGpuListToJson() {
		GpuNodeVO inGpuNodeVO = new GpuNodeVO();
		inGpuNodeVO.setType("worker");
		List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO); 
		// j.seo 작성
		if(gpuList == null || gpuList.size() <= 0 || gpuList.isEmpty()) {
			return null;
		}
		JSONObject jObj = new JSONObject();		
		for(int i = 0 ; i < gpuList.size(); i++) {
			jObj.put(gpuList.get(i).getAddress(), gpuList.get(i).getPassword());
		}
		return jObj;
	}
	
	private void dirCopy(File sourceF, File targetF) {
		File[] target_file = sourceF.listFiles();
		for (File file : target_file) {
			File temp = new File(targetF.getAbsolutePath() + File.separator + file.getName());
			if(file.isDirectory()){
				temp.mkdir();
				dirCopy(file, temp);
			} else {
				FileInputStream fis = null;
				FileOutputStream fos = null;
				try {
					fis = new FileInputStream(file);
					fos = new FileOutputStream(temp) ;
					byte[] b = new byte[4096];
					int cnt = 0;
					while((cnt=fis.read(b)) != -1){
						fos.write(b, 0, cnt);
					}
				} catch (Exception e) {
					if(e instanceof IOException) {
						logger.error("IOException Error!", e);
					} else if(e instanceof FileNotFoundException) {
						logger.error("FileNotFoundException Error!", e);
					} else {
						logger.error("Exception Error!", e);
					}
				} finally{
					try {
						if(fis != null) {
							fis.close();
						} 
						if(fos != null) {
							fos.close();
						}
					} catch (IOException e) {
						logger.error("IOException Error!", e);
					}	
				}
			}
		}
	}
	
	private void fileCopy(File sourceF, File targetF) {
		try {
			FileInputStream fis = new FileInputStream(sourceF); // 읽을파일
			FileOutputStream fos = new FileOutputStream(targetF); // 복사할파일
			int fileByte = 0;
			try {
				while ((fileByte = fis.read()) != -1) {
					fos.write(fileByte);
				}
			} catch (IOException e) {
				logger.error("IOException Error!", e);
			} finally {
				try {
					if (fis != null) {
						fis.close();
					}
					if (fos != null) {
						fos.close();
					}
				} catch (IOException e) {
					logger.error("IOException Error!", e);
				}
			}
		} catch (FileNotFoundException e) {
			logger.error("FileNotFoundException Error!", e);
		}
	}

	public static void deleteFolder(String path) {

		File folder = new File(path);
		try {
			if (folder.exists()) {
				// 파일리스트 얻어오기
				File[] folder_list = folder.listFiles(); 

				for (int i = 0; i < folder_list.length; i++) {
					if (folder_list[i].isFile()) {
						folder_list[i].delete();
					} else {
						// 재귀함수호출
						deleteFolder(folder_list[i].getPath()); 
					}
					folder_list[i].delete();
				}
				// 폴더 삭제
				folder.delete(); 
				logger.info(path + "폴더가 삭제되었습니다.");
			}
		} catch (Exception e) {
			logger.error("Exception Error!", e);
		}
	}
	
	// 세션이 연결된 리스트를 반환하면 정상, JsonOutputVO를 반환하면 에러
	private Object getSSHSessionList(List<GpuNodeVO> gpuList) {
		List<Session> sessionList = new ArrayList<Session>();
		SessionSingletone sessionSingletone = SessionSingletone.getInstance();
		Map<String, Session> sessionMap = sessionSingletone.getSessionMap();
		if(sessionMap == null || sessionMap.isEmpty()) {
			return Output.JsonOutput("4071", "원격 접속 가능한 GPU Server가 존재하지 않습니다.\nSetup 또는 서버상태를 확인하세요.");
		}
		
		for(int i = 0; i < gpuList.size(); i++) {
			Session session = sessionMap.get(gpuList.get(i).getAddress());
			if(session == null || session.isConnected() == false) {
				continue;
			}
			sessionList.add(session);
		}
		
		if(sessionList == null || sessionList.size() <= 0 || sessionList.isEmpty()) {
			logger.error("원격 접속 가능한 세션 없음! Setup을 확인하세요.");
			return Output.JsonOutput("300", "원격 접속 가능한 GPU Server가 존재하지 않습니다.\nSetup 또는 서버상태를 확인하세요.");
		}
		
		return sessionList;
			
	}
	
}
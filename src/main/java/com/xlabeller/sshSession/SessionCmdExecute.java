package com.xlabeller.sshSession;

import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.Session;
import com.xlabeller.models.DockerServiceVO;
import com.xlabeller.models.GpuNodeImageVO;
import com.xlabeller.models.GpuNodeStatusVO;
import com.xlabeller.models.SSHSessionVO;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

public class SessionCmdExecute implements Callable<Object> {
	private Session session;
	private SSHSessionVO sshSessionVO;

	private static Logger logger = Logger.getLogger(SessionCmdExecute.class);

	public SessionCmdExecute(Session session) {
		this.session = session;
	}

	public SessionCmdExecute(Session session, SSHSessionVO sshSessionVO) {
		this.session = session;
		this.sshSessionVO = sshSessionVO;
	}

	@Override
	public Object call() {
		// 입력 : ImageName / sshSessionVO.setImageName()를 통해 반드시 ImageName을 입력받아야 됨.
		if (sshSessionVO.getCommnad().equals("imageCheck")) {
			return (GpuNodeImageVO) imageCheck(sshSessionVO.getImageName());
		}
		if (sshSessionVO.getCommnad().equals("getAvailbelGpuList")) {
			return (GpuNodeStatusVO) getAvailbelGpuList();
		}
		// 입력 : ImageName / sshSessionVO.setImageName()를 통해 반드시 ImageName을 입력받아야 됨.
		if (sshSessionVO.getCommnad().equals("findImageCheck")) {
			return (boolean) findImageCheck(sshSessionVO.getImageName());
		}
		if (sshSessionVO.getCommnad().equals("runTaskList")) {
			return (List<DockerServiceVO>) runTaskList();
		}
		// 입력 : projectId, taskId / sshSessionVO.setProjectId(),
		// sshSessionVO.setTaskId()를 통해 반드시 projectId와 taskId를 입력받아야 됨.
		if (sshSessionVO.getCommnad().equals("isUpTrainning")) {
			return (boolean) isUpTraining(sshSessionVO.getProjectId(), sshSessionVO.getTaskId());
		}
		// 입력 : projectId, taskId / sshSessionVO.setProjectId(),
		// sshSessionVO.setTaskId()를 통해 반드시 projectId와 taskId를 입력받아야 됨.
		if (sshSessionVO.getCommnad().equals("isUpInference")) {
			return (boolean) isUpInference(sshSessionVO.getProjectId(), sshSessionVO.getTaskId());
		}
		// 입력 : algorithmId / sshSessionVO.setAlgorithmId()를 통해 반드시 algorithmId를 입력받아야
		// 됨.
		if (sshSessionVO.getCommnad().equals("algorithmDeploy")) {
			return (JSONObject) algorithmDeploy(sshSessionVO.getAlgorithmId(), session.getHost());
		}
		if (sshSessionVO.getCommnad().equals("nfsStatus")) {
			return (boolean) nfsStatus(session.getHost());
		}
		if (sshSessionVO.getCommnad().equals("nfsJoin")) {
			return (boolean) nfsJoin(session.getHost());
		}
		// 입력 : type, projectId, taskId
		if (sshSessionVO.getCommnad().equals("killContainer")) {
			return (boolean) killContainer(sshSessionVO.getType(), sshSessionVO.getProjectId(),
					sshSessionVO.getTaskId());
		}

		return null;
	}

	public String cmdExcute(String command) {
		ChannelExec chanelExec = null;
		String result = "";

		try {
			// 채널 연결 시간 : 20초
			chanelExec = (ChannelExec) session.openChannel("exec");
			chanelExec.setCommand(command);
			StringBuilder outputBuffer = new StringBuilder();
			StringBuilder errorBuffer = new StringBuilder();
			InputStream in = chanelExec.getInputStream();
			InputStream err = chanelExec.getExtInputStream();

			chanelExec.connect();

			byte[] tmp = new byte[1024];
			while (true) {
				while (in.available() > 0) {
					int i = in.read(tmp, 0, 1024);
					if (i < 0)
						break;
					outputBuffer.append(new String(tmp, 0, i));
				}

				while (err.available() > 0) {
					int i = err.read(tmp, 0, 1024);
					if (i < 0)
						break;
					errorBuffer.append(new String(tmp, 0, i));
				}

				if (chanelExec.isClosed()) {
					if ((in.available() > 0) || (err.available() > 0))
						continue;
					break;
				}

				try {
					Thread.sleep(1000);
				} catch (Exception ee) {
					if (in != null) {
						in = null;
					}
					if (err != null) {
						err = null;
					}
				}
			}

			if (outputBuffer != null && outputBuffer.length() > 0) {
				result = outputBuffer.toString();
				//logger.info("CommandExecute Success! " + outputBuffer.toString());
			} else if (errorBuffer != null && errorBuffer.length() > 0) {
				result = null;
				logger.info("CommandExecute Error! " + errorBuffer.toString());
			} else {
				return null;
			}

			in = null;
			err = null;
			chanelExec.disconnect();

		} catch (Exception e) {
			System.out.println("Error! " + e);
		} finally {
			if (chanelExec != null) {
				chanelExec = null;
			}
		}

		// result가 null일 경우 cmd명령어에 실패한 것
		return result;
	}

	// 모든 이미지 검색
	public GpuNodeImageVO imageCheck(String imageName) {
		String cmd = "docker images | tail -n +2 | awk '{print $1\":\"$2}'";
		String result = cmdExcute(cmd);
		if (result == null || result.length() <= 0) {
			return null;
		}
		// 연결된 세션에 hostname을 불러오는 몀령어
		String hostName = cmdExcute("hostname").trim();
		if (hostName == null || hostName.length() <= 0) {
			hostName = "-";
		}
		String[] splitResult = result.split("\n");
		StringBuilder imageList = new StringBuilder();
		String check = "";

		for (int i = 0; i < splitResult.length; i++) {
			if (splitResult[i] == null || splitResult[i].length() <= 0) {
				continue;
			}
			if (splitResult[i].equals(imageName)) {
				check = splitResult[i] + "==true";
			}
			if (i == 0) {
				imageList.append(splitResult[i]);
			} else {
				imageList.append(",");
				imageList.append(splitResult[i]);
			}
		}

		GpuNodeImageVO gpuNodeImageVO = new GpuNodeImageVO();
		gpuNodeImageVO.setHost_name(hostName);
		gpuNodeImageVO.setImages(imageList.toString());
		gpuNodeImageVO.setCheck(check);
		gpuNodeImageVO.setNode_ip(session.getHost());

		//// System.out.println("hostName : " + gpuNodeImageVO.getHost_name());
		//// System.out.println("ImageList : " + imageList.toString());
		//// System.out.println("check : " + gpuNodeImageVO.getCheck());
		//// System.out.println("nodeIp: " + gpuNodeImageVO.getNode_ip());

		return gpuNodeImageVO;
	}

	// 사용 가능한 gpu 조회
	public GpuNodeStatusVO getAvailbelGpuList() {
		String getGpuNumCmd = "nvidia-smi --query | fgrep \'Attached GPUs\'";
		String getGpuNumCmdOutput = cmdExcute(getGpuNumCmd).trim();
		if (getGpuNumCmdOutput == null || getGpuNumCmdOutput.length() <= 0) {
			return null;
		}
		String[] gpuNumResult = getGpuNumCmdOutput.split(": ");
		String hostName = cmdExcute("hostname").trim();
		if (gpuNumResult == null || gpuNumResult.length < 2) {
			return null;
		}

		int gpuNum = 0;
		try {
			gpuNum = Integer.parseInt(gpuNumResult[1]);
		} catch (NumberFormatException e) {
			// System.out.println("NumberFormatException Error!" + e);
			return null;
		}

		// gpuNUm -> 1,2,3,4 이런식으로 int 값 나옴. gpu 개
		StringBuilder availableGpuIndex = new StringBuilder();
		StringBuilder unAvailableGpuIndex = new StringBuilder();
		for (int i = 0; i < gpuNum; i++) {
			String getGpuStatusCmd = "docker ps --filter \"label=gpu_id=" + i + "\"";
			String getGpuStatusCmdOutput = cmdExcute(getGpuStatusCmd);
			String[] GpuStatusResult = getGpuStatusCmdOutput.split("\n");
			if (i == 0) {
				if (GpuStatusResult.length == 1) {
					availableGpuIndex.append(String.valueOf(i));
				} else {
					unAvailableGpuIndex.append(String.valueOf(i));
				}
			} else {
				if (GpuStatusResult.length == 1) {
					availableGpuIndex.append(",");
					availableGpuIndex.append(String.valueOf(i));
				} else {
					unAvailableGpuIndex.append(",");
					unAvailableGpuIndex.append(String.valueOf(i));
				}
			}
		}

		GpuNodeStatusVO gpuResult = new GpuNodeStatusVO();
		gpuResult.setNode_ip(session.getHost());
		gpuResult.setHost_name(hostName);
		gpuResult.setAvailable_gpu_index(availableGpuIndex.toString());
		gpuResult.setUnavailable_gpu_index(unAvailableGpuIndex.toString());

		return gpuResult;
	}

	// 특정 도커 이미지 검색
	public boolean findImageCheck(String imageName) {
		String cmd = "docker images " + imageName;
		String imageCheckResult = cmdExcute(cmd);
		// System.out.println(imageCheckResult);
		String[] splitImageCheckResult = imageCheckResult.split("\n");
		String[] splitImageName = imageName.split(":");

		boolean result = false;
		if (splitImageName == null || splitImageName.length != 2) {
			return result;
		}
		if (imageCheckResult == null || imageCheckResult.length() <= 0) {
			return result;
		}

		if (splitImageCheckResult == null || splitImageCheckResult.length <= 1) {
			return result;
		}
		if (splitImageName[0] == null || splitImageName[0].length() <= 0) {
			return result;
		}
		if (splitImageName[1] == null || splitImageName[1].length() <= 0) {
			return result;
		}

		for (int i = 0; i < splitImageCheckResult.length; i++) {
			if (splitImageCheckResult[i].contains(splitImageName[0])
					&& splitImageCheckResult[i].contains(splitImageName[1])) {
				result = true;
				return result;
			} else {
				continue;
			}
		}
		if (imageCheckResult.contains(imageName)) {
			// System.out.println("true!");
			result = true;
		}
		return result;
	}

	// s.kim 추가 ssh로 실행중인 Task List 알아내
	public List<DockerServiceVO> runTaskList() {
		String getRunTaskCmd = "docker ps --no-trunc --filter \"name=xlabeller_\" --filter \"label=xlabeller\" "
				+ "--format \"table {{.Names}}\\${{.Status}}\"";
		// logger.info(getRunTaskCmd);
		String getRunTaskCmdOutput = cmdExcute(getRunTaskCmd);
		if (getRunTaskCmdOutput == null || getRunTaskCmdOutput.length() <= 0) {
			logger.error(this.session.getHost() + " CommandExecute Error!");
			return null;
		}
		String[] getRunTaskResult = getRunTaskCmdOutput.split("\n");
		// length 가 1이면 Header 만나온 경우, 즉 명령어의 결과값이 없음
		List<DockerServiceVO> list = new ArrayList<DockerServiceVO>();
		if (getRunTaskResult.length == 1) {
			logger.error(this.session.getHost() + " Not run task!");
			return null;
		} else {
			for (int i = 1; i < getRunTaskResult.length; i++) {
				DockerServiceVO dockerServiceVO = new DockerServiceVO();
				// output ex) xlabeler_t_10_10$up 10second
				String[] temp = getRunTaskResult[i].split("\\$");
				if (temp.length != 2) {
					continue;
				}
				String names = temp[0];
				String status = temp[1];
				String[] typePidTid = names.split("_");
				//// System.out.println(names);
				String type = typePidTid[1];
				String projectId = typePidTid[2];
				String taskId = typePidTid[3];
				dockerServiceVO.setProject_id(projectId);
				dockerServiceVO.setId(taskId);
				dockerServiceVO.setStatus(status);
				dockerServiceVO.setType(type);
				dockerServiceVO.setAddress(this.session.getHost());
				list.add(dockerServiceVO);
			}
		}

		if (list.size() <= 0 || list.isEmpty()) {
			return null;
		}

		return list;
	}

	public Object callCustomTrain(String projectId, String taskId, String algorithmId, String gpuIndex, String mode,
			String config) {
		JSONObject rObj = new JSONObject();
		String annotation = null;
		if (mode.equals("seg")) {
			annotation = "segmentation.json";
		} else if (mode.equals("video")) {
			annotation = "videoBox.json";
		} else if (mode.equals("bbox")) {
			annotation = "train.csv";
		} else {
			rObj.put("code", "551");
			rObj.put("data", "학습 모드가 올바르지 않습니다.\n관리자에게 문의 부탁드립니다.");
			return rObj;
		} 
		String cmd;
		if (algorithmId.equals("2")) {
			//batch
			String batch = null;
			JSONParser parser = new JSONParser();
			Object obj = null;
			try {
				obj = parser.parse(config.replaceAll("\\\\",""));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			JSONObject jsonObj = (JSONObject) obj;
			batch = String.valueOf(jsonObj.get("batch_size"));
			cmd = "docker run --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES="+ gpuIndex +" --rm -itd --label gpu_id=" + gpuIndex +
					" --label " + "xlabeller=t_" + projectId + "_" + taskId + " --name xlabeller_t_" + projectId + "_"
					+ taskId + " --shm-size 10000000m --ipc host -v /xlabeller:/xlabeller xlabeller_yolov4:2.0 " + "python3 xlabeller_yolov4_train.py"
					+ " --pid " + projectId
					+ " --tid " + taskId
					+ " --batch " + batch
					+ " --subdivisions " + batch;
		} else if (algorithmId.equals("7") || algorithmId.equals("8")) { // efficientdet:latest
			String batch = null;
			String epochs = null;
			String model = null;
			String learning_rate = null;
			JSONParser parser = new JSONParser();
			Object obj = null;
			try {
				obj = parser.parse(config.replaceAll("\\\\",""));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			JSONObject jsonObj = (JSONObject) obj;
			batch = String.valueOf(jsonObj.get("batch_size"));
			epochs = String.valueOf(jsonObj.get("epochs"));
			model = String.valueOf(jsonObj.get("model"));
			learning_rate = String.valueOf(jsonObj.get("learning_rate"));
			
			cmd = "docker run --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES="+ gpuIndex +" --rm -itd --label gpu_id=" + gpuIndex +
					" --label " + "xlabeller=t_" + projectId + "_" + taskId + " --name xlabeller_t_" + projectId + "_"
					+ taskId + " --shm-size 10000000m --ipc host -v /xlabeller:/xlabeller efficientdet:latest " + "python3 run_efficientdet.py"
					+ " --pid " + projectId
					+ " --tid " + taskId
					+ " --learning_rate " + learning_rate
					+ " --batch " + batch
					+ " --epochs " + epochs
					+ " --model " + model;
		} else {
			cmd = "docker run --rm -itd --label gpu_id=" + gpuIndex + " --label " + "xlabeller=t_" + projectId + "_"
				+ taskId + " --name xlabeller_t_" + projectId + "_" + taskId + " --shm-size 10000000m --ipc host -v /xlabeller:/xlabeller ca_"
				+ algorithmId + ":latest" + " python -u run_custom_model.py --action train --mode " + mode
				+ " --params \"" + config + "\" --gpu_id " + gpuIndex + " --log_path /xlabeller/workspace/" + projectId
				+ "/" + taskId + "/log/run.log" + " --annotation /xlabeller/workspace/" + projectId + "/" + taskId
				+ "/annotation/" + annotation + " --evalresult /xlabeller/workspace/" + projectId + "/" + taskId
				+ "/log/mAP.csv" + " --lossresult /xlabeller/workspace/" + projectId + "/" + taskId + "/log/loss.csv"
				+ " --modelPath /xlabeller/workspace/" + projectId + "/" + taskId + "/model/"
				+ " --label /xlabeller/workspace/" + projectId + "/" + taskId + "/class/classes";
		}
		logger.info("docker cmd : " + cmd);
		String cmdResult = cmdExcute(cmd);
		
		if (cmdResult == null) {
			rObj.put("code", "551");
			rObj.put("data", "Training 과정 중에 오류가 발생했습니다.\n잠시 후에 다시 시도해주시길 바랍니다.");
		} else if (cmdResult.length() > 0) {
			rObj.put("code", "200");
			rObj.put("data", "Training을 시작합니다.");
		}
		return rObj;

	}

	
	
	
	
	public Object callCustomInference(String projectId, String taskId, String algorithmId, String gpuIndex, String mode,
			String modelName, String csvFileName, String parameterJson) {
		String cmd = "docker run --rm -itd --label gpu_id=" + gpuIndex + " --label " + "xlabeller=i_" + projectId + "_"
				+ taskId + " --name xlabeller_i_" + projectId + "_" + taskId + " --shm-size 10000000m --ipc host -v /xlabeller:/xlabeller ca_"
				+ algorithmId + ":latest" + " python -u run_custom_model.py --action inference --mode " + mode
				+ " --params \"" + parameterJson + "\" --gpu_id " + gpuIndex + " --dataPath /xlabeller/workspace/"
				+ projectId + "/" + taskId + "/imagepath/imagepath.csv" + " --labels /xlabeller/workspace/" + projectId
				+ "/" + taskId + "/class/classes" + " --modelPath /xlabeller/workspace/" + projectId + "/" + taskId
				+ "/model/" + modelName + " --saveResult /xlabeller/workspace/" + projectId + "/" + taskId + "/result/"
				+ csvFileName;
		logger.info(cmd);
		// System.out.println("cmd:" + cmd);
		String cmdResult = cmdExcute(cmd);
	
		JSONObject rObj = new JSONObject();
		if (cmdResult == null) {
			rObj.put("code", "551");
			rObj.put("data", "Inference 과정 중에 오류가 발생했습니다.\n잠시 후에 다시 시도해주시길 바랍니다.");
		} else if (cmdResult.length() > 0) {
			rObj.put("code", "200");
			rObj.put("data", "Inference를 시작합니다.");
		}
		// if(cmdResult == null) {
		// cmdResult = "error!";
		// }
		return rObj;
	}
	
	
	
	public Object callCustomEfficientdetInference(String projectId, String taskId, String gpuIndex, String modelName,
			String csvFileName) {
		
		
		String cmd = "docker run --ipc host --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES="+ gpuIndex +" --rm -itd --label gpu_id=" + gpuIndex + " --label " + "xlabeller=i_" + projectId + "_" + taskId +
				" --name xlabeller_i_" + projectId + "_" + taskId + 
				" --shm-size 10000000m --ipc host -v /xlabeller:/xlabeller " +
				" --ipc=host " + 
				" efficientdet:latest" + 
				" python3 run_visualization.py" +
				" --pid " + projectId +
				" --tid " + taskId +
				" --gpus 1 " +
				" --modelname " + modelName + 
				" --output " + csvFileName +
				"";
		
		if(taskId.equals("3")) {
			// 기본 학습모델 선택
			System.out.println("기본 학습모델 선택");
			cmd += " --default True ";
		}
		logger.info("efficientdet command::" + cmd);
		//System.out.println(cmd);
		String cmdResult = cmdExcute(cmd);
		JSONObject rObj = new JSONObject();
		if (cmdResult == null) {
			rObj.put("code", "551");
			rObj.put("data", "Inference 과정 중에 오류가 발생했습니다.\n잠시 후에 다시 시도해주시길 바랍니다.");
		} else if (cmdResult.length() > 0) {
			rObj.put("code", "200");
			rObj.put("data", "Inference를 시작합니다.");
		}
		return rObj;
	}
	
	// s.kim 210602
	public Object callCustomYolov4Inference(String projectId, String taskId, String gpuIndex, String modelName, String csvFileName, String classificationThreshold, String type) {
//		String cmd = "docker run --rm -itd --label gpu_id=" + gpuIndex + " --label " + "xlabeller=i_" + projectId + "_" + taskId + 
//				" --name xlabeller_i_" + projectId + "_" + taskId + 
//				" -v xlabeller_nfs:/xlabeller" + 
//				" xlabeller_yolov4:2.0" + 
//				" python3 /workspace/darknet/xlabeller_inference.py" +
//				" --thresh " + classificationThreshold +
//				" --output_csv " + csvFileName +
//				" --weights " + modelName + 
//				" --pid " + projectId + 
//				" --tid " + taskId +
//				" --data_type IMAGE";
		
		
		
		String cmd = "docker run --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES="+ gpuIndex +"  --rm -itd --label gpu_id=" + gpuIndex + " --label " + "xlabeller=i_" + projectId + "_" + taskId +
				" --name xlabeller_i_" + projectId + "_" + taskId + 
				" --shm-size 10000000m --ipc host -v /xlabeller:/xlabeller" +
				" xlabeller_yolov4:2.0" + 
				" python3 /workspace/darknet/xlabeller_inference.py" +
				" --type " + type +
				" --thresh " + classificationThreshold +
				" --output_csv " + csvFileName +
				" --weights " + modelName + 
				" --pid " + projectId + 
				" --tid " + taskId +
				" --data_type IMAGE";

		logger.info("yolo image command::" + cmd);
		// System.out.println(cmd);
		String cmdResult = cmdExcute(cmd);
		JSONObject rObj = new JSONObject();
		if (cmdResult == null) {
			rObj.put("code", "551");
			rObj.put("data", "Inference 과정 중에 오류가 발생했습니다.\n잠시 후에 다시 시도해주시길 바랍니다.");
		} else if (cmdResult.length() > 0) {
			rObj.put("code", "200");
			rObj.put("data", "Inference를 시작합니다.");
		}
		return rObj;
	}
	
	
	// s.kim 210602
	public Object callCustomYolov4VideoInference(String projectId, String taskId, String gpuIndex, String modelName, String csvFileName, String classificationThreshold) {

		String cmd = "docker run --rm -itd --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES="+ gpuIndex +" --label gpu_id=" + gpuIndex + " --label " + "xlabeller=i_" + projectId + "_" + taskId +
				" --name xlabeller_i_" + projectId + "_" + taskId + 
				" --shm-size 10000000m --ipc host -v /xlabeller:/xlabeller" +
				" xlabeller_yolov4:2.0" + 
				" python3 /workspace/darknet/xlabeller_inference.py" +
				" --thresh " + classificationThreshold +
				" --output_csv " + csvFileName +
				" --weights " + modelName + 
				" --pid " + projectId + 
				" --tid " + taskId +
				" --data_type VIDEO";
		logger.info("yolo video command::" + cmd);
		//System.out.println(cmd);
		String cmdResult = cmdExcute(cmd);
		JSONObject rObj = new JSONObject();
		if (cmdResult == null) {
			rObj.put("code", "551");
			rObj.put("data", "Inference 과정 중에 오류가 발생했습니다.\n잠시 후에 다시 시도해주시길 바랍니다.");
		} else if (cmdResult.length() > 0) {
			rObj.put("code", "200");
			rObj.put("data", "Inference를 시작합니다.");
		}
		return rObj;
	}

	public Object algorithmDeploy(String algorithmId, String address) {
		boolean is = false;
		boolean cmdCheck = false;
		String imageName = "ca_" + algorithmId + ":latest";
		String imageRmiCmd = "docker rmi " + imageName + " --force";
		String imageRmiCmdOutput = cmdExcute(imageRmiCmd);
		//String imageBuildCmd = "cd ~/ca_" + algorithmId
		//		+ "_temp && docker build --force-rm=true --rm=true --no-cache --tag " + imageName + " .";
		
		String imageBuildCmd = "cd ~/ca_" + algorithmId
				+ "_temp && docker build --force-rm=true --rm=true --tag " + imageName + " .";
		
		String imageBuildCmdOutput = cmdExcute(imageBuildCmd);
		if (imageBuildCmdOutput == null || imageBuildCmdOutput.length() <= 0) {
			logger.error(this.session.getHost() + "Algorithm Deploy 실패!");
			cmdCheck = true;
		}

		if (!cmdCheck) {
			String[] imageBuildResult = imageBuildCmdOutput.split("\n");
			if (imageBuildResult != null && imageBuildResult.length > 0) {
				String buildStatus = imageBuildResult[imageBuildResult.length - 1];
				String successMsg = "Successfully tagged " + imageName;
				if (buildStatus == null || buildStatus.length() <= 0) {
					is = false;
				} else if (buildStatus.equals(successMsg)) {
					is = true;
				}
			}
		}

		JSONObject rObj = new JSONObject();

		if (is == true) {
			rObj.put("code", "200");
			rObj.put("data", "Deploy algorithm success.");
		} else {
			rObj.put("code", session.getHost());
			JSONObject failNode = new JSONObject();

			failNode.put(address, imageBuildCmdOutput);
			String errMsg = failNode.toString();
			String errMsgResult = (errMsg.replace("\\u001B[91m", "^^")).replace("\\n\\u001B[0m", "^^\\n");
			rObj.put("data", errMsgResult);
		}
		return rObj;
	}

	public String callCustonInference(String projectId, String taskId, String algorithmId, String gpuIndex, String mode,
			String modelName, String csvFileName, String datasetId, String parameterJson) {
		String cmd = "docker run --rm -itd  --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES="+ gpuIndex +"  --label gpu_id=" + gpuIndex + " --label " + "xlabeller=i_" + projectId + "_"
				+ taskId + " --name xlabeller_i_" + projectId + "_" + taskId + " -v nfs:/xlabeller ca_" + algorithmId
				+ ":latest" + " python -u run_custom_model.py --action inference --mode " + mode + " --params \""
				+ parameterJson + "\" --gpu_id " + gpuIndex + " --data_path /xlabeller/workspace/" + projectId + "/"
				+ taskId + "/imagepath/imagepath.csv" + " --label /xlabeller/workspace/" + projectId + "/" + taskId
				+ "/class/classes" + " --modelPath /xlabeller/workspace/" + projectId + "/" + taskId + "/model/"
				+ modelName + " -s" + " --label /xlabeller/workspace/" + projectId + "/" + taskId + "/result/"
				+ csvFileName + "#" + datasetId + ".csv";

		//// System.out.println("cmd:" + cmd);
		String cmdResult = cmdExcute(cmd);
		JSONObject rObj = new JSONObject();
		if (cmdResult == null) {
			rObj.put("code", "551");
			rObj.put("data", "Inference 과정 중에 오류가 발생했습니다.\n잠시 후에 다시 시도해주시길 바랍니다.");
		} else if (cmdResult.length() > 0) {
			rObj.put("code", "200");
			rObj.put("data", "Inference를 시작합니다.");
		}

		return null;
	}

	public boolean isUpTraining(String projectId, String taskId) {
		String getIsUpTrainningCmd = "docker ps --no-trunc --filter \"name=xlabeller_t_" + projectId + "_" + taskId
				+ "\" --filter \"label=xlabeller=t_" + projectId + "_" + taskId
				+ "\" --format \"table {{.Names}}\\${{.Status}}\"";
		
		String getIsUpTrainningCmdOutput = cmdExcute(getIsUpTrainningCmd);

		if (getIsUpTrainningCmdOutput == null || getIsUpTrainningCmdOutput.length() <= 0) {
			return false;
		}
		String[] getIsUpTrainningResult = getIsUpTrainningCmdOutput.split("\n");

		if (getIsUpTrainningResult.length == 1) {
			return false;
		} else if (getIsUpTrainningResult.length == 2) {
			return true;
		}
		return false;
	}

	public boolean killContainer(String type, String projectId, String taskId) {
		boolean is = false;
		if (type.equals("t")) {
			is = isUpTraining(projectId, taskId);
		} else if (type.equals("i")) {
			is = isUpInference(projectId, taskId);
		}
		if (!is) {
			return false;
		}

		String killContainerCmd = "docker rm -f xlabeller_" + type + "_" + projectId + "_" + taskId;
		// System.out.println(killContainerCmd);
		// output ex : xlabeller_i_99_99
		String killContainerCmdOutput = cmdExcute(killContainerCmd);
		if (killContainerCmdOutput == null || killContainerCmdOutput.length() <= 0) {
			return false;
		}
		String[] killContainerResult = killContainerCmdOutput.split("\n");
		killContainerCmd = null;
		killContainerCmdOutput = null;

		if (killContainerResult.length != 1) {
			return false;
		}

		String[] temp = killContainerResult[0].split("_");
		if (temp.length != 4) {
			return false;
		} else if (temp[0].equals("xlabeller") && temp[1].equals(type) && temp[2].equals(projectId)
				&& temp[3].equals(taskId)) {
			return true;
		}

		return false;
	}

	public boolean isUpInference(String projectId, String taskId) {

		String getIsUpTrainningCmd = "docker ps --no-trunc --filter \"name=xlabeller_i_" + projectId + "_" + taskId
				+ "\" --filter \"label=xlabeller=i_" + projectId + "_" + taskId
				+ "\" --format \"table {{.Names}}\\${{.Status}}\"";
		String getIsUpTrainningCmdOutput = cmdExcute(getIsUpTrainningCmd);
		if (getIsUpTrainningCmdOutput == null || getIsUpTrainningCmdOutput.length() <= 0) {
			return false;
		}
		String[] getIsUpTrainningResult = getIsUpTrainningCmdOutput.split("\n");

		if (getIsUpTrainningResult.length == 1) {
			return false;
		} else if (getIsUpTrainningResult.length == 2) {
			return true;
		}

		return false;
	}

	public void algorithmDelete(String imageName) {
		String algorithmDeleteCmd = "docker rmi " + imageName + " --force";
		String algorithmDeleteCmdOutput = cmdExcute(algorithmDeleteCmd);
	}

	public boolean nfsStatus(String address) {
		String nfsStatusCmd = "docker volume inspect --format \'{{ .Options }}\' xlabeller_nfs";
		String nfsStatusCmdOutput = cmdExcute(nfsStatusCmd);
		if (nfsStatusCmdOutput == null || nfsStatusCmdOutput.length() <= 0) {
			return false;
		}
		String joinOutput = "map\\[device::/xlabeller o:addr=" + address + ",rw,nolock type:nfs\\]";

		if (nfsStatusCmdOutput.equals(joinOutput)) {
			return true;
		}
		return false;
	}

	public boolean nfsJoin(String address) {
		String isNfsCmd = "docker volume ls -f \"name=xlabeller_nfs\"";
		String isNfsCmdOutput = cmdExcute(isNfsCmd);
		String[] isNfsResult = isNfsCmdOutput.split("\n");
		if (isNfsResult == null || isNfsResult.length <= 0) {
			return false;
		} else if (isNfsResult.length == 2) {
			String nfsRmCmd = "docker volume rm xlabeller_nfs";
			String nfsRmCmdOutput = cmdExcute(nfsRmCmd);
		}
		String nfsJoinCmd = "docker volume create xlabeller_nfs --opt device=\":/xlabeller\" --opt o=\"addr=" + address
				+ ",rw,nolock\" --opt type=\"nfs\"";
		String nfsJoinCmdOutput = cmdExcute(nfsJoinCmd);
		if (nfsJoinCmdOutput == null || nfsJoinCmdOutput.length() <= 0) {
			return false;
		}

		if (nfsJoinCmdOutput.equals("xlabeller_nfs")) {
			return true;
		}
		return false;
	}
	public boolean videoConvertImage(String projectId, String taskId) {
		
		String cmd = "docker run -t -v xlabeller_nfs:/xlabeller"
				+ " xlabeller_video_convert_yolo:1.1"
				+ " python3 /workspace/video_convert_yolo_train.py"
				+ " --project_id " + projectId
				+ " --task_id " + taskId
				+ " --frame 30";

		String convertOutput = cmdExcute(cmd);
		String[] convertOutputResult = convertOutput.split("\n");
		if (convertOutputResult == null || convertOutputResult.length <= 0) {
			return false;
		} 
		
		String status = convertOutputResult[0];
		status = status.substring(0, status.length()-1);
		
		if (status.equals("true")) {
			return true;
		} else {
			return false;
		}
	}
	

	public Session getSession() {
		return session;
	}

	public void sessionClose() {
		if (this.session != null) {
			this.session.disconnect();
		}
	}

}

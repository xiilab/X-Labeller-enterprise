package com.xlabeller.common.module;

import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.Session;
import com.xlabeller.models.DockerServiceVO;
import com.xlabeller.models.GpuNodeImageVO;
import com.xlabeller.models.GpuNodeStatusVO;
import com.xlabeller.models.SSHSessionVO;
import org.json.simple.JSONObject;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

public class SessionCmdExecute implements Callable<Object>{
	private Session session;
	private SSHSessionVO sshSessionVO;
	
	
	public SessionCmdExecute(Session session, SSHSessionVO sshSessionVO) {
		this.session = session;
		this.sshSessionVO = sshSessionVO;
	}
	
	@Override
	public Object call() {
		// 입력 : ImageName, sshSessionVO.setImageName()를 통해 반드시 ImageName을 입력받아야 됨.
		if(sshSessionVO.getCommnad().equals("imageCheck")) {
			return (GpuNodeImageVO) imageCheck(sshSessionVO.getImageName());
		}
		if(sshSessionVO.getCommnad().equals("getAvailbelGpuList")) {
			return (GpuNodeStatusVO) getAvailbelGpuList();
		}
		// 입력 : ImageName, sshSessionVO.setImageName()를 통해 반드시 ImageName을 입력받아야 됨.
		if(sshSessionVO.getCommnad().equals("findImageCheck")) {
			return (boolean) findImageCheck(sshSessionVO.getImageName());
		}
		if(sshSessionVO.getCommnad().equals("findImageCheck")) {
			return (List<DockerServiceVO>) runTaskList();
		}
		// 입력 : projectId, taskId, sshSessionVO.setProjectId(), sshSessionVO.setTaskId()를 통해 반드시 projectId와 taskId를 입력받아야 됨.
		if(sshSessionVO.getCommnad().equals("isUpTrainning")) {
			return (boolean) isUpTrainning(sshSessionVO.getProjectId(), sshSessionVO.getTaskId());
		}
		// 입력 : projectId, taskId, sshSessionVO.setProjectId(), sshSessionVO.setTaskId()를 통해 반드시 projectId와 taskId를 입력받아야 됨.
		if(sshSessionVO.getCommnad().equals("isUpInference")) {
			return (boolean) isUpInference(sshSessionVO.getProjectId(), sshSessionVO.getTaskId());
		}
		// 입력 : algorithmId, sshSessionVO.setAlgorithmId()를 통해 반드시 algorithmId를 입력받아야 됨.
		if(sshSessionVO.getCommnad().equals("algorithmDeploy")) {
			return (JSONObject) algorithmDeploy(sshSessionVO.getAlgorithmId(), session.getHost());
		}
		if(sshSessionVO.getCommnad().equals("nfsStatus")) {
			return (boolean) nfsStatus(session.getHost());
		}
		if(sshSessionVO.getCommnad().equals("nfsJoin")) {
			return (boolean) nfsJoin(session.getHost());
		}
		else {
			return null;
		}
	}
	
	public String cmdExcute(String command) {
		ChannelExec chanelExec = null;
		String result = "";
		
		try {	
				//logger.info("command : " + command);
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
						//System.out.println("output i : " + i);
						if (i < 0)
							break;
						outputBuffer.append(new String(tmp, 0, i));
						//System.out.println("output : " + new String(tmp, 0, i));
					}

					while (err.available() > 0) {
						int i = err.read(tmp, 0, 1024);
						//System.out.println("error i : " + i);
						if (i < 0)
							break;
						errorBuffer.append(new String(tmp, 0, i));
						//System.out.println("errput : " + new String(tmp, 0, i));
					}

					if (chanelExec.isClosed()) {
						if ((in.available() > 0) || (err.available() > 0))
							continue;
						//System.out.println("exit-status: " + chanelExec.getExitStatus());
						break;
					}
					
					try {
						Thread.sleep(1000);
					} catch (Exception ee) {
						if(in != null) {
							in = null;
						}
						if(err != null) {
							err = null;
						}
					}
				}
				
				if(outputBuffer != null && outputBuffer.length() > 0) {
					//logger.info("cmdExcute Success!" + outputBuffer.toString());
					System.out.println("cmdExcute Success! " + outputBuffer.toString());
					result = outputBuffer.toString();
					//logger.info("cmdExcute Success!" + result);
				}
				else if(errorBuffer != null && errorBuffer.length() > 0) {
					System.out.println("cmdExcute Error!" + errorBuffer.toString());
					result = null;
					//result = errorBuffer.toString();
				} else {
					return null;
				}
				
				in = null;
				err = null;
				chanelExec.disconnect();
			
		} catch (Exception e) {
			System.out.println("Error! " + e);
		} finally {
			if(chanelExec != null ) {
				chanelExec = null;
			}
		}
		
		return result;
	}
	
	// 모든 이미지 검색
		public GpuNodeImageVO imageCheck(String imageName) {
			String cmd = "docker images | tail -n +2 | awk '{print $1\":\"$2}'";
			String result = cmdExcute(cmd);
			String hostName = cmdExcute("hostname").trim();
			String[] splitResult = result.split("\n");
			StringBuffer imageList = new StringBuffer();
			String check = "";
			
			if(result == null || result.length() <= 0) {
				return null;
			}
			
			if(hostName == null || hostName.length() <= 0) {
				hostName = "-";
			}
			
			for(int i = 0; i < splitResult.length; i++) {
				if(splitResult[i] == null || splitResult[i].length() <= 0) {
					continue;
				}
				if(splitResult[i].equals(imageName)) {
					check = splitResult[i] + "==true"; 
				}
				if(i == 0) {
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
			
			
			System.out.println("hostName : " + gpuNodeImageVO.getHost_name());
			System.out.println("ImageList : " + imageList.toString());
			System.out.println("check : " + gpuNodeImageVO.getCheck());
			System.out.println("nodeIp: " + gpuNodeImageVO.getNode_ip());
			
			return gpuNodeImageVO;
		}
		
		// 사용 가능한 gpu 조회
		public GpuNodeStatusVO getAvailbelGpuList(){
			String getGpuNumCmd = "nvidia-smi --query | fgrep \'Attached GPUs\'";
			String getGpuNumCmdOutput = cmdExcute(getGpuNumCmd).replaceAll("\n", "");
			String [] gpuNumResult = getGpuNumCmdOutput.split(": ");
			String hostName = cmdExcute("hostname").trim();
			if(gpuNumResult == null || gpuNumResult.length < 2) {
				return null;
			}
			int gpuNum = 0;
			try {
				gpuNum = Integer.parseInt(gpuNumResult[1]);
			} catch (NumberFormatException e) {
				System.out.println("NumberFormatException Error!" + e);
				return null;
			}
			
			// gpuNUm -> 1,2,3,4 이런식으로 int 값 나옴. gpu 개
			StringBuffer availableGpuIndex = new StringBuffer();
			StringBuffer unAvailableGpuIndex = new StringBuffer();
			for (int i = 0; i < gpuNum; i++) {
				// 얘의 결과는
				String getGpuStatusCmd = "docker ps --filter \"label=gpu_id=" + i + "\"";  
				String getGpuStatusCmdOutput = cmdExcute(getGpuStatusCmd);
				String [] GpuStatusResult = getGpuStatusCmdOutput.split("\n");
				if(i == 0) {
					if (GpuStatusResult.length == 1) { 
					//	availableGpuIndex.add(i);
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
//			availableGpuIndex = availableGpuIndex
//			unAvailableGpuIndex = unAvailableGpuIndex.substring(0,unAvailableGpuIndex.length());
			
			System.out.println("availableGpuIndex : " + availableGpuIndex.toString());
			System.out.println("unAvailableGpuIndex : " + unAvailableGpuIndex.toString());
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
			System.out.println(imageCheckResult);
			String[] splitImageCheckResult = imageCheckResult.split("\n");
			String[] splitImageName = imageName.split(":");
			
			boolean result = false;
			if(splitImageName == null || splitImageName.length != 2) {
				return result;
			}
			if(imageCheckResult == null || imageCheckResult.length() <= 0) {
				return result;
			}
			
			if(splitImageCheckResult == null || splitImageCheckResult.length <= 1) {
				return result;
			}
			if(splitImageName[0] == null || splitImageName[0].length() <= 0) {
				return result;
			}
			if(splitImageName[1] == null || splitImageName[1].length() <= 0) {
				return result;
			}
			
			for(int i = 0; i < splitImageCheckResult.length; i++) {
				if(splitImageCheckResult[i].contains(splitImageName[0]) && splitImageCheckResult[i].contains(splitImageName[1])) {
					result = true;
					return result;
				} else {
					continue;
				}
			}
			if(imageCheckResult.contains(imageName)) {
				System.out.println("true!");
				result = true;
			}
			return result;
		}
		
		// s.kim 추가 ssh로 실행중인 Task List 알아내
        public List<DockerServiceVO> runTaskList() {
            String getRunTaskCmd = "docker ps --no-trunc --filter \"name=xlabeller_\" --filter \"label=xlabeller\" "
                    + "--format \"table {{.Names}}\\${{.Status}}\"";
            //logger.info(getRunTaskCmd);
            String getRunTaskCmdOutput = cmdExcute(getRunTaskCmd);
            String [] getRunTaskResult = getRunTaskCmdOutput.split("\n");
            //length 가 1이면 Header 만나온 경우, 즉 명령어의 결과값이 없음
            List<DockerServiceVO> list = new ArrayList<DockerServiceVO>();
            if (getRunTaskResult.length == 1) {  
                //logger.info("NOT run TASK!");
                return null;
            } else {
                for (int i = 1; i< getRunTaskResult.length; i++) {
                    DockerServiceVO tempVO = new DockerServiceVO();
                    //  xlabeler_t_10_10$up 10second
                    String [] temp = getRunTaskResult[i].split("\\$");
                    if (temp.length != 2) {
                        continue;
                    }
                    String names  = temp[0];
                    String status = temp[1];
                    String[] typePidTid = names.split("_");
                    //System.out.println(names);
                    String type = typePidTid[1];
                    String projectId = typePidTid[2];
                    String taskId = typePidTid[3];
                    tempVO.setProject_id(projectId);
                    tempVO.setId(taskId);
                    tempVO.setStatus(status);
                    tempVO.setType(type);
                    list.add(tempVO);
                }
            
            }
            return list;
        }
		public String callCustomTrain(String projectId, String taskId, String algorithmId, String gpuIndex, String mode, String parameterJson) {
			String cmd = 
					"docker run --rm -itd --label gpu_id=" + gpuIndex + " --label "
					+ "xlabeller=t_" + projectId + "_" + taskId + " --name xlabeller_t_" + projectId + "_" + taskId + " -v nfs:/xlabeller ca_" + algorithmId + ":latest"
					+ " python -u run_custom_model.py --action train --mode " + mode + " --params \"" + parameterJson + "\" --gpu_id " + gpuIndex 
					+ " --log_path /xlabeller/workspace/" + projectId + "/" + taskId + "/log/run.log"
					+ " --annotation /xlabeller/workspace/" + projectId + "/" + taskId + "/annotation/train.csv"
					+ " --evalresult /xlabeller/workspace/" + projectId + "/" + taskId + "/log/mAP.csv"
					+ " --lossresult /xlabeller/workspace/" + projectId + "/" + taskId + "/log/loss.csv"
					+ " --modelPath /xlabeller/workspace/" + projectId + "/" + taskId + "/model/"
					+ " --label /xlabeller/workspace/" + projectId + "/" + taskId + "/class/classes";
			System.out.println("cmd:" + cmd);
			String cmdResult = cmdExcute(cmd);
			//if(cmdResult == null) {
			//	cmdResult = "error!";
			//}
			return cmdResult;
			
		} 
		
		 public Object algorithmDeploy(String algorithmId, String address) {
	            boolean is = false;
	            String imageName = "ca_" + algorithmId + ":latest";
	            String imageRmiCmd = "docker rmi " + imageName + " --force";
	            String imageRmiCmdOutput = cmdExcute(imageRmiCmd);
	            
	            String imageBuildCmd = "cd ~/ca_" + algorithmId + "_temp && docker build --force-rm=true --rm=true --no-cache --tag " + imageName +" .";
	            String imageBuildCmdOutput = cmdExcute(imageBuildCmd);
	            //System.out.println(imageBuildCmdOutput);
	            String[] imageBuildResult = imageBuildCmdOutput.split("\n");
	            String buildStatus = imageBuildResult[imageBuildResult.length -1];
	            String successMsg = "Successfully tagged " + imageName;
	            if(buildStatus == null || buildStatus.length() <= 0) {
	            	is = false;
	            }
	            if (buildStatus.equals(successMsg)) {
	                is = true;
	            }
	            
	            JSONObject rObj = new JSONObject();
	            
	            if(is == true) {
	                rObj.put("code","200");
	                rObj.put("data","Deploy algorithm success.");
	            }else {
	                //JSONArray failNodes = new JSONArray();
	                //JSONObject failNode = new JSONObject();
	                //failNode.put(address,imageBuildCmdOutput);
	                //failNodes.add(failNode);
	                rObj.put("code", session.getHost());
	                JSONObject failNode = new JSONObject();
	                //System.out.println("imageBuildResult");
	                //for (int i = 0; i < imageBuildResult.length;i++) {
	                //  System.out.println(imageBuildResult[i]);
	                //}
	                //System.out.println(imageBuildCmdOutput);
	                //System.out.println("--------");
	                //failNode.put(address, imageBuildCmdOutput.replaceAll("\u001b[91m", "^^").replaceAll("\n\u001b[0m", "^^\n"));
	                failNode.put(address, imageBuildCmdOutput);
//	              System.out.println("-----failNode.toString()-----");
//	              System.out.println(failNode.toString());
	                String errMsg = failNode.toString();
//	              //\n\u001B[0m
//	              String start = "\\u001B[91m";
//	              String end = "u001B[0m";
	                String errMsgResult = (errMsg.replace("\\u001B[91m", "^^")).replace("\\n\\u001B[0m", "^^\\n");
	                System.out.println("-----errMsgResult-----");
	                System.out.println(errMsgResult);
	                //rObj.put("data",failNode.toString());
	                rObj.put("data",errMsgResult);
	            }
	            return rObj;
		 }
		
		public String callCustonInference(String projectId, String taskId, String algorithmId, String gpuIndex, String mode, String modelName, String csvFileName, String datasetId, String parameterJson) {
			String cmd = "docker run --rm -itd --label gpu_id=" + gpuIndex + " --label "
							+ "xlabeller=i_" + projectId + "_" + taskId + " --name xlabeller_i_" + projectId + "_" + taskId + " -v nfs:/xlabeller ca_" + algorithmId + ":latest"
							+ " python -u run_custom_model.py --action inference --mode " + mode + " --params \"" + parameterJson + "\" --gpu_id " + gpuIndex 
							+ " --data_path /xlabeller/workspace/" + projectId + "/" + taskId + "/imagepath/imagepath.csv"
							+ " --label /xlabeller/workspace/" + projectId + "/" + taskId + "/class/classes"
							+ " --modelPath /xlabeller/workspace/" + projectId + "/" + taskId + "/model/" + modelName + " -s"
							+ " --label /xlabeller/workspace/" + projectId + "/" + taskId + "/result/" + csvFileName + "#" + datasetId + ".csv";
			
			//System.out.println("cmd:" + cmd);
			String cmdResult = cmdExcute(cmd);
			JSONObject rObj = new JSONObject();
			if(cmdResult == null) {
				rObj.put("code", "551");
				rObj.put("data", "Inference 과정 중에 오류가 발생했습니다.\n잠시 후에 다시 시도해주시길 바랍니다.");
			} else if(cmdResult.length() > 0){
				rObj.put("code", "200");
				rObj.put("data", "Inference를 시작합니다.");
			}
			//if(cmdResult == null) {
			//	cmdResult = "error!";
			//}
			return null;
		}
		
        public boolean isUpTrainning(String projectId, String taskId) {
            String getIsUpTrainningCmd = "docker ps --no-trunc --filter \"name=xlabeller_t_" + projectId + "_" + taskId 
                    + "\" --filter \"label=xlabeller=t_" + projectId + "_" + taskId + "\" --format \"table {{.Names}}\\${{.Status}}\"";
            String getIsUpTrainningCmdOutput = cmdExcute(getIsUpTrainningCmd);
            String[] getIsUpTrainningResult = getIsUpTrainningCmdOutput.split("\n");
            getIsUpTrainningCmd = null;
            getIsUpTrainningCmdOutput = null;
        
            if (getIsUpTrainningResult.length == 1) {
                getIsUpTrainningResult = null;
                return false;
            }
            if (getIsUpTrainningResult.length == 2) {
                getIsUpTrainningResult = null;
                return true;
            }
        
            getIsUpTrainningResult = null;
            return false;
        }
        
        public boolean killContainer(String type, String projectId, String taskId) {
			boolean is = false;
			if (type.equals("t")) {
				is = isUpTrainning(projectId, taskId);
			} else if (type.equals("i")) {
				is = isUpInference(projectId, taskId);
			}
			if (!is) {
				return false;
			}
			
			String killContainerCmd = "docker rm -f xlabeller_" + type + "_" + projectId + "_" + taskId;
			System.out.println(killContainerCmd);
			//output ex : xlabeller_i_99_99
			String killContainerCmdOutput = cmdExcute(killContainerCmd);
			String [] killContainerResult = killContainerCmdOutput.split("\n");
			killContainerCmd = null;
			killContainerCmdOutput = null;
			
			if (killContainerResult.length != 1) {
				return false;
			}
			String [] temp = killContainerResult[0].split("_");
			if (temp.length != 4) {
				return false;
			}
			if (temp[0].equals("xlabeller") && temp[1].equals(type) && temp[2].equals(projectId) && temp[3].equals(taskId)) {
				return true;
			}
			return false;
		}
		
		public boolean isUpInference(String projectId, String taskId) {

			String getIsUpTrainningCmd = "docker ps --no-trunc --filter \"name=xlabeller_i_" + projectId + "_" + taskId
					+ "\" --filter \"label=xlabeller=i_" + projectId + "_" + taskId
					+ "\" --format \"table {{.Names}}\\${{.Status}}\"";
			String getIsUpTrainningCmdOutput = cmdExcute(getIsUpTrainningCmd);
			String[] getIsUpTrainningResult = getIsUpTrainningCmdOutput.split("\n");
			System.out.println(getIsUpTrainningResult.length);
			getIsUpTrainningCmd = null;
			getIsUpTrainningCmdOutput = null;

			if (getIsUpTrainningResult.length == 1) {
				getIsUpTrainningResult = null;
				return false;
			}
			if (getIsUpTrainningResult.length == 2) {
				getIsUpTrainningResult = null;
				return true;
			}

			getIsUpTrainningResult = null;
			return false;
		}
		 
		public void algorithmDelete(String imageName) {
			String algorithmDeleteCmd = "docker rmi " + imageName + " --force";
			String algorithmDeleteCmdOutput = cmdExcute(algorithmDeleteCmd);
			
		}
		
		public boolean nfsStatus(String address) {
			boolean is = false;
			String nfsStatusCmd = "docker volume inspect --format \'{{ .Options }}\' xlabeller_nfs";
			String nfsStatusCmdOutput = cmdExcute(nfsStatusCmd);
			String joinOutput = "map\\[device::/xlabeller o:addr=" + address + ",rw,nolock type:nfs\\]";
			System.out.println("nfsStatusCmdOutput::" + nfsStatusCmdOutput);
			System.out.println("joinOutput::" + joinOutput);
			if (nfsStatusCmdOutput.equals(joinOutput)) {
				is = true;
			}
			return is;
		}
		
		public boolean nfsJoin(String address) {
			boolean is = false;
			
			String isNfsCmd = "docker volume ls -f \"name=xlabeller_nfs\"";
			String isNfsCmdOutput = cmdExcute(isNfsCmd);
			String [] isNfsResult = isNfsCmdOutput.split("\n");
			
			if (isNfsResult.length == 2) {
				String nfsRmCmd = "docker volume rm xlabeller_nfs";
				String nfsRmCmdOutput = cmdExcute(nfsRmCmd);
            }
			String nfsJoinCmd = "docker volume create xlabeller_nfs --opt device=\":/xlabeller\" --opt o=\"addr=" + address + ",rw,nolock\" --opt type=\"nfs\"";
			String nfsJoinCmdOutput = cmdExcute(nfsJoinCmd);
			
			if (nfsJoinCmdOutput.equals("xlabeller_nfs")) {
				is = nfsStatus(address);
			}
			return is;
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


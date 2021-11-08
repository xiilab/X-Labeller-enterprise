package com.xlabeller.common.module;

import com.google.protobuf.ByteString;
import com.xlabeller.common.module.TrainGRPC.*;
import com.xlabeller.common.module.TrainningGrpc.TrainningBlockingStub;
import com.xlabeller.models.DockerServiceVO;
import com.xlabeller.models.GpuNodeImageVO;
import com.xlabeller.models.GpuNodeStatusVO;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.util.ArrayList;
import java.util.List;


public class GrpcUtils {
	public Object call() {
		
		JSONObject jObj = new JSONObject();
		jObj.put("--epoch","20");
		jObj.put(		"--backbone","resnet50");
		jObj.put(		"--gpu","0");
		jObj.put(		"--steps","1000");
		jObj.put(		"--snapshot-path","/workspace/xlabelerData/snapshot");
		
	    byte[] bData = jObj.toJSONString().getBytes(); 
	    
	    //byteOut.toByteArray();
	    ByteString bDataString = ByteString.copyFrom(bData);
		
		TrainRequest req = TrainRequest.newBuilder().
				setProjectid("data").
				setTaskid("1").
				setParameters(bDataString).
				setAnnotations("data/train_labels.csv").
				setClasses("class/classes").
				build();
		ManagedChannel channel;
		channel = ManagedChannelBuilder.forAddress("192.168.1.62", 8888).usePlaintext().build();
		TrainningBlockingStub bs = TrainningGrpc.newBlockingStub(channel);
		ReadyStatusResponse res = bs.runTrainning(req);
		
		channel.shutdownNow();
		
		return null;
	}
	
	public Object callTrain(String ip, int port,JSONObject jObj,String projectId,String taskId, String annotationPath,String classPath) {
		byte[] bData = jObj.toJSONString().getBytes(); 
		ByteString bDataString = ByteString.copyFrom(bData);
		TrainRequest req = TrainRequest.newBuilder().
				setProjectid(projectId).
				setTaskid(taskId).
				setParameters(bDataString).
				setAnnotations(annotationPath).
				setClasses(classPath).
				build();
		ManagedChannel channel;
		channel = ManagedChannelBuilder.forAddress(ip, port).usePlaintext().build();
		TrainningBlockingStub bs = TrainningGrpc.newBlockingStub(channel);
		ReadyStatusResponse res = bs.runTrainning(req);
		
		channel.shutdownNow();
		
		return null;
	}
	
	public Object callInference(String ip, int port,String projectId,String taskId, String classes,String backbone, String modelName, String score, String csvSavePath, String imagePath,boolean isConvertModel) {
		InferenceRequest req = InferenceRequest.newBuilder().
				setBackbone(backbone).
				setClasses(classes).
				setCsvsavepath(csvSavePath).
				setInferenceimagepath(imagePath).
				setModelname(modelName).
				setProjectid(projectId).
				setTaskid(taskId).
				setScore(score).
				setConvertmodel(isConvertModel).
				build();
		ManagedChannel channel;
		channel = ManagedChannelBuilder.forAddress(ip, port).usePlaintext().build();
		TrainningBlockingStub bs = TrainningGrpc.newBlockingStub(channel);
		ReadyStatusResponse res = bs.runInference(req);
		
		channel.shutdownNow();
		
		return null;
	}
	
	/**/

	public Object callCustomTrain(String ip, int port,JSONObject gpuObj,String gpuIndex,String imageName, String config,String projectId,String taskId) {
//		byte[] bData = jObj.toJSONString().getBytes(); 
//		ByteString bDataString = ByteString.copyFrom(bData);
		
		byte[] bGpu = gpuObj.toJSONString().getBytes(); 
		ByteString bGpuString = ByteString.copyFrom(bGpu);
		
		CustomTrainRequest req = CustomTrainRequest.newBuilder().
				setProjectid(projectId).
				setTaskid(taskId).
				setParameters(config).
				setNodeIpPwd(bGpuString).
				setImageName(imageName).
				setGpuIndex(gpuIndex).
				build();
		ManagedChannel channel;
		channel = ManagedChannelBuilder.forAddress(ip, port).usePlaintext().build();
		TrainningBlockingStub bs = TrainningGrpc.newBlockingStub(channel);
		ReadyStatusResponse res = bs.runCustomTrainning(req);
		channel.shutdownNow();
		
		boolean is = res.getStatus();
		JSONObject rObj = new JSONObject();
		
		if(is == true) {
			rObj.put("code","200");
			rObj.put("data","Training을 시작합니다.");
		}else {
			rObj.put("code","551");
			rObj.put("data",res.getMsg());
		}
		
		return rObj;
	}
	
	public Object callCustomInference(String ip, int port,JSONObject gpuObj,String gpuIndex,String imageName, String config,String projectId,String taskId, String modelName, String csvSavePath, String imagePath) {
//		byte[] bData = jObj.toJSONString().getBytes(); 
//		ByteString bDataString = ByteString.copyFrom(bData);
//		
		byte[] bGpu = gpuObj.toJSONString().getBytes(); 
		ByteString bGpuString = ByteString.copyFrom(bGpu);
		
		CustomInferenceRequest req = CustomInferenceRequest.newBuilder().
				setCsvsavepath(csvSavePath).
				setInferenceimagepath(imagePath).
				setModelname(modelName).
				setProjectid(projectId).
				setTaskid(taskId).
				setGpuIndex(gpuIndex).
				setNodeIpPwd(bGpuString).
				setImageName(imageName).
				setParameters(config).
				build();
		ManagedChannel channel;
		channel = ManagedChannelBuilder.forAddress(ip, port).usePlaintext().build();
		TrainningBlockingStub bs = TrainningGrpc.newBlockingStub(channel);
		ReadyStatusResponse res = bs.runCustomInference(req);
		channel.shutdownNow();
		
		boolean is = res.getStatus();
		JSONObject rObj = new JSONObject();
		
		String[] sliceProjectId = projectId.split("_");
	
		if(sliceProjectId.length == 1) {
			if(is == true) {
				rObj.put("code","200");
				rObj.put("data","Inference를 시작합니다.");
			}else {
				rObj.put("code","551");
				rObj.put("data",res.getMsg());
			}
		} else if(sliceProjectId.length == 2 && (sliceProjectId[1] != null && sliceProjectId[1].equals("m"))) {
			if(is == true) {
				rObj.put("code","200");
				rObj.put("data","mAP파일이 생성되었습니다.");
			}else {
				rObj.put("code","551");
				rObj.put("data","map파일을 생성하는데 실패했습니다.");
			}
		}   
		else {
			if(is == true) {
				rObj.put("code","200");
				rObj.put("data","Inference에 성공하였습니다.");
			}else {
				rObj.put("code","551");
				rObj.put("data",res.getMsg());
			}
		}
		
		return rObj;
		
		
	}
	
	/**/
	
	
	public Object killTrain(String ip, int port,String projectId,String taskId,String type) {
		ControllerRequest req = ControllerRequest.newBuilder().
				setProjectid(projectId).
				setTaskid(taskId).
				setType(type).
				build();
		ManagedChannel channel;
		channel = ManagedChannelBuilder.forAddress(ip, port).usePlaintext().build();
		TrainningBlockingStub bs = TrainningGrpc.newBlockingStub(channel);
		ControllerResponse res = bs.kill(req);
		
		channel.shutdownNow();
		
		return res.getResult();
	}
	
	public Object isUpTrain(String ip, int port,String projectId,String taskId) {
		ControllerRequest req = ControllerRequest.newBuilder().
				setProjectid(projectId).
				setTaskid(taskId).
				build();
		ManagedChannel channel;
		channel = ManagedChannelBuilder.forAddress(ip, port).usePlaintext().build();
		TrainningBlockingStub bs = TrainningGrpc.newBlockingStub(channel);
		ControllerResponse res = bs.isUpContainer(req);
		
		channel.shutdownNow();
		
		return res.getResult();
	}
	
	//수정 필요
	public Object isUpInference(String ip, int port,String projectId,String taskId) {
		ControllerRequest req = ControllerRequest.newBuilder().
				setProjectid(projectId).
				setTaskid(taskId).
				build();
		ManagedChannel channel;
		channel = ManagedChannelBuilder.forAddress(ip, port).usePlaintext().build();
		TrainningBlockingStub bs = TrainningGrpc.newBlockingStub(channel);
		ControllerResponse res = bs.isUpInference(req);
		
		channel.shutdownNow();
		
		return res.getResult();
	}
	
	
	public Object serviceList(String ip, int port) {
//		ControllerRequest req = ControllerRequest.newBuilder().
//				setProjectid(projectId).
//				setTaskid(taskId).
//				build();
		Empty request = Empty.getDefaultInstance();
		ManagedChannel channel;
		channel = ManagedChannelBuilder.forAddress(ip, port).usePlaintext().build();
		TrainningBlockingStub bs = TrainningGrpc.newBlockingStub(channel);
		ServiceResponse res = bs.serviceList(request);
		channel.shutdownNow();
		
		List<TrainGRPC.ServiceList> sl = res.getServicesList();
		
		
		List<DockerServiceVO> list = new ArrayList<DockerServiceVO>();
		for(int i = 0 ; i < sl.size(); i++) {
			DockerServiceVO temp = new DockerServiceVO();
			temp.setProject_id(sl.get(i).getProjectID());
			temp.setId(sl.get(i).getTaskID());
			temp.setStatus(sl.get(i).getState());
			temp.setType(sl.get(i).getType());
			
			list.add(temp);
			
		}
		
		return list;
		
		
//		string state = 1;
//		string taskID = 2;
//		string projectID = 3;
	}
	
	public List<GpuNodeStatusVO> callAvailableGpuList(String ip, int port,JSONObject gpuObj) {
		byte[] bData = gpuObj.toJSONString().getBytes(); 
	    
	    ByteString bDataString = ByteString.copyFrom(bData);
		
		AvailableGpuListRequest req = AvailableGpuListRequest.newBuilder()
			.setNodeIpPwd(bDataString).build();
		
		ManagedChannel channel;
		channel = ManagedChannelBuilder.forAddress(ip, port).usePlaintext().build();
		TrainningBlockingStub bs = TrainningGrpc.newBlockingStub(channel);
		AvailableGpuListResponse res = bs.availableGpuList(req);
		
		channel.shutdownNow();
		
		
		List<TrainGRPC.GpuList> resultList = res.getResultList();
		
		
		List<GpuNodeStatusVO> list = new ArrayList<GpuNodeStatusVO>();
		for(int i = 0 ; i < resultList.size(); i++) {
			GpuNodeStatusVO temp = new GpuNodeStatusVO();
			temp.setNode_ip(resultList.get(i).getNodeIp());
			temp.setHost_name(resultList.get(i).getHostName());
			temp.setAvailable_gpu_index(resultList.get(i).getAvailableGpuIndex());
			temp.setUnavailable_gpu_index(resultList.get(i).getUnavailableGpuIndex());			
			list.add(temp);			
		}
		
		
		return list;
	}
	
	
	public Object callImageCheck(String ip, int port,JSONObject gpuObj,String imageName) {
		byte[] bData = gpuObj.toJSONString().getBytes(); 
	    
	    ByteString bDataString = ByteString.copyFrom(bData);
		
	    ImageCheckRequest req = ImageCheckRequest.newBuilder()
			.setNodeIpPwd(bDataString)
			.setImageName(imageName)
			.build();
		
		ManagedChannel channel;
		channel = ManagedChannelBuilder.forAddress(ip, port).usePlaintext().build();
		TrainningBlockingStub bs = TrainningGrpc.newBlockingStub(channel);
		ImageCheckResponse res = bs.imageCheck(req);
		
		channel.shutdownNow();
		
		
		List<TrainGRPC.ImageList> resultList = res.getResultList();
		
		
		List<GpuNodeImageVO> list = new ArrayList<GpuNodeImageVO>();
		for(int i = 0 ; i < resultList.size(); i++) {
			GpuNodeImageVO temp = new GpuNodeImageVO();
			temp.setNode_ip(resultList.get(i).getNodeIp());
			temp.setHost_name(resultList.get(i).getHostName());
			temp.setCheck(resultList.get(i).getCheck());
			temp.setImages(resultList.get(i).getImageList());			
			list.add(temp);			
		}
		
		
		return list;
	}
	
	public Object callEnrollment(String ip, int port,JSONObject gpuObj,String imageName,String mappingTrain, String mappingInference,String mappingModel, String baseDocker,String folderName,JSONArray dockerCmd) {
		byte[] bData = gpuObj.toJSONString().getBytes(); 
	    
	    ByteString bDataString = ByteString.copyFrom(bData);
		
	    List<TrainGRPC.Line> lineList = new ArrayList<TrainGRPC.Line>();
	    
	    if(dockerCmd != null) {
		    for(int i = 0 ; i < dockerCmd.size();i++) {
		    	JSONObject tempObj = (JSONObject)dockerCmd.get(i);
		    	String cmd = (String)tempObj.get("name");
		    	String type = (String)tempObj.get("type");
		    	lineList.add(TrainGRPC.Line.newBuilder().setCmd(cmd).setType(type).build());
		    }
	    }
	    
	    
	    EnrollmentRequest req = EnrollmentRequest.newBuilder()
			.setNodeIpPwd(bDataString)
			.setImageName(imageName)
			.setMappingTrain(mappingTrain)
			.setMappingInference(mappingInference)
			.setMappingModel(mappingModel)
			.setBaseDocker(baseDocker)
			.setFolderName(folderName)
			.addAllResult(lineList)
			.build();
		
		ManagedChannel channel;
		channel = ManagedChannelBuilder.forAddress(ip, port).usePlaintext().build();
		TrainningBlockingStub bs = TrainningGrpc.newBlockingStub(channel);
		EnrollmentResponse res = bs.customEnrollment(req);
		
		
		channel.shutdownNow();
		
		boolean is = res.getStatus();
		JSONObject rObj = new JSONObject();
		
		if(is == true) {
			rObj.put("code","200");
			rObj.put("data","Deploy algorithm success.");
		}else {
			rObj.put("code","551");
			rObj.put("data",res.getFailedNodes());
		}
		
		return rObj;
		
		
		
	}
	

//message EnrollmentRequest{
//    string imageName = 1; // docker image:tag 예)ca_1:latest(worker node에 ca_1:latest 이름:태그로 배포 )
//    string mappingTrain = 2; // Train 매핑 파라미터 예)Training.train
//    string mappingInference = 3; // Inference 매핑 파라미터 예)Predict.predict
//    string mappingModel = 4; // Model 매핑 파라미터 예)Predict.get_model
//    string baseDocker = 5; // Base가 되는 Docker image (FROM) 예) zzkl/pt_base:python3.7
//    string folderName = 6; // 소스코드의 폴더명 예) 1/src (소스코드가 업로드 되는 실제 위치는 /xlabeller/custom/1/src)
//    bytes nodeIpPwd = 7; // Worker Node의 IP와 비밀번호 예) "{"192.168.1.63":"xiirocks1!","192.168.1.194":"1234"}
//    repeated Line result = 8; // Dockerfile 에 작성될 내용, 순서대로 적힘,
//}
	
}
		
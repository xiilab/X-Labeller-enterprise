package com.xlabeller.task;

import com.xlabeller.common.module.Output;
import com.xlabeller.models.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;






@Controller
@RequestMapping("/task")
public class TaskController {
	

	@Autowired
	private TaskService taskService;  
	
	
	private static final Logger logger = LoggerFactory.getLogger(TaskController.class);

	/**
	 * Task List 가져오기
	 * INPUT : 
	 * 		project_id
	 * 		user_id
	 * 		is_enable
	 * 		label_type
	 * OUTPUT :  
	 * 
	 */
	@RequestMapping("/getTaskList")
	public ModelAndView getTasksetList(TaskVO taskVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.getTaskList(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Model이 존재하지 않는 Task를 제외하고 Task List가져오기
	 * 
	 * INPUT :
	 * 		dataset_id : 해당 데이터셋의 라벨타입으로 필터링해 TaskList를 출력하기 위함
	 * 		page_num
	 * OUTPUT :  
	 * 
	 */
	@RequestMapping("/getQuickInferenceTaskList")
	public ModelAndView getQuickInferenceTaskList(TaskVO taskVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.getQuickInferenceTaskList(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	/**
	 * Quick Training & Quick Infernece에서 task, annotation, inference Output file 이름 자동완성
	 * INPUT : 
	 * 		dataset_id : 해당 데이터셋의 title 가져오기 위함
	 * 
	 */
	@RequestMapping("/setAnnoTaskName")
	public ModelAndView setAnnoTaskName(QuickTrainerVO quickTrainerVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.setAnnoTaskName(quickTrainerVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Task 등록
	 * INPUT : 
	 * 		project_id
	 * 		title
	 * 		contents
	 * 		base_task_id : NULL값 허용 
	 * 		config
	 * 		annotation_id
	 * 
	 */
	@RequestMapping("/insertTask")
	public ModelAndView insertTask(TaskVO taskVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = taskService.insertTask(taskVO);
		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
			}
		}

		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
	/**
	 * 해당 Task의 학습 모델 파일 리스트를 생성날짜를 기준으로 오름차순 출력
	 * INPUT : 
	 * 		task_id
	 * OUTPUT : 
	 * 
	 **/
	@RequestMapping("/getCheckPointList")
	public ModelAndView getCheckPointList(TaskVO taskVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Object result;
		try {
			result = taskService.getCheckPointList(taskVO);
		} catch (Exception e) {
			//e.printStackTrace();
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.s\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
			}
		}
		
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
	/**
	 * Task 삭제
	 * INPUT : 
	 * 		task_id
	 * 
	 */
	@RequestMapping("/deleteTask")
	public ModelAndView deleteTask(TaskVO taskVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result;
		try {
			result = taskService.deleteTask(taskVO);
		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
			}
		}
		
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}

	/**
	 * Task 수정
	 * INPUT : 
	 * 사용 X
	 * 모델 - 테스트 페어가 유지 되어야함.
	 * 
	 * INPUT :
	 * 		title 
	 * 		contents
	 * OUTPUT : 
	 *
	 */
	@RequestMapping("/updateTask")
	public ModelAndView updateTask(TaskVO taskVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = taskService.updateTask(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Task Training run
	 * INPUT : 
	 * 		task_id
	 * 		gpu_node_id
	 * 		gpu_index
	 * OUTPUT :
	 * 		
	 */
	@RequestMapping("/runTrain")
	public ModelAndView runTask(TaskVO taskVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = taskService.runTrain(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Task Inference run
	 * INPUT : 
	 * 		task_id
	 * 		img_path : 이미지 패스
	 * 		model_name : 모델 파일 이름.
	 * 		csv_save_name : filename
	 * 		config : 파라미터 JSON
	 * 		gpu_node_id
	 * 		gpu_index
	 * 
	 */
	@RequestMapping("/runInference")
	public ModelAndView runInference(InferenceVO inferenceVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = taskService.runInference(inferenceVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Task Inference run
	 * INPUT : 
	 * 		task_id
	 * 		img_path : 이미지 패스
	 * 		model_name : 모델 파일 이름.
	 * 		csv_save_name : filename
	 * 		config : 파라미터 JSON
	 * 		gpu_node_id
	 * 		gpu_index
	 * 
	 */
	@RequestMapping("/runInferenceYoloVideo")
	public ModelAndView runInferenceYoloVideo(InferenceVO inferenceVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = taskService.runInferenceYoloVideo(inferenceVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Task ID로 가져오기
	 * INPUT : 
	 * 		task_id
	 * OUTPUT : 
	 * 		 
	 */
	@RequestMapping("/getTaskById")
	public ModelAndView getTaskById(TaskVO taskVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.getTaskById(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	

	/**
	 * 모델리스트 가져오기
	 * INPUT :
	 * 		task_id
	 * OUTPUT : 
	 * 	
	 */
	@RequestMapping("/getModelList")
	public ModelAndView getModelList(TaskVO taskVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.getModelList(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * 인퍼런스 결과 리스트 가져오기
	 * INPUT :
	 * 		id : task id
	 * OUTPUT : 
	 * 		
	 */
	@RequestMapping("/getInferenceResultList")
	public ModelAndView getInferenceResultList(InferenceResultVO inferenceResultVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.getInferenceResultList(inferenceResultVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * 인퍼런스 파라미터 가져오기
	 * INPUT : 
	 * 		task id
	 * OUTPUT : 
	 * 		
	 */
	@RequestMapping("/getInferenceParameter")
	public ModelAndView getInferenceParameter(TaskVO taskVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.getInferenceParameter(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
	
	/**
	 * 인퍼런스 결과 디테일 가져오기
	 * INPUT : 
	 * 		id : task id
	 * 		filename : 선택된 파일 이름
	 * OUTPUT : 
	 * 		
	 */
	@RequestMapping("/getInferenceResult")
	public ModelAndView getInferenceResult(InferenceResultVO inferenceResultVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.getInferenceResult(inferenceResultVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * 학습 로그 읽어오기
	 * INPUT : 
	 * 		id : task id
	 * 		start : 시작지점
	 * 		size : 개수
	 * OUTPUT : 
	 * 		
	 */
	@RequestMapping("/getTrainLog")
	public ModelAndView getTrainLog(TrainLogVO trainLogVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.getTrainLog(trainLogVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * comparison map 그래프 출력하기 위해 csv파일 파싱
	 * INPUT : 
	 * 		id : task_id 
	 * OUTPUT : 
	 * 		
	 */ 
	@RequestMapping("/getMapCSV")
	public ModelAndView getMapCSV(LossMapVO lossMapVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.getMapCSV(lossMapVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
	/**
	 * comparison loss 그래프 출력하기 위해 csv파일 파싱
	 * INPUT : 
	 * 		id : task_id 
	 * OUTPUT : 
	 * 		
	 */ 
	@RequestMapping("/getLossCSV")
	public ModelAndView getLossCSV(LossMapVO lossMapVO) throws Exception  {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.getLossCSV(lossMapVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}

	/**
	 * Task Training kill
	 * INPUT : 
	 * 		task id
	 * OUTPUT :
	 * 		
	 */
	@RequestMapping("/killTrain")
	public ModelAndView killTrain(TaskVO taskVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = taskService.killTrain(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	/**
	 * Task Train status 실행중 / 실행중이지 않음
	 * INPUT : 
	 * 		task id
	 * OUTPUT : 
	 * 
	 */
	@RequestMapping("/getTrainStatus") 
	public ModelAndView getTrainStatus(TaskVO taskVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = taskService.getTrainStatus(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Task Inference status 실행중 / 실행중이지 않음
	 * INPUT : 
	 * 		task id
	 * OUTPUT :
	 * 		
	 */
	@RequestMapping("/getInferenceStatus")
	public ModelAndView getInferenceStatus(TaskVO taskVO, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = taskService.getInferenceStatus(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	/**
	 * GPU 상태 리스트(사용 가능/불가능에 대한 리스트)
	 * 사용 안함
	 * INTPUT : 
	 * Output
	 * 	code : 200
	 *  data : List<GpuNodeStatusVO>
	 * 
	 */
	@RequestMapping("/getGpuStatus")
	public ModelAndView getGpuStatus(TaskVO taskVO) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = taskService.getGpuStatus();
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * GPU내의 사용가능한 알고리즘 리스트(사용 가능/불가능에 대한 리스트)
	 * 사용 안함.
	 * INPUT : 
	 * 		 
	 * Output
	 * 	code : 200
	 *  data : List<GpuNodeImageVO>
	 * 
	 * 
	 * @return
	 */
	@RequestMapping("/getGpuImage")
	public ModelAndView getGpuImage(GpuNodeImageVO gpuNodeImageVO) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = taskService.getGpuImage(gpuNodeImageVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	
	/**
	 * 해당 테스크에서 사용 가능한 GPU / INDEX 리스트
	 * INPUT:
	 * 		task_id
	 * 		algorithm_id
	 * Output
	 * 	code : 200
	 *  data : List<GpuNodeStatusVO>
	 * 
	 * 
	 * @return
	 */
	@RequestMapping("/getSelectableGpuNode")
	public ModelAndView getSelectableGpuNode(TaskVO taskVO) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = taskService.getSelectableGpuNode(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	
	/**
	 * 컨테이너 종료
	 * INPUT :
	 * 		task_id
	 * 		address
	 * OUTPUT : 
	 * 
	 * 
	 */
	@RequestMapping("/killContainer")
	public ModelAndView killContainer(TaskVO taskVO) {
		ModelAndView modelAndView = new ModelAndView();		
		Object result = taskService.killContainer(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Quick Training run
	 * Task명, Annotation명 중복 검사 후 Annotation 생성 
	 * 생성된 Annotation아이디를 반환받아 곧바로 Task생성 후 Training 시작
	 * INPUT : 
	 *  annotation_title
	 *  task_title
	 *  dataset_id
	 * OUTPUT : 
	 */
	@RequestMapping("/quickTraining")
	public ModelAndView quickTraining(TaskVO taskVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result;
		try {
			result = taskService.quickTraining(taskVO);
		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Quick Inference run
	 * Task명, Annotation명 중복 검사 후 Annotation 생성 
	 * 생성된 Annotation아이디를 반환받아 곧바로 Task생성 후 Training 시작
	 * INPUT : 
	 * 		annotation_title
	 *  	task_title
	 *  	dataset_id
	 * OUTPUT : 
	 * 		
	 */
	@RequestMapping("/quickInference")
	public ModelAndView quickInference(TaskVO taskVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result;
		try {
			result = taskService.quickInference(taskVO);
		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * Inference로 저장하려는 CSV Name과 중복된 CSV Name 있는지 검사
	 * INPUT : 
	 * 		task_id
	 * 		save_csv_name
	 * OUTPUT :
	 * 
	 */
	@RequestMapping("/getResultList")
	public ModelAndView getResultList(TaskVO taskVO) {
		ModelAndView modelAndView = new ModelAndView();
		Object result;
		try {
			result = taskService.getResultList(taskVO);
		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = e.getMessage();
			if(errMsg==null){
				result = Output.JsonOutput("9000", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else if( (errMsg.split("#")).length != 2 ){
				result = Output.JsonOutput("9001", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
			}else{
				String[] errMsgArr = errMsg.split("#");
				result = Output.JsonOutput(errMsgArr[0], errMsgArr[1]);
			}
		}
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * mAP파일 생성
	 * Input : 
	 * 		task_id
	 * 		annotation_id
	 * 		gpu_node_id
	 * 		gpu_index
	 * 		config
	 * 		model_name
	 * OUTPUT :
	 * 		 
	 */
	@RequestMapping("/createMap")
	public ModelAndView createMap(TaskVO taskVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.createMap(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * map/annotation_id/에 존재하는 파일 리스트 반환
	 * INPUT : 
	 * 		path
	 * OUTPUT : 
	 * 		 
	 */
	@RequestMapping("/getAnnotationMapList")
	public ModelAndView getAnnotationMapList(TaskVO taskVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.getAnnotationMapList(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
		
	}
	
	/**
	 * map/annotation_id/에 생성된 CSV파일 read
	 * INPUT :
	 * 		 mapPath1
	 * 		 mapPath2
	 * OUTPUT : 
	 * 		 
	 */
	@RequestMapping("/getScoreMapCSV")
	public ModelAndView getScoreMapCSV(TaskVO taskVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.getScoreMapCSV(taskVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}

	@GetMapping("/semiAutoInference")
	public ModelAndView runSemiAutoInference(InferenceVO inferenceVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Object result = taskService.runSemiAutoInference(inferenceVO);
		modelAndView.addObject("result",  result);
		return modelAndView;
	}
	
}
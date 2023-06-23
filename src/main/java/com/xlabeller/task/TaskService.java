package com.xlabeller.task;

import com.jcraft.jsch.Session;
import com.xlabeller.algorithm.AlgorithmDao;
import com.xlabeller.annotation.AnnotationDao;
import com.xlabeller.common.module.*;
import com.xlabeller.data.DataDao;
import com.xlabeller.data.DataService;
import com.xlabeller.gpuNode.GpuNodeDao;
import com.xlabeller.gpuNode.GpuNodeService;
import com.xlabeller.models.*;
import com.xlabeller.project.ProjectDao;
import com.xlabeller.sshSession.SSHCmdExecute;
import com.xlabeller.sshSession.SSHSessionConnection;
import com.xlabeller.sshSession.SessionCmdExecute;
import com.xlabeller.sshSession.SessionSingletone;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.*;
import java.util.concurrent.*;

@Service
public class TaskService {
    @Autowired
    private TaskDao taskDao;

    @Autowired
    private AnnotationDao annotationDao;

    @Autowired
    private GpuNodeDao gpuNodeDao;

    @Autowired
    private DataDao dataDao;

    @Autowired
    private AlgorithmDao algorithmDao;

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private DataService dataService;

    @Autowired
    private GpuNodeService gpuNodeService;

    @Value("#{globalProperty['grpc.address']}")
    private String GRPC_ADDRESS;

    @Value("#{globalProperty['grpc.port']}")
    private int GRPC_PORT;


    private String NFS_MOUNT_ROOT_PATH = "/xlabeller";
    private String NFS_MOUNT_WORKSPACE_PATH = "/xlabeller/workspace/";

    private String WORKSPACE_PATH = "/usr/local/uploadFile/xlabeller/workspace/";
    private String MAP_PATH = "/usr/local/uploadFile/xlabeller/mAP/";

    private static Logger logger = Logger.getLogger(TaskService.class);

    //private SessionSingletone sessionSingletone = SessionSingletone.getInsance();

    public Object getTaskList(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        //페이징
        int count = taskDao.getTaskTotalCount(taskVO);
        int size = 9999;
        int pageStart = 0;
        if (taskVO.getPage_num() != null && !taskVO.getPage_num().equals("")) {
            try {
                pageStart = Integer.valueOf(taskVO.getPage_num()).intValue();
            } catch (NumberFormatException e) {
                // TODO: handle exception
                logger.error("NumberFormatException Error!", e);
                pageStart = 0;
            }
        }

        taskVO.setPage_num(String.valueOf(pageStart * size));
        taskVO.setPage_size(String.valueOf(size));
        taskVO.setTotal_size(String.valueOf(count));

        Object result = taskDao.getTaskList(taskVO);
        return Output.JsonOutput("200", result);
    }

    public Object getQuickInferenceTaskList(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        // TaskList로 taskId가져와서 /model폴더에 파일 있는지 확인
        int size = 9999;
        int pageStart = 0;
        if (taskVO.getPage_num() != null && !taskVO.getPage_num().equals("")) {
            try {
                pageStart = Integer.valueOf(taskVO.getPage_num()).intValue();
            } catch (NumberFormatException e) {
                logger.error("NumberFormatException Error!", e);
                pageStart = 0;
            }
        }

        if (taskVO.getDataset_id() == null || taskVO.getDataset_id().length() <= 0) {
            return Output.JsonOutput("4061", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        DatasetVO datasetVO = new DatasetVO();
        datasetVO.setDataset_id(taskVO.getDataset_id());
        DatasetVO findDatasetVO = dataDao.getDatasetById(datasetVO);

        taskVO.setPage_num(String.valueOf(pageStart * size));
        taskVO.setPage_size(String.valueOf(size));
        taskVO.setLabel_type(findDatasetVO.getLabel_type());
        List<TaskVO> taskList = taskDao.getTaskList(taskVO);
        List<TaskVO> result = new ArrayList<TaskVO>();

        File f = null;
        File[] files = null;
        try {
            for (int i = 0; i < taskList.size(); i++) {
                String path = WORKSPACE_PATH + taskList.get(i).getProject_id() + "/" + taskList.get(i).getTask_id() + "/";
                String modelPath = path + "model";

                f = new File(modelPath);

                files = f.listFiles(new FilenameFilter() {
                    @Override
                    public boolean accept(File dir, String name) {
                        return !name.equals(".DS_Store");
                    }
                });

                if (files != null && files.length > 0) {
                    result.add(taskList.get(i));
                }
            }
        } catch (Exception e) {
            logger.error("getQuickInferenceTaskList Error!", e);
        } finally {
            f = null;
            files = null;
        }
        return Output.JsonOutput("200", result);
    }

    public Object getCheckPointList(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        if (taskVO.getTask_id() == null || taskVO.getTask_id().length() <= 0) {
            return Output.JsonOutput("4061", "Task ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        TaskVO findTaskVO = taskDao.getTaskById(taskVO);
        if (findTaskVO == null || findTaskVO.getTask_id() == null || findTaskVO.getTask_id().length() <= 0) {
            return Output.JsonOutput("4071", "Task가 손상되었습니다.");
        }

        String pathName = WORKSPACE_PATH + findTaskVO.getProject_id() + "/" + findTaskVO.getTask_id() + "/model/";
        File[] files = null;
        String fileList[] = null;
        try {
            files = new File(pathName).listFiles(); // 경로에 있는 파일목록구함
            if ((files == null || files.length <= 0) && !taskVO.getTask_id().equals("3")) {
                return Output.JsonOutput("4001", "모델이 존재하지 않습니다.\n학습 후 Inference해주세요.");
            }

            // 무조건 3은 패스
            if (taskVO.getTask_id().equals("3")) {
                // ㄹㅇ /xlabeller/src/main/webapp/WEB-INF/view/trainer/task/map.jsp 코드 보느라고 눈깔빠지는줄
                fileList = new String[]{
                        "checkpoint-130.pth.tar"
                };
            } else {
                fileList = new String[files.length];
                Arrays.sort(files, new Comparator<File>() {
                    public int compare(File f1, File f2) {
                        return Long.valueOf(f1.lastModified()).compareTo(f2.lastModified());
                    }
                });

                for (int i = 0; i < files.length; i++) {
                    fileList[i] = files[i].getName();
                }
            }


        } catch (Exception e) {
            if (e instanceof NumberFormatException) {
                logger.error("NumberFormatException Error!", e);
            } else {
                logger.error("Exception Error!", e);
            }
        } finally {
            files = null;
        }

        return Output.JsonOutput("200", fileList);
    }

    // inference파일 저장할 때 파일명 중복 검사
    public Object getResultList(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        if (taskVO.getTask_id() == null || taskVO.getTask_id().length() <= 0) {
            return Output.JsonOutput("4061", "Task ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if (taskVO.getCsv_save_name() == null || taskVO.getCsv_save_name().length() <= 0) {
            return Output.JsonOutput("4061", "저장할 CSV파일명을 입력해주세요.");
        }

        TaskVO findTaskVO = taskDao.getTaskById(taskVO);
        if (findTaskVO == null || findTaskVO.getTask_id() == null || findTaskVO.getTask_id().length() <= 0) {
            return Output.JsonOutput("4071", "해당 Task 정보가 손상되어 Inference결과로 생성된 CSV파일 리스트를 출력할 수 없습니다.\n새로고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        String pathName = WORKSPACE_PATH + findTaskVO.getProject_id() + "/" + findTaskVO.getTask_id() + "/result/";
        File[] files = null;

        try {
            files = new File(pathName).listFiles(); // 경로에 있는 파일목록구함
            if (files == null || files.length <= 0) {
                return Output.JsonOutput("200", "중복된 CSV Name이 없습니다.");
            }
            //fileList = new String[files.length];

//			Arrays.sort(files, new Comparator<File>() {
//				public int compare(File f1, File f2) {
//					return Long.valueOf(f1.lastModified()).compareTo(f2.lastModified());
//				}
//			});

            for (int i = 0; i < files.length; i++) {
                if (files[i].getName() == null) {
                    continue;
                }
                if (files[i].getName().equals(taskVO.getCsv_save_name())) {
                    return Output.JsonOutput("3404", "중복된 CSV Name이 이미 존재합니다. 덮어쓰겠습니까?");
                }
            }
        } catch (Exception e) {
            logger.error("Exception Error!", e);
            return Output.JsonOutput("4091", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 문제가 발생할 경우 관리자에게 문의해주세요.");
        } finally {
            files = null;
        }

        return Output.JsonOutput("200", "중복된 CSV Name이 없습니다.");
    }

    public Object insertTask(TaskVO taskVO) throws CustomException {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        int cnt = 0;
        int updateCnt = 0;
        taskVO.setUser_id(userInfo.getUser_id());
        taskVO.setIs_fixed("0");
        taskVO.setIs_enable("1");
        TaskVO findTaskVO = new TaskVO();
        TaskVO insertTaskVO = new TaskVO();
        String path = WORKSPACE_PATH;
        if (taskVO.getProject_id() == null || taskVO.getProject_id().equals("")) {
            return Output.JsonOutput("4061", "Task를 생성할 Project폴더를 선택해주세요.");
        }

        if (taskVO.getTitle() == null || taskVO.getTitle().length() <= 0) {
            return Output.JsonOutput("4061", "제목을 입력해주세요.");
        }

        if (taskVO.getContents() == null || taskVO.getContents().length() <= 0) {
            return Output.JsonOutput("4061", "설명을 입력해주세요.");
        }

        if (taskVO.getConfig() == null || taskVO.getConfig().length() <= 0) {
            return Output.JsonOutput("4061", "알고리즘의 파라미터를 입력해주세요.");
        }

        if (taskVO.getTitle().length() > 100) {
            return Output.JsonOutput("4061", "제목의 길이는 100자를 초과할 수 없습니다.\n다른 제목을 입력해주세요.");
        }

        if (taskVO.getContents().length() > 300) {
            return Output.JsonOutput("4061", "설명의 길이는 300자를 초과할 수 없습니다.\n다른 설명을 입력해주세요.");
        }

        List<TaskVO> dupCheck = taskDao.getCheckTaskName(taskVO);
        if (dupCheck != null && !dupCheck.isEmpty() && dupCheck.size() > 0) {
            return Output.JsonOutput("300", "중복된 Task명입니다.");
        }

        TaskVO updateTaskVO = new TaskVO();
        String config = null;
        String pretrained_model = null;

        // Task 생성 (Inheritance X)
        if (taskVO.getBase_task_id() == null) {
            cnt = taskDao.insertTask(taskVO);
            if (cnt != 1) {
                throw new CustomException("4001#등록이 올바르지 않습니다.");
            }

            updateTaskVO = new TaskVO();
            updateTaskVO = taskDao.getTaskById(taskVO);
            JSONParser parser = new JSONParser();
            JSONObject configJson = new JSONObject();
            try {
                configJson = (JSONObject) parser.parse(updateTaskVO.getConfig());
            } catch (ParseException e) {
                //logger.error("ParseExeption Error!", e);
                throw new CustomException("4001#등록이 올바르지 않습니다.");
            }

            configJson.put("pretrained_model", null);

            updateTaskVO.setConfig(configJson.toJSONString());
            updateTaskVO.setBase_task_id(null);
            updateCnt = taskDao.updateTask(updateTaskVO);
            if (updateCnt != 1) {
                throw new CustomException("4001#업데이트가 올바르지 않습니다.");
            }

            path = path + taskVO.getProject_id() + "/" + taskVO.getTask_id() + "/";
        }
        // Inheritance를 통해 Task 생성
        else if (taskVO.getBase_task_id() != null && taskVO.getBase_task_id().length() > 0) {
            TaskVO findBaseTaskVO = new TaskVO();
            findBaseTaskVO.setTask_id(taskVO.getBase_task_id());

            TaskVO baseTaskVO = taskDao.getTaskById(findBaseTaskVO);
            if (baseTaskVO == null) {
                return Output.JsonOutput("4071", "Inheritance하려는 Task가 정보가 손상되어 생성할 수 없습니다.");
            }
            if (baseTaskVO.getProject_id() == null || baseTaskVO.getProject_id().length() <= 0) {
                return Output.JsonOutput("4071", "Inheritance하려는 Task가 정보가 손상되어 생성할 수 없습니다.");
            }
            if (baseTaskVO.getTask_id() == null || baseTaskVO.getTask_id().length() <= 0) {
                return Output.JsonOutput("4071", "Inheritance하려는 Task가 정보가 손상되어 생성할 수 없습니다.");
            }

            // Base가 되는 task가 학습 중일 경우 task 생성을 하지 못하도록 막아야함.(학습모델이 미완성일 수 있기 때문에, Inference는 상관 X)
            GpuNodeVO inGpuNodeVO = new GpuNodeVO();
            inGpuNodeVO.setType("worker");
            List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);

            // worker List를 넘겨 세션이 연결된 gpuList를 반환받음.
            // JsonOutputVO로 반환할 경우 에러가 발생한 것
            boolean isSessionConnect = true;
            Object sessionObj = getSSHSessionList(gpuList);
            if (sessionObj instanceof JsonOutputVO) {
                //return Output.JsonOutput("300", "현재 학습이 실행중인 Task입니다.\n해당 Task의 학습이 끝난 후 시도해주세요.");
                isSessionConnect = false;
            }

            // isSessionConnect가 true일 때, Base Task 학습 중인지 검사 후 TASK 생성
            // isSessionConnect가 false일 때, Base Task 학습 중인지 검사하지 않고 TASK 생성
            if (isSessionConnect == true) {
                // sessionObj 메소드에서 list 크기가 0일 경우 JsonOutputVO로 반환하기 때문에 사이즈 체크 필요 X
                List<Session> sessionList = (List<Session>) sessionObj;

                // 연결된 각 세션들에 이미지 체크를 수행하기 위한 콜렉션 리스트
                Collection isUpTrainingCmd = new ArrayList();
                // 이미지 체크의 결과를 반환받는 리스트
                List<Future<Boolean>> isUpTrainingResult = new ArrayList();

                for (int i = 0; i < sessionList.size(); i++) {
                    SSHSessionVO sshSessionVO = new SSHSessionVO();
                    sshSessionVO.setCommnad("isUpTraining");
                    sshSessionVO.setProjectId(baseTaskVO.getProject_id());
                    sshSessionVO.setTaskId(baseTaskVO.getTask_id());
                    // 이미지 체크 명령어, 이미지 이름을 넘겨주고 객체를 생성해 콜렉션에 추가
                    isUpTrainingCmd.add(new SessionCmdExecute(sessionList.get(i), sshSessionVO));
                }

                ExecutorService executorService = Executors.newFixedThreadPool(10);
                try {
                    // 콜렉션에 생성된 객체를 쓰레드로 실행시킴, 명령어를 실행해 성공한 경우에만 리스트에 추가함.
                    isUpTrainingResult = executorService.invokeAll(isUpTrainingCmd);
                } catch (Exception e) {
                    if (e instanceof InterruptedException) {
                        logger.error("InterruptedException Error!", e);
                    } else {
                        logger.error("Exception Error!", e);
                    }
                } finally {
                    executorService.shutdown();
                }

//				if (isUpTrainingResult.size() <= 0 || isUpTrainingResult.isEmpty()) {
//					return Output.JsonOutput("3452", "Inheritance로 Task를 생성하는데 실패했습니다.\n새로 고침 후 다시 한번 시도해주시고 지속적으로 발생항 경우 관리자에게 문의해주시길 바랍니다.");
//				}

                for (int i = 0; i < isUpTrainingResult.size(); i++) {
                    Boolean isUpTraining;
                    try {
                        isUpTraining = isUpTrainingResult.get(i).get();
                        if (isUpTraining) {
                            return Output.JsonOutput("300", "현재 학습이 실행중인 Task입니다.\n해당 Task의 학습이 끝난 후 시도해주세요.");
                        }
                    } catch (Exception e) {
                        // 결과를 확인할 때 에러가 발생할 경우 throw new Exception으로 메소드를 반환할지 다음 반복문을 진행시킬지 결정해야됨
                        logger.error("Exception Error!", e);
                        continue;
                    }

                }
            }

            findTaskVO.setTask_id(taskVO.getBase_task_id());
            findTaskVO = taskDao.getTaskById(findTaskVO);
            // 프로젝트명 + 테스크명 + 체크포인트이름을 contents에 넣음. title을 얻기 위함
            ProjectTaskVO projectTaskVO = new ProjectTaskVO();
            projectTaskVO.setProject_id(findTaskVO.getProject_id());
            projectTaskVO.setTask_id(findTaskVO.getTask_id());
            projectTaskVO = taskDao.getProjectTaskById(projectTaskVO);
            // Insert
            //TaskVO findTaskVO = taskDao.getTaskById(taskVO);
            insertTaskVO = new TaskVO();
            insertTaskVO.setProject_id(taskVO.getProject_id());
            insertTaskVO.setTitle(taskVO.getTitle());
            insertTaskVO.setUser_id(userInfo.getUser_id());
            insertTaskVO.setIs_enable("1");
            insertTaskVO.setIs_fixed("0");
            insertTaskVO.setBase_task_id(taskVO.getBase_task_id());
            insertTaskVO.setContents(taskVO.getContents() + " {" + projectTaskVO.getProject_title() + "/" + projectTaskVO.getTask_title() + "/" + taskVO.getCheck_point_name() + "}");
            insertTaskVO.setAlgorithm_id(findTaskVO.getAlgorithm_id());
            insertTaskVO.setConfig(taskVO.getConfig());
            insertTaskVO.setLabel_type(findTaskVO.getLabel_type());

            cnt = taskDao.insertTask(insertTaskVO);
            if (cnt != 1) {
                throw new CustomException("4001#등록이 올바르지 않습니다.");
            }
            taskVO.setTask_id(insertTaskVO.getTask_id());

            path = path + taskVO.getProject_id() + "/" + insertTaskVO.getTask_id() + "/";
//			System.out.println(path);

        }
//		if(cnt != 1){
//			throw new Exception("4001#등록이 올바르지 않습니다.");
//		}

        File f = new File(path);
        boolean is = f.mkdirs();
        if (!is) {
            throw new CustomException("4032#등록이 올바르지 않습니다.");
        }

        f = new File(path + "annotation");
        is = f.mkdirs();
        if (!is) {
            throw new CustomException("4033#등록이 올바르지 않습니다.");
        }

        f = new File(path + "class");
        is = f.mkdirs();
        if (!is) {
            throw new CustomException("4034#등록이 올바르지 않습니다.");
        }

        f = new File(path + "log");
        is = f.mkdirs();
        if (!is) {
            throw new CustomException("4035#등록이 올바르지 않습니다.");
        }

        f = new File(path + "model");
        is = f.mkdirs();
        if (!is) {
            throw new CustomException("4036#등록이 올바르지 않습니다.");
        }

        f = new File(path + "result");
        is = f.mkdirs();
        if (!is) {
            throw new CustomException("4037#등록이 올바르지 않습니다.");
        }

        f = new File(path + "pre");
        is = f.mkdirs();
        if (!is) {
            throw new CustomException("4038#등록이 올바르지 않습니다.");
        }

        f = new File(path + "imagepath");
        is = f.mkdirs();
        if (!is) {
            throw new CustomException("4038#등록이 올바르지 않습니다.");
        }

        f = new File(path + "videopath");
        is = f.mkdirs();
        if (!is) {
            throw new CustomException("4038#등록이 올바르지 않습니다.");
        }

        if (taskVO.getBase_task_id() != null) {
            config = taskVO.getConfig().substring(0, taskVO.getConfig().length() - 1);

            String checkPointPath = WORKSPACE_PATH + findTaskVO.getProject_id() + "/" + findTaskVO.getTask_id() + "/model/" + taskVO.getCheck_point_name();
            String checkPointCopyPath = WORKSPACE_PATH + insertTaskVO.getProject_id() + "/" + insertTaskVO.getTask_id() + "/pre/" + taskVO.getCheck_point_name();
            String checkPointCopyPath2 = WORKSPACE_PATH + insertTaskVO.getProject_id() + "/" + insertTaskVO.getTask_id() + "/pre";
            String preTrainedModel = NFS_MOUNT_WORKSPACE_PATH + insertTaskVO.getProject_id() + "/" + insertTaskVO.getTask_id() + "/pre/" + taskVO.getCheck_point_name();
            String folderName = checkPointCopyPath2 + "/" + taskVO.getCheck_point_name();

            NIOFileCopy fileCopy = new NIOFileCopy();
            File file = new File(checkPointPath);

            if (file.isDirectory()) {
                File folder = new File(folderName);
                boolean flag = folder.mkdir();
                if (flag == false) {
                    throw new CustomException("4001#체크포인트 복사에 실패하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
                }
                File f1 = new File(checkPointPath);
                File f2 = new File(folderName);
                fileCopy.allFileCopy(f1, f2);
            } else {
                boolean copyState = fileCopy.nioFileCopy(checkPointPath, checkPointCopyPath);
                if (copyState == false) {
                    try {
                        Object deleteTask = deleteTask(insertTaskVO);
                    } catch (Exception e) {
                        throw new CustomException("4001#체크포인트 복사에 실패하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
                    }
                }
            }

            pretrained_model = config + ",\"pretrained_model\":\"" + preTrainedModel + "\"}";
            updateTaskVO = new TaskVO();
            updateTaskVO.setTask_id(insertTaskVO.getTask_id());
            updateTaskVO.setConfig(pretrained_model);
            updateCnt = taskDao.updateTask(updateTaskVO);
            if (updateCnt != 1) {
                throw new CustomException("4001#업데이트가 올바르지 않습니다.");
            }
        }

        AnnotationVO annotationVO = new AnnotationVO();
        annotationVO.setAnnotation_id(taskVO.getAnnotation_id());
        AnnotationVO annotationResult = annotationDao.getAnnotationById(annotationVO);
        if (annotationResult == null || annotationResult.getLabel_type() == null || annotationResult.getLabel_type().length() <= 0) {
            throw new CustomException("4001#등록이 올바르지 않습니다.");
        }
        if (annotationResult.getLabel_type().equals("IMAGE_SEGMENTATION")) {
            JSONObject segJson;
            try {
                segJson = (JSONObject) importSegAnnotation(annotationResult);
                is = saveAnnotationtoJson(segJson.toJSONString(), path + "annotation/segmentation.json");
                if (!is) {
                    throw new CustomException("4001#등록이 올바르지 않습니다.");
                }
            } catch (Exception e) {
                throw new CustomException("4001#등록이 올바르지 않습니다.");
            }
        } else if (annotationResult.getLabel_type().equals("IMAGE_BBOX")) {
            is = importAnnotation(path + "annotation/train.csv", annotationResult.getData());
            if (!is) {
                throw new CustomException("4001#등록이 올바르지 않습니다.");
            }
        } else if (annotationResult.getLabel_type().equals("VIDEO_BBOX")) {
            JSONArray videoBoxJson = (JSONArray) importVideoBoxAnnotation(annotationResult);
            String jsonString = videoBoxJson.toJSONString();
            jsonString = jsonString.replace("\"[", "[");
            jsonString = jsonString.replace("]\"", "]");
            try {
                is = saveAnnotationtoJson(jsonString, path + "annotation/videoBox.json");
                if (!is) {
                    throw new CustomException("4001#등록이 올바르지 않습니다.");
                }
            } catch (Exception e) {
                throw new CustomException("4001#등록이 올바르지 않습니다.");
            }
        } else {
            //logger.error("insertTask annotationResult.getLabelType Error! annotationResult.getLabel_type() : " + annotationResult.getLabel_type());
            throw new CustomException("4001#등록이 올바르지 않습니다.");
        }

        if (annotationResult.getLabel_type().equals("IMAGE_SEGMENTATION") || annotationResult.getLabel_type().equals("IMAGE_BBOX")) {
            is = importClass(path + "class/classes", annotationResult.getData());
            if (!is) {
                throw new CustomException("4001#등록이 올바르지 않습니다.");
            }
        } else if (annotationResult.getLabel_type().equals("VIDEO_BBOX")) {
            is = importVideoBoxClass(path + "class/classes", annotationResult.getData());
            if (!is) {
                throw new CustomException("4001#등록이 올바르지 않습니다.");
            }
        }


        // s.kim add yolo, video -> img
        if (annotationResult.getLabel_type().equals("VIDEO_BBOX") && taskVO.getAlgorithm_id().equals("2")) {
            // chane video to img

            GpuNodeVO masterGpuNodeVO = new GpuNodeVO();
            masterGpuNodeVO.setType("master");
            List<GpuNodeVO> masterNode = gpuNodeDao.getGpuNodeList(masterGpuNodeVO);

            if (masterNode == null || masterNode.size() == 0) {
                throw new CustomException("801#실행중에 예기치 않은 문제가 발생했습니다. 문의 부탁드립니다");
            }
            String host = null;
            String pw = null;
            int port = 0;
            String userName = null;
            for (int i = 0; i < masterNode.size(); i++) {
                host = masterNode.get(i).getAddress();
                pw = masterNode.get(i).getPassword();
                port = Integer.valueOf(masterNode.get(i).getPort());
                userName = masterNode.get(i).getAccount();
            }

            String projectId = taskVO.getProject_id();
            String taskId = taskVO.getTask_id();

            SSHSessionConnection sshConnection = new SSHSessionConnection(userName, port, host, pw);
            Session session = sshConnection.call();
            SessionCmdExecute sessionCmdExecute = new SessionCmdExecute(session);
            boolean convertStatus = sessionCmdExecute.videoConvertImage(projectId, taskId);
            if (!convertStatus) {
                throw new CustomException("801#비디오를 이미지로 변환 하는 과정에서 문제가 발생했습니다.\n비디오 약 1초당 1장의 이미지로 변환되며 라벨이 해당 비디오 시간초에 없을 경우 변환이 불가능할 수 있습니다.\n지속적으로 문제가 발생시 문의 부탁드립니다.");
            }
            // update task label type
            updateTaskVO.setLabel_type("IMAGE_BBOX");
            updateCnt = taskDao.updateTask(updateTaskVO);
            if (updateCnt != 1) {
                throw new CustomException("801#비디오를 이미지로 변환 하는 과정에서 문제가 발생했습니다. 문의 부탁드립니다.");
            }
        }

        return Output.JsonOutput("200", "등록이 완료되었습니다");
    }

    public Object deleteTask(TaskVO taskVO) throws CustomException {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다.");
        }
        if (taskVO.getTask_id() == null || taskVO.getTask_id().length() <= 0) {
            return Output.JsonOutput("4061", "TASK ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        TaskVO oneTask = taskDao.getTaskById(taskVO);
        if (oneTask == null) {
            //return Output.JsonOutput("4071", "삭제가 불가능한 테스크입니다.");
            return Output.JsonOutput("4071", "삭제할 TASK 정보가 손상되어 삭제할 수 없습니다.\\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
            //throw new CustomException("4071#삭제할 TASK 정보가 손상되어 삭제할 수 없습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if (oneTask.getTask_id() == null || oneTask.getTask_id().length() <= 0) {
            return Output.JsonOutput("4071", "삭제할 TASK 정보가 손상되어 삭제할 수 없습니다.\\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
            //throw new CustomException("4071#삭제할 TASK 정보가 손상되어 삭제할 수 없습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if (oneTask.getProject_id() == null || oneTask.getProject_id().length() <= 0) {
            return Output.JsonOutput("4071", "삭제할 TASK 정보가 손상되어 삭제할 수 없습니다.\\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
            //throw new CustomException("4071#삭제할 TASK 정보가 손상되어 삭제할 수 없습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        JsonOutputVO taskServiceCheck = (JsonOutputVO) gpuNodeService.getServiceList();
        List<DockerServiceVO> serviceList = (List<DockerServiceVO>) taskServiceCheck.getData();
        for (int i = 0; i < serviceList.size(); i++) {
            DockerServiceVO service = serviceList.get(i);
            if (oneTask.getTask_id().equals(service.getId())) {
                return Output.JsonOutput("4061", "현재 동작하고 있는 Task입니다.");
            }
        }

        String projectId = oneTask.getProject_id();
        String taskId = oneTask.getTask_id();
        oneTask.setBase_task_id(oneTask.getTask_id());

        if (oneTask.getIs_fixed() != null && oneTask.getIs_fixed().equals("1")) {
            return Output.JsonOutput("4071", "삭제가 불가능한 테스크입니다");
        }

        int cnt = taskDao.deleteTask(taskVO);
        if (cnt != 1) {
            throw new CustomException("4071#Task를 삭제하는 과정에서 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
            //return Output.JsonOutput("4001", "삭제가 불가능한 테스크입니다");
        }

        String delPath = WORKSPACE_PATH + projectId + "/" + taskId + "/";
        FileUtils.delete(delPath);

        return Output.JsonOutput("200", "삭제가 완료되었습니다");
    }


    public Object updateTask(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        if (taskVO.getTask_id() == null || taskVO.getTask_id().length() <= 0) {
            return Output.JsonOutput("4061", "TASK ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        TaskVO outputTaskVO = taskDao.getTaskById(taskVO);
        if (outputTaskVO.getIs_fixed() != null && outputTaskVO.getIs_fixed().equals("1")) {
            return Output.JsonOutput("4071", "업데이트가 불가능한 테스크 입니다");
        }

        int cnt = taskDao.updateTask(taskVO);
        if (cnt == 1) {
            return Output.JsonOutput("200", "업데이트가 완료되었습니다");
        } else {
            return Output.JsonOutput("4001", "업데이트가 올바르지 않습니다");
        }
    }

    private boolean importAnnotation(String path, String data) {

        JSONParser jp = new JSONParser();
        JSONArray jArr = null;

        try {
            jArr = (JSONArray) jp.parse(data);
        } catch (ParseException e) {
            logger.error("importAnnotation ParseException Error!", e);
            return false;
        }

        for (int i = 0; i < jArr.size(); i++) {
            String tempPath = (String) ((JSONObject) jArr.get(i)).get("path");
            tempPath = NFS_MOUNT_ROOT_PATH + "/" + tempPath;
            ((JSONObject) jArr.get(i)).put("path", tempPath);

            double tx = 0;
            double ty = 0;
            double tw = 0;
            double th = 0;
            try {
                tx = Math.floor((double) Double.valueOf((String) ((JSONObject) jArr.get(i)).get("x")).doubleValue());
                ty = Math.floor((double) Double.valueOf((String) ((JSONObject) jArr.get(i)).get("y")).doubleValue());
                tw = Math.floor((double) Double.valueOf((String) ((JSONObject) jArr.get(i)).get("w")).doubleValue());
                th = Math.floor((double) Double.valueOf((String) ((JSONObject) jArr.get(i)).get("h")).doubleValue());
            } catch (NumberFormatException e) {
                logger.error("NumverFormatException Erorr!", e);
                logger.error("tx : " + tx);
                logger.error("ty : " + ty);
                logger.error("tw : " + tw);
                logger.error("th : " + th);
                return false;
            }
//				int tx = Integer.valueOf(  (String)((JSONObject)jArr.get(i)).get("x")  ).intValue();
//				int ty = Integer.valueOf(  (String)((JSONObject)jArr.get(i)).get("y")  ).intValue();
//				int tw = Integer.valueOf(  (String)((JSONObject)jArr.get(i)).get("w")  ).intValue();
//				int th = Integer.valueOf(  (String)((JSONObject)jArr.get(i)).get("h")  ).intValue();

            ((JSONObject) jArr.get(i)).put("x", String.valueOf(tx));
            ((JSONObject) jArr.get(i)).put("y", String.valueOf(ty));
            ((JSONObject) jArr.get(i)).put("w", String.valueOf(tx + tw));
            ((JSONObject) jArr.get(i)).put("h", String.valueOf(ty + th));

        }

        boolean is = false;
        String[] list = new String[]{"path", "x", "y", "w", "h", "label"};
        CsvWriter csv = new CsvWriter(jArr, list, path);
        is = csv.create();

        return is;
    }

    private boolean importClass(String path, String data) {
        JSONParser jp = new JSONParser();
        JSONArray jArr;
        try {
            jArr = (JSONArray) jp.parse(data);
        } catch (ParseException e) {
            logger.error("importClass Erorr!", e);
            return false;
        }

//		HashMap<String,String> hm = new HashMap<String,String>();
        Map<String, String> hm = new LinkedHashMap<String, String>();
        for (int i = 0; i < jArr.size(); i++) {
            String label = (String) ((JSONObject) jArr.get(i)).get("label");
            hm.put(label, "1");
        }

        List<String> labelList = new ArrayList<String>(hm.keySet());

        JSONArray lbJArr = new JSONArray();
        for (int i = 0; i < labelList.size(); i++) {
            JSONObject tempJObj = new JSONObject();
            tempJObj.put("label", labelList.get(i));
            tempJObj.put("number", String.valueOf(i));
            lbJArr.add(tempJObj);
        }

        boolean is;
        String[] list = new String[]{"label", "number"};
        CsvWriter csv = new CsvWriter(lbJArr, list, path);
        is = csv.create();
        return is;


    }

    private boolean importVideoBoxClass(String path, String data) {
        JSONParser jp = new JSONParser();
        JSONArray jArr = null;
        try {
            jArr = (JSONArray) jp.parse(data);
        } catch (ParseException e) {
            logger.error("importVideoBoxClass Erorr!", e);
            return false;
        }

        Map<String, String> hm = new LinkedHashMap<String, String>();
        for (int i = 0; i < jArr.size(); i++) {
            JSONObject json = (JSONObject) jArr.get(i);
            JSONObject metasJson = null;
            if (json.get("label") == null || ((String) json.get("label")).length() <= 0) {
                continue;
            }
            String label = (String) json.get("label");
            hm.put(label, "1");
        }

        List<String> labelList = new ArrayList<String>(hm.keySet());

        JSONArray lbJArr = new JSONArray();
        for (int i = 0; i < labelList.size(); i++) {
            JSONObject tempJObj = new JSONObject();
            tempJObj.put("label", labelList.get(i));
            tempJObj.put("number", String.valueOf(i));
            lbJArr.add(tempJObj);
        }

        boolean is;
        String[] list = new String[]{"label", "number"};
        CsvWriter csv = new CsvWriter(lbJArr, list, path);
        is = csv.create();
        return is;

    }


    public Object getModelList(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        if (taskVO.getTask_id() == null || taskVO.getTask_id().length() <= 0) {
            return Output.JsonOutput("4061", "TASK ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        TaskVO oneTask = taskDao.getTaskById(taskVO);
        if (oneTask == null) {
            logger.error("Task 정보가 손상되었습니다. task_id : " + taskVO.getTask_id());
            return Output.JsonOutput("4071", "Task정보가 손상되었습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if (oneTask.getTask_id() == null || oneTask.getTask_id().length() <= 0) {
            logger.error("Task 정보가 손상되었습니다. task_id : " + taskVO.getTask_id());
            return Output.JsonOutput("4071", "Task정보가 손상되었습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if (oneTask.getProject_id() == null || oneTask.getProject_id().length() <= 0) {
            logger.error("Task 정보가 손상되었습니다. task_id : " + taskVO.getTask_id());
            return Output.JsonOutput("4071", "Task정보가 손상되었습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        String projectId = oneTask.getProject_id();
        String taskId = oneTask.getTask_id();
        String modelPath = WORKSPACE_PATH + projectId + "/" + taskId + "/model";
        List<String> modelList = FileUtils.fileList(modelPath);
        return Output.JsonOutput("200", modelList);
    }


    public Object runTrain(TaskVO taskVO) {
        logger.info("runTrain : IN");

        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }

        if (taskVO.getTask_id() == null || taskVO.getTask_id().length() <= 0) {
            return Output.JsonOutput("4061", "TASK ID 파라미터 값이 유효하지 않습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if (taskVO.getGpu_node_id() == null || taskVO.getGpu_node_id().length() <= 0) {
            return Output.JsonOutput("4061", "선택된 GPU가 없습니다.\nGPU를 선택해주세요.");
        }
        if (taskVO.getGpu_index() == null || taskVO.getGpu_index().length() <= 0) {
            return Output.JsonOutput("4061", "선택된 GPU가 없습니다.\nGPU를 선택해주세요.");
        }

        TaskVO resultTask = taskDao.getTaskById(taskVO);
        if (resultTask.getIs_fixed() != null && resultTask.getIs_fixed().equals("1")) {
            logger.error("Task 정보가 손상되었습니다. task_id : " + taskVO.getTask_id());
            return Output.JsonOutput("4071", "Inheritance가 불가능한 테스크 입니다");
        }
        if (resultTask.getLabel_type() == null || resultTask.getLabel_type().length() <= 0) {
            logger.error("Task 정보가 손상되었습니다. task_id : " + taskVO.getTask_id());
            return Output.JsonOutput("4071", "Inheritance가 불가능한 테스크 입니다");
        }

        String mode = "";
        if (resultTask.getLabel_type().equals("IMAGE_SEGMENTATION")) {
            mode = "seg";
        } else if (resultTask.getLabel_type().equals("IMAGE_BBOX")) {
            mode = "bbox";
        } else if (resultTask.getLabel_type().equals("VIDEO_BBOX")) {
            mode = "video";
        }

        String taskId = resultTask.getTask_id();
        String projectId = resultTask.getProject_id();
        String algorithmId = resultTask.getAlgorithm_id();
        //String gpuIndex = taskVO.getGpu_index();
        GpuNodeVO gpuNodeVO = new GpuNodeVO();
        gpuNodeVO.setGpu_node_id(taskVO.getGpu_node_id());
        GpuNodeVO findGpuNodeVO = gpuNodeDao.getGpuNodeById(gpuNodeVO);
        String host = findGpuNodeVO.getAddress();
        String pw = findGpuNodeVO.getPassword();
        int port = 0;
        try {
            port = Integer.valueOf(findGpuNodeVO.getPort());
        } catch (NumberFormatException e) {
            logger.error("NumberFormatException Error!", e);
            return Output.JsonOutput("4091", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        String userName = findGpuNodeVO.getAccount();

        resultTask.setTask_id(taskId);

        //타이머 체크
        int remainTime = CheckTimer.getRunnableTime();
        if (remainTime != -1) {
            return Output.JsonOutput("300", "학습 요청 가능 시간까지 " + String.valueOf(remainTime) + "초 남았습니다. 다시 시도 하시기 바랍니다.");
        }

        //SSHSessionConnection sshConnection = new SSHSessionConnection(userName, port, host, pw);
        Session session = SessionSingletone.getSession(host);
        if (session == null || session.isConnected() == false) {
            return Output.JsonOutput("4071", host + "와의 연결이 끊어져 학습이 불가능합니다.\nGPU Server의 연결상태를 확인해주세요.");
        }
        SessionCmdExecute sessionCmdExecute = new SessionCmdExecute(session);
        boolean isUpTrain = sessionCmdExecute.isUpTraining(projectId, taskId);

        if (isUpTrain == true) {
            return Output.JsonOutput("4505", "현재 동작하고 있는 Task입니다.");
        }
//		SSHCmdExecute sshSession = new SSHCmdExecute(userName, port, host, pw);
//
//		boolean isUpTrain = sshSession.isUpTrainning(projectId, taskId);
//		if(isUpTrain == true) {
//			return Output.JsonOutput("4505", "현재 동작하고 있는 Task입니다.");
//		}


//		TaskVO resultTask = outputTaskVO;
//		TaskVO resultTask = taskDao.getTaskById(taskVO);

//		AlgorithmVO inputAlgorithmVO = new AlgorithmVO();
//		inputAlgorithmVO.setAlgorithm_id(result.getAlgorithm_id());
//		AlgorithmVO outputAlogrithmVO = algorithmDao.getAlgorithmById(inputAlgorithmVO);


        GpuNodeVO inputGpuNodeVO = new GpuNodeVO();
        inputGpuNodeVO.setGpu_node_id(taskVO.getGpu_node_id());
        GpuNodeVO outputGpuNodeVO = gpuNodeDao.getGpuNodeById(inputGpuNodeVO);
        if (outputGpuNodeVO == null) {
            return Output.JsonOutput("801", "실행중에 예기치 않은 문제가 발생했습니다. 문의 부탁드립니다");
        }
        if (outputGpuNodeVO.getAddress() == null || outputGpuNodeVO.getAddress().length() <= 0) {
            return Output.JsonOutput("801", "해당 GPU Node의 Address가 없습니다.\nSetup을 확인해주세요.");
        }
        if (outputGpuNodeVO.getPassword() == null || outputGpuNodeVO.getPassword().length() <= 0) {
            return Output.JsonOutput("801", "해당 GPU Node의 Password가 없습니다.\nSetup을 확인해주세요.");
        }
        JSONObject gpuObj = new JSONObject();
        gpuObj.put(outputGpuNodeVO.getAddress(), outputGpuNodeVO.getPassword());

        String gpuIndex = taskVO.getGpu_index();
        String imageName = "ca_" + resultTask.getAlgorithm_id() + ":latest";

        // j.seo 삭제
        //GrpcUtils gu = new GrpcUtils();
        //

        //컨테이너 제거
        boolean is = sessionCmdExecute.killContainer("t", projectId, taskId);
        //boolean is = (boolean)gu.killTrain(GRPC_ADDRESS, GRPC_PORT, resultTask.getProject_id(), resultTask.getId(),"t");
        //

        //model & log 삭제
        String taskPath = WORKSPACE_PATH + resultTask.getProject_id() + "/" + resultTask.getTask_id() + "/";
        FileUtils.deleteFileInDir(taskPath + "model");
        FileUtils.deleteFileInDir(taskPath + "log");
        FileUtils.deleteFileInDir(taskPath + "result");

//		JSONParser jp = new JSONParser();
//		JSONObject jObj;
        try {

            String config = resultTask.getConfig();
//			jObj = (JSONObject)jp.parse(resultTask.getConfig());
//			jObj.put("--workers","0");


//			String annotationPath = "train.csv";
//			String classPath = "classes";

//			if(!isAvailable()) {
//				return Output.JsonOutput("800", "모든 GPU가 사용중이기 때문에, 사용 가능한 GPU가 없습니다.");
//			}


            logger.info("addr : " + String.valueOf(GRPC_ADDRESS));
            logger.info("port : " + String.valueOf(GRPC_PORT));
            logger.info("gpuIndex : " + String.valueOf(gpuIndex));
            logger.info("imageName : " + String.valueOf(imageName));
            logger.info("config : " + String.valueOf(config));
            logger.info("project_id : " + String.valueOf(resultTask.getProject_id()));
            logger.info("task_id : " + String.valueOf(resultTask.getTask_id()));
            logger.info(gpuObj);

            config = config.replaceAll("\"", "\\\\\"");
            //SSHCmdExcute sshSession = new SSHCmdExcute(userName, port, host, pw);
            Object result = sessionCmdExecute.callCustomTrain(projectId, taskId, algorithmId, gpuIndex, mode, config);

            //Object result = gu.callCustomTrain(GRPC_ADDRESS, GRPC_PORT, gpuObj, gpuIndex, imageName, config, resultTask.getProject_id(), resultTask.getId() + "_" + mode);
            return result;
//			gu.callTrain(GRPC_ADDRESS, GRPC_PORT, jObj, result.getProject_id(), result.getId(), annotationPath, classPath);


//			gu.call("192.168.1.62", 8888, jObj, result.getProject_id(), result.getId(), annotationPath, classPath);


        } catch (Exception e) {
            logger.error("E :: " + e.getMessage());
            return Output.JsonOutput("801", "실행중에 예기치 않은 문제가 발생했습니다. 문의 부탁드립니다");
        }

//		return Output.JsonOutput("200", "학습을 시작하였습니다.");
    }


    private boolean isAvailable() {
        List<GpuNodeVO> gnList = gpuNodeDao.getGpuNodeStatusList(null);
        boolean isAvailable = false;
        for (int i = 0; i < gnList.size(); i++) {
            if (gnList.get(i).getStatus() != null && gnList.get(i).getStatus().equals("available")) {
                isAvailable = true;
                break;
            }
        }
        return isAvailable;

    }

    // s.kim 210602
    public Object runInferenceYoloVideo(InferenceVO inferenceVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        if (inferenceVO.getGpu_node_id() == null || inferenceVO.getGpu_node_id().length() <= 0) {
            return Output.JsonOutput("4506", "선택된 GPU가 없습니다.\nGPU를 선택해주세요.");
        }
        if (inferenceVO.getGpu_index() == null || inferenceVO.getGpu_index().length() <= 0) {
            return Output.JsonOutput("4506", "선택된 GPU가 없습니다.\nGPU를 선택해주세요.");
        }
        if (inferenceVO.getConfig() == null || inferenceVO.getConfig().length() <= 0) {
            return Output.JsonOutput("4506", "선택된 알고리즘이 없거나 손상되었습니다.\n새로 고침 후 다시 시도해주시고 지속저으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if (inferenceVO.getModel_name() == null || inferenceVO.getModel_name().length() <= 0) {
            return Output.JsonOutput("4506", "Inference할 학습모델을 선택해주세요.");
        }
        if (inferenceVO.getCsv_save_name() == null || inferenceVO.getCsv_save_name().length() <= 0) {
            return Output.JsonOutput("4506", "저장될 파일명을 입력해주세요.");
        }
        if (inferenceVO.getImg_path() == null || inferenceVO.getImg_path().length() <= 0) {
            return Output.JsonOutput("4506", "유효하지 않은 접근입니다. 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if (inferenceVO.getImg_path() == null || inferenceVO.getImg_path().length() <= 0) {
            return Output.JsonOutput("4506", "유효하지 않은 접근입니다. 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        //타이머 체크
        int remainTime = CheckTimer.getRunnableTime();
        if (remainTime != -1) {

            return Output.JsonOutput("803", "추론 요청 가능 시간까지 " + String.valueOf(remainTime) + "초 남았습니다. 다시 시도 하시기 바랍니다.");
        }

        TaskVO inputTaskVO = new TaskVO();
        inputTaskVO.setTask_id(inferenceVO.getTask_id());
        TaskVO resultTask = taskDao.getTaskById(inputTaskVO);
        String resultProjectId = resultTask.getProject_id();

        GpuNodeVO inputGpuNodeVO = new GpuNodeVO();
        inputGpuNodeVO.setGpu_node_id(inferenceVO.getGpu_node_id());
        GpuNodeVO outputGpuNodeVO = gpuNodeDao.getGpuNodeById(inputGpuNodeVO);
        if (outputGpuNodeVO == null) {
            return Output.JsonOutput("801", "실행중에 예기치 않은 문제가 발생했습니다. 문의 부탁드립니다");
        }
        if (outputGpuNodeVO.getAddress() == null || outputGpuNodeVO.getAddress().length() <= 0) {
            return Output.JsonOutput("801", "해당 GPU Node의 Address가 없습니다.\nSetup을 확인해주세요.");
        }
        if (outputGpuNodeVO.getPassword() == null || outputGpuNodeVO.getPassword().length() <= 0) {
            return Output.JsonOutput("801", "해당 GPU Node의 Password가 없습니다.\nSetup을 확인해주세요.");
        }

        String host = outputGpuNodeVO.getAddress();
        String pw = outputGpuNodeVO.getPassword();
        int port = 0;
        try {
            port = Integer.valueOf(outputGpuNodeVO.getPort());
        } catch (Exception e) {
            return Output.JsonOutput("801", "해당 GPU Node의 port번호가 올바르지 않습니다.\nGPU Node의 Port번호를 수정해주세요.");
        }
        String userName = outputGpuNodeVO.getAccount();

        SSHSessionConnection sshConnection = new SSHSessionConnection(userName, port, host, pw);
        Session session = sshConnection.call();
        SessionCmdExecute sessionCmdExecute = new SessionCmdExecute(session);
        boolean isUpInference = sessionCmdExecute.isUpInference(resultTask.getProject_id(), resultTask.getTask_id());

        if (isUpInference == true) {
            return Output.JsonOutput("4505", "현재 동작하고 있는 Task입니다.");
        }

        String gpuIndex = inferenceVO.getGpu_index();

        // imgPath csv파일 변환
        String path = WORKSPACE_PATH + resultTask.getProject_id() + "/" + resultTask.getTask_id() + "/imagepath/videopath.csv";
        CsvWriter csvWriter = new CsvWriter();
        boolean fileState = csvWriter.createString(path, inferenceVO.getImg_path());
        if (fileState == false) {
            return Output.JsonOutput("811", "CSV파일 복사에 실패하였습니다. 다시 시도하시기 바랍니다.");
        }

        try {
            String config = inferenceVO.getConfig();

            String projectId = resultProjectId;
            String taskId = resultTask.getTask_id();
            String modelName = inferenceVO.getModel_name();
            String csvSavePath = inferenceVO.getCsv_save_name();

            JSONParser parser = new JSONParser();
            Object obj = parser.parse(config);
            JSONObject jsonObj = (JSONObject) obj;
            String classificationThreshold = String.valueOf(jsonObj.get("classification_threshold"));
            //String nmsThreshold = String.valueOf(jsonObj.get("nms_threshold"));

            Object result = sessionCmdExecute.callCustomYolov4VideoInference(projectId, taskId, gpuIndex, modelName, csvSavePath, classificationThreshold);

            return result;

        } catch (Exception e) {
            logger.error("Exception Error!", e);
            return Output.JsonOutput("801", "실행중에 예기치 않은 문제가 발생했습니다. 문의 부탁드립니다");
        }
    }


    public Object runInference(InferenceVO inferenceVO) {
//		id : run_id,					// task id인지 확인 > ok
//		config : config_string,  			// 수정 json으로 넘기기 값 확인 > ok
//		img_path : img_string,
//		model_name : name,
//		csv_save_name : file_name,				// config 와 별개로 반드시 받아야하는 값  => ok
//		gpu_node_id : selected_gpu_node_id,
//		gpu_index : selected_gpu_index
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }

        if (inferenceVO.getGpu_node_id() == null || inferenceVO.getGpu_node_id().length() <= 0) {
            return Output.JsonOutput("4506", "선택된 GPU가 없습니다.\nGPU를 선택해주세요.");
        }
        if (inferenceVO.getGpu_index() == null || inferenceVO.getGpu_index().length() <= 0) {
            return Output.JsonOutput("4506", "선택된 GPU가 없습니다.\nGPU를 선택해주세요.");
        }
        if (inferenceVO.getConfig() == null || inferenceVO.getConfig().length() <= 0) {
            return Output.JsonOutput("4506", "선택된 알고리즘이 없거나 손상되었습니다.\n새로 고침 후 다시 시도해주시고 지속저으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if ((inferenceVO.getModel_name() == null || inferenceVO.getModel_name().length() <= 0) && !inferenceVO.getTask_id().equals("3")) {
            return Output.JsonOutput("4506", "Inference할 학습모델을 선택해주세요.");
        }
        if (inferenceVO.getCsv_save_name() == null || inferenceVO.getCsv_save_name().length() <= 0) {
            return Output.JsonOutput("4506", "저장될 파일명을 입력해주세요.");
        }
        if (inferenceVO.getImg_path() == null || inferenceVO.getImg_path().length() <= 0) {
            return Output.JsonOutput("4506", "유효하지 않은 접근입니다. 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        //j.seo 삭제
//		JsonOutputVO taskServiceCheck = (JsonOutputVO)gpuNodeService.getServiceList();
//		List<DockerServiceVO> serviceList = (List<DockerServiceVO>) taskServiceCheck.getData();
//		for (int i = 0; i < serviceList.size(); i++) {
//			DockerServiceVO service = serviceList.get(i);
//			if (service.getId() == null || service.getId().length() <= 0) {
//				return Output.JsonOutput("4505", "현재 동작하고 있는 Task입니다.");
//			}
//			if (inferenceVO.getId() != null && inferenceVO.getId().equals(service.getId())) {
//				return Output.JsonOutput("4505", "현재 동작하고 있는 Task입니다.");
//			}
//		}
        //

        //타이머 체크
        int remainTime = CheckTimer.getRunnableTime();
        if (remainTime != -1) {

            return Output.JsonOutput("803", "추론 요청 가능 시간까지 " + String.valueOf(remainTime) + "초 남았습니다. 다시 시도 하시기 바랍니다.");
        }

        TaskVO inputTaskVO = new TaskVO();
        inputTaskVO.setTask_id(inferenceVO.getTask_id());
        TaskVO resultTask = taskDao.getTaskById(inputTaskVO);
        String resultProjectId = resultTask.getProject_id();

        String mode = "";
        String extension = "";
        if (resultTask.getLabel_type().equals("IMAGE_SEGMENTATION")) {
            mode = "seg";
            extension = ".csv";
        } else if (resultTask.getLabel_type().equals("IMAGE_BBOX")) {
            mode = "bbox";
            extension = ".csv";
        } else if (resultTask.getLabel_type().equals("VIDEO_BBOX")) {
            mode = "video";
            extension = ".json";
        } else {
            return Output.JsonOutput("4506", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고, 지속적으로 발생할 경우 관리자에게 문의해 주시길 바랍니다.");
        }

//		if(inferenceVO.getQuick() != null && inferenceVO.getQuick().equals("true")) {
//			resultProjectId = resultTask.getProject_id() + "_q";
//		}

        GpuNodeVO inputGpuNodeVO = new GpuNodeVO();
        inputGpuNodeVO.setGpu_node_id(inferenceVO.getGpu_node_id());
        GpuNodeVO outputGpuNodeVO = gpuNodeDao.getGpuNodeById(inputGpuNodeVO);
        if (outputGpuNodeVO == null) {
            return Output.JsonOutput("801", "실행중에 예기치 않은 문제가 발생했습니다. 문의 부탁드립니다");
        }
        if (outputGpuNodeVO.getAddress() == null || outputGpuNodeVO.getAddress().length() <= 0) {
            return Output.JsonOutput("801", "해당 GPU Node의 Address가 없습니다.\nSetup을 확인해주세요.");
        }
        if (outputGpuNodeVO.getPassword() == null || outputGpuNodeVO.getPassword().length() <= 0) {
            return Output.JsonOutput("801", "해당 GPU Node의 Password가 없습니다.\nSetup을 확인해주세요.");
        }

        String host = outputGpuNodeVO.getAddress();
        String pw = outputGpuNodeVO.getPassword();
        int port = 0;
        try {
            port = Integer.valueOf(outputGpuNodeVO.getPort());
        } catch (Exception e) {
            return Output.JsonOutput("801", "해당 GPU Node의 port번호가 올바르지 않습니다.\nGPU Node의 Port번호를 수정해주세요.");
        }
        String userName = outputGpuNodeVO.getAccount();

        SSHSessionConnection sshConnection = new SSHSessionConnection(userName, port, host, pw);
        Session session = sshConnection.call();
        SessionCmdExecute sessionCmdExecute = new SessionCmdExecute(session);
        boolean isUpInference = sessionCmdExecute.isUpInference(resultTask.getProject_id(), resultTask.getTask_id());

        if (isUpInference == true) {
            return Output.JsonOutput("4505", "현재 동작하고 있는 Task입니다.");
        }
//		SSHCmdExecute sshSession = new SSHCmdExecute(userName, port, host, pw);
//
//		boolean isUpInference = sshSession.isUpInference(resultTask.getProject_id(), resultTask.getId());
//		if(isUpInference == true) {
//			return Output.JsonOutput("4505", "현재 동작하고 있는 Task입니다.");
//		}

        JSONObject gpuObj = new JSONObject();
        gpuObj.put(outputGpuNodeVO.getAddress(), outputGpuNodeVO.getPassword());


        String gpuIndex = inferenceVO.getGpu_index();
        String imageName = "ca_" + resultTask.getAlgorithm_id() + ":latest";

        // imgPath csv파일 변환
        String path = WORKSPACE_PATH + resultTask.getProject_id() + "/" + resultTask.getTask_id() + "/imagepath/imagepath.csv";

        String pathDir = WORKSPACE_PATH + resultTask.getProject_id() + "/" + resultTask.getTask_id() + "/imagepath/";
        try {
            // 강제 폴더 생성 !!!!!!!!!!!!!!!!!!!!
            System.out.println(pathDir + "강제 폴더 생성 !!!!!!!!!!!!!!!!!!!!");
            Paths.get(pathDir).toFile().mkdirs();
        } catch (Exception e) {
        }

        CsvWriter csvWriter = new CsvWriter();
        boolean fileState = csvWriter.createString(path, inferenceVO.getImg_path());
        if (fileState == false) {
            return Output.JsonOutput("811", "CSV파일 복사에 실패하였습니다. 다시 시도하시기 바랍니다.");
        }


//		JSONParser jp = new JSONParser();
//		JSONObject jObj;
        try {
//			jObj = (JSONObject)jp.parse(inferenceVO.getConfig());
            String config = inferenceVO.getConfig();

            GrpcUtils gu = new GrpcUtils();
            String projectId = resultProjectId;
//			String taskId = resultTask.getId() + "_" + mode;
            String taskId = resultTask.getTask_id();
//			String classes = "classes";
            String modelName = inferenceVO.getModel_name();
            String algorithmId = resultTask.getAlgorithm_id();
            // j.seo 삭제
            //String imagePath = inferenceVO.getImg_path();
            // j.seo 추가
            String imagePath = "imagepath.csv";
//			String score = inferenceVO.getScore();
//			String backbone = (String)jObj.get("--backbone");
            String csvSavePath = inferenceVO.getCsv_save_name() + extension;
//			boolean isConvertModel = Boolean.parseBoolean(inferenceVO.getIs_convert_model());

//			if(!isAvailable()) {
//				return Output.JsonOutput("800", "모든 GPU가 사용중이기 때문에, 사용 가능한 GPU가 없습니다.");
//			}

            Object result;
            // s.kim 임시 추가, 시연
            if (algorithmId.equals("2")) {
                JSONParser parser = new JSONParser();
                Object obj = parser.parse(config);
                JSONObject jsonObj = (JSONObject) obj;

                String classificationThreshold = String.valueOf(jsonObj.get("classification_threshold"));

                result = sessionCmdExecute.callCustomYolov4Inference(projectId, taskId, gpuIndex, modelName, csvSavePath, classificationThreshold, "multi");

            } else if (algorithmId.equals("7") || algorithmId.equals("8")) {
                JSONParser parser = new JSONParser();
                Object obj = parser.parse(config);
                JSONObject jsonObj = (JSONObject) obj;

                String classificationThreshold = String.valueOf(jsonObj.get("classification_threshold"));

                result = sessionCmdExecute.callCustomEfficientdetInference(projectId, taskId, gpuIndex, modelName, csvSavePath, "multi");
            } else if (algorithmId.equals("9")) {
                AlgorithmVO algorithmVO = new AlgorithmVO();
                algorithmVO.setAlgorithm_id(algorithmId);
                AlgorithmVO algorithmById = algorithmDao.getAlgorithmById(algorithmVO);
                String algorithmConfig = algorithmById.getInference_param();
                JSONParser parser = new JSONParser();
                Object obj = parser.parse(algorithmConfig);
                JSONArray jsonArr = (JSONArray) obj;
                String confThreshold =
                        (String) jsonArr.stream()
                                .filter((jsonObj) -> {
                                    return "conf_thres".equals((String) ((JSONObject) jsonObj).get("param"));
                                })
                                .map((jsonObj) -> {
                                    return String.valueOf(((JSONObject)jsonObj).getOrDefault("defaultvalue", "0.25"));
                                })
                                .findFirst()
                                .get();
                String iouThreshold =
                        (String) jsonArr.stream()
                                .filter((jsonObj) -> {
                                    return "iou_thres".equals((String) ((JSONObject) jsonObj).get("param"));
                                })
                                .map((jsonObj) -> {
                                    return String.valueOf(((JSONObject)jsonObj).getOrDefault("defaultvalue", "0.25"));
                                })
                                .findFirst()
                                .get();
                //JSONObject jsonObj = (JSONObject)parser.parse(config);
                // (String projectId, String taskId, String gpuIndex, String modelName, String csvFileName, String confThreshold, String iouThreshold, String type) {
                result = sessionCmdExecute.callCustomYolov5InferenceBySeg(projectId, taskId, gpuIndex, modelName, csvSavePath, confThreshold, iouThreshold, "multi");
            } else if (algorithmId.equals("10")) {
                AlgorithmVO algorithmVO = new AlgorithmVO();
                algorithmVO.setAlgorithm_id(algorithmId);
                AlgorithmVO algorithmById = algorithmDao.getAlgorithmById(algorithmVO);
                String algorithmConfig = algorithmById.getInference_param();
                JSONParser parser = new JSONParser();
                Object obj = parser.parse(algorithmConfig);
                JSONArray jsonArr = (JSONArray) obj;
                String confThreshold =
                        (String) jsonArr.stream()
                                .filter((jsonObj) -> {
                                    return "conf_thres".equals((String) ((JSONObject) jsonObj).get("param"));
                                })
                                .map((jsonObj) -> {
                                    return String.valueOf(((JSONObject)jsonObj).getOrDefault("defaultvalue", "0.25"));
                                })
                                .findFirst()
                                .get();
                String iouThreshold =
                        (String) jsonArr.stream()
                                .filter((jsonObj) -> {
                                    return "iou_thres".equals((String) ((JSONObject) jsonObj).get("param"));
                                })
                                .map((jsonObj) -> {
                                    return String.valueOf(((JSONObject)jsonObj).getOrDefault("defaultvalue", "0.25"));
                                })
                                .findFirst()
                                .get();
                //JSONObject jsonObj = (JSONObject)parser.parse(config);
                // (String projectId, String taskId, String gpuIndex, String modelName, String csvFileName, String confThreshold, String iouThreshold, String type) {
                result = sessionCmdExecute.callCustomYolov5InferenceByBbox(projectId, taskId, gpuIndex, modelName, csvSavePath, confThreshold, iouThreshold, "multi");
            } else {
                config = config.replaceAll("\"", "\\\\\"");
                result = sessionCmdExecute.callCustomInference(projectId, taskId, algorithmId, gpuIndex, mode, modelName, csvSavePath, config);
            }

            //Object result = gu.callCustomInference(GRPC_ADDRESS, GRPC_PORT, gpuObj, gpuIndex, imageName, config, projectId, taskId, modelName, csvSavePath, imagePath);
            return result;
//			gu.callInference(GRPC_ADDRESS, GRPC_PORT, projectId, taskId, classes, backbone, modelName, score, csvSavePath, imagePath,isConvertModel);
//			AsyncProcess2 ap = new AsyncProcess2( () -> gu.callInference(GRPC_ADDRESS, GRPC_PORT, projectId, taskId, classes, backbone, modelName, score, csvSavePath, imagePath,isConvertModel) );
//			ap.start();
        } catch (Exception e) {
            logger.error("Exception Error!", e);
            return Output.JsonOutput("801", "실행중에 예기치 않은 문제가 발생했습니다. 문의 부탁드립니다");
        }

//		return Output.JsonOutput("200", "Inference를 시작하였습니다.");
    }

    public Object runSemiAutoInference(InferenceVO inferenceVO) {
//		id : run_id,					// task id인지 확인 > ok
//		config : config_string,  			// 수정 json으로 넘기기 값 확인 > ok
//		img_path : img_string,
//		model_name : name,
//		csv_save_name : file_name,				// config 와 별개로 반드시 받아야하는 값  => ok
//		gpu_node_id : selected_gpu_node_id,
//		gpu_index : selected_gpu_index

        String modelName = inferenceVO.getModel_name();
        String dataId = inferenceVO.getData_id();
        String taskId = inferenceVO.getTask_id();
        String gpuNodeId = "1";
        String gpuIndex = "3";

        if (!StringUtils.hasText(inferenceVO.getData_id())) {
            return Output.JsonOutput("4506", "선택된 알고리즘이 없거나 손상되었습니다.\n새로 고침 후 다시 시도해주시고 지속저으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if (!StringUtils.hasText(inferenceVO.getData_id())) {
            return Output.JsonOutput("4506", "Inference할 학습모델을 선택해주세요.");
        }
        if (!StringUtils.hasText(inferenceVO.getTask_id())) {
            return Output.JsonOutput("4506", "Inference할 TASK를 선택해주세요.");
        }

        // dataId로 조회해서 imgPath가져옴
        DataVO dataVO = new DataVO();
        dataVO.setData_id(dataId);
        DataVO findDataVO = dataDao.getDataById(dataVO);
        String datasetId = findDataVO.getDataset_id();
        String dataPath = NFS_MOUNT_ROOT_PATH + "/" + findDataVO.getPath();

        // task_id로 TASK 조회 후, config 값 세팅
        TaskVO taskVO = new TaskVO();
        taskVO.setTask_id(taskId);
        TaskVO findTaskVO = taskDao.getTaskById(taskVO);
        String labelType = findTaskVO.getLabel_type();
        String config = findTaskVO.getConfig();
        String projectId = findTaskVO.getProject_id();
        String algorithmId = findTaskVO.getAlgorithm_id();

        // TASK의 라벨타입으로 분기 처리
        String mode = "";

        if (labelType.equals("IMAGE_SEGMENTATION")) {
            mode = "seg";
        } else if (labelType.equals("IMAGE_BBOX")) {
            mode = "bbox";
        } else {
            return Output.JsonOutput("4506", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고, 지속적으로 발생할 경우 관리자에게 문의해 주시길 바랍니다.");
        }

        // gpuNode 정보 불러와서 변수에 저장
        GpuNodeVO gpuNodeVO = new GpuNodeVO();
        gpuNodeVO.setGpu_node_id(gpuNodeId);
        GpuNodeVO outputGpuNodeVO = gpuNodeDao.getGpuNodeById(gpuNodeVO);
        if (outputGpuNodeVO == null) {
            return Output.JsonOutput("801", "등록된 GPU가 존재하지 않습니다.\nGPU를 먼저 등록해주세요.");
        }
        if (!StringUtils.hasText(outputGpuNodeVO.getAddress())) {
            return Output.JsonOutput("801", "해당 GPU Node의 Address가 없습니다.\nSetup을 확인해주세요.");
        }
        if (!StringUtils.hasText(outputGpuNodeVO.getPassword())) {
            return Output.JsonOutput("801", "해당 GPU Node의 Password가 없습니다.\nSetup을 확인해주세요.");
        }

        // gpuNode 주소, 비밀번호 변수에 저장
        String host = outputGpuNodeVO.getAddress();
        String pw = outputGpuNodeVO.getPassword();
        String userName = outputGpuNodeVO.getAccount();
        int port = Integer.valueOf(outputGpuNodeVO.getPort());

        SSHSessionConnection sshConnection = new SSHSessionConnection(userName, port, host, pw);
        Session session = sshConnection.call();
        SessionCmdExecute sessionCmdExecute = new SessionCmdExecute(session);

        boolean isUpInference = sessionCmdExecute.isUpInference(projectId, taskId);
        if (isUpInference) {
            return Output.JsonOutput("4505", "현재 동작하고 있는 Task입니다.");
        }

        JSONObject gpuObj = new JSONObject();
        gpuObj.put(host, pw);

        // imgPath csv파일 변환
        String path = WORKSPACE_PATH + "semi_auto/imagepath/imagepath.csv";
        String pathDir = WORKSPACE_PATH + "semi_auto/imagepath/";

        try {
            // 강제 폴더 생성 !!!!!!!!!!!!!!!!!!!!
            System.out.println(pathDir + "강제 폴더 생성 !!!!!!!!!!!!!!!!!!!!");
            Paths.get(pathDir).toFile().mkdirs();
        } catch (Exception e) {
        }

        // imagePath에 저장
        CsvWriter csvWriter = new CsvWriter();
        boolean fileState = csvWriter.createString(path, dataPath);
        if (!fileState) {
            return Output.JsonOutput("811", "CSV파일 생성에 실패하였습니다. 다시 시도하시기 바랍니다.");
        }

        UUID uuid = UUID.randomUUID();
        String csvSaveFullPath = WORKSPACE_PATH + "semi_auto/result/" + uuid + ".csv";
        String csvSaveDir = WORKSPACE_PATH + "semi_auto/result/";
        // 디렉토리 하위 파일 모두 지우기
        // deleteFileList(csvSaveDir);
        String csvSaveFileName = uuid + ".csv";

        try {
            // s.kim 임시 추가, 시연
            if (algorithmId.equals("2")) {
                AlgorithmVO algorithmVO = new AlgorithmVO();
                algorithmVO.setAlgorithm_id(algorithmId);
                AlgorithmVO algorithmById = algorithmDao.getAlgorithmById(algorithmVO);
                String algotirhmConfig = algorithmById.getInference_param();
                JSONParser parser = new JSONParser();
                Object obj = parser.parse(algotirhmConfig);
                JSONArray jsonArr = (JSONArray) obj;
                String classificationThreshold =
                        (String) jsonArr.stream()
                                .filter((jsonObj) -> {
                                    return "classification_threshold".equals((String) ((JSONObject) jsonObj).get("param"));
                                })
                                .map((jsonObj) -> {
                                    return String.valueOf(((JSONObject)jsonObj).getOrDefault("defaultvalue", "0.5"));
                                })
                                .findFirst()
                                .get();

                sessionCmdExecute.callCustomYolov4Inference(projectId, taskId, gpuIndex, modelName, csvSaveFileName, classificationThreshold, "single");

            } else if (algorithmId.equals("7") || algorithmId.equals("8")) {
                JSONParser parser = new JSONParser();
                //JSONObject jsonObj = (JSONObject)parser.parse(config);
                sessionCmdExecute.callCustomEfficientdetInference(projectId, taskId, gpuIndex, modelName, csvSaveFileName, "single");
            } else if (algorithmId.equals("9")) {
                AlgorithmVO algorithmVO = new AlgorithmVO();
                algorithmVO.setAlgorithm_id(algorithmId);
                AlgorithmVO algorithmById = algorithmDao.getAlgorithmById(algorithmVO);
                String algorithmConfig = algorithmById.getInference_param();
                JSONParser parser = new JSONParser();
                Object obj = parser.parse(algorithmConfig);
                JSONArray jsonArr = (JSONArray) obj;
                String confThreshold =
                        (String) jsonArr.stream()
                                .filter((jsonObj) -> {
                                    return "conf_thres".equals((String) ((JSONObject) jsonObj).get("param"));
                                })
                                .map((jsonObj) -> {
                                    return String.valueOf(((JSONObject)jsonObj).getOrDefault("defaultvalue", "0.25"));
                                })
                                .findFirst()
                                .get();
                String iouThreshold =
                        (String) jsonArr.stream()
                                .filter((jsonObj) -> {
                                    return "iou_thres".equals((String) ((JSONObject) jsonObj).get("param"));
                                })
                                .map((jsonObj) -> {
                                    return String.valueOf(((JSONObject)jsonObj).getOrDefault("defaultvalue", "0.25"));
                                })
                                .findFirst()
                                .get();
                //JSONObject jsonObj = (JSONObject)parser.parse(config);
                // (String projectId, String taskId, String gpuIndex, String modelName, String csvFileName, String confThreshold, String iouThreshold, String type) {
                sessionCmdExecute.callCustomYolov5InferenceBySeg(projectId, taskId, gpuIndex, modelName, csvSaveFileName, confThreshold, iouThreshold, "single");
            } else if (algorithmId.equals("10")) {
                AlgorithmVO algorithmVO = new AlgorithmVO();
                algorithmVO.setAlgorithm_id(algorithmId);
                AlgorithmVO algorithmById = algorithmDao.getAlgorithmById(algorithmVO);
                String algorithmConfig = algorithmById.getInference_param();
                JSONParser parser = new JSONParser();
                Object obj = parser.parse(algorithmConfig);
                JSONArray jsonArr = (JSONArray) obj;
                String confThreshold =
                        (String) jsonArr.stream()
                                .filter((jsonObj) -> {
                                    return "conf_thres".equals((String) ((JSONObject) jsonObj).get("param"));
                                })
                                .map((jsonObj) -> {
                                    return String.valueOf(((JSONObject)jsonObj).getOrDefault("defaultvalue", "0.25"));
                                })
                                .findFirst()
                                .get();
                String iouThreshold =
                        (String) jsonArr.stream()
                                .filter((jsonObj) -> {
                                    return "iou_thres".equals((String) ((JSONObject) jsonObj).get("param"));
                                })
                                .map((jsonObj) -> {
                                    return String.valueOf(((JSONObject)jsonObj).getOrDefault("defaultvalue", "0.25"));
                                })
                                .findFirst()
                                .get();
                //JSONObject jsonObj = (JSONObject)parser.parse(config);
                // (String projectId, String taskId, String gpuIndex, String modelName, String csvFileName, String confThreshold, String iouThreshold, String type) {
                sessionCmdExecute.callCustomYolov5InferenceByBbox(projectId, taskId, gpuIndex, modelName, csvSaveFileName, confThreshold, iouThreshold, "single");
            } else {
                config = config.replaceAll("\"", "\\\\\"");
                sessionCmdExecute.callCustomInference(projectId, taskId, algorithmId, gpuIndex, mode, modelName, csvSaveFileName, config);
            }

            // 파일 생성되었는지 5초 간격으로 확인
            File file = new File(csvSaveFullPath);

            long startTime = System.currentTimeMillis();
            long elapsedTime = 0;
            int idx = 0;

            // 파일 디렉토리 탐색 명령어
            List<String> commands = new ArrayList<>();
            commands.add("ls");
            commands.add(csvSaveDir);

            while (true) {
                Process process = null;
                InputStreamReader inputReader = null;
                BufferedReader bufferedReader = null;
                try {
                    Thread.sleep(2000); // 3초마다 체크

                    // 프로세스 빌더 생성 후 명령어
                    ProcessBuilder processBuilder = new ProcessBuilder(commands);
                    process = processBuilder.start();

                    // 명령어 결과값 받아오고 출력
                    inputReader = new InputStreamReader(process.getInputStream(), "UTF-8");
                    bufferedReader = new BufferedReader(inputReader);

                    String line = "";
                    logger.info("실행 결과!\n");
                    while ((line = bufferedReader.readLine()) != null) {
                        if (line.trim().length() == 0) {
                            continue;
                        }

                        logger.info(line + "\n");
                    }

                    elapsedTime = System.currentTimeMillis() - startTime; // 경과 시간 업데이트
                    logger.info("semi-auto Inference 경과 시간 : " + elapsedTime);
                    logger.info("csvSaveFullPath : " + csvSaveFullPath);

                    // 파일 확인
                    file = new File(csvSaveFullPath);
                    logger.info("파일 존재 여부 : " + file.exists());
                    if (file.exists() || idx == 60) {
                        break;
                    }

                    idx++;
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
//                    if (inputReader != null) {
//                        inputReader.close();
//                    }
//                    if (bufferedReader != null) {
//                        bufferedReader.close();
//                    }
                    if (process != null) {
                        process.destroy();
                    }
                }
            }

            if (idx == 20) {
                return Output.JsonOutput("4301", "생성할 라벨이 존재하지 않습니다.");
            }

            // 생성된 CSV파일 읽어서 DB에 추가하기 위한 형식으로 변환
            CsvReader cr = new CsvReader(csvSaveFullPath);
            List<InferenceResultVO> resultList = cr.read();
            if (resultList.size() == 0) {
                return Output.JsonOutput("4301", "생성할 라벨이 존재하지 않습니다.");
            }
            List<String> infoList = new ArrayList<>();
            for (InferenceResultVO inferenceResultVO : resultList) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(
                        "\"" +
                                inferenceResultVO.getImg_path() + ","
                                + inferenceResultVO.getX() + ","
                                + inferenceResultVO.getY() + ","
                                + inferenceResultVO.getW() + ","
                                + inferenceResultVO.getH() + ","
                                + "null" +
                                "\""
                );
                infoList.add(stringBuilder.toString());
            }

            String[] infoArray = new String[infoList.size()];
            infoArray = infoList.toArray(infoArray);

            MetaVO insertMetaVO = new MetaVO();
            insertMetaVO.setInfo(Arrays.toString(infoArray));
            insertMetaVO.setDataset_id(datasetId);
            insertMetaVO.setTask_id(taskId);
            insertMetaVO.setType("single");
            insertMetaVO.setPath(csvSaveFileName);
            //Object OutputResult = dataService.insertMetaByInference(insertMetaVO);

            return dataService.insertMetaByInference(insertMetaVO);
        } catch (Exception e) {
            logger.error("Exception Error!", e);
            return Output.JsonOutput("801", "실행중에 예기치 않은 문제가 발생했습니다. 문의 부탁드립니다");
        } finally {
            String renamePath = WORKSPACE_PATH + "semi_auto/result_temp/semi_auto_result_temp.csv";
            File file = new File(csvSaveFullPath);
            File newFile = new File(renamePath);
            try {
                Files.move(file.toPath(), newFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
            }
        }

//		return Output.JsonOutput("200", "Inference를 시작하였습니다.");
    }

    private void deleteFileList(String csvSaveDir) {
        File deleteFolder = new File(csvSaveDir);
        File[] deleteFileList = deleteFolder.listFiles();
        for (int i = 0; i < deleteFileList.length; i++) {
            deleteFileList[i].delete();
        }
    }


    public Object getTaskById(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        if (taskVO.getTask_id() == null || taskVO.getTask_id().length() <= 0) {
            return Output.JsonOutput("200", null);
        }
        TaskVO result = taskDao.getTaskById(taskVO);
        String taskId = result.getTask_id();
        String projectId = result.getProject_id();
        List<String> annotationList = null;

        if (result.getLabel_type() == null || result.getLabel_type().length() <= 0) {
            annotationList = null;
        }
        //type은 Trainer페이지에서 Task를 학습시킬 때만 파일을 불러오도록 하기위해 필요한 데이터
        else if (result.getLabel_type().equals("IMAGE_SEGMENTATION") && (taskVO.getType() != null && taskVO.getType().equals("1"))) {
            JSONReader jReader = new JSONReader(WORKSPACE_PATH + projectId + "/" + taskId + "/" + "annotation/segmentation.json");
            annotationList = jReader.read();
        } else if (result.getLabel_type().equals("IMAGE_BBOX") && (taskVO.getType() != null && taskVO.getType().equals("1"))) {
            CsvReader cr = new CsvReader(WORKSPACE_PATH + projectId + "/" + taskId + "/" + "annotation/train.csv");
            annotationList = cr.readToArray();
        } else if (result.getLabel_type().equals("VIDEO_BBOX") && (taskVO.getType() != null && taskVO.getType().equals("1"))) {
            JSONReader jReader = new JSONReader(WORKSPACE_PATH + projectId + "/" + taskId + "/" + "annotation/videoBox.json");
            annotationList = jReader.videoBoxread();
        }
        result.setAnnotation_list(annotationList);
        return Output.JsonOutput("200", result);
    }

    public Object getInferenceResultList(InferenceResultVO inferenceResultVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        TaskVO inputTaskVO = new TaskVO();
        inputTaskVO.setTask_id(inferenceResultVO.getId());
        TaskVO oneTask = taskDao.getTaskById(inputTaskVO);
        if (oneTask == null) {
            return Output.JsonOutput("200", null);
        }
        if (oneTask.getProject_id() == null || oneTask.getProject_id().length() <= 0) {
            return Output.JsonOutput("200", null);
        }
        if (oneTask.getTask_id() == null || oneTask.getTask_id().length() <= 0) {
            return Output.JsonOutput("200", null);
        }
        String projectId = oneTask.getProject_id();
        String taskId = oneTask.getTask_id();
        String resultPath = WORKSPACE_PATH + projectId + "/" + taskId + "/" + "result";
        List<String> resultList = FileUtils.fileList(resultPath);

        return Output.JsonOutput("200", resultList);
    }

    public Object getInferenceParameter(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        TaskVO resultTask = taskDao.getTaskById(taskVO);
        if (resultTask == null || resultTask.getAlgorithm_id() == null || resultTask.getAlgorithm_id().length() <= 0) {
            return Output.JsonOutput("3505", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 문제가 발생할 경우 관리자에게 문의해주세요.");
        }
        AlgorithmVO inputAlgorithmVO = new AlgorithmVO();
        inputAlgorithmVO.setAlgorithm_id(resultTask.getAlgorithm_id());
        AlgorithmVO outputAlgorithmVO = algorithmDao.getAlgorithmById(inputAlgorithmVO);
        return Output.JsonOutput("200", outputAlgorithmVO);
    }

    // 일
    public Object getInferenceResult(InferenceResultVO inferenceResultVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        TaskVO inputTaskVO = new TaskVO();
        inputTaskVO.setTask_id(inferenceResultVO.getTask_id());
        TaskVO oneTask = taskDao.getTaskById(inputTaskVO);
        if (oneTask == null) {
            return Output.JsonOutput("200", null);
        }
        if (oneTask.getProject_id() == null || oneTask.getProject_id().length() <= 0) {
            return Output.JsonOutput("200", null);
        }
        if (oneTask.getTask_id() == null || oneTask.getTask_id().length() <= 0) {
            return Output.JsonOutput("200", null);
        }
        String projectId = oneTask.getProject_id();
        String taskId = oneTask.getTask_id();
        String resultPath = WORKSPACE_PATH + projectId + "/" + taskId + "/result/" + inferenceResultVO.getFilename();
        if (oneTask.getLabel_type() == null || oneTask.getLabel_type() == null) {
            return Output.JsonOutput("200", null);
        }

        if (oneTask.getLabel_type().equals("IMAGE_BBOX") || oneTask.getLabel_type().equals("IMAGE_SEGMENTATION")) {
            //mfArr[i].getOriginalFilename().split("\\.")[mfArr[i].getOriginalFilename().split("\\.").length-1];
            String format = resultPath.split("\\.")[resultPath.split("\\.").length - 1];
            if (format.equals("csv")) {
                CsvReader cr = new CsvReader(resultPath);
                List<InferenceResultVO> resultList = cr.read();
                if (resultList == null || resultList.isEmpty() || resultList.size() <= 0) {
                    return Output.JsonOutput("3305", "Inference할 데이터가 없습니다.");
                }
                return Output.JsonOutput("200", resultList);
            } else if (format.equals("json")) {
                JSONReader jsonReader = new JSONReader(resultPath);
                List<InferenceResultVO> videoBoxresult = new ArrayList<InferenceResultVO>();
                List<String> videoBoxList = jsonReader.videoBoxread();
                if (videoBoxList == null || videoBoxList.isEmpty() || videoBoxList.size() <= 0) {
                    return Output.JsonOutput("3305", "사용 가능한 데이터가 없습니다.");
                }
                for (int i = 0; i < videoBoxList.size(); i++) {
                    String videoBoxStr = videoBoxList.get(i);
                    String[] splitStr = videoBoxStr.split(",");
                    if (splitStr == null || splitStr.length <= 0 || splitStr.length < 6) {
                        continue;
                    }
                    InferenceResultVO resultVO = new InferenceResultVO();
                    resultVO.setX(String.valueOf(i));
                    resultVO.setH("-");
                    resultVO.setW("-");
                    resultVO.setY("-");
                    resultVO.setImg_path(splitStr[0]);
                    resultVO.setLabel(splitStr[5]);
                    videoBoxresult.add(resultVO);
                }
//				List<InferenceResultVO> resultList;
                return Output.JsonOutput("200", videoBoxresult);
            } else {
                return Output.JsonOutput("3305", "Inference할 수 없는 파일입니다.");
            }
        } else if (oneTask.getLabel_type().equals("VIDEO_BBOX")) {
            JSONReader jsonReader = new JSONReader(resultPath);
            List<InferenceResultVO> videoBoxresult = new ArrayList<InferenceResultVO>();
            List<String> videoBoxList = jsonReader.videoBoxread();
            if (videoBoxList == null || videoBoxList.isEmpty() || videoBoxList.size() <= 0) {
                return Output.JsonOutput("3305", "사용 가능한 데이터가 없습니다.");
            }
            for (int i = 0; i < videoBoxList.size(); i++) {
                String videoBoxStr = videoBoxList.get(i);
                String[] splitStr = videoBoxStr.split(",");
                if (splitStr == null || splitStr.length <= 0 || splitStr.length < 6) {
                    continue;
                }
                InferenceResultVO resultVO = new InferenceResultVO();
                resultVO.setX(String.valueOf(i));
                resultVO.setH("-");
                resultVO.setW("-");
                resultVO.setY("-");
                resultVO.setImg_path(splitStr[0]);
                resultVO.setLabel(splitStr[5]);
                videoBoxresult.add(resultVO);
            }
//			List<InferenceResultVO> resultList;
            return Output.JsonOutput("200", videoBoxresult);
        } else {
            return Output.JsonOutput("200", null);
        }
    }

    //j.seo추가
    public Object getMapCSV(LossMapVO lossMapVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        TaskVO inputTaskVO = new TaskVO();
        inputTaskVO.setTask_id(lossMapVO.getId());
        TaskVO oneTask = taskDao.getTaskById(inputTaskVO);
        if (oneTask == null) {
            return Output.JsonOutput("200", null);
        }
        if (oneTask.getProject_id() == null || oneTask.getProject_id().length() <= 0) {
            return Output.JsonOutput("200", null);
        }
        if (oneTask.getTask_id() == null || oneTask.getTask_id().length() <= 0) {
            return Output.JsonOutput("200", null);
        }
        String projectId = oneTask.getProject_id();
        String taskId = oneTask.getTask_id();
        String resultPath = WORKSPACE_PATH + projectId + "/" + taskId + "/" + "log/mAP.csv";
//		String resultPath = WORKSPACE_PATH + 1 + "/" + 1 + "/" + "log/mAP.csv";
        CsvReader cr = new CsvReader(resultPath);
        List<LossMapVO> resultList = cr.mapCSVRead();
        return Output.JsonOutput("200", resultList);
    }

    public Object getLossCSV(LossMapVO lossMapVO) throws Exception {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        TaskVO inputTaskVO = new TaskVO();
        inputTaskVO.setTask_id(lossMapVO.getId());
        TaskVO oneTask = taskDao.getTaskById(inputTaskVO);
        if (oneTask == null) {
            return Output.JsonOutput("200", null);
        }
        if (oneTask.getProject_id() == null || oneTask.getProject_id().length() <= 0) {
            return Output.JsonOutput("200", null);
        }
        if (oneTask.getTask_id() == null || oneTask.getTask_id().length() <= 0) {
            return Output.JsonOutput("200", null);
        }
        String projectId = oneTask.getProject_id();
        String taskId = oneTask.getTask_id();
        String resultPath = WORKSPACE_PATH + projectId + "/" + taskId + "/" + "log/loss.csv";
        Object resultList = null;
        resultList = convertLossCSVtoJson(resultPath);
        return Output.JsonOutput("200", resultList);
    }

    public Object getTrainLog(TrainLogVO trainLogVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        if (!StringUtils.hasText(trainLogVO.getTask_id())) {
            return Output.JsonOutput("4584", "Occured Loading Log");
        }

        TaskVO inputTaskVO = new TaskVO();
        inputTaskVO.setTask_id(trainLogVO.getTask_id());
        TaskVO oneTask = taskDao.getTaskById(inputTaskVO);
        if (oneTask == null) {
            return Output.JsonOutput("200", null);
        }
        if (!StringUtils.hasText(oneTask.getProject_id())) {
            return Output.JsonOutput("200", null);
        }
        if (!StringUtils.hasText(oneTask.getTask_id())) {
            return Output.JsonOutput("200", null);
        }

        String projectId = oneTask.getProject_id();
        String taskId = oneTask.getTask_id();
        String logPath = WORKSPACE_PATH + projectId + "/" + taskId + "/" + "log/run.log";
        int startLine = 0;
        int lastLine = 0;

        TrainLogVO result = new TrainLogVO();
        result.setLog("");

        try (BufferedReader br = new BufferedReader(new FileReader(logPath))){

            // String lastLine = null;

            while (br.readLine() != null) {
                // lastLine = Integer.parseInt(line);
                // startLine = lastLine - 5000;
                lastLine++;
                startLine = Math.max(lastLine - 5000, 0);
            }

        } catch (Exception e) {
            if (e instanceof NumberFormatException) {
                logger.info("NumberFormatException Error : " + e);
                //return Output.JsonOutput("200", result);
            } else if (e instanceof IOException) {
                //logger.info("IOException Error : " + e);
            }
            return Output.JsonOutput("200", result);
        }

        StringBuilder sb = new StringBuilder();
        int lineCount = 0;
        try (BufferedReader br = new BufferedReader(new FileReader(logPath))) {
            String line = "";

            while ((line = br.readLine()) != null && lineCount <= lastLine) {
                if (startLine <= lineCount) {
                    sb.append(line);
                    sb.append("\n");
                }
                lineCount++;
            }
        } catch (Exception e) {
            if (e instanceof IOException) {
                // logger.error("IOException Error!", e);
            } else {
                logger.error("Exception Error : ", e);
            }

            return Output.JsonOutput("4584", "Occured Loading Log");
        }

        result.setStart(String.valueOf(startLine));
        result.setSize(String.valueOf(lastLine));
        result.setLog(sb.toString());

        return Output.JsonOutput("200", result);
    }

//    public Object getTrainLog(TrainLogVO trainLogVO) {
//        UserVO userInfo = SessionUtil.getUserInfo();
//        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
//        }
//        if (trainLogVO.getTask_id() == null || trainLogVO.getTask_id().length() <= 0) {
//            return Output.JsonOutput("4584", "Occured Loading Log");
//        }
//        TaskVO inputTaskVO = new TaskVO();
//        inputTaskVO.setTask_id(trainLogVO.getTask_id());
//        TaskVO oneTask = taskDao.getTaskById(inputTaskVO);
//        if (oneTask == null) {
//            return Output.JsonOutput("200", null);
//        }
//        if (oneTask.getProject_id() == null || oneTask.getProject_id().length() <= 0) {
//            return Output.JsonOutput("200", null);
//        }
//        if (oneTask.getTask_id() == null || oneTask.getTask_id().length() <= 0) {
//            return Output.JsonOutput("200", null);
//        }
//        String projectId = oneTask.getProject_id();
//        String taskId = oneTask.getTask_id();
//        String logPath = WORKSPACE_PATH + projectId + "/" + taskId + "/" + "log/run.log";
//        TextReader tr;
//        String log = "";
//        try {
//            tr = new TextReader(logPath);
//            if (trainLogVO.getStart() == null || trainLogVO.getStart().equals("")) {
//                int start = tr.getFileLength() - Integer.valueOf(trainLogVO.getSize());
//
//                if (start <= 0) {
//                    start = 0;
//                }
//
//                log = tr.getRandomAccess(start, Integer.valueOf(trainLogVO.getSize()));
//
//                TrainLogVO result = new TrainLogVO();
//                result.setLog(log);
//
//                trainLogVO.setStart(String.valueOf(start));
//
//                return Output.JsonOutput("200", result);
//            } else {
//                log = tr.getRandomAccess(Integer.valueOf(trainLogVO.getStart()), Integer.valueOf(trainLogVO.getSize()));
//                TrainLogVO result = new TrainLogVO();
//                result.setLog(log);
//                return Output.JsonOutput("200", result);
//            }
//        } catch (Exception e) {
//            if (e instanceof NumberFormatException) {
//                logger.error("NumberFormatException Error!", e);
//                return Output.JsonOutput("4584", "Occured Loading Log");
//            } else if (e instanceof FileNotFoundException) {
//                logger.error("FileNotFoundException Error!", e);
//                return Output.JsonOutput("4584", "Occured Loading Log");
//            } else if (e instanceof IOException) {
//                logger.error("IOException Error!", e);
//                return Output.JsonOutput("4584", "Occured Loading Log");
//            } else {
//                logger.error("Excpetion Error!", e);
//                return Output.JsonOutput("4584", "Occured Loading Log");
//            }
//        }
//    }
//    public Object getTrainLog(TrainLogVO trainLogVO) {
//        UserVO userInfo = SessionUtil.getUserInfo();
//        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
//        }
//        if (trainLogVO.getTask_id() == null || trainLogVO.getTask_id().length() <= 0) {
//            return Output.JsonOutput("4584", "Occured Loading Log");
//        }
//        TaskVO inputTaskVO = new TaskVO();
//        inputTaskVO.setTask_id(trainLogVO.getTask_id());
//        TaskVO oneTask = taskDao.getTaskById(inputTaskVO);
//        if (oneTask == null) {
//            return Output.JsonOutput("200", null);
//        }
//        if (oneTask.getProject_id() == null || oneTask.getProject_id().length() <= 0) {
//            return Output.JsonOutput("200", null);
//        }
//        if (oneTask.getTask_id() == null || oneTask.getTask_id().length() <= 0) {
//            return Output.JsonOutput("200", null);
//        }
//        String projectId = oneTask.getProject_id();
//        String taskId = oneTask.getTask_id();
//        String logPath = WORKSPACE_PATH + projectId + "/" + taskId + "/" + "log/run.log";
//        TextReader tr;
//        String log = "";
//        try {
//            tr = new TextReader(logPath);
//            if (trainLogVO.getStart() == null || trainLogVO.getStart().equals("")) {
//                int start = tr.getFileLength() - Integer.valueOf(trainLogVO.getSize());
//
//                if (start <= 0) {
//                    start = 0;
//                }
//
//                log = tr.getRandomAccess(start, Integer.valueOf(trainLogVO.getSize()));
//
//                TrainLogVO result = new TrainLogVO();
//                result.setLog(log);
//
//                trainLogVO.setStart(String.valueOf(start));
//
//                return Output.JsonOutput("200", result);
//            } else {
//                log = tr.getRandomAccess(Integer.valueOf(trainLogVO.getStart()), Integer.valueOf(trainLogVO.getSize()));
//                TrainLogVO result = new TrainLogVO();
//                result.setLog(log);
//                return Output.JsonOutput("200", result);
//            }
//        } catch (Exception e) {
//            if (e instanceof NumberFormatException) {
//                logger.error("NumberFormatException Error!", e);
//                return Output.JsonOutput("4584", "Occured Loading Log");
//            } else if (e instanceof FileNotFoundException) {
//                logger.error("FileNotFoundException Error!", e);
//                return Output.JsonOutput("4584", "Occured Loading Log");
//            } else if (e instanceof IOException) {
//                logger.error("IOException Error!", e);
//                return Output.JsonOutput("4584", "Occured Loading Log");
//            } else {
//                logger.error("Excpetion Error!", e);
//                return Output.JsonOutput("4584", "Occured Loading Log");
//            }
//        }
//    }

    private static int countLines(String str) {
        if (str == null || str.length() <= 0) {
            return 0;
        }
        String[] lines = str.split("\r\n|\r|\n");
        return lines.length;
    }

    // s.kim 삭제
//	public Object killTrain(TaskVO taskVO) {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
//		}
//		TaskVO result = taskDao.getTaskById(taskVO);
//		if(result == null) {
//			return Output.JsonOutput("3405", false);
//		}
//		if(result.getProject_id() == null || result.getProject_id().length() <= 0) {
//			return Output.JsonOutput("3405", false);
//		}
//		if(result.getId() == null || result.getId().length() <= 0) {
//			return Output.JsonOutput("3405", false);
//		}
//		GrpcUtils gu = new GrpcUtils();
//		boolean is = (boolean)gu.killTrain(GRPC_ADDRESS, GRPC_PORT, result.getProject_id(), result.getId(),"t");
//		return Output.JsonOutput("200", is);
//	}
    //

    //s.kim 추가
    public Object killTrain(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        TaskVO result = taskDao.getTaskById(taskVO);
        if (result == null) {
            return Output.JsonOutput("3405", false);
        }
        if (result.getProject_id() == null || result.getProject_id().length() <= 0) {
            return Output.JsonOutput("3405", false);
        }
        if (result.getTask_id() == null || result.getTask_id().length() <= 0) {
            return Output.JsonOutput("3405", false);
        }
        // s.kim 수정 2021-01-26
        // grpc -> ssh
        GpuNodeVO inGpuNodeVO = new GpuNodeVO();
        inGpuNodeVO.setType("worker");
        List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);

        Object sessionObj = getSSHSessionList(gpuList);
        if (sessionObj instanceof JsonOutputVO) {
            return Output.JsonOutput("3405", false);
        }

        // sessionObj 메소드에서 list 크기가 0일 경우 JsonOutputVO로 반환하기 때문에 사이즈 체크 필요 X
        List<Session> sessionList = (List<Session>) sessionObj;

        if (sessionList.size() <= 0 || sessionList.isEmpty()) {
            //return Output.JsonOutput("3405", false);
            return null;
        }

        boolean is = false;
        Collection killTrainCmd = new ArrayList();
        List<Future<Boolean>> killTrainResult = null;
        ExecutorService executorService = Executors.newFixedThreadPool(10);

        for (int i = 0; i < sessionList.size(); i++) {
            SSHSessionVO sshSessionVO = new SSHSessionVO();
            sshSessionVO.setCommnad("killContainer");
            sshSessionVO.setProjectId(result.getProject_id());
            sshSessionVO.setTaskId(result.getTask_id());
            sshSessionVO.setType("t");
            killTrainCmd.add(new SessionCmdExecute(sessionList.get(i), sshSessionVO));
        }

        try {
            killTrainResult = executorService.invokeAll(killTrainCmd);
        } catch (Exception e) {
            if (e instanceof InterruptedException) {
                logger.error("InterruptedException Error!", e);
            } else {
                logger.error("Exception Error!", e);
            }
        } finally {
            executorService.shutdown();
        }

        if (killTrainResult.size() <= 0 || killTrainResult.isEmpty()) {
            return Output.JsonOutput("3405", false);
        }

        for (int i = 0; i < killTrainResult.size(); i++) {
            Boolean killTrainRes;
            try {
                killTrainRes = killTrainResult.get(i).get();
                if (killTrainRes == true) {
                    is = true;
                    break;
                }
            } catch (Exception e) {
                if (e instanceof InterruptedException) {
                    logger.error("InterruptedException Error!", e);
                } else if (e instanceof ExecutionException) {
                    logger.error("ExecutionException Error!", e);
                } else {
                    logger.error("Exception Error!", e);
                }
                continue;
            }
        }

        // s.kim 제거 2021-01-26
        //GrpcUtils gu = new GrpcUtils();
        //boolean is = (boolean)gu.killTrain(GRPC_ADDRESS, GRPC_PORT, result.getProject_id(), result.getId(),"t");
        return Output.JsonOutput("200", is);
    }
    //


    //s.kim 삭제
//	public Object killContainer(TaskVO taskVO) {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
//		}
//		TaskVO result = taskDao.getTaskById(taskVO);
//		if(result == null) {
//			return Output.JsonOutput("3405", false);
//		}
//		if(result.getProject_id() == null || result.getProject_id().length() <= 0) {
//			return Output.JsonOutput("3405", false);
//		}
//		if(result.getId() == null || result.getId().length() <= 0) {
//			return Output.JsonOutput("3405", false);
//		}
//		GrpcUtils gu = new GrpcUtils();
//		boolean is = (boolean)gu.killTrain(GRPC_ADDRESS, GRPC_PORT, result.getProject_id(), result.getId(),taskVO.getType());
//		return Output.JsonOutput("200", is);
//	}
    // s.kim

    public Object killContainer(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }

        if (taskVO.getAddress() == null || taskVO.getAddress().length() <= 0) {
            return Output.JsonOutput("3405", false);
        }
        TaskVO result = taskDao.getTaskById(taskVO);
        if (result == null) {
            return Output.JsonOutput("3405", false);
        }
        if (result.getProject_id() == null || result.getProject_id().length() <= 0) {
            return Output.JsonOutput("3405", false);
        }
        if (result.getTask_id() == null || result.getTask_id().length() <= 0) {
            return Output.JsonOutput("3405", false);
        }
        // s.kim 수정 2021-01-26
        // grpc -> ssh
        GpuNodeVO inGpuNodeVO = new GpuNodeVO();
        inGpuNodeVO.setType("worker");
        List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);

        Object sessionObj = getSSHSessionList(gpuList);
        if (sessionObj instanceof JsonOutputVO) {
            return Output.JsonOutput("3405", false);
        }

        // sessionObj 메소드에서 list 크기가 0일 경우 JsonOutputVO로 반환하기 때문에 사이즈 체크 필요 X
        List<Session> sessionList = (List<Session>) sessionObj;

        if (sessionList.size() <= 0 || sessionList.isEmpty()) {
            //return Output.JsonOutput("3405", false);
            return null;
        }

        boolean is = false;
        Collection killContainerCmd = new ArrayList();
        List<Future<Boolean>> killContainerResult = null;
        ExecutorService executorService = Executors.newFixedThreadPool(10);

        int sessionIndex = -1;

        for (int i = 0; i < sessionList.size(); i++) {
            if (sessionList.get(i).getHost().equals(taskVO.getAddress())) {
                sessionIndex = i;
                break;
            }
        }

        if (sessionIndex == -1) {
            return null;
        }

        SSHSessionVO sshSessionVO = new SSHSessionVO();
        sshSessionVO.setCommnad("killContainer");
        sshSessionVO.setProjectId(result.getProject_id());
        sshSessionVO.setTaskId(result.getTask_id());
        sshSessionVO.setType(taskVO.getType());
        SessionCmdExecute sessionCmdExecute = new SessionCmdExecute(sessionList.get(sessionIndex), sshSessionVO);
        is = (boolean) sessionCmdExecute.call();
//		killContainerCmd.add(new SessionCmdExecute(sessionList.get(i), sshSessionVO));

        // 선택한 명령어 실행중인 인덱스만 kill Container

//        for(int i = 0; i < sessionList.size(); i++) {
//        	SSHSessionVO sshSessionVO = new SSHSessionVO();
//        	sshSessionVO.setCommnad("killContainer");
//        	sshSessionVO.setProjectId(result.getProject_id());
//        	sshSessionVO.setTaskId(result.getId());
//        	sshSessionVO.setType(taskVO.getType());
//        	killContainerCmd.add(new SessionCmdExecute(sessionList.get(i), sshSessionVO));
//        }

//        try {
//        	killContainerResult = executorService.invokeAll(killContainerCmd);
//		} catch (Exception e) {
//			if (e instanceof InterruptedException) {
//				logger.error("InterruptedException Error!", e);
//			} else {
//				logger.error("Exception Error!", e);
//			}
//		}
//
//        if(killContainerResult.size() <= 0 || killContainerResult.isEmpty()) {
//        	return Output.JsonOutput("3405", false);
//        }

//        for(int i = 0; i < killContainerResult.size(); i++) {
//        	Boolean killTrainRes;
//			try {
//				killTrainRes = killContainerResult.get(i).get();
//	        	if(killTrainRes == true) {
//	        		is = true;
//	        		break;
//	        	}
//			} catch (InterruptedException | ExecutionException e) {
//				if(e instanceof InterruptedException) {
//					logger.error("InterruptedException Error!", e);
//				} else if(e instanceof ExecutionException) {
//					logger.error("ExecutionException Error!", e);
//				} else {
//					logger.error("Exception Error!", e);
//				}
//
//				continue;
//
//			}
//        }
//        List<SSHCmdExecute> sshList = new ArrayList<SSHCmdExecute>();
//        for(int i = 0; i < gpuList.size(); i++) {
//            String account = gpuList.get(i).getAccount();
//            String address = gpuList.get(i).getAddress();
//            String password = gpuList.get(i).getPassword();
//        	int port = 0;
//        	try {
//               	port = Integer.valueOf(gpuList.get(i).getPort());
//        	} catch (NumberFormatException e) {
//        		logger.error("GPU Node의 포트번호가 잘못된 형태입니다.\nDB에서 수정해주세요.");
//        		logger.error("NumberFormatException Error!", e);
//        		continue;
//        	}
//
//            SSHCmdExecute sshCmdExcute = new SSHCmdExecute(account, port, address, password);
//            sshList.add(sshCmdExcute);
//        }
//        if(sshList.size() <= 0 || sshList.isEmpty()) {
//            //return Output.JsonOutput("3454", "연결된 노드가 없습니다.\nSetup에서 worker 노드를 연결 후 다시 시도하세요.");
//            return null;
//        }
//        boolean is = false;
//
//        for(int i = 0; i < sshList.size(); i++) {
//            //sshList.get(i).cmdExcute(command)
//            SSHCmdExecute sshSession = sshList.get(i);
//            is = sshSession.killContainer(taskVO.getType(), result.getProject_id(), result.getId());
//            if (is) {
//                break;
//            }
//        }
        // s.kim 제거 2021-01-26
        //GrpcUtils gu = new GrpcUtils();
        //boolean is = (boolean)gu.killTrain(GRPC_ADDRESS, GRPC_PORT, result.getProject_id(), result.getId(),taskVO.getType());
        return Output.JsonOutput("200", is);
    }


    // s.kim 삭제
//	public Object getTrainStatus(TaskVO taskVO) {
//		UserVO userInfo = SessionUtil.getUserInfo();
//		if(userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
//			return Output.JsonOutput("2001","로그인 세션이 만료 되었습니다");
//		}
//		TaskVO result = taskDao.getTaskById(taskVO);
//		if(result == null) {
//			return Output.JsonOutput("3405", false);
//		}
//		if(result.getProject_id() == null || result.getProject_id().length() <= 0) {
//			return Output.JsonOutput("3405", false);
//		}
//		if(result.getId() == null || result.getId().length() <= 0) {
//			return Output.JsonOutput("3405", false);
//		}
//		GrpcUtils gu = new GrpcUtils();
//		boolean is = (boolean)gu.isUpTrain(GRPC_ADDRESS, GRPC_PORT, result.getProject_id(), result.getId());
//		return Output.JsonOutput("200", is);
//	}
    //s.kim 추가
    public Object getTrainStatus(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        TaskVO result = taskDao.getTaskById(taskVO);
        if (result == null) {
            return Output.JsonOutput("3405", false);
        }
        if (result.getProject_id() == null || result.getProject_id().length() <= 0) {
            return Output.JsonOutput("3405", false);
        }
        if (result.getTask_id() == null || result.getTask_id().length() <= 0) {
            return Output.JsonOutput("3405", false);
        }

        // s.kim 수정 2021-01-26
        // grpc -> ssh
        GpuNodeVO inGpuNodeVO = new GpuNodeVO();
        inGpuNodeVO.setType("worker");
        List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);

        // worker List를 넘겨 세션이 연결된 gpuList를 반환받음.
        // JsonOutputVO로 반환할 경우 에러가 발생한 것
        Object sessionObj = getSSHSessionList(gpuList);
        if (sessionObj instanceof JsonOutputVO) {
            return Output.JsonOutput("3405", false);
        }

        // sessionObj 메소드에서 list 크기가 0일 경우 JsonOutputVO로 반환하기 때문에 사이즈 체크 필요 X
        List<Session> sessionList = (List<Session>) sessionObj;

        if (sessionList.size() <= 0 || sessionList.isEmpty()) {
            //return Output.JsonOutput("3454", "연결된 노드가 없습니다.\nSetup에서 worker 노드를 연결 후 다시 시도하세요.");
            return null;
        }
        boolean is = false;
        Collection isUpTrainingCmd = new ArrayList();
        List<Future<Boolean>> isUpTrainingResult = null;
        ExecutorService executorService = Executors.newFixedThreadPool(10);

        for (int i = 0; i < sessionList.size(); i++) {
            //sshList.get(i).cmdExcute(command)
            //SSHCmdExecute sshSession = sessionList.get(i);
            SSHSessionVO sshSessionVO = new SSHSessionVO();
            sshSessionVO.setCommnad("isUpTrainning");
            sshSessionVO.setProjectId(result.getProject_id());
            sshSessionVO.setTaskId(result.getTask_id());
            isUpTrainingCmd.add(new SessionCmdExecute(sessionList.get(i), sshSessionVO));
        }

        try {
            isUpTrainingResult = executorService.invokeAll(isUpTrainingCmd);
        } catch (InterruptedException e) {
            if (e instanceof InterruptedException) {
                logger.error("InterruptedException Error!", e);
            } else {
                logger.error("Exception Error!", e);
            }
        } finally {
            executorService.shutdown();
        }

        if (isUpTrainingResult == null || isUpTrainingResult.size() <= 0 || isUpTrainingResult.isEmpty()) {
            //is = false;
            return Output.JsonOutput("3405", false);
        }

        for (int i = 0; i < isUpTrainingResult.size(); i++) {
            try {
                Boolean isUpTraining = isUpTrainingResult.get(i).get();

                if (isUpTraining == null) {
                    is = false;
                    break;
                }
                if (isUpTraining) {
                    is = true;
                    break;
                }
            } catch (Exception e) {
                if (e instanceof InterruptedException) {
                    logger.error("InterruptedException Error!", e);
                } else if (e instanceof ExecutionException) {
                    logger.error("ExecutionException Error!", e);
                } else {
                    logger.error("Exception Error!", e);
                }
                continue;
            }
        }

        // s.kim 제거 2021-01-26
        //GrpcUtils gu = new GrpcUtils();
        //boolean is = (boolean)gu.isUpTrain(GRPC_ADDRESS, GRPC_PORT, result.getProject_id(), result.getId());
        //System.out.println(is);

        return Output.JsonOutput("200", is);
    }

    public Object getInferenceStatus(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        TaskVO result = taskDao.getTaskById(taskVO);
        if (result == null) {
            return Output.JsonOutput("3405", false);
        }
        if (result.getProject_id() == null || result.getProject_id().length() <= 0) {
            return Output.JsonOutput("3405", false);
        }
        if (result.getTask_id() == null || result.getTask_id().length() <= 0) {
            return Output.JsonOutput("3405", false);
        }

        GpuNodeVO inGpuNodeVO = new GpuNodeVO();
        inGpuNodeVO.setType("worker");
        List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);

        Object sessionObj = getSSHSessionList(gpuList);
        if (sessionObj instanceof JsonOutputVO) {
            return Output.JsonOutput("3405", false);
        }

        // sessionObj 메소드에서 list 크기가 0일 경우 JsonOutputVO로 반환하기 때문에 사이즈 체크 필요 X
        List<Session> sessionList = (List<Session>) sessionObj;

        //

//        List<SSHCmdExecute> sshList = new ArrayList<SSHCmdExecute>();
//        for(int i = 0; i < gpuList.size(); i++) {
//            String account = gpuList.get(i).getAccount();
//            String address = gpuList.get(i).getAddress();
//            String password = gpuList.get(i).getPassword();
//        	int port = 0;
//            try {
//            	port = Integer.valueOf(gpuList.get(i).getPort());
//			} catch (NumberFormatException e) {
//				logger.error("GPU Node의 포트번호가 잘못된 형태입니다.\nDB에서 수정해주세요.");
//				logger.error("NumberFormatException Error!", e);
//				continue;
//			}
//
//            SSHCmdExecute sshCmdExcute = new SSHCmdExecute(account, port, address, password);
//            sshList.add(sshCmdExcute);
//        }

        if (sessionList.size() <= 0 || sessionList.isEmpty()) {
            //return Output.JsonOutput("3454", "연결된 노드가 없습니다.\nSetup에서 worker 노드를 연결 후 다시 시도하세요.");
            return null;
        }
        boolean is = false;
        Collection isUpInferenceCmd = new ArrayList();
        List<Future<Boolean>> isUpInferenceResult = null;
        ExecutorService executorService = Executors.newFixedThreadPool(10);

        for (int i = 0; i < sessionList.size(); i++) {
            //sshList.get(i).cmdExcute(command)
            //SSHCmdExecute sshSession = sessionList.get(i);
            SSHSessionVO sshSessionVO = new SSHSessionVO();
            sshSessionVO.setCommnad("isUpInference");
            sshSessionVO.setProjectId(result.getProject_id());
            sshSessionVO.setTaskId(result.getTask_id());
            isUpInferenceCmd.add(new SessionCmdExecute(sessionList.get(i), sshSessionVO));
//            is = sshSession.isUpTrainning(result.getProject_id(), result.getId());
//            if (is) {
//                break;
//            }
        }

        try {
            isUpInferenceResult = executorService.invokeAll(isUpInferenceCmd);
        } catch (InterruptedException e) {
            if (e instanceof InterruptedException) {
                logger.error("InterruptedException Error!", e);
            } else {
                logger.error("Exception Error!", e);
            }
        } finally {
            executorService.shutdown();
        }

        if (isUpInferenceResult == null || isUpInferenceResult.size() <= 0 || isUpInferenceResult.isEmpty()) {
            //is = false;
            return Output.JsonOutput("3405", false);
        }

        for (int i = 0; i < isUpInferenceResult.size(); i++) {
            try {
                Boolean isUpInference = isUpInferenceResult.get(i).get();
                if (isUpInference == null) {
                    continue;
                }
                if (isUpInference) {
                    is = true;
                    break;
                }
            } catch (Exception e) {
                if (e instanceof InterruptedException) {
                    logger.error("InterruptedException Error!", e);
                } else if (e instanceof ExecutionException) {
                    logger.error("ExecutionException Error!", e);
                } else {
                    logger.error("Exception Error!", e);
                }

                continue;
            }
        }
//        List<SSHCmdExecute> sshList = new ArrayList<SSHCmdExecute>();
//        for(int i = 0; i < gpuList.size(); i++) {
//            String account = gpuList.get(i).getAccount();
//            String address = gpuList.get(i).getAddress();
//            String password = gpuList.get(i).getPassword();
//        	int port = 0;
//            try {
//            	port = Integer.valueOf(gpuList.get(i).getPort());
//			} catch (NumberFormatException e) {
//				logger.error("GPU Node의 포트번호가 잘못된 형태입니다.\nDB에서 수정해주세요.");
//				logger.error("NumberFormatException Error!", e);
//				continue;
//			}
//
//            SSHCmdExecute sshCmdExcute = new SSHCmdExecute(account, port, address, password);
//            sshList.add(sshCmdExcute);
//        }
//
//        boolean is = false;
//        for(int i = 0; i < sshList.size(); i++) {
//        	is = sshList.get(i).isUpInference(result.getProject_id(), result.getId());
//        	if(is == true) {
//        		break;
//        	}
//        }
//		GrpcUtils gu = new GrpcUtils();
//		boolean is = (boolean)gu.isUpInference(GRPC_ADDRESS, GRPC_PORT, result.getProject_id(), result.getId());
        return Output.JsonOutput("200", is);
    }

    public Object getGpuStatus() {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        JSONObject jObj = getGpuListToJson();
        if (jObj == null || jObj.size() <= 0) {
            return Output.JsonOutput("200", null);
        }
        GrpcUtils gu = new GrpcUtils();
        List<GpuNodeStatusVO> resultList = (List<GpuNodeStatusVO>) gu.callAvailableGpuList(GRPC_ADDRESS, GRPC_PORT, jObj);
        return Output.JsonOutput("200", resultList);
    }

    // getImage
    public Object getGpuImage(GpuNodeImageVO gpuNodeImageVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }

        String imageName = gpuNodeImageVO.getImages();
        if (imageName == null || imageName.length() <= 0) {
            imageName = "";
        }

        JSONObject jObj = getGpuListToJson();

        GrpcUtils gu = new GrpcUtils();
        List<GpuNodeImageVO> resultList = (List<GpuNodeImageVO>) gu.callImageCheck(GRPC_ADDRESS, GRPC_PORT, jObj, imageName);

        HashMap<String, String> idMap = new HashMap<String, String>();


        for (int i = 0; i < resultList.size(); i++) {
            String tempImage = resultList.get(i).getImages();
            if (tempImage != null && !tempImage.equals("")) {
                String[] tempImageArr = tempImage.split(",");
                for (int j = 0; j < tempImageArr.length; j++) {
                    idMap.put(tempImageArr[j], "true");
                }
            }
        }

//		String ids = "";
        StringBuffer ids = new StringBuffer();
        List<GpuNodeImageVO> availableImageList = new ArrayList<GpuNodeImageVO>();
        int k = 0;
        for (String key : idMap.keySet()) {
            if (k == 0) {
//				ids += key;
                ids.append(key);
                k++;
            } else {
//				ids += ","+key;
                ids.append(",");
                ids.append(key);
                k++;
            }
            GpuNodeImageVO temp = new GpuNodeImageVO();
            temp.setImages(key);
            availableImageList.add(temp);

        }
        if (k == 0) {
            return Output.JsonOutput("200", null);
        }
        AlgorithmVO inAlgorithmVO = new AlgorithmVO();
        inAlgorithmVO.setAlgorithm_id(ids.toString());
        List<AlgorithmVO> algorithmList = algorithmDao.getAlgorithmInId(inAlgorithmVO);

        return Output.JsonOutput("200", algorithmList);
    }

    // ㅌㅍ
    //선택가능한 GPU NODE
    //이미지 존재하는 GPU Node와 GPU Index를 받아옴
    public Object getSelectableGpuNode(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }

        TaskVO resultTask = null;
        String imageName = "";
        if (taskVO.getTask_id() != null && taskVO.getTask_id().length() > 0) {
            resultTask = taskDao.getTaskById(taskVO);

            if (resultTask.getAlgorithm_id() == null || resultTask.getAlgorithm_id().length() <= 0) {
                return Output.JsonOutput("3451", "알고리즘을 선택해주세요.");
            }

            imageName = "ca_" + resultTask.getAlgorithm_id() + ":latest";
        } else {
            imageName = "ca_" + taskVO.getAlgorithm_id() + ":latest";
        }

        //String imageName = "ca_"+resultTask.getAlgorithm_id()+":latest";

        JSONObject jObj = getGpuListToJson();
        if (jObj.size() <= 0 || jObj.isEmpty()) {
            return Output.JsonOutput("3454", "연결된 노드가 없습니다.\nSetup에서 worker 노드를 연결 후 다시 시도하세요.");
        }

        GpuNodeVO inGpuNodeVO = new GpuNodeVO();
        inGpuNodeVO.setType("worker");
        List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);
        if (gpuList == null || gpuList.size() <= 0 || gpuList.isEmpty()) {
            return Output.JsonOutput("3454", "연결된 노드가 없습니다.\nSetup에서 worker 노드를 연결 후 다시 시도하세요.");
        }

        // worker List를 넘겨 세션이 연결된 gpuList를 반환받음.
        // JsonOutputVO로 반환할 경우 에러가 발생한 것
        Object sessionObj = getSSHSessionList(gpuList);
        if (sessionObj instanceof JsonOutputVO) {
            return sessionObj;
        }

        // sessionObj 메소드에서 list 크기가 0일 경우 JsonOutputVO로 반환하기 때문에 사이즈 체크 필요 X
        List<Session> sessionList = (List<Session>) sessionObj;

        // 연결된 각 세션들에 이미지 체크를 수행하기 위한 콜렉션 리스트
        Collection resultImageCheckCmd = new ArrayList();
        // 이미지 체크의 결과를 반환받는 리스트
        List<Future<GpuNodeImageVO>> resultImageCheckList = new ArrayList<>();

        for (int i = 0; i < sessionList.size(); i++) {
            SSHSessionVO sshSessionVO = new SSHSessionVO();
            sshSessionVO.setCommnad("imageCheck");
            sshSessionVO.setImageName(imageName);
            // 이미지 체크 명령어, 이미지 이름을 넘겨주고 객체를 생성해 콜렉션에 추가
            resultImageCheckCmd.add(new SessionCmdExecute(sessionList.get(i), sshSessionVO));
        }

        ExecutorService executorService = Executors.newFixedThreadPool(10);
        try {
            // 콜렉션에 생성된 객체를 쓰레드로 실행시킴, 명령어를 실행해 성공한 경우에만 리스트에 추가함.
            resultImageCheckList = executorService.invokeAll(resultImageCheckCmd);
        } catch (Exception e) {
            if (e instanceof InterruptedException) {
                logger.error("InterruptedException Error!", e);
            } else {
                logger.error("Exception Error!", e);
            }
        }

        if (resultImageCheckList.size() <= 0 || resultImageCheckList.isEmpty()) {
            executorService.shutdownNow();
            return Output.JsonOutput("3452", "해당 노드에는 선택하신 알고리즘이 배포되지 않았습니다.\n배포 후 다시 시도하세요.");
        }

        JSONObject checkGpuNodeObj = new JSONObject();

        for (int i = 0; i < resultImageCheckList.size(); i++) {
            try {
                GpuNodeImageVO gpuNodeImageVO = resultImageCheckList.get(i).get();
                //String checkStr = resultImageCheckList.get(i).get().getCheck();
                String checkStr = gpuNodeImageVO.getCheck();
                if (checkStr == null || checkStr.length() <= 0) {
                    continue;
                }
                if (checkStr != null && checkStr.split("==").length <= 2 && checkStr.split("==")[1] != null) {
                    if (checkStr.split("==")[1].equals("true")) {
                        checkGpuNodeObj.put(resultImageCheckList.get(i).get().getNode_ip(), jObj.get(resultImageCheckList.get(i).get().getNode_ip()));
                    }
                } else {
                    continue;
                }
            } catch (InterruptedException | ExecutionException e) {
                if (e instanceof InterruptedException) {
                    logger.error("InterruptedException Error!", e);
                } else if (e instanceof ExecutionException) {
                    logger.error("ExecutionException Error!", e);
                } else {
                    logger.error("Exception Error!", e);
                }

                continue;
            }
        }

        if (checkGpuNodeObj.size() <= 0 || checkGpuNodeObj.isEmpty()) {
            return Output.JsonOutput("3453", "해당 노드에는 선택하신 알고리즘이 배포되지 않았습니다.\n배포 후 다시 시도하세요.");
        }

        Collection availableCmdList = new ArrayList<>();
        for (int i = 0; i < sessionList.size(); i++) {
            SSHSessionVO sshSessionVO = new SSHSessionVO();
            sshSessionVO.setCommnad("getAvailbelGpuList");
            availableCmdList.add(new SessionCmdExecute(sessionList.get(i), sshSessionVO));
        }

        List<Future<GpuNodeStatusVO>> availableGpuNodeResult = new ArrayList<Future<GpuNodeStatusVO>>();
        try {
            availableGpuNodeResult = executorService.invokeAll(availableCmdList);
        } catch (Exception e) {
            if (e instanceof InterruptedException) {
                logger.error("InterruptedException Error!", e);
            } else {
                logger.error("Exception Error!", e);
            }
        } finally {
            executorService.shutdown();
        }
        //executorService.shutdown();

        if (availableGpuNodeResult.isEmpty() || availableGpuNodeResult.size() <= 0) {
            executorService.shutdownNow();
            return Output.JsonOutput("3454", "현재 사용가능한 GPU Node가 존재하지 않습니다.\n잠시후에 시도해주시길 바랍니다.");
        }

        List<GpuNodeStatusVO> resultAvailableGpuNodeList = new ArrayList<GpuNodeStatusVO>();

        for (int i = 0; i < availableGpuNodeResult.size(); i++) {
            try {
                //GpuNodeStatusVO gpuNodeStatusVO = availableGpuNodeResult.get(i).get();
                resultAvailableGpuNodeList.add(availableGpuNodeResult.get(i).get());
            } catch (InterruptedException | ExecutionException e) {
                if (e instanceof InterruptedException) {
                    logger.error("InterruptedException Error!", e);
                } else if (e instanceof ExecutionException) {
                    logger.error("ExecutionException Error!", e);
                } else {
                    logger.error("Exception Error!", e);
                }

                continue;
            }
        }

        if (resultAvailableGpuNodeList.size() <= 0 || resultAvailableGpuNodeList.isEmpty()) {
            return Output.JsonOutput("3454", "현재 사용가능한 GPU Node가 존재하지 않습니다.\n잠시후에 시도해주시길 바랍니다.");
        }

        HashMap<String, String> gpuMap = new HashMap<String, String>();

        for (int i = 0; i < gpuList.size(); i++) {
            gpuMap.put(gpuList.get(i).getAddress(), gpuList.get(i).getGpu_node_id());
        }

        for (int i = 0; i < resultAvailableGpuNodeList.size(); i++) {
            resultAvailableGpuNodeList.get(i).setGpu_node_id(gpuMap.get(resultAvailableGpuNodeList.get(i).getNode_ip()));
        }

        ObjectMapper objectMapper = new ObjectMapper();
        String s = null;
        try {
            s = objectMapper.writeValueAsString(resultAvailableGpuNodeList);
            logger.info("AVALIABLE GPU : "+ s);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return Output.JsonOutput("200", resultAvailableGpuNodeList);

    }

    //선택가능한 GPU NODE
    //이미지 존재하는 GPU Node와 GPU Index를 받아옴
    public Object getSelectableGpuNodeQuick(QuickTrainerVO quickTrainerVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }


        if (quickTrainerVO.getAlgorithm_id() == null || quickTrainerVO.getAlgorithm_id().length() <= 0) {
            return Output.JsonOutput("3451", "알고리즘을 선택해주세요.");
        }

        String imageName = "ca_" + quickTrainerVO.getAlgorithm_id() + ":latest";

        JSONObject jObj = getGpuListToJson();
        if (jObj.size() <= 0 || jObj.isEmpty()) {
            return Output.JsonOutput("3454", "연결된 노드가 없습니다.\nSetup에서 worker 노드를 연결 후 다시 시도하세요.");
        }
        GpuNodeVO inGpuNodeVO = new GpuNodeVO();
        inGpuNodeVO.setType("worker");
        List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);

        List<SSHCmdExecute> sshList = new ArrayList<SSHCmdExecute>();
        for (int i = 0; i < gpuList.size(); i++) {
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

            SSHCmdExecute sshCmdExcute = new SSHCmdExecute(account, port, address, password);
            sshList.add(sshCmdExcute);
        }
        if (sshList.size() <= 0 || sshList.isEmpty()) {
            return Output.JsonOutput("3454", "연결된 노드가 없습니다.\nSetup에서 worker 노드를 연결 후 다시 시도하세요.");
        }


        // j.seo 수정 (210129)
//		GrpcUtils gu = new GrpcUtils();
//		List<GpuNodeImageVO> resultImageCheckList = (List<GpuNodeImageVO>)gu.callImageCheck(GRPC_ADDRESS, GRPC_PORT, jObj,imageName);
//
//		if(resultImageCheckList == null || resultImageCheckList.size() <= 0 || resultImageCheckList.isEmpty()) {
//			return Output.JsonOutput("3453", "해당 노드에는 선택하신 알고리즘이 배포되지 않았습니다.\n배포 후 다시 시도하세요.");
//		}
//		for(int i = 0 ; i < resultImageCheckList.size();i++) {
//		String checkStr = resultImageCheckList.get(i).getCheck();
//		if(checkStr == null) {
//			return Output.JsonOutput("3453", "해당 노드에는 선택하신 알고리즘이 배포되지 않았습니다.\n배포 후 다시 시도하세요.");
//		}
//		if(checkStr.split("==").length >= 2 && checkStr.split("==")[1] != null) {
//			if(checkStr.split("==")[1].equals("true")) {
//				checkGpuNodeObj.put(resultImageCheckList.get(i).getNode_ip(), jObj.get(resultImageCheckList.get(i).getNode_ip()));
//			}
//		}
//	}
        List<GpuNodeImageVO> resultImageCheckList = new ArrayList<GpuNodeImageVO>();
        for (int i = 0; i < sshList.size(); i++) {
            SSHCmdExecute sshSession = sshList.get(i);
            GpuNodeImageVO gpuNodeImageVO = sshSession.imageCheck(imageName);
            if (gpuNodeImageVO == null || gpuNodeImageVO.getCheck() == null || gpuNodeImageVO.getCheck().length() <= 0) {
                continue;
            }
            resultImageCheckList.add(gpuNodeImageVO);
        }

        if (resultImageCheckList.size() <= 0 || resultImageCheckList.isEmpty()) {
            return Output.JsonOutput("3452", "해당 노드에는 선택하신 알고리즘이 배포되지 않았습니다.\n배포 후 다시 시도하세요.");
        }

        JSONObject checkGpuNodeObj = new JSONObject();

        for (int i = 0; i < resultImageCheckList.size(); i++) {
            String checkStr = resultImageCheckList.get(i).getCheck();
            if (checkStr != null && checkStr.split("==").length <= 2 && checkStr.split("==")[1] != null) {
                if (checkStr.split("==")[1].equals("true")) {
                    checkGpuNodeObj.put(resultImageCheckList.get(i).getNode_ip(), jObj.get(resultImageCheckList.get(i).getNode_ip()));
                }
            }
        }

        List<GpuNodeStatusVO> resultAvailableGpuNodeList = new ArrayList<GpuNodeStatusVO>();
        for (int i = 0; i < sshList.size(); i++) {
            SSHCmdExecute sshSession = sshList.get(i);
            GpuNodeStatusVO gpuNodeStatusVO = sshSession.getAvailbelGpuList();
            resultAvailableGpuNodeList.add(gpuNodeStatusVO);
            sshSession.sessionClose();
            //resultAvailableGpuNodeList.add(gpuNodeStatusVO);
        }

        if (checkGpuNodeObj.size() <= 0 || checkGpuNodeObj.isEmpty()) {
            return Output.JsonOutput("3453", "해당 노드에는 선택하신 알고리즘이 배포되지 않았습니다.\n배포 후 다시 시도하세요.");
        }

        // j.seo 삭제(210119)
//		List<GpuNodeStatusVO> resultAvailableGpuNodeList = gu.callAvailableGpuList(GRPC_ADDRESS, GRPC_PORT, checkGpuNodeObj);
//		if(resultAvailableGpuNodeList == null || resultAvailableGpuNodeList.size() <= 0 || resultAvailableGpuNodeList.isEmpty()) {
//			return Output.JsonOutput("3453", "현재 사용가능한 GPU가 없습니다.\n잠시 후 다시 시도해주세요.");
//		}
        //

        HashMap<String, String> gpuMap = new HashMap<String, String>();

        for (int i = 0; i < gpuList.size(); i++) {
            gpuMap.put(gpuList.get(i).getAddress(), gpuList.get(i).getGpu_node_id());
        }

        for (int i = 0; i < resultAvailableGpuNodeList.size(); i++) {
            resultAvailableGpuNodeList.get(i).setGpu_node_id(gpuMap.get(resultAvailableGpuNodeList.get(i).getNode_ip()));
        }


        return Output.JsonOutput("200", resultAvailableGpuNodeList);
    }

    private JSONObject getGpuListToJson() {
        GpuNodeVO inGpuNodeVO = new GpuNodeVO();
        inGpuNodeVO.setType("worker");
        List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);
        JSONObject jObj = new JSONObject();
        for (int i = 0; i < gpuList.size(); i++) {
            jObj.put(gpuList.get(i).getAddress(), gpuList.get(i).getPassword());
        }
        return jObj;
    }

    private Object convertLossCSVtoJson(String resultPath) {
        CsvReader cr = new CsvReader(resultPath);
        List<String> resultList = null;
        resultList = cr.readToArray();

        if (resultList == null || resultList.isEmpty() || resultList.size() < 2) {
            return null;
        }

        // 인덱스 구분, header
        String[] index = resultList.get(0).split(",");
        // 인덱스에 들어갈 값 구분, body
        String[] indexValue = null;
        // 키가 저장된 0번을 제외하고 csv의 길이만큼 첫번째 줄부터 반복문 실행
        List<JSONArray> jsonList = new ArrayList<JSONArray>();
        JSONArray jArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        JSONObject json = null;

        // 0번째에는 컬럼
        for (int i = 1; i < resultList.size(); i++) {
            indexValue = resultList.get(i).split(",");
            jArray = new JSONArray();
            json = new JSONObject();
            for (int j = 0; j < index.length; j++) {
                json.put(index[j], indexValue[j]);
            }
            jArray.add(json);
            jsonList.add(jArray);
            logger.info(jArray.toJSONString());
        }
        jsonObject.put("header", index);
        jsonObject.put("body", jsonList);
        return jsonObject;
    }

    private String makeCmd(String address, String account, String password, String command) {
        String newCmd = "sshpass -p '" + password + "' ssh -o StrictHostKeyChecking=no " + account + "@" + address + " " + command;
        System.out.println(newCmd);
        return newCmd;
    }


    private String cmd(String command) throws IOException, InterruptedException {
        CmdExector ce = new CmdExector();
        String[] cmd = {"/bin/bash", "-c", command};
        String result = ce.byProcessBuilderRedirect(cmd);
        System.out.println(result);
        return result;
    }

    public Object quickTraining(TaskVO taskVO) throws Exception {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        if (taskVO.getBase_task_id() == null || taskVO.getBase_task_id().length() <= 0) {
            taskVO.setBase_task_id(null);
        }
        if (taskVO.getCheck_point_name() == null || taskVO.getCheck_point_name().length() <= 0) {
            taskVO.setCheck_point_name(null);
        }
        if (taskVO.getAnnotation_title() == null || taskVO.getAnnotation_title().length() <= 0) {
            return Output.JsonOutput("4611", "Annotation명을 입력해주세요.");
        }
        if (taskVO.getTask_title() == null || taskVO.getTask_title().length() <= 0) {
            return Output.JsonOutput("4611", "Task명을 입력해주세요.");
        }
        if (taskVO.getProject_id() == null || taskVO.getProject_id().length() <= 0) {
            return Output.JsonOutput("4611", "Task를 생성할 프로젝트를 선택해주세요.");
        }
        if (taskVO.getAlgorithm_id() == null || taskVO.getAlgorithm_id().length() <= 0) {
            return Output.JsonOutput("4611", "알고리즘을 선택해주세요.");
        }
        if (taskVO.getConfig() == null || taskVO.getConfig().length() <= 0) {
            return Output.JsonOutput("4611", "알고리즘의 파라미터 값을 입력해주세요.");
        }
//		System.out.println(quickTrainerVO.getConfig());
//		TaskVO taskVO = new TaskVO();
////		System.out.println(quickTrainerVO.getTask_title());
//		taskVO.setTitle(quickTrainerVO.getTask_title());
//		taskVO.setProject_id(quickTrainerVO.getProject_id());
        taskVO.setTitle(taskVO.getTask_title());
        AnnotationVO annotationVO = new AnnotationVO();
        annotationVO.setTitle(taskVO.getAnnotation_title());

        // Task명, Annotation명 중복 체크
        List<TaskVO> taskNameDupCheck = taskDao.getCheckTaskName(taskVO);
        List<AnnotationVO> annoNameDupCheck = annotationDao.getCheckAnnotationName(annotationVO);
        if (taskNameDupCheck.size() != 0) {
            return Output.JsonOutput("4612", "중복된 Task명입니다.");
        }
        if (annoNameDupCheck.size() != 0) {
            return Output.JsonOutput("4612", "중복된 Annotation명입니다.");
        }

        // 사용 가능한 GPU 있는지 검사
        // 주석
        JsonOutputVO getGpuNodeVO = (JsonOutputVO) getSelectableGpuNode(taskVO);
        if (getGpuNodeVO.getCode() == null || getGpuNodeVO.getCode().length() <= 0 || !getGpuNodeVO.getCode().equals("200")) {
            return getGpuNodeVO;
        }

        List<GpuNodeStatusVO> gpuNodeList = (ArrayList<GpuNodeStatusVO>) getGpuNodeVO.getData();
        if (gpuNodeList == null || gpuNodeList.isEmpty() || gpuNodeList.size() <= 0) {
            return Output.JsonOutput("3453", "현재 사용가능한 GPU가 없습니다.\n잠시후에 시도해주세요.");
        }
        GpuNodeStatusVO runGpuNode = null;

        for (GpuNodeStatusVO gpuNode : gpuNodeList) {
            if (gpuNode.getAvailable_gpu_index() != null && gpuNode.getAvailable_gpu_index().length() > 0) {
                runGpuNode = gpuNode;
                break;
            }
        }
        // Available_gpu_index가 빈값이 아니라면 사용가능한 GPU_Index가 있는 것으로 간주, split으로 첫번째 인덱스만 가져온다.
        if (runGpuNode == null || runGpuNode.getAvailable_gpu_index() == null || runGpuNode.getAvailable_gpu_index().length() <= 0) {
            return Output.JsonOutput("3455", "현재 사용가능한 GPU가 없습니다.\n잠시후에 시도해주세요.");
        }
        String[] gpuIndexID = runGpuNode.getAvailable_gpu_index().split(",");
        if (gpuIndexID == null || gpuIndexID.length <= 0) {
            return Output.JsonOutput("3455", "현재 사용가능한 GPU가 없습니다.\n잠시후에 시도해주세요.");
        }
        // 주석
        // MetaData 가져와서 Json형태로 변환
        // DataSet ID를 통해 Data리스트를 가져옴, annotation을 생성하기 위함
        DataVO dataVO = new DataVO();
        dataVO.setDataset_id(taskVO.getDataset_id());
        dataVO.setPage_num("0");
        dataVO.setPage_size("99999");
        dataVO.setStatus("1");
        List<DataVO> dataList = dataDao.getDataList(dataVO);
        if (dataList == null || dataList.isEmpty() || dataList.size() <= 0) {
            return Output.JsonOutput("3500", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        // 가져온 dataList를 통해 MetaDataList를 가져옴, Annotation에 Path를 저장하기 위함
        List<MetaVO> metaList = new ArrayList<MetaVO>();
        for (int i = 0; i < dataList.size(); i++) {
            MetaVO metaVO = new MetaVO();
            metaVO.setData_id(dataList.get(i).getData_id());
            List<MetaVO> findMetaList = dataDao.getMetaList(metaVO);
            if (findMetaList == null || findMetaList.size() <= 0) {
                continue;
            }
            for (int j = 0; j < findMetaList.size(); j++) {
                findMetaList.get(j).setPath(dataList.get(i).getPath());
                metaList.add(findMetaList.get(j));
            }
        }

        if (metaList == null || metaList.isEmpty() || metaList.size() <= 0) {
            return Output.JsonOutput("3456", "라벨정보 생성 후 Training해주시길 바랍니다.");
        }
        // Json형태로 변환
        // Annotation Insert
        JSONArray jsonArr = new JSONArray();
//		for(int i = 0; i < metaList.size(); i++) {
//			String[] slice_info = metaList.get(i).getInfo().split(",");
//			JSONObject jsonObj = new JSONObject();
//			jsonObj.put("path", meta.getPath());
//			jsonObj.put("x", slice_info[0]);
//			jsonObj.put("y", slice_info[1]);
//			jsonObj.put("w", slice_info[2]);
//			jsonObj.put("h", slice_info[3]);
//			jsonObj.put("label", meta.getLabel());
//			jsonArr.add(jsonObj);
//		}
        String label_type = "";
        for (MetaVO meta : metaList) {
            label_type = meta.getLabel_type();
            if (label_type == null || label_type.length() <= 0) {
                continue;
            }
            if (meta == null || meta.getInfo() == null || meta.getInfo().length() <= 0) {
                continue;
            }
            if (meta.getPath() == null || meta.getPath().length() <= 0) {
                continue;
            }
            if (meta.getLabel() == null || meta.getLabel().length() <= 0) {
                continue;
            }
            JSONObject jsonObj = new JSONObject();
            if (meta.getLabel_type() == null || meta.getLabel_type().length() <= 0) {
                continue;
            }
            if (meta.getLabel_type().equals("IMAGE_BBOX")) {
                String[] slice_info = meta.getInfo().split(",");
                if (slice_info == null || slice_info.length < 4) {
                    continue;
                }
                jsonObj.put("path", meta.getPath());
                jsonObj.put("x", slice_info[0]);
                jsonObj.put("y", slice_info[1]);
                jsonObj.put("w", slice_info[2]);
                jsonObj.put("h", slice_info[3]);
                jsonObj.put("label", meta.getLabel());
                jsonObj.put("label_type", "#" + label_type);
            } else if (meta.getLabel_type().equals("IMAGE_SEGMENTATION")) {
                JSONParser parser = new JSONParser();
                JSONArray jArray = (JSONArray) parser.parse(meta.getInfo());
                JSONObject jObj = (JSONObject) jArray.get(0);

                if ((String) jObj.get("box") == null || ((String) jObj.get("box")).length() <= 0) {
                    continue;
                }
                if (jObj.get("segmentation") == null || jObj.get("segmentation").toString().length() <= 0) {
                    continue;
                }
                String[] box_split = ((String) jObj.get("box")).split(",");
                if (box_split == null || box_split.length < 4) {
                    continue;
                }
                String segmentation = jObj.get("segmentation").toString();
                if (segmentation == null || segmentation.length() <= 0) {
                    continue;
                }

                jsonObj.put("path", meta.getPath());
                jsonObj.put("x", box_split[0]);
                jsonObj.put("y", box_split[1]);
                jsonObj.put("w", box_split[2]);
                jsonObj.put("h", box_split[3]);
                jsonObj.put("label", meta.getLabel());
                jsonObj.put("segmentation", segmentation);
                jsonObj.put("label_type", "#" + label_type);
            } else if (meta.getLabel_type().equals("VIDEO_BBOX")) {
                jsonObj.put("path", meta.getPath());
                jsonObj.put("label", meta.getLabel());
                jsonObj.put("label_type", "#" + label_type);
                jsonObj.put("meta_id", meta.getMeta_id());
                jsonObj.put("metas", meta.getInfo());
            }
            jsonArr.add(jsonObj);
        }
        if (jsonArr.isEmpty() || jsonArr.size() <= 0) {
            return Output.JsonOutput("3456", "라벨정보 생성 후 Training해주시길 바랍니다.");
        }
        annotationVO.setContents(annotationVO.getTitle() + "_QuickTraining Result");
        annotationVO.setData(jsonArr.toJSONString());
        annotationVO.setUser_id(userInfo.getUser_id());
        annotationVO.setLabel_type(label_type);
        int cnt = annotationDao.insertAnnotation(annotationVO);
        if (cnt != 1) {
            throw new Exception("4002#등록이 올바르지 않습니다.");
        }

        // taskInsert
//		taskVO.setProject_id(taskVO.getProject_id());
//		taskVO.setAlgorithm_id(taskVO.getAlgorithm_id());
//		taskVO.setConfig(taskVO.getConfig());
//		// 승계 추가
//		taskVO.setBase_task_id(taskVO.getBase_task_id());
//		taskVO.setContents(taskVO.getContents());
//		taskVO.setCheck_point_name(taskVO.getCheck_point_name());
        //
        taskVO.setAnnotation_id(annotationVO.getAnnotation_id());
        taskVO.setLabel_type(annotationVO.getLabel_type());
        JsonOutputVO insertResult = (JsonOutputVO) insertTask(taskVO);
        if (insertResult.getCode() == null || insertResult.getCode().length() <= 0 || !insertResult.getCode().equals("200")) {
            throw new Exception("4002#퀵트레이닝에 실패하였습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 문의해주시길 바랍니다.");
        }
        // 주석
        taskVO.setGpu_node_id(runGpuNode.getGpu_node_id());
        taskVO.setGpu_index(gpuIndexID[0]);
        // 주석
        Object result = runTrain(taskVO);

        return result;
    }

    public Object importSegAnnotation(AnnotationVO result) throws ParseException {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
//		AnnotationVO result = annotationDao.getAnnotationById(annotationVO);
        String data = result.getData();
        JSONParser jp = new JSONParser();
        JSONArray dataArr = null;
        try {
            dataArr = (JSONArray) jp.parse(data);
        } catch (ParseException e) {
            logger.error("ParseException Error!", e);
            return null;
        }
        CocoExportUtil cu = new CocoExportUtil();
        Object resultJson = cu.createAll(dataArr);

        return resultJson;
    }

    public boolean saveAnnotationtoJson(String json, String path) throws ParseException, IOException {
        boolean flag = false;

        FileWriter file = null;
        try {
            file = new FileWriter(path);
            file.write(json);
            flag = true;
        } catch (IOException e) {
            logger.error("IOException Error!", e);
        } finally {
            if (file != null) {
                file.flush();
                file.close();
            }
            file = null;
        }

        return flag;
    }

    public Object importVideoBoxAnnotation(AnnotationVO annotationVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        if (annotationVO.getData() == null || annotationVO.getData().length() <= 0) {
            return Output.JsonOutput("2001", "데이터가 존재하지 않는 Annotation입니다.\n다른 Annotation파일을 선택해주세요.");
        }
//		AnnotationVO result = annotationDao.getAnnotationById(annotationVO);
        JSONParser parser = new JSONParser();
        JSONArray jsonArray = null;

        try {
            jsonArray = (JSONArray) parser.parse(annotationVO.getData());
        } catch (ParseException e) {
            logger.error("ParseExcpeiont Error!", e);
        }

        JSONArray resultJsonArray = new JSONArray();
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject json = (JSONObject) jsonArray.get(i);
            if (json.get("path") == null || ((String) json.get("path")).length() <= 0) {
                continue;
            }
            if (json.get("label") == null || ((String) json.get("label")).length() <= 0) {
                continue;
            }

            JSONObject jsonElement = new JSONObject();
            JSONObject metasJson = new JSONObject();
            JSONArray metasJsonArray = new JSONArray();
            JSONObject metasJsonInputElement = new JSONObject();
            JSONArray rectData = new JSONArray();
            List<String> rectList = new ArrayList<String>();

            try {
                metasJson = (JSONObject) parser.parse(json.get("metas").toString());
                if (metasJson == null || metasJson.size() <= 0) {
                    continue;
                }
                rectData = (JSONArray) parser.parse(metasJson.get("rectData").toString());
            } catch (Exception e) {
                logger.error("ParseExcpeiont Error!", e);
            }


            for (int j = 0; j < rectData.size(); j++) {
                JSONObject rectDataElement = (JSONObject) rectData.get(j);
//				tx = Math.floor((double)Double.valueOf(  (String)((JSONObject)jArr.get(i)).get("x")  ).doubleValue());
//				if(rectDataElement.get("top") == null || ((Double)rectDataElement.get("top")) <= 0) {
//					continue;
//				}
                if (rectDataElement.get("top") == null || Double.valueOf(rectDataElement.get("top").toString()).doubleValue() < 0) {
                    continue;
                }
                if (rectDataElement.get("left") == null || Double.valueOf(rectDataElement.get("left").toString()).doubleValue() < 0) {
                    continue;
                }
                if (rectDataElement.get("width") == null || Double.valueOf(rectDataElement.get("width").toString()).doubleValue() < 0) {
                    continue;
                }
                if (rectDataElement.get("height") == null || Double.valueOf(rectDataElement.get("height").toString()).doubleValue() < 0) {
                    continue;
                }


//				double y1 = Double.parseDouble(((String)rectDataElement.get("top")));
//				double x1 = Double.parseDouble(((String)rectDataElement.get("left")));
//				double width = Double.parseDouble(((String)rectDataElement.get("width")));
//				double height = Double.parseDouble(((String)rectDataElement.get("height")));
                double y1 = Double.valueOf(rectDataElement.get("top").toString()).doubleValue();
                double x1 = Double.valueOf(rectDataElement.get("left").toString()).doubleValue();
                double width = Double.valueOf(rectDataElement.get("width").toString()).doubleValue();
                double height = Double.valueOf(rectDataElement.get("height").toString()).doubleValue();
                double x2 = x1 + width;
                double y2 = y1 + height;
                StringBuffer sb = new StringBuffer();
                sb.append("[" + x1 + "," + y1 + "," + x2 + "," + y2 + "]");

                rectList.add(sb.toString());

            }

            metasJsonInputElement.put("start_frame", (Long) metasJson.get("startFrame"));
            metasJsonInputElement.put("end_frame", (Long) metasJson.get("endFrame"));
            metasJsonInputElement.put("label", (String) json.get("label"));
            metasJsonInputElement.put("bbox_list", rectList);

            metasJsonArray.add(metasJsonInputElement);
            jsonElement.put("video_path", NFS_MOUNT_ROOT_PATH + "/" + (String) json.get("path"));
            jsonElement.put("metas", metasJsonArray);
            resultJsonArray.add(jsonElement);
        }
        return resultJsonArray;
    }

    public Object quickInference(TaskVO taskVO) throws Exception {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }

        if (taskVO.getConfig() == null || taskVO.getConfig().length() <= 0) {
            return Output.JsonOutput("4611", "알고리즘의 파라미터 값을 입력해주세요.");
        }
//		if(quickTrainerVO.getTask_id() == null || quickTrainerVO.getTask_id().length() <= 0) {
//			logger.error("quickTrainerVO.getTask_id is null");
//			return Output.JsonOutput("4611", "Task를 선택해주세요.");
//		}
        if (taskVO.getDataset_id() == null || taskVO.getDataset_id().length() <= 0) {
            logger.error("quickTrainerVO.getDataset_id is null");
            return Output.JsonOutput("4611", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if (taskVO.getCsv_title() == null || taskVO.getCsv_title().length() <= 0) {
            return Output.JsonOutput("4611", "저장될 csv파일명을 입력해주세요.");
        }
        if (taskVO.getCheck_point_name() == null || taskVO.getCheck_point_name().length() <= 0) {
            return Output.JsonOutput("4611", "Inference할 모델을 선택해주세요.");
        }

        taskVO.setTask_id(taskVO.getTask_id());
        taskVO.setCsv_save_name(taskVO.getCsv_title());

//		TaskVO taskVO = new TaskVO();
//		taskVO.setId(quickTrainerVO.getTask_id());
//		taskVO.setCsv_save_name(quickTrainerVO.getCsv_title());
        TaskVO findTaskVO = taskDao.getTaskById(taskVO);
        if (findTaskVO == null || findTaskVO.getAlgorithm_id() == null || findTaskVO.getAlgorithm_id().length() <= 0) {
            return Output.JsonOutput("4611", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        taskVO.setAlgorithm_id(findTaskVO.getAlgorithm_id());

        JsonOutputVO getResultList = (JsonOutputVO) getResultList(taskVO);
        if (getResultList == null) {
            return Output.JsonOutput("4611", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if (getResultList.getCode() != null && getResultList.getCode().length() > 0 && !getResultList.getCode().equals("200")) {
            return getResultList;
        }

        //주석
        //사용 가능한 GPU Index 있는지 검사
        JsonOutputVO getGpuNodeVO = (JsonOutputVO) getSelectableGpuNode(taskVO);
        if (getGpuNodeVO.getCode() == null || getGpuNodeVO.getCode().length() <= 0 || !getGpuNodeVO.getCode().equals("200")) {
            return getGpuNodeVO;
        }
        List<GpuNodeStatusVO> gpuNodeList = (ArrayList<GpuNodeStatusVO>) getGpuNodeVO.getData();
        if (gpuNodeList == null || gpuNodeList.isEmpty() || gpuNodeList.size() <= 0) {
            return Output.JsonOutput("3453", "현재 사용가능한 GPU가 없습니다.\n잠시후에 시도해주세요.");
        }

        GpuNodeStatusVO runGpuNode = null;
        // 사용가능한 gpu index가 있으면 반복문 중단
        for (GpuNodeStatusVO gpuNode : gpuNodeList) {
            if (gpuNode.getAvailable_gpu_index() != null && gpuNode.getAvailable_gpu_index().length() > 0) {
                runGpuNode = gpuNode;
                break;
            }
        }

        if (runGpuNode == null || runGpuNode.getAvailable_gpu_index() == null || runGpuNode.getAvailable_gpu_index().length() <= 0) {
            return Output.JsonOutput("3455", "현재 사용가능한 GPU가 없습니다.\n잠시후에 시도해주세요.");
        }

        String[] gpuIndexID = runGpuNode.getAvailable_gpu_index().split(",");

        //주석
        if (taskVO.getCheck_point_name() == null || taskVO.getCheck_point_name().length() <= 0) {
            JsonOutputVO checkPoint = (JsonOutputVO) getCheckPointList(findTaskVO);
            if (checkPoint == null || checkPoint.getCode() == null || checkPoint.getCode().length() <= 0 || !checkPoint.getCode().equals("200")) {
                return checkPoint;
            }
            if (checkPoint.getData() == null || !(checkPoint.getData() instanceof String[])) {
                return checkPoint;
            }
            String[] checkPointList = (String[]) checkPoint.getData();

            // 파일 수정날짜가 오래된 순으로 파일이름 출력
            if (checkPointList == null || checkPointList.length <= 0) {
                return Output.JsonOutput("3456", "학습된 모형이 없습니다.\nTraining 후 Inference해주시길 바랍니다.");
            }

            //
            String checkPointName = checkPointList[checkPointList.length - 1];

            taskVO.setCheck_point_name(checkPointName);
        }
        // 주석

        // csv에 저장할 image path 저장
        StringBuffer imagePath = new StringBuffer();
        DataVO dataVO = new DataVO();
        dataVO.setDataset_id(taskVO.getDataset_id());
        dataVO.setPage_num("0");
        dataVO.setPage_size("99999");
        dataVO.setStatus("1");
        List<DataVO> dataList = dataDao.getDataList(dataVO);
        if (dataList == null || dataList.size() <= 0) {
            return Output.JsonOutput("3457", "데이터셋에 데이터가 존재하지 않습니다.\n데이터셋에 데이터를 추가 후 다시 시도해주시고, 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        for (int i = 0; i < dataList.size(); i++) {
            if (i == 0) {
                imagePath.append("/xlabeller/" + dataList.get(i).getPath());
            } else {
                imagePath.append(",/xlabeller/" + dataList.get(i).getPath());
            }
        }

        DatasetVO datasetVO = new DatasetVO();
        datasetVO.setDataset_id(taskVO.getDataset_id());
        DatasetVO findDatasetVO = dataDao.getDatasetById(datasetVO);
        if (findDatasetVO == null || findDatasetVO.getLabel_type() == null || findDatasetVO.getLabel_type().length() <= 0) {
            return Output.JsonOutput("3358", "Dataset이 손상되었습니다.\n다시 시도해주세요.");
        }

        String csvFullName = "";
        String csvName = "";
        if (findDatasetVO.getLabel_type().equals("IMAGE_BBOX") || findDatasetVO.getLabel_type().equals("IMAGE_SEGMENTATION")) {
            // 주석
            csvName = taskVO.getCsv_title() + "#" + taskVO.getDataset_id();
            csvFullName = taskVO.getCsv_title() + "#" + taskVO.getDataset_id() + ".csv";
//			csvName =  "train#88";
//			csvFullName = "train#88.csv";
            // 주석
        } else if (findDatasetVO.getLabel_type().equals("VIDEO_BBOX")) {
            // 주석
            csvName = taskVO.getCsv_title() + "#" + taskVO.getDataset_id();
            csvFullName = taskVO.getCsv_title() + "#" + taskVO.getDataset_id() + ".json";
//			csvName =  "videoBox#91";
//			csvFullName = "videoBox#91.json";
            // 주석
        } else {
            return Output.JsonOutput("3358", "Dataset이 손상되었습니다.\n다시 시도해주세요.");
        }


        // 주석
        InferenceVO inferenceVO = new InferenceVO();
        inferenceVO.setConfig(taskVO.getConfig());
        inferenceVO.setCsv_save_name(csvName);
        inferenceVO.setGpu_index(gpuIndexID[0]);
        inferenceVO.setGpu_node_id(runGpuNode.getGpu_node_id());
        //inferenceVO.setId(taskVO.getTask_id());
        inferenceVO.setTask_id(taskVO.getTask_id());
        inferenceVO.setImg_path(imagePath.toString());
        inferenceVO.setModel_name(taskVO.getCheck_point_name());
        inferenceVO.setQuick("true");

        Object runInferenceResult = runInference(inferenceVO); // code : 200, data : ~
        // VO클래스
        // JsonOutputVO로 반환되면 오류가 발생한 것으로 리턴, 정상동작할 때는 JSONObject 반환
        if (runInferenceResult == null) {
            return Output.JsonOutput("3408", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고, 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
        if (runInferenceResult instanceof JsonOutputVO) {
            return runInferenceResult;
        }
        JSONObject resultJson = (JSONObject) runInferenceResult;
        if (resultJson == null || resultJson.get("code") == null || !resultJson.get("code").equals("200")) {
            return resultJson;
        }
        GpuNodeVO inGpuNodeVO = new GpuNodeVO();
        inGpuNodeVO.setType("worker");
        List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);

        // worker List를 넘겨 세션이 연결된 gpuList를 반환받음.
        // JsonOutputVO로 반환할 경우 에러가 발생한 것
        Object sessionObj = getSSHSessionList(gpuList);
        if (sessionObj instanceof JsonOutputVO) {
            return sessionObj;
        }

        // sessionObj 메소드에서 list 크기가 0일 경우 JsonOutputVO로 반환하기 때문에 사이즈 체크 필요 X
        List<Session> sessionList = (List<Session>) sessionObj;
//		List<SSHCmdExecute> sshList = new ArrayList<SSHCmdExecute>();
//		for(int i = 0; i < gpuList.size(); i++) {
//			String account = gpuList.get(i).getAccount();
//			String address = gpuList.get(i).getAddress();
//			String password = gpuList.get(i).getPassword();
//			int port = 0;
//            try {
//            	port = Integer.valueOf(gpuList.get(i).getPort());
//			} catch (NumberFormatException e) {
//				logger.error("GPU Node의 포트번호가 잘못된 형태입니다.\nDB에서 수정해주세요.");
//				logger.error("NumberFormatException Error!", e);
//				continue;
//			}
//
//			SSHCmdExecute sshCmdExcute = new SSHCmdExecute(account, port, address, password);
//			sshList.add(sshCmdExcute);
//		}

        boolean isUpInference = false;
//		TaskVO task = new TaskVO();
//		task.setId(quickTrainerVO.getTask_id());
        TaskVO findTask = taskDao.getTaskById(taskVO);
        if (findTask == null || findTask.getProject_id() == null || findTask.getProject_id().length() <= 0) {
            return Output.JsonOutput("3408", "유효하지 않은 접근입니다.\n새로 고침 후 다시 시도해주시고, 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

//		int sessionIndex = -1;
//		for(int i = 0; i < sessionList.size(); i++) {
//			isUpInference = sessionList.get(i).isUpInference(findTask.getProject_id(), findTask.getId());
//			if(isUpInference) {
//				sessionIndex = i;
//				break;
//			}
//		}
//
//		if(sessionIndex == -1) {
//			return Output.JsonOutput("3408", "Inference과정 중에 오류가 발생했습니다.\\n새로 고침 후 다시 시도해주시고, 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
//		}

        Collection isUpInferenceCmd = new ArrayList();
        List<Future<Boolean>> isUpInferenceResult = null;
        ExecutorService executorService = Executors.newFixedThreadPool(10);

        for (int i = 0; i < sessionList.size(); i++) {
            //sshList.get(i).cmdExcute(command)
            //SSHCmdExecute sshSession = sessionList.get(i);
            SSHSessionVO sshSessionVO = new SSHSessionVO();
            sshSessionVO.setCommnad("isUpInference");
            sshSessionVO.setProjectId(findTask.getProject_id());
            sshSessionVO.setTaskId(findTask.getTask_id());
            isUpInferenceCmd.add(new SessionCmdExecute(sessionList.get(i), sshSessionVO));
//            is = sshSession.isUpTrainning(result.getProject_id(), result.getId());
//            if (is) {
//                break;
//            }
        }

//		while (true) {
//			isUpInference = sshList.get(sessionIndex).isUpInference(findTask.getProject_id(), findTask.getId());
//			if(isUpInference == false) {
//				break;
//			}
//			Thread.sleep(3000);
//		}
        int sessionIndex = -1;
        try {
            isUpInferenceResult = executorService.invokeAll(isUpInferenceCmd);
        } catch (Exception e) {
//			InterruptedException - if interrupted while waiting, in which case unfinished tasks are cancelled
//			NullPointerException - if tasks or any of its elements are null
//			RejectedExecutionException - if any task cannot be scheduled for execution
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

        if (isUpInferenceResult == null || isUpInferenceResult.size() <= 0 || isUpInferenceResult.isEmpty()) {
            logger.error("Inference Error!");
            return Output.JsonOutput("3408", "Inference과정 중에 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고, 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        for (int i = 0; i < isUpInferenceResult.size(); i++) {
            try {
                boolean isUpInfernece = isUpInferenceResult.get(i).get();
                if (isUpInfernece == true) {
                    sessionIndex = i;
                    break;
                }
            } catch (Exception e) {
                if (e instanceof InterruptedException) {
                    logger.error("InterruptedException Error!", e);
                } else if (e instanceof ExecutionException) {
                    logger.error("ExecutionException Error!", e);
                } else {
                    logger.error("Exception Error!", e);
                }

                continue;
            }

        }

        if (sessionIndex == -1) {
            return Output.JsonOutput("3408", "Inference과정 중에 오류가 발생했습니다.\n새로 고침 후 다시 시도해주시고, 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }

        while (true) {
            //boolean isUpInferenceWhile = isUpInferenceResult.get(sessionIndex).get();
            SessionCmdExecute session = new SessionCmdExecute(sessionList.get(sessionIndex));
            boolean isUpInferenceWhile = session.isUpInference(findTask.getProject_id(), findTask.getTask_id());
            if (!isUpInferenceWhile) {
                break;
            }
            Thread.sleep(3000);
        }


//		// 주석

        StringBuffer sb = new StringBuffer();
        if (findDatasetVO.getLabel_type().equals("IMAGE_BBOX") || findDatasetVO.getLabel_type().equals("IMAGE_SEGMENTATION")) {
            InferenceResultVO inferenceResultVO = new InferenceResultVO();
            inferenceResultVO.setId(findTaskVO.getTask_id());
            inferenceResultVO.setTask_id(findTaskVO.getTask_id());
            // 주석
            inferenceResultVO.setFilename(csvFullName);
            // 주석

            JsonOutputVO inferenceResult = null;
            if (getInferenceResult(inferenceResultVO) instanceof JsonOutputVO) {
                inferenceResult = (JsonOutputVO) getInferenceResult(inferenceResultVO);
            }
            if (inferenceResult == null) {
                return Output.JsonOutput("3355", "Inference 결과가 없습니다.");
            }
            if (inferenceResult.getData() instanceof String) {
                return inferenceResult;
            }
            // 결과를 읽어옴
//		JsonOutputVO inferenceResult = (JsonOutputVO)getInferenceResult(inferenceResultVO);
            List<InferenceResultVO> inferenceList = (List<InferenceResultVO>) inferenceResult.getData();

            String path = WORKSPACE_PATH + findTaskVO.getProject_id() + "/" + findTaskVO.getTask_id() + "/";

            if (inferenceList == null) {
                String delPath = path + "result/" + csvFullName;
                FileUtils.delete(delPath);
                return Output.JsonOutput("3357", "CSV파일이 손상되었습니다.");
            }
            if (inferenceList.size() <= 0) {
                return Output.JsonOutput("3355", "Inference 결과가 없습니다.");
            }

            // class파일 읽어서 라벨 class명이랑 일치하는지 확인
            String classPath = path + "class/classes";
//		List<String> classList = new ArrayList<String>();
            Map<String, Integer> classesFileMap = new LinkedHashMap<String, Integer>();
            Map<Integer, String> inferenceListMap = new LinkedHashMap<Integer, String>();
            FileReader fileReader = null;
            BufferedReader reader = null;
            boolean check = false;

            // classes파일 라벨이름 목록
            String line = null;
            try {
                fileReader = new FileReader(classPath);
                reader = new BufferedReader(fileReader);
                while ((line = reader.readLine()) != null) {
                    String[] temp = line.split(",");
//				classList.add(temp[0]);
                    classesFileMap.put(temp[0], 0);
                }
            } catch (IOException e) {
                logger.error("Class file read IOException Error!", e);
                return Output.JsonOutput("3355", "Class파일이 손상되었습니다.\n해당 데이터셋을 학습 후 재시도해주시길 바랍니다.");
            }

            for (int i = 0; i < inferenceList.size(); i++) {
                if (inferenceList.get(i).getLabel() == null || inferenceList.get(i).getLabel().length() <= 0) {
                    inferenceListMap.clear();
                    break;
                }
                inferenceListMap.put(i, inferenceList.get(i).getLabel());
            }

            if (inferenceListMap == null || inferenceListMap.isEmpty() || inferenceListMap.size() <= 0) {
                logger.error("인퍼런스 결과의 라벨명과 Dataset classes파일의 라벨명이 일치하지 않아 오류가 발생하였습니다.");
                return Output.JsonOutput("3355", "Class파일이 손상되었습니다.\n해당 데이터셋을 학습 후 재시도해주시길 바랍니다.");
            }
            for (int i = 0; i < inferenceList.size(); i++) {
                if (classesFileMap.containsKey(inferenceListMap.get(i))) {
                    check = true;
                } else {
                    logger.error("inferenceListMap.get(i) ::" + inferenceListMap.get(i));
                    check = false;
                    break;
                }
            }

            if (check == false) {
                logger.error("인퍼런스 결과의 라벨명과 Dataset classes파일의 라벨명이 일치하지 않아 오류가 발생하였습니다.");
                String delPath = path + "result/" + csvFullName;
                FileUtils.delete(delPath);
                return Output.JsonOutput("3357", "CSV파일이 손상되었습니다.\n다시 시도해주세요.");
            }

            sb.append("[");
            if (findDatasetVO.getLabel_type().equals("IMAGE_BBOX") || findDatasetVO.getLabel_type().equals("VIDEO_BBOX")) {
                for (int i = 0; i < inferenceList.size(); i++) {
                    if (i == 0) {
                        sb.append("\"");
                        sb.append(inferenceList.get(i).getImg_path());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getX());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getY());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getW());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getH());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getLabel());
                        sb.append("\"");
                    } else {
                        sb.append(",\"");
                        sb.append(inferenceList.get(i).getImg_path());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getX());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getY());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getW());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getH());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getLabel());
                        sb.append("\"");
                    }
                }
            } else if (findDatasetVO.getLabel_type().equals("IMAGE_SEGMENTATION")) {
                for (int i = 0; i < inferenceList.size(); i++) {
                    String segmentation = inferenceList.get(i).getSegmentation();
                    segmentation = segmentation.replace("x", "\\\"" + "x" + "\\\"");
                    segmentation = segmentation.replace("y", "\\\"" + "y" + "\\\"");

                    if (i == 0) {
                        sb.append("\"");
                        sb.append(inferenceList.get(i).getImg_path());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getX());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getY());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getW());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getH());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getLabel());
                        sb.append(",");
                        sb.append(segmentation);
                        sb.append("\"");
                    } else {
                        sb.append(",\"");
                        sb.append(inferenceList.get(i).getImg_path());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getX());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getY());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getW());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getH());
                        sb.append(",");
                        sb.append(inferenceList.get(i).getLabel());
                        sb.append(",");
                        sb.append(segmentation);
                        sb.append("\"");
                    }
                }
            }

            sb.append("]");

            if (sb == null || sb.length() <= 0) {
                return Output.JsonOutput("3355", "Inference 결과가 없습니다.");
            }

            MetaVO metaVO = new MetaVO();
            metaVO.setInfo(sb.toString());
            metaVO.setDataset_id(taskVO.getDataset_id());
            metaVO.setTask_id(findTaskVO.getTask_id());
            metaVO.setPath(csvFullName);
            JsonOutputVO outputVO = (JsonOutputVO) dataService.insertMetaByInference(metaVO);
            if (outputVO.getCode() == null || outputVO.getCode().length() <= 0 || !outputVO.getCode().equals("200")) {
                return outputVO;
            }
        } else if (findDatasetVO.getLabel_type().equals("VIDEO_BBOX")) {
            JSONReader jReader = new JSONReader(WORKSPACE_PATH + findTaskVO.getProject_id() + "/" + findTaskVO.getTask_id() + "/result/" + csvFullName);
            Map<String, String> inferenceResultMap = null;
            // info
            inferenceResultMap = jReader.videoBoxInferenceRead();

            if (inferenceResultMap == null || inferenceResultMap.size() <= 0) {
                return Output.JsonOutput("3355", "Inference 결과가 없습니다.");
            }


            String path = WORKSPACE_PATH + findTaskVO.getProject_id() + "/" + findTaskVO.getTask_id() + "/";
            String classPath = path + "class/classes";
//			List<String> classList = new ArrayList<String>();
            Map<String, Integer> classesFileMap = new LinkedHashMap<String, Integer>();
            Map<Integer, String> inferenceListMap = new LinkedHashMap<Integer, String>();
            FileReader fileReader = null;
            BufferedReader reader = null;
            boolean check = false;
            // classes파일 라벨이름 목록
            String line = null;
            try {
                fileReader = new FileReader(classPath);
                reader = new BufferedReader(fileReader);
                while ((line = reader.readLine()) != null) {
                    String[] temp = line.split(",");
//					classList.add(temp[0]);
                    classesFileMap.put(temp[0], 0);
                }
            } catch (IOException e) {
                logger.error("Class file read IOException Error!", e);
                return Output.JsonOutput("3355", "classes파일이 손상되었습니다.\n해당 데이터셋을 학습 후 재시도해주시길 바랍니다.");
            }

            // 라벨명 가져옴
            JSONReader jsonReader = new JSONReader(WORKSPACE_PATH + findTaskVO.getProject_id() + "/" + findTaskVO.getTask_id() + "/result/" + csvFullName);
            List<String> videoBoxList = jsonReader.videoBoxread();

            if (videoBoxList == null || videoBoxList.isEmpty() || videoBoxList.size() <= 0) {
                return Output.JsonOutput("3357", "JSON파일이 손상되었습니다.");
            }
            for (int i = 0; i < videoBoxList.size(); i++) {
                String videoBoxStr = videoBoxList.get(i);
                String[] splitStr = videoBoxStr.split(",");
                if (splitStr == null || splitStr.length <= 0 || splitStr.length < 6) {
                    continue;
                }

                inferenceListMap.put(i, splitStr[5]);
            }

            if (inferenceListMap == null || inferenceListMap.isEmpty() || inferenceListMap.size() <= 0) {
                logger.error("인퍼런스 결과의 라벨명과 Dataset classes파일의 라벨명이 일치하지 않아 오류가 발생하였습니다.");
                return Output.JsonOutput("3355", "Class파일이 손상되었습니다.\n해당 데이터셋을 학습 후 재시도해주시길 바랍니다.");
            }

            for (int i = 0; i < videoBoxList.size(); i++) {
                if (classesFileMap.containsKey(inferenceListMap.get(i))) {
                    check = true;
                } else {
                    check = false;
                    break;
                }
            }

            if (check == false) {
                logger.error("인퍼런스 결과의 라벨명과 Dataset classes파일의 라벨명이 일치하지 않아 오류가 발생하였습니다.");
                String delPath = path + "result/" + csvFullName;
                FileUtils.delete(delPath);
                return Output.JsonOutput("3357", "CSV파일이 손상되었습니다.\n다시 시도해주세요.");
            }


            HashMap<String, String> pathMap = new HashMap<String, String>();
            List<MetaVO> metaList = new ArrayList<MetaVO>();

            int j = 0;
            for (String key : inferenceResultMap.keySet()) {
                String videoBoxStr = videoBoxList.get(j++);
                String[] splitStr = videoBoxStr.split(",");
                if (splitStr == null || splitStr.length <= 0 || splitStr.length < 6) {
                    continue;
                }
                // System.out.println("방법1) key : " + key +" / value : " + map.get(key));
                String imgPath = inferenceResultMap.get(key);


                pathMap.put(imgPath, "1");

                MetaVO metaTempVO = new MetaVO();
                metaTempVO.setData_id(imgPath);
                metaTempVO.setLabel(splitStr[5]);
                metaTempVO.setInfo(key);
                metaTempVO.setUser_id(userInfo.getUser_id());
                metaTempVO.setLabel_type(findDatasetVO.getLabel_type());
//				metaTempVO.setCrop_img(b64);
//				metaTempVO.setSegmentation(segmentation);
                metaList.add(metaTempVO);
            }

            if (metaList == null || metaList.isEmpty() || metaList.size() <= 0) {
                throw new Exception("3355#Inference 결과가 없습니다.");
            }

            List<String> pathList = new ArrayList<String>(pathMap.keySet());
            if (pathList == null || pathList.size() <= 0 || pathList.isEmpty()) {
                throw new Exception("3355#Inference 결과가 없습니다.");
            }
            StringBuffer sb2 = new StringBuffer();
            for (int i = 0; i < pathList.size(); i++) {
                if (i == 0) {
                    sb2.append("'");
                    sb2.append(pathList.get(i));
                    sb2.append("'");
                } else {
                    sb2.append(",'");
                    sb2.append(pathList.get(i));
                    sb2.append("'");
                }

            }
            DataVO inputDataVO = new DataVO();
            inputDataVO.setPath(sb2.toString());
            inputDataVO.setDataset_id(taskVO.getDataset_id());
            List<DataVO> dataList2 = dataDao.getDataListInPath(inputDataVO);
            if (dataList2 == null || dataList2.isEmpty() || dataList2.size() <= 0) {
                throw new Exception("3355#Inference 결과가 없습니다.");
            }

            DataVO tempDataVO = null;
            for (int i = 0; i < dataList2.size(); i++) {
                tempDataVO = dataList2.get(i);
                pathMap.put(tempDataVO.getPath(), tempDataVO.getData_id());
            }
            ///////

            /////// 패스아이디 대신 데이터 아이디로 변환
            MetaVO tempMetaVO = null;
            for (int i = 0; i < metaList.size(); i++) {
                tempMetaVO = metaList.get(i);
                tempMetaVO.setData_id(pathMap.get(tempMetaVO.getData_id()));
            }

            HashMap<String, Object> hm = new HashMap<String, Object>();
            hm.put("metaList", metaList);
            if (metaList.isEmpty() || metaList.size() <= 0) {
                throw new Exception("4003#등록이 올바르지 않습니다.");
            }

            int cnt = dataDao.insertMeta(hm);
            if (cnt != metaList.size()) {
                throw new Exception("4003#등록이 올바르지 않습니다.");
            }

        }

        return Output.JsonOutput("200", "Quick Inference가 완료되었습니다.");
    }

    public Object setAnnoTaskName(QuickTrainerVO quickTrainerVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        DatasetVO datasetVO = new DatasetVO();
        if (quickTrainerVO.getDataset_id() == null || quickTrainerVO.getDataset_id().length() <= 0) {
            logger.error("Dataset_id Error!");
        }
        datasetVO.setDataset_id(quickTrainerVO.getDataset_id());
        DatasetVO dataset = dataDao.getDatasetById(datasetVO);

        // 이름설정
        String taskName = "Quick_" + dataset.getTitle() + "_Task";
        String annoName = "Quick_" + dataset.getTitle() + "_Annotation";
        String inferenceName = "Quick_" + dataset.getTitle() + "_Inference";

        TaskVO taskVO = new TaskVO();
        taskVO.setTitle(taskName);
        taskVO.setPage_num("0");
        taskVO.setPage_size("9999");
        List<TaskVO> taskList = taskDao.getTaskList(taskVO);
        taskName += taskList.size() + 1;

        AnnotationVO annotationVO = new AnnotationVO();
        annotationVO.setTitle(annoName);
        annotationVO.setPage_num("0");
        annotationVO.setPage_size("9999");
        List<AnnotationVO> annotationList = annotationDao.getAnnotationList(annotationVO);
        annoName += annotationList.size() + 1;

        JSONArray jArr = new JSONArray();
        jArr.add(taskName);
        jArr.add(annoName);
        jArr.add(inferenceName);

        return jArr;
    }

    public Object createMap(TaskVO taskVO) throws Exception {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }

        if (taskVO.getTask_id() == null || taskVO.getTask_id().length() <= 0) {
            return Output.JsonOutput("3302", "선택된 Task가 없습니다.\nTask를 선택해주세요.");
        }

        if (taskVO.getAnnotation_id() == null || taskVO.getAnnotation_id().length() <= 0) {
            return Output.JsonOutput("3303", "선택된 Annotation이 없습니다.\nAnnotation을 선택해주세요.");
        }

        JsonOutputVO taskServiceCheck = (JsonOutputVO) gpuNodeService.getServiceList();
        List<DockerServiceVO> serviceList = (List<DockerServiceVO>) taskServiceCheck.getData();
        for (int i = 0; i < serviceList.size(); i++) {
            DockerServiceVO service = serviceList.get(i);
            if (service.getId() == null || service.getId().length() <= 0) {
                return Output.JsonOutput("4505", "현재 동작하고 있는 Task입니다.");
            }
            if (taskVO.getTask_id() != null && taskVO.getTask_id().equals(service.getId())) {
                return Output.JsonOutput("4505", "현재 동작하고 있는 Task입니다.");
            }
        }

        //타이머 체크
        int remainTime = CheckTimer.getRunnableTime();
        if (remainTime != -1) {

            return Output.JsonOutput("803", "추론 요청 가능 시간까지 " + String.valueOf(remainTime) + "초 남았습니다. 다시 시도 하시기 바랍니다.");
        }

        TaskVO findTaskVO = taskDao.getTaskById(taskVO);
        ProjectVO projectVO = new ProjectVO();
        projectVO.setProject_id(findTaskVO.getProject_id());
        ProjectVO findProjectVO = projectDao.getProjectById(projectVO);

        AnnotationVO annotationVO = new AnnotationVO();
        annotationVO.setAnnotation_id(taskVO.getAnnotation_id());
        AnnotationVO findAnnotationVO = annotationDao.getAnnotationById(annotationVO);


        File file = null;
        try {
            file = new File(MAP_PATH + findAnnotationVO.getTitle());
            if (!file.isDirectory()) {
                boolean flag = file.mkdir();
                if (flag == false) {
                    return Output.JsonOutput("3401", "mAP파일을 생성하는데 실패했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
                }
            }
        } catch (Exception e) {
            logger.error("Exception Error!", e);
            return Output.JsonOutput("3401", "mAP파일을 생성하는데 실패했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        } finally {
            file = null;
        }

        GpuNodeVO inputGpuNodeVO = new GpuNodeVO();
        inputGpuNodeVO.setGpu_node_id(taskVO.getGpu_node_id());
        GpuNodeVO outputGpuNodeVO = gpuNodeDao.getGpuNodeById(inputGpuNodeVO);
        if (outputGpuNodeVO == null) {
            return Output.JsonOutput("801", "실행중에 예기치 않은 문제가 발생했습니다. 문의 부탁드립니다");
        }
        if (outputGpuNodeVO.getAddress() == null || outputGpuNodeVO.getAddress().length() <= 0) {
            return Output.JsonOutput("801", "해당 GPU Node의 Address가 없습니다.\nSetup을 확인해주세요.");
        }
        if (outputGpuNodeVO.getPassword() == null || outputGpuNodeVO.getPassword().length() <= 0) {
            return Output.JsonOutput("801", "해당 GPU Node의 Password가 없습니다.\nSetup을 확인해주세요.");
        }

        JSONObject gpuObj = new JSONObject();
        gpuObj.put(outputGpuNodeVO.getAddress(), outputGpuNodeVO.getPassword());

        String gpuIndex = taskVO.getGpu_index();

        String path = WORKSPACE_PATH + findTaskVO.getProject_id() + "/" + findTaskVO.getTask_id() + "/imagepath/map_train.csv";
        boolean is = importAnnotation(path, findAnnotationVO.getData());
        if (!is) {
            return Output.JsonOutput("3401", "mAP파일을 생성하는데 실패했습니다.\n새로 고침 후 다시 시도해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
        }
//		CsvReader cr = new CsvReader(path + "annotation/map_train.csv");
//		List<String> imagePath = cr.readToArray();
        try {
            GrpcUtils gu = new GrpcUtils();
            String fileName = findProjectVO.getTitle() + "_" + findTaskVO.getTitle() + ".csv";
            String imagePath = "map_train.csv";
//			String imageName = "ca_1:latest";
            String imageName = "ca_" + findTaskVO.getAlgorithm_id() + ":latest";


            String config = taskVO.getConfig();
            String projectId = findTaskVO.getProject_id() + "_m";
            String taskId = findTaskVO.getTask_id();
            String modelName = taskVO.getModel_name();
            String csvSavePath = NFS_MOUNT_ROOT_PATH + "/mAP/" + findAnnotationVO.getTitle() + "/" + fileName;

            Object result = gu.callCustomInference(GRPC_ADDRESS, GRPC_PORT, gpuObj, gpuIndex, imageName, config, projectId, taskId, modelName, csvSavePath, imagePath);
            return result;
        } catch (Exception e) {
            logger.error("Exception Error!", e);
            return Output.JsonOutput("801", "실행중에 예기치 않은 문제가 발생했습니다. 문의 부탁드립니다");
        }
    }

    public Object getAnnotationMapList(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        Object result = null;
        String path = null;
        if (taskVO.getPath() == null || taskVO.getPath().length() <= 0) {
            path = MAP_PATH;
            result = getFileList(path);
            return result;
        } else {
            path = MAP_PATH + taskVO.getPath();
            result = getFileList(path);
            return result;
        }
    }

    public Object getScoreMapCSV(TaskVO taskVO) {
        UserVO userInfo = SessionUtil.getUserInfo();
        if (userInfo == null || userInfo.getUser_id() == null || userInfo.getUser_id().length() <= 0) {
            return Output.JsonOutput("2001", "로그인 세션이 만료 되었습니다");
        }
        if (taskVO.getMapPath() == null || taskVO.getMapPath().isEmpty() || taskVO.getMapPath().size() < 2) {
            return Output.JsonOutput("3302", "비교할 Task를 최소 2개 이상 선택해주세요.");
        }

        List<String> mapPath = taskVO.getMapPath();
        CsvReader[] mapCr = null;
//		if(taskVO.getMapPath1() == null || taskVO.getMapPath1().length() <= 0) {
//			return Output.JsonOutput("3302","비교할 Task를 선택해주세요.");
//		}
//		if(taskVO.getMapPath2() == null || taskVO.getMapPath2().length() <= 0) {
//			return Output.JsonOutput("3302","비교할 Task를 선택해주세요.");
//		}
////		JSONObject mapTask1 = new JSONObject();
////		JSONObject mapTask2 = new JSONObject();
//
//		JSONArray jArray = new JSONArray();
//
//
//		JSONObject jsonTask1 = new JSONObject();
//		JSONObject jsonTask2 = new JSONObject();
//
//		HashMap<String, String> mapTask1 = new LinkedHashMap<String, String>();
//		HashMap<String, String> mapTask2 = new LinkedHashMap<String, String>();
//
//		CsvReader mapCr1 = new CsvReader(MAP_PATH + taskVO.getMapPath1());
//		CsvReader mapCr2 = new CsvReader(MAP_PATH + taskVO.getMapPath2());
//
//		List<String> taskMapResult1 = mapCr1.readToArray();
//		if(taskMapResult1 == null || taskMapResult1.size() <= 0 || taskMapResult1.isEmpty()) {
//			return Output.JsonOutput("3305","CSV파일이 손상되었습니다.\nmAP파일을 재생성해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
//		}
//		List<String> taskMapResult2 = mapCr2.readToArray();
//		if(taskMapResult2 == null || taskMapResult2.size() <= 0 || taskMapResult2.isEmpty()) {
//			return Output.JsonOutput("3306","CSV파일이 손상되었습니다.\nmAP파일을 재생성해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
//		}
//		if(taskMapResult1.size() != taskMapResult2.size()) {
//			return Output.JsonOutput("3307","다른 Annotation으로 생성된 mAP파일은 비교할 수 없습니다.");
//		}
//		for(int i = 0; i < taskMapResult1.size(); i++) {
//			String[] split_map1 = taskMapResult1.get(i).split(",");
//			if(split_map1 == null || split_map1.length <= 0 || split_map1.length != 2) {
//				return Output.JsonOutput("3308","CSV파일이 손상되었습니다.\nmAP파일을 재생성해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
//			}
//			String[] split_map2 = taskMapResult2.get(i).split(",");
//			if(split_map2 == null || split_map2.length <= 0 || split_map2.length != 2) {
//				return Output.JsonOutput("3309","CSV파일이 손상되었습니다.\nmAP파일을 재생성해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
//			}
//			mapTask1.put(split_map1[0], split_map1[1]);
//			mapTask2.put(split_map2[0], split_map2[1]);
//
//		}
//
//		  Set mapTask2Key = mapTask2.keySet();
//
//		  for (Iterator iterator = mapTask2Key.iterator(); iterator.hasNext();) {
//			  String keyName = (String) iterator.next();
//		      if(!mapTask1.containsKey(keyName)) {
//		    	  return Output.JsonOutput("3307","일치하지 않는 Label을 가진 mAP파일끼리는 비교할 수 없습니다.");
//		      }
//		  }
//
//
//
//		jsonTask1.put(taskVO.getMapPath1(), mapTask1);
//		jsonTask2.put(taskVO.getMapPath2(), mapTask2);
////		jsonTask2.put("", "");
//		jArray.add(jsonTask1);
//		jArray.add(jsonTask2);
//
//		return Output.JsonOutput("200", jArray);

        JSONArray jArray = new JSONArray();
        List<JSONObject> jsonTask = new ArrayList<JSONObject>();
        List<LinkedHashMap<String, String>> mapTaskArray = new ArrayList<LinkedHashMap<String, String>>();

        // 비교할 파일 수만큼 반복문 수행
        for (int i = 0; i < mapPath.size(); i++) {
            // csv파일을 읽어옴
            CsvReader csvReader = new CsvReader(MAP_PATH + mapPath.get(i));
            List<String> csvString = csvReader.readToArray();
            if (csvString == null || csvString.size() <= 0 || csvString.isEmpty()) {
                return Output.JsonOutput("3305", mapPath.get(i) + " csv파일이 손상되었습니다.\nmAP파일을 재생성해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
            }
            LinkedHashMap<String, String> mapTask = new LinkedHashMap<String, String>();
            // 읽어온 csv파일의 값을 map로 생성, map를 비교해 파일의 손상여부를 확인하기 위함
            for (int j = 0; j < csvString.size(); j++) {
                String[] split_map = csvString.get(j).split(",");
                if (split_map == null || split_map.length < 2) {
                    return Output.JsonOutput("3305", mapPath.get(i) + " csv파일이 포함되어 있습니다.\nmAP파일을 재생성해주시고 지속적으로 발생할 경우 관리자에게 문의해주시길 바랍니다.");
                }
                mapTask.put(split_map[0], split_map[1]);
            }

            mapTaskArray.add(mapTask);
        }

        // map를 비교, 첫번째 파일과 각 파일들을 비교해서 하나의 파일이라도 일치하지 않으면 손상된 것
        for (int i = 1; i < mapTaskArray.size(); i++) {
            if (mapTaskArray.get(0).size() != mapTaskArray.get(i).size()) {
                return Output.JsonOutput("3307", "다른 Annotation으로 생성된 mAP파일은 비교할 수 없습니다.");
            }

            Set mapTaskKey = mapTaskArray.get(i).keySet();

            for (Iterator iterator = mapTaskKey.iterator(); iterator.hasNext(); ) {
                String keyName = (String) iterator.next();

                if (!mapTaskArray.get(0).containsKey(keyName)) {
                    return Output.JsonOutput("3307", "일치하지 않는 Label을 가진 mAP파일끼리는 비교할 수 없습니다.");
                }
            }
        }

        for (int i = 0; i < mapPath.size(); i++) {
            JSONObject json = new JSONObject();
            json.put(mapPath.get(i), mapTaskArray.get(i));
            jsonTask.add(json);
        }

        jArray.add(jsonTask);
        for (int i = 0; i < taskVO.getMapPath().size(); i++) {

        }

//		logger.info(jArray2.toString());
        return Output.JsonOutput("200", jsonTask);
    }


    private String[] getFileList(String path) {
        File[] files = null;
        String fileList[] = null;
        try {
            files = new File(path).listFiles(); // 경로에 있는 파일목록구함
            if (files == null || files.length <= 0) {
                return null;
            }

//			for(int i = 0; i < files.length; i++) {
//				File folder = new File(files[i].getName());
//				folder_files = folder.listFiles(new FilenameFilter() {
//			        @Override
//			        public boolean accept(File dir, String name) {
//			            return !name.equals(".DS_Store");
//			        }
//				});
//			}

            fileList = new String[files.length];
//			fileList = new String[files.length];

            if (fileList == null || fileList.length <= 0) {
                return null;
            }

            // 최근에 생성된 날짜별로 내림차순 정렬
            Arrays.sort(files, new Comparator<File>() {
                public int compare(File f1, File f2) {
                    long l1 = getFileCreationEpoch(f1);
                    long l2 = getFileCreationEpoch(f2);
//					return Long.valueOf(f2.lastModified()).compareTo(f1.lastModified());
                    return Long.valueOf(l2).compareTo(l1);
                }
            });

            for (int i = 0; i < files.length; i++) {
                fileList[i] = files[i].getName();
            }
        } catch (NumberFormatException e) {
            logger.error("NumberFormatException Error!", e);
        } catch (Exception e) {
            logger.error("Exception Error!", e);
        } finally {
            files = null;
        }

        return fileList;
    }

    // 파일 생성된 날짜로 정렬
    private long getFileCreationEpoch(File file) {
        try {
            BasicFileAttributes attr = Files.readAttributes(file.toPath(), BasicFileAttributes.class);
            return attr.creationTime().toInstant().toEpochMilli();
        } catch (IOException e) {
//	          throw new RuntimeException(file.getAbsolutePath(), e);
            logger.error("IOException Error!", e);
            return 0;
        }
    }

    // GpuNode 테이블 조회 후 세션 연결
    private Object getWorkerGpuList() {
        GpuNodeVO inGpuNodeVO = new GpuNodeVO();
        inGpuNodeVO.setType("worker");
        List<GpuNodeVO> gpuList = gpuNodeDao.getGpuNodeList(inGpuNodeVO);

        Collection sessionConnectionList = new ArrayList();
        // j.seo 추가 (210203)
        List<SSHCmdExecute> sshList = new ArrayList<SSHCmdExecute>();
        for (int i = 0; i < gpuList.size(); i++) {
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

            sessionConnectionList.add(new SSHCmdExecute(account, port, address, password));
        }

        if (sessionConnectionList.size() <= 0 || sessionConnectionList.isEmpty()) {
            return Output.JsonOutput("3454", "연결된 노드가 없습니다.\nSetup에서 worker 노드를 연결 후 다시 시도하세요.");
        }

        // 쓰레드로 SSH 세션 연결, 요청한 순서대로 session을 반환받음.
        ExecutorService executorService = Executors.newFixedThreadPool(5);
        List<Future<Session>> sessionList = new ArrayList<>();
        List<Session> result = new ArrayList<Session>();
        try {
            sessionList = executorService.invokeAll(sessionConnectionList);
        } catch (Exception e) {
            if (e instanceof InterruptedException) {
                logger.error("InterruptedException", e);
            }
            if (e instanceof NullPointerException) {
                logger.error("NullPointerException" + e);
            }
            if (e instanceof RejectedExecutionException) {
                logger.error("RejectedExecutionException" + e);
            }
        } finally {
            executorService.shutdown();
        }

        if (sessionList.size() <= 0 || sessionList.isEmpty()) {
            logger.error("세션 연결 실패! SSH로 접속하려는 호스트가 정상적으로 연결되는지 확인하세요.");
            return Output.JsonOutput("3454", "연결된 노드가 없습니다.\nSetup에서 worker 노드를 연결 후 다시 시도하세요.");
        }

        for (int i = 0; i < sessionList.size(); i++) {
            try {
                Session session = sessionList.get(i).get();
                result.add(session);
            } catch (Exception e) {
                if (e instanceof InterruptedException) {
                    logger.error("InterruptedException Error!", e);
                    continue;
                }
                if (e instanceof ExecutionException) {
                    logger.error("ExecutionException Error!", e);
                    continue;
                }
            }
        }

        return result;
    }

    private Object getSSHSessionList(List<GpuNodeVO> gpuList) {
        List<Session> sessionList = new ArrayList<Session>();
        SessionSingletone sessionSingletone = SessionSingletone.getInstance();
        Map<String, Session> sessionMap = sessionSingletone.getSessionMap();
        if (sessionMap == null || sessionMap.isEmpty()) {
            return Output.JsonOutput("3454", "원격 접속 가능한 GPU Server가 존재하지 않습니다.\nSetup 또는 서버상태를 확인하세요.");
        }

        for (int i = 0; i < gpuList.size(); i++) {
            Session session = sessionMap.get(gpuList.get(i).getAddress());
            if (session == null || session.isConnected() == false) {
                continue;
            }
            sessionList.add(session);
        }

        if (sessionList == null || sessionList.size() <= 0 || sessionList.isEmpty()) {
            logger.error("원격 접속 가능한 세션 없음! Setup을 확인하세요.");
            return Output.JsonOutput("3454", "원격 접속 가능한 GPU Server가 존재하지 않습니다.\nSetup 또는 서버상태를 확인하세요.");
        }

        return sessionList;

    }
}
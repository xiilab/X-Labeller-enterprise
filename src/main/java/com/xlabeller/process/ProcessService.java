package com.xlabeller.process;

import com.xlabeller.data.DataDao;
import com.xlabeller.models.DatasetVO;
import com.xlabeller.quartz.QuartzLock;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;


@Service
public class ProcessService {
	@Autowired
	private DataDao dataDao;
	
	private static Logger logger = Logger.getLogger(ProcessService.class);	
	
	
	public void procDataUpload(QuartzLock quartzLock) {		
		// 타겟 Dataset 가져옴
		List<DatasetVO> dataList = dataDao.getUploadRequestDatasetList();
		if(dataList == null || dataList.isEmpty()) {
			return;
		}
		
		
//		ExecutorService executorService = Executors.newSingleThreadExecutor();
		ExecutorService executorService = Executors.newFixedThreadPool(dataList.size());
		
		// 정보와 함께 Thread생성(이슈 발생하지 않기 위해 1개로 한정함!)
		for(int i = 0 ; i < dataList.size(); i++) {
			boolean isRun = quartzLock.startExecute();
			if(!isRun) {
				break;
			}
			ProcessLogicThread thread = new ProcessLogicThread(dataDao,dataList.get(i));			
			Future future = executorService.submit(thread);	
			try {
				future.get();
				quartzLock.releaseExecute();
			} catch (Exception e) {
				quartzLock.releaseExecute();
			}
		}
		executorService.shutdown();
//		try {
//			executorService.shutdown();
//			executorService.awaitTermination(999999L,TimeUnit.SECONDS);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			logger.error("awaitTermination",e);
//		}
//		executorService.shutdown();
		
	}

	
}
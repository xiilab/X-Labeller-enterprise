package com.xlabeller.init;

import com.xlabeller.models.TableVO;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import java.util.List;

@Repository
public class InitDao {
	@Autowired
	private SqlSession sqlSession;
	
	private static Logger logger = Logger.getLogger(InitDao.class);
	
	@PostConstruct
	public void initialize(){
		System.out.println("TEST");
		initAnnotation();
		initData();
//		updateChangeInitData();
//		updateAddInitData();
		initDataset();
//		updateChangeInitDataset();
//		updateAddInitDataset();
		initMeta();
		initProject();
		initTask();
		initUsers();
		initGpuNode();
		initAlgorithm();
		initDatasetLog();
		
		try {
			initDefaultAlgorithm();
		}catch(Exception e) {
			//e.printStackTrace();
			
		}
		
		try {
			initDefaultProject();
		}catch(Exception e) {
			//e.printStackTrace();
		}
		
		try {
			initDefaultTask();
		}catch(Exception e) {
			//e.printStackTrace();
			
		}
		
		// Add Column (테이블명, 추가할 컬럼명, 타입, default값)
		try {
			addColumn("DATA", "USER_ID", "INT(11)", "NULL");
			addColumn("DATA", "MEDIA_TYPE", "varchar(70)", "NULL");
			addColumn("DATA", "WIDTH", "INT(11)", "NULL");
			addColumn("DATA", "HEIGHT", "INT(11)", "NULL");
			addColumn("DATA", "FPS", "INT(11)", "NULL");
			addColumn("DATA", "CONFIRM_STATUS", "INT(11)", "NULL");
			addColumn("DATA", "FILENAME", "varchar(150)", "NULL");
			addColumn("DATA", "FRAME", "INT(11)", "NULL");
			addColumn("DATA", "DURATION", "double", "NULL");
			addColumn("DATASET", "MEDIA_TYPE", "varchar(70)", "NULL");
			addColumn("META", "LABEL_TYPE", "varchar(70)", "NULL");
			addColumn("META", "USER_ID", "INT(11)", "NULL");
			addColumn("META", "CREATED_DATE", "DATETIME", "NULL");
			addColumn("USERS", "ROOT_ID", "INT(11)", "NULL");
			addColumn("GPU_NODE", "PORT", "INT(11)", "0");
//			addColumn("TEST", "MEDIA_TYPE", "varchar(70)", "NULL");s
//			addColumn("TEST", "MEDIA_TYPE2", "varchar(70)", "null");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// changeColumnName(테이블명, 변경 전 컬럼이름, 변경 후 컬럼이름, 타입, default값)
		try {
			changeColumnName("DATA", "ID", "DATA_ID", "INT(11)", "NULL");
			changeColumnName("DATA", "IS_ENABLE", "STATUS", "INT(11)", "NULL");
			changeColumnName("DATASET", "ID", "DATASET_ID", "INT(11)", "NULL");
			changeColumnName("DATASET", "IS_ENABLE", "STATUS", "INT(11)", "NULL");
			changeColumnName("USERS", "ID", "USER_ID", "INT(11)", "NULL");
			changeColumnName("META", "ID", "META_ID", "INT(11)", "NULL");
			changeColumnName("ANNOTATION", "ID", "ANNOTATION_ID", "INT(11)", "AUTO_INCREMENT");
			changeColumnName("GPU_NODE", "ID", "GPU_NODE_ID", "INT(11)", "AUTO_INCREMENT");
			changeColumnName("PROJECT", "ID", "PROJECT_ID", "INT(11)", "AUTO_INCREMENT");
			changeColumnName("TASK", "ID", "TASK_ID", "INT(11)", "AUTO_INCREMENT");
//			changeColumnName("TEST", "MEDIA_TYPE3", "MEDIA_TYPE2", "varchar(70)");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		// deleteColumn(테이블명, 삭제하려는 컬럼명)
		try {
			deleteColumn("META", "SEGMENTATION");
			deleteColumn("META", "CROP_IMG");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
		
	public int initAnnotation() {
        return sqlSession.insert("com.xlabeller.sql.init.initAnnotation");
    }
	
	public int initData() {
        return sqlSession.insert("com.xlabeller.sql.init.initData");
    }
	
	public int updateChangeInitData() {
		return sqlSession.update("com.xlabeller.sql.init.updateChangeInitData");
	}
	
	public int updateAddInitData() {
		return sqlSession.update("com.xlabeller.sql.init.updateAddInitData");
	}
	
	public int initDataset() {
        return sqlSession.insert("com.xlabeller.sql.init.initDataset");
    }
	
	public int updateChangeInitDataset() {
		return sqlSession.update("com.xlabeller.sql.init.updateChangeInitDataset");
	}
	
	public int updateAddInitDataset() {
		return sqlSession.update("com.xlabeller.sql.init.updateAddInitDataset");
	}
	
	public int initMeta() {
        return sqlSession.insert("com.xlabeller.sql.init.initMeta");
    }
	
	public int initProject() {
        return sqlSession.insert("com.xlabeller.sql.init.initProject");
    }
	
	public int initTask() {
        return sqlSession.insert("com.xlabeller.sql.init.initTask");
    }
	
	public int initUsers() {
        return sqlSession.insert("com.xlabeller.sql.init.initUsers");
    }
	
	public int initGpuNode() {
        return sqlSession.insert("com.xlabeller.sql.init.initGpuNode");
    }
	
	public int initDefaultProject() {
        return sqlSession.insert("com.xlabeller.sql.init.initDefaultProject");
    }
	
	public int initDefaultTask() {
        return sqlSession.insert("com.xlabeller.sql.init.initDefaultTask");
    }
	
	public int initAlgorithm() {
        return sqlSession.insert("com.xlabeller.sql.init.initAlgorithm");
    }
	
	public int initDefaultAlgorithm() {
        return sqlSession.insert("com.xlabeller.sql.init.initDefaultAlgorithm");
    }    
	
	public int initDatasetLog() {
		return sqlSession.update("com.xlabeller.sql.init.initDatasetLog");
	}
	
	private int changeColumnName(String tableName, String beforeColName, String afterColName, String type, String defaultValue) {
		if(tableName == null || tableName.length() <= 0) {
			logger.warn("tableName를 입력해주세요. tableName : " + tableName);
			return 0;
		} 
		if(beforeColName == null || beforeColName.length() <= 0) {
			logger.warn("변경하고자하는 컬럼명을 입력해주세요. beforeColName : " + beforeColName);
			return 0;
		} 
		if(afterColName == null || afterColName.length() <= 0) {
			logger.warn("변경할 컬럼명을 입력해주세요. afterColName : " + afterColName);
			return 0;
		} 
		if(type == null || type.length() <= 0) {
			logger.warn("type을 입력해주세요. type : " + type);
			return 0;
		}
		if(defaultValue == null || defaultValue.length() <= 0) {
			logger.warn("defaultValue을 입력해주세요. defaultValue : " + defaultValue);
			return 0;
		}
		
		boolean state = false;
		TableVO tableVO = new TableVO();
		tableVO.setTable_name(tableName);
		tableVO.setBeforeColName(beforeColName);
		tableVO.setAfterColName(afterColName);
		tableVO.setType(type);
		tableVO.setDefault_value(defaultValue);
		
		// 변경하려는 컬럼명 존재하는지 확인
		List<TableVO> columnNameList = getColumnNameList(tableVO);
		
		String colName = null;
		// 추가하려는 컬럼명이 존재하는지 확인
		for(int i = 0; i < columnNameList.size(); i++) {
			// 테이블의 각 컬럼명을 가져옴, 동일한 컬럼명이 존재하는지 확인
			colName = columnNameList.get(i).getColumn_name();
//			System.out.println(colName);
			if(colName == null || colName.length() <= 0) {
				logger.warn("컬럼명 조회에 실패하였습니다. colName : " + colName);
				return 0;
			} 
			
			// 변경하고자 하는 컬럼명이 존재한다면 반복문 중단 후 업데이트 수행
			if(colName.equals(beforeColName)) {
				state = true;
				for(int j = 0; j < columnNameList.size(); j++) {
					colName = columnNameList.get(j).getColumn_name();
					if(colName.equals(afterColName)) {
						logger.warn("변경할 컬럼 이름이 이미 존재합니다. colName : " + colName);
						return 0;
					}
				}
				break;
			}
		}
		
		if(state == false) {
			logger.warn("변경하고자하는 컬럼이 존재하지 않습니다.");
			return 0;
		}
		
		logger.warn("컬럼명 변경 완료.");
		return sqlSession.update("com.xlabeller.sql.init.changeColumnName", tableVO);
	}
	
	private int addColumn(String tableName, String columnName, String type, String defaultValue) {
		if(tableName == null || tableName.length() <= 0) {
			logger.warn("tableName를 입력해주세요. tableName : " + tableName);
			return -1;
		} 
		if(columnName == null || columnName.length() <= 0) {
			logger.warn("columnName를 입력해주세요. columnName : " + columnName);
			return -1;
		} 
		if(type == null || type.length() <= 0) {
			logger.warn("type을 입력해주세요. type : " + type);
			return -1;
		} 
		if(defaultValue == null || defaultValue.length() <= 0) {
			logger.warn("defaultValue를 입력해주세요. defaultValue : " + defaultValue);
			return -1;
		} 
		TableVO tableVO = new TableVO();
		tableVO.setTable_name(tableName);
		tableVO.setColumn_name(columnName);
		tableVO.setType(type);
		if(defaultValue.equals("null")) {
			defaultValue = "NULL";
		}
		tableVO.setDefault_value(defaultValue);
		
		
		List<TableVO> columnNameList = getColumnNameList(tableVO);
		
		// 추가하려는 컬럼명이 존재하는지 확인
		for(int i = 0; i < columnNameList.size(); i++) {
			String colName = columnNameList.get(i).getColumn_name();
//			System.out.println(colName);
			if(columnName == null || columnName.length() <= 0) {
				logger.warn("컬럼명 조회에 실패하였습니다.");
				return -1;
			} 
			if(colName.equals(columnName)) {
				logger.warn(columnName + "은 이미 테이블에 존재하는 컬럼명입니다.");
				return -1;
			}
		}
		
		// 존재하지 않으면 추가
		logger.warn("컬럼 추가 완료.");
		return sqlSession.update("com.xlabeller.sql.init.addColumn", tableVO);
	}
	
	private int deleteColumn(String tableName, String columnName) {
		if(tableName == null || tableName.length() <= 0) {
			logger.warn("tableName를 입력해주세요. tableName : " + tableName);
			return -1;
		} 
		if(columnName == null || columnName.length() <= 0) {
			logger.warn("columnName를 입력해주세요. columnName : " + columnName);
			return -1;
		} 
		
		TableVO tableVO = new TableVO();
		tableVO.setTable_name(tableName);
		tableVO.setColumn_name(columnName);
		
		List<TableVO> columnNameList = getColumnNameList(tableVO);
		boolean state = false;
		
		// 삭제하려는 컬럼명이 존재하는지 확인
		for(int i = 0; i < columnNameList.size(); i++) {
			String colName = columnNameList.get(i).getColumn_name();
			if(columnName == null || columnName.length() <= 0) {
				logger.warn("컬럼명 조회에 실패하였습니다.");
				return -1;
			} 
			if(colName.equals(columnName)) {
				logger.warn(columnName + "은 테이블에 존재하는 컬럼명입니다.");
				state = true;
				break;
			}
		}
		
		if(!state) {
			logger.warn("삭제하려는 컬럼명이 테이블에 존재하지 않습니다. columnName : " + tableVO.getColumn_name());
			return -1;
		}
		
		// 존재하지 않으면 추가
		logger.warn("컬럼 추가 완료.");
		return sqlSession.update("com.xlabeller.sql.init.deleteColumnName", tableVO);
	}
	
	/**
	 * 테이블명 입력받아 컬럼명 조회
	 * @param tableVO
	 * input : table_name
	 * @return table_list
	 */ 
	public List<TableVO> getColumnNameList(TableVO tableVO) {
		return (List<TableVO>)sqlSession.selectList("com.xlabeller.sql.init.getColumnNameList", tableVO);
	}
	
}




package com.xlabeller.data;

import com.xlabeller.models.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class DataDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertDataset(DatasetVO datasetVO) {
        return sqlSession.insert("com.xlabeller.sql.data.insertDataset",datasetVO);
    }
	
	public int deleteDataset(DatasetVO datasetVO) {
        return sqlSession.delete("com.xlabeller.sql.data.deleteDataset",datasetVO);
    }
	
	public List<DatasetVO> getDatasetList(DatasetVO datasetVO) {
        return (List<DatasetVO>)sqlSession.selectList("com.xlabeller.sql.data.getDatasetList",datasetVO);
    }
	
	public DatasetVO getDatasetById(DatasetVO datasetVO) {
        return (DatasetVO)sqlSession.selectOne("com.xlabeller.sql.data.getDatasetById",datasetVO);
    }
	
	// 추가됨
	public DatasetVO getMyDatasetById(DatasetVO datasetVO) {
        return (DatasetVO)sqlSession.selectOne("com.xlabeller.sql.data.getMyDatasetById",datasetVO);
    }
	
	
	public int updateDataset(DatasetVO datasetVO) {
        return sqlSession.update("com.xlabeller.sql.data.updateDataset",datasetVO);
    }
	

	// 작업 획득이 가능한지 확인하면서 업데이트하는 기능
	public int updateDatasetAvailable(DatasetVO datasetVO) {
        return sqlSession.update("com.xlabeller.sql.data.updateDatasetAvailable",datasetVO);
    }
	
 
	public int getDatasetTotalCount(DatasetVO datasetVO) {
        return (int)sqlSession.selectOne("com.xlabeller.sql.data.getDatasetTotalCount",datasetVO);
    }
	
	
	
	public int insertData(HashMap hm) {
        return sqlSession.insert("com.xlabeller.sql.data.insertData",hm);
    }
	
	public int insertDataInId(DataVO dataVO) {
        return sqlSession.insert("com.xlabeller.sql.data.insertDataInId", dataVO);
    }
	
	public int insertMetaBySelectResult(ReplicaMetaVO replicaMetaVO) {
        return sqlSession.insert("com.xlabeller.sql.data.insertMetaBySelectResult", replicaMetaVO);
    }
	
	
	public int deleteDataList(DataVO dataVO) {
        return sqlSession.delete("com.xlabeller.sql.data.deleteDataList",dataVO);
    }
	
	public List<DataVO> getDataList(DataVO dataVO) {
        return (List<DataVO>)sqlSession.selectList("com.xlabeller.sql.data.getDataList",dataVO);
    }
	public DataVO getDataById(DataVO dataVO) {
        return (DataVO)sqlSession.selectOne("com.xlabeller.sql.data.getDataById",dataVO);
    }
	

	public DataVO getDataByNum(DataVO dataVO) {
        return (DataVO)sqlSession.selectOne("com.xlabeller.sql.data.getDataByNum",dataVO);
    }
	
	
	
	//추가됨
	public int getDataTotalCount(DataVO dataVO) {
        return (int)sqlSession.selectOne("com.xlabeller.sql.data.getDataTotalCount",dataVO);
    }

	// 백그라운드 업로드 추가됨
	public List<DatasetVO> getUploadRequestDatasetList() {
        return (List<DatasetVO>)sqlSession.selectList("com.xlabeller.sql.data.getUploadRequestDatasetList");
    }
	
	
	
	public List<DataVO> getDataInId(DataVO dataVO) {
        return (List<DataVO>)sqlSession.selectList("com.xlabeller.sql.data.getDataInId",dataVO);
    }
	
	public List<DataVO> getDataByDatasetId(DataVO dataVO) {
        return (List<DataVO>)sqlSession.selectList("com.xlabeller.sql.data.getDataByDatasetId", dataVO);
    }
	
	
	
	public int updateDataInId(DataVO dataVO) {
        return sqlSession.update("com.xlabeller.sql.data.updateDataInId",dataVO);
    }
	

	public int insertMeta(HashMap hm) {
        return sqlSession.insert("com.xlabeller.sql.data.insertMeta",hm);
    }
	
	public int updateMeta(MetaVO metaVO) {
        return sqlSession.update("com.xlabeller.sql.data.updateMeta",metaVO);
    }
	
	public int updateMovelMetaByDataId(MetaMoveVO metaMoveVO) {
        return sqlSession.update("com.xlabeller.sql.data.updateMovelMetaByDataId",metaMoveVO);
    }
	
	
	public int deleteMetaList(MetaVO metaVO) {
        return sqlSession.delete("com.xlabeller.sql.data.deleteMetaList",metaVO);
    }
	
	public List<MetaVO> getMetaList(MetaVO metaVO) {
        return (List<MetaVO>)sqlSession.selectList("com.xlabeller.sql.data.getMetaList",metaVO);
    }
	
	public List<MetaVO> getMetaListInId(MetaVO metaVO) {
        return (List<MetaVO>)sqlSession.selectList("com.xlabeller.sql.data.getMetaListInId",metaVO);
    }
	
	
	public List<MetaVO> getSearchVisionList(MetaVO metaVO) {
        return (List<MetaVO>)sqlSession.selectList("com.xlabeller.sql.data.getSearchVisionList",metaVO);
    }
	
	public List<MetaVO> getSearchAnnotationVisionList(MetaVO metaVO) {
        return (List<MetaVO>)sqlSession.selectList("com.xlabeller.sql.data.getSearchAnnotationVisionList",metaVO);
    }
	
	public List<MetaVO> getSearchVideoAnnotationVisionList(MetaVO metaVO) {
        return (List<MetaVO>)sqlSession.selectList("com.xlabeller.sql.data.getSearchVideoAnnotationVisionList",metaVO);
    }
	
	public int getSearchVisionListTotalCount(MetaVO metaVO) {
		return (int)sqlSession.selectOne("com.xlabeller.sql.data.getSearchVisionListTotalCount",metaVO);
	}
	
	public List<DataVO> getDataListInPath(DataVO dataVO) {
        return (List<DataVO>)sqlSession.selectList("com.xlabeller.sql.data.getDataListInPath",dataVO);
    }
	
    
	public int deleteMetaByDatasetId(DataVO dataVO) {
        return sqlSession.delete("com.xlabeller.sql.data.deleteMetaByDatasetId",dataVO);
    }
	
	
	public int deleteMetaInDataId(DataVO dataVO) {
        return sqlSession.delete("com.xlabeller.sql.data.deleteMetaInDataId",dataVO);
    }
	
	public int getMetaInDataIdCount(DataVO dataVO) {
		return (int)sqlSession.selectOne("com.xlabeller.sql.data.getMetaInDataIdCount",dataVO);
	}
	
	
	public int updateDataByDatasetId(DataVO dataVO) {
        return sqlSession.update("com.xlabeller.sql.data.updateDataByDatasetId",dataVO);
    }
	
	public int updateData(DataVO dataVO) {
        return sqlSession.update("com.xlabeller.sql.data.updateData",dataVO);
    }
	
	public int deleteMeta(MetaVO metaVO) {
        return sqlSession.delete("com.xlabeller.sql.data.deleteMeta",metaVO);
    }
	
	public List<MetaVO> getLabelGroup(MetaVO metaVO) {
        return (List<MetaVO>)sqlSession.selectList("com.xlabeller.sql.data.getLabelGroup",metaVO);
    }
	
	public int insertDataOne(DataVO dataVO) {
        return sqlSession.insert("com.xlabeller.sql.data.insertDataOne",dataVO);
    }
	
	public int deleteData(DataVO dataVO) {
        return sqlSession.delete("com.xlabeller.sql.data.deleteData",dataVO);
    }
	
	public int deleteDataInId(DataVO dataVO) {
        return sqlSession.delete("com.xlabeller.sql.data.deleteDataInId",dataVO);
    }
	
	public int deleteDataByDatasetId(DataVO dataVO) {
		return sqlSession.delete("com.xlabeller.sql.data.deleteDataByDatasetId", dataVO);
	}
	
	public int getMetaByDataSetIdCount(DataVO dataVO) {
		return (int)sqlSession.selectOne("com.xlabeller.sql.data.getMetaByDataSetIdCount",dataVO);
	}
	
	

	// 데이터셋 로그 관련
	public int insertDatasetLog(DatasetLogVO datasetLogVO) {
        return sqlSession.insert("com.xlabeller.sql.data.insertDatasetLog",datasetLogVO);
    }
	
	public List<DatasetLogVO> getDatasetLogList(DatasetLogVO datasetLogVO) {
        return (List<DatasetLogVO>)sqlSession.selectList("com.xlabeller.sql.data.getDatasetLogList",datasetLogVO);
    }
	
	public int getDatasetLogTotalCount(DatasetLogVO datasetLogVO) {
        return (int)sqlSession.selectOne("com.xlabeller.sql.data.getDatasetLogTotalCount",datasetLogVO);
	}

    public DatasetVO getCheckOwnerDatasetById(DatasetVO datasetVO) {
        return (DatasetVO)sqlSession.selectOne("com.xii.sql.data.getCheckOwnerDatasetById",datasetVO);
    }


}
package com.xlabeller.algorithm;

import com.xlabeller.models.AlgorithmVO;
import com.xlabeller.models.TaskVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AlgorithmDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	//algorithm
	public int insertAlgorithm(AlgorithmVO algorithmVO) {
        return sqlSession.insert("com.xlabeller.sql.algorithm.insertAlgorithm",algorithmVO);
    }
	
	public int deleteAlgorithm(AlgorithmVO algorithmVO) {
        return sqlSession.delete("com.xlabeller.sql.algorithm.deleteAlgorithm",algorithmVO);
    }
	
	public List<AlgorithmVO> getAlgorithmList(AlgorithmVO algorithmVO) {
        return (List<AlgorithmVO>)sqlSession.selectList("com.xlabeller.sql.algorithm.getAlgorithmList",algorithmVO);
    }
	
	public int updateAlgorithm(AlgorithmVO algorithmVO) {
        return sqlSession.update("com.xlabeller.sql.algorithm.updateAlgorithm",algorithmVO);
    }
 
	public int getAlgorithmTotalCount(AlgorithmVO algorithmVO) {
        return (int)sqlSession.selectOne("com.xlabeller.sql.algorithm.getAlgorithmTotalCount",algorithmVO);
    }
	
	public AlgorithmVO getAlgorithmById(AlgorithmVO algorithmVO) {
        return (AlgorithmVO)sqlSession.selectOne("com.xlabeller.sql.algorithm.getAlgorithmById",algorithmVO);
    }
	
	
	public List<AlgorithmVO> getAlgorithmInId(AlgorithmVO algorithmVO) {
        return (List<AlgorithmVO>)sqlSession.selectList("com.xlabeller.sql.algorithm.getAlgorithmInId",algorithmVO);
    }
	
	public List<TaskVO> getTaskListByAlgorithmId(AlgorithmVO algorithmVO) {
		return (List<TaskVO>)sqlSession.selectList("com.xlabeller.sql.algorithm.getTaskListByAlgorithmId", algorithmVO);
	} 
	
    
}
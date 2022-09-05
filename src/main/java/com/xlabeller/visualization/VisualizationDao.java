package com.xlabeller.visualization;

import com.xlabeller.models.AlgorithmVO;
import com.xlabeller.models.TaskVO;
import com.xlabeller.models.VisualizationVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class VisualizationDao {
	@Autowired
	private SqlSession sqlSession;

	public VisualizationVO getDataQuantityPerResolution(VisualizationVO visualizationVO) {
        return (VisualizationVO) sqlSession.selectOne("com.xlabeller.sql.visualization.getDataQuantityPerResolution",visualizationVO);
    }

    public List<VisualizationVO> getDataQuantityPerClass(VisualizationVO visualizationVO) {
        return (List<VisualizationVO>) sqlSession.selectList("com.xlabeller.sql.visualization.getDataQuantityPerClass",visualizationVO);
    }

    public VisualizationVO getClassQuantityPerResolution(VisualizationVO visualizationVO) {
        return (VisualizationVO) sqlSession.selectOne("com.xlabeller.sql.visualization.getClassQuantityPerResolution",visualizationVO);
    }
}
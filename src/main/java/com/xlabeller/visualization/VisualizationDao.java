package com.xlabeller.visualization;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xlabeller.models.VisualizationVO;

@Repository
public class VisualizationDao {
	@Autowired
	private SqlSession sqlSession;

	public VisualizationVO getDataQuantityPerResolution(VisualizationVO visualizationVO) {
        return (VisualizationVO) sqlSession.selectOne("com.xlabeller.sql.visualization.getDataQuantityPerResolution",visualizationVO);
    }
	@SuppressWarnings("unchecked")
    public List<VisualizationVO> getDataQuantityPerClass(VisualizationVO visualizationVO) {
        return (List<VisualizationVO>) sqlSession.selectList("com.xlabeller.sql.visualization.getDataQuantityPerClass",visualizationVO);
    }

    public VisualizationVO getClassQuantityPerResolution(VisualizationVO visualizationVO) {
        return (VisualizationVO) sqlSession.selectOne("com.xlabeller.sql.visualization.getClassQuantityPerResolution",visualizationVO);
    }
    @SuppressWarnings("unchecked")
	public Object getLabelList(VisualizationVO visualizationVO) {
		return (List<VisualizationVO>) sqlSession.selectList("com.xlabeller.sql.visualization.getLabelList",visualizationVO);
	}
}
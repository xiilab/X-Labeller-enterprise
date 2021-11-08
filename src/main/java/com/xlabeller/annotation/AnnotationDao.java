package com.xlabeller.annotation;

import com.xlabeller.models.AnnotationVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AnnotationDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	//annotation
	public int insertAnnotation(AnnotationVO annotationVO) {
        return sqlSession.insert("com.xlabeller.sql.annotation.insertAnnotation",annotationVO);
    }
	
	public int deleteAnnotation(AnnotationVO annotationVO) {
        return sqlSession.delete("com.xlabeller.sql.annotation.deleteAnnotation",annotationVO);
    }
	
	public List<AnnotationVO> getAnnotationList(AnnotationVO annotationVO) {
        return (List<AnnotationVO>)sqlSession.selectList("com.xlabeller.sql.annotation.getAnnotationList",annotationVO);
    }
	
	public int updateAnnotation(AnnotationVO annotationVO) {
        return sqlSession.update("com.xlabeller.sql.annotation.updateAnnotation",annotationVO);
    }
 
	public int getAnnotationTotalCount(AnnotationVO annotationVO) {
        return (int)sqlSession.selectOne("com.xlabeller.sql.annotation.getAnnotationTotalCount",annotationVO);
    }
	
	public AnnotationVO getAnnotationById(AnnotationVO annotationVO) {
        return (AnnotationVO)sqlSession.selectOne("com.xlabeller.sql.annotation.getAnnotationById",annotationVO);
    }
	
	public AnnotationVO getVideoAnnotationById(AnnotationVO annotationVO) {
        return (AnnotationVO)sqlSession.selectOne("com.xlabeller.sql.annotation.getVideoAnnotationById",annotationVO);
    }
	
	public List<AnnotationVO> getCheckAnnotationName(AnnotationVO annotationVO) {
        return (List<AnnotationVO>)sqlSession.selectList("com.xlabeller.sql.annotation.getCheckAnnotationName",annotationVO);
    }
	
	
    
}
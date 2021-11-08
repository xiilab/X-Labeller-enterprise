package com.xlabeller.project;

import com.xlabeller.models.ProjectVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProjectDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertProject(ProjectVO projectVO) {
        return sqlSession.insert("com.xlabeller.sql.project.insertProject",projectVO);
    }
	
	public int deleteProject(ProjectVO projectVO) {
        return sqlSession.delete("com.xlabeller.sql.project.deleteProject",projectVO);
    }
	
	public List<ProjectVO> getProjectList(ProjectVO projectVO) {
        return (List<ProjectVO>)sqlSession.selectList("com.xlabeller.sql.project.getProjectList",projectVO);
    }
	
	public int updateProject(ProjectVO projectVO) {
        return sqlSession.update("com.xlabeller.sql.project.updateProject",projectVO);
    }
 
	public int getProjectTotalCount(ProjectVO projectVO) {
        return (int)sqlSession.selectOne("com.xlabeller.sql.project.getProjectTotalCount",projectVO);
    }
	
	public ProjectVO getProjectById(ProjectVO projectVO) {
        return (ProjectVO)sqlSession.selectOne("com.xlabeller.sql.project.getProjectById",projectVO);
    }
	
	
	
	
	
    
}
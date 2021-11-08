package com.xlabeller.task;

import com.xlabeller.models.ProjectTaskVO;
import com.xlabeller.models.TaskVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TaskDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertTask(TaskVO taskVO) {
        return sqlSession.insert("com.xlabeller.sql.task.insertTask",taskVO);
    }
	
	public int deleteTask(TaskVO taskVO) {
        return sqlSession.delete("com.xlabeller.sql.task.deleteTask",taskVO);
    }
	
	public List<TaskVO> getTaskList(TaskVO taskVO) {
        return (List<TaskVO>)sqlSession.selectList("com.xlabeller.sql.task.getTaskList",taskVO);
    }
	
	public int updateTask(TaskVO taskVO) {
        return sqlSession.update("com.xlabeller.sql.task.updateTask",taskVO);
    }
 
	public int getTaskTotalCount(TaskVO taskVO) {
        return (int)sqlSession.selectOne("com.xlabeller.sql.task.getTaskTotalCount",taskVO);
    }
	
	public TaskVO getTaskById(TaskVO taskVO) {
        return (TaskVO)sqlSession.selectOne("com.xlabeller.sql.task.getTaskById",taskVO);
    }
	
	
	public int deleteTaskByProject(TaskVO taskVO) {
        return sqlSession.delete("com.xlabeller.sql.task.deleteTaskByProject",taskVO);
    }
	
	
	public ProjectTaskVO getProjectTaskById(ProjectTaskVO projectTaskVO) {
        return (ProjectTaskVO)sqlSession.selectOne("com.xlabeller.sql.task.getProjectTaskById",projectTaskVO);
    }
	
	
	public List<TaskVO> getCheckTaskName(TaskVO taskVO) {
        return (List<TaskVO>)sqlSession.selectList("com.xlabeller.sql.task.getCheckTaskName",taskVO);
    }
	
	public List<TaskVO> getTaskListByBaseTaskId(TaskVO taskVO) {
		return (List<TaskVO>)sqlSession.selectList("com.xlabeller.sql.task.getTaskListByBaseTaskId", taskVO);
	}
	
	public int updateTaskBaseTaskId(TaskVO taskVO) {
		return sqlSession.update("com.xlabeller.sql.task.updateTaskBaseTaskId", taskVO);
	}
	
}
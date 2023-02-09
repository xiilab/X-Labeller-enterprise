package com.xlabeller.imExport;

import com.xlabeller.models.ImExportVO;
import com.xlabeller.models.ProjectVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ImExportDao {
	@Autowired
	private SqlSession sqlSession;

	public List<ImExportVO> getExportAnnotationData(ImExportVO imExportVO) {
		return (List<ImExportVO>)sqlSession.selectList("com.xlabeller.sql.imExport.getExportAnnotationData", imExportVO);
	}
}
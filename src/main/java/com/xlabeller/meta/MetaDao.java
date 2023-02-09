package com.xlabeller.meta;

import com.xlabeller.models.MetaVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MetaDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<MetaVO> getMetaByDataId(MetaVO metaVO) {
        return (List<MetaVO>)sqlSession.selectList("com.xlabeller.sql.meta.getMetaByDataId",metaVO);
    }
	
	public MetaVO getMetaByMetaId(MetaVO metaVO) {
        return (MetaVO)sqlSession.selectOne("com.xlabeller.sql.meta.getMetaByMetaId",metaVO);
    }
	

	
	public int insertMeta(MetaVO metaVO) {
        return sqlSession.insert("com.xlabeller.sql.meta.insertMeta",metaVO);
    }

	public int insertMetaList(MetaVO metaVO) {
		return sqlSession.insert("com.xlabeller.sql.meta.insertMetaList",metaVO);
	}
	
	public int upsertMeta(MetaVO metaVO) {
		return sqlSession.update("com.xlabeller.sql.meta.upsertMeta",metaVO);
	}

	
	
	public int deleteMetaById(MetaVO metaVO) {
		return sqlSession.delete("com.xlabeller.sql.meta.deleteMetaById",metaVO);
	}
	
	
	
	
	
	
}
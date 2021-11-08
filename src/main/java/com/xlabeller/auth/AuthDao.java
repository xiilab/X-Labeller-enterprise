package com.xlabeller.auth;

import com.xlabeller.models.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AuthDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	
	
	public List<UserVO> getUserByAccount(UserVO userVO) {
        return (List<UserVO>)sqlSession.selectList("com.xlabeller.sql.auth.getUserByAccount",userVO);
    }
	
	
	
	public UserVO getUserById(UserVO userVO) {
        return (UserVO)sqlSession.selectOne("com.xlabeller.sql.auth.getUserById",userVO);
    }
	
	public int insertUser(UserVO userVO) {
        return sqlSession.insert("com.xlabeller.sql.auth.insertUser",userVO);
    }
	
	public UserVO getUserByAccountPassword(UserVO userVO) {
        return (UserVO)sqlSession.selectOne("com.xlabeller.sql.auth.getUserByAccountPassword",userVO);
    }
	
	public int updateUser(UserVO userVO) {
        return sqlSession.update("com.xlabeller.sql.auth.updateUser",userVO);
    }
	
	public List<UserVO> getUserByKey(UserVO userVO) {
        return (List<UserVO>)sqlSession.selectList("com.xlabeller.sql.auth.getUserByKey",userVO);
    }
	
	public int updateLoginCount(UserVO userVO) {
		return sqlSession.update("com.xlabeller.sql.auth.updateLoginCount",userVO);
	}
}
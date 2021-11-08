package com.xlabeller.common.module;

import org.apache.log4j.Logger;
import org.springframework.dao.*;
import org.springframework.jdbc.BadSqlGrammarException;

public class SqlUtils {
	
	private static Logger logger = Logger.getLogger(SqlUtils.class);

	public static int sqlException(DataAccessException e) {
		if(e instanceof DataIntegrityViolationException){
			return 1000;
//			System.out.println("무결성 제약 조건 위반");

		}else if (e instanceof BadSqlGrammarException){
			return 2000;
//			System.out.println("SQL이 유효하지 않은 경우 예외가 발생");

		}else if(e instanceof DataAccessResourceFailureException){ 	//
			return 3000;

//			System.out.println("JDBC를 사용하여 데이터베이스에 연결할 수 없는경우");

		}else if(e instanceof CannotAcquireLockException){
			return 4000;

//			System.out.println("누군가 DB물고있는경우, 누가 커밋안했을때 - DB락");

		}else if(e instanceof DeadlockLoserDataAccessException){
			return 5000;

//			System.out.println("현재 프로세스가 교착 상태");

		}else {
			return 6000;
		}
	}
		
	
}
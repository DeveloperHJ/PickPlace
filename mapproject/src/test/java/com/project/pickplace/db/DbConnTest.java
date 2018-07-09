package com.project.pickplace.db;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

// 데이터베이스 연결 Junit5 테스트 
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class DbConnTest {

	private static final Logger logger = LoggerFactory.getLogger(DbConnTest.class);
	
	@Autowired
	private DataSource ds;

	@Test 
	void dbConn_test() {
		try(Connection conn = ds.getConnection()) {
			logger.info("연결성공");
		} catch (SQLException e) {
			e.printStackTrace();
			logger.info("연결실패");
		}
	}
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	void sql_test() {
		logger.info(sqlsession.toString());
		logger.info(sqlSessionFactory.toString());
	}
}

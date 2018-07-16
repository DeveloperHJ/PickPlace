package com.project.pickplace.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.pickplace.dto.PinInfoDTO;

@Repository
public class PinDAOImplXML implements PinDAO {
	
	// Mybatis 구별을 위한 namespace 상수
	private static final String NAMESPACE = "pininfo.";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public void insert(PinInfoDTO pindto) {
		sqlsession.insert(NAMESPACE + "insert", pindto);
	}

	// 전체 핀 리스트 가져오기
	@Override
	public List<PinInfoDTO> pinList() {
		return sqlsession.selectList(NAMESPACE + "listAll");
	}

	@Override
	public List<PinInfoDTO> pinList(Integer mnum) {
		return sqlsession.selectList(NAMESPACE + "list", mnum);
	}

	// 핀 정보 가져오기
	@Override
	public PinInfoDTO pinView(Integer pnum) {
		return sqlsession.selectOne(NAMESPACE + "pinView", pnum);
	}
}

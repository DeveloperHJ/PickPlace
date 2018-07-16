package com.project.pickplace.pin;

import java.util.List;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.project.pickplace.dao.PinDAO;
import com.project.pickplace.dto.PinInfoDTO;

// 핀 등록, 수정, 삭제 등 PinDAO(Service) 테스트 
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class PinDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(PinDAOTest.class);

	@Autowired
	@Qualifier("pinDAOImplXML")
	PinDAO pindao;

	private PinInfoDTO pindto;
	
	// 핀 찍기 테스트
	@Test @Disabled
	void insert_test() {
		for (int i = 0; i < 100; i++) {
			pindto = new PinInfoDTO(51, "testmemo.." + i, "color..test.." + i , "35.55858807" + i, "129.32036895" + i, 5);
			pindao.insert(pindto);
		}
	}
	
	// 핀 목록 전체 불러오기
	@Test @Disabled
	void listAll_test() {
		List<PinInfoDTO> list = pindao.pinList();
		System.out.println(list.size());
	}
	
	// 해당 게시글의 핀 목록
	@Test @Disabled
	void list_test() {
		List<PinInfoDTO> list = pindao.pinList(51);
		System.out.println(list.size());
	}
	
	// 핀 정보 가져오기 
	@Test
	void view_test() {
		System.out.println(pindao.pinView(548).toString());
	}
}

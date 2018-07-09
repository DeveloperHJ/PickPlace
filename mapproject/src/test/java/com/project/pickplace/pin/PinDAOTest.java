package com.project.pickplace.pin;

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
	
	@Test
	void insert_test() {
		pindto = new PinInfoDTO(1, "testmemo1", "blue1", "1234567", "12345678", 5);
		pindao.insert(pindto);
	}
}

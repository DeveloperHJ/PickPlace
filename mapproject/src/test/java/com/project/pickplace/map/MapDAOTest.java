package com.project.pickplace.map;

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

import com.project.pickplace.dao.MapDAO;
import com.project.pickplace.dto.MapInfoDTO;

/* MNUM		NUMBER(13,0)		No				1	글번호
KAKAO_EMAIL	VARCHAR2(20 BYTE)	No				2	글쓴이
MTITLE		VARCHAR2(30 BYTE)	No				3	제목
MLOCAL		VARCHAR2(20 BYTE)	No				4	지역
MCONTENT	VARCHAR2(40 BYTE)	Yes				5	메모
MCDATE		DATE				No	SYSDATE 	6	등록날짜
MUDATE		DATE				No	SYSDATE 	7	수정날짜
BEGIN_LAT	VARCHAR2(30 BYTE)	No				8	시작위도
BEGIN_LNG	VARCHAR2(30 BYTE)	No				9	시작경도 */

// 핀 등록, 수정, 삭제 등 PinDAO(Service) 테스트 
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class MapDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(MapDAOTest.class);

	@Autowired
	@Qualifier("mapDAOImplXML")
	MapDAO mapdao;
	
	private MapInfoDTO mapdto = new MapInfoDTO();
	
	// 기록 등록하기
	@Test @Disabled
	void write_test() {
		for (int j = 0; j < 11; j++) {
			mapdto.setKakaoEmail("test@test.com");
			mapdto.setMtitle("맵 기록 테스트...	" + j);
			mapdto.setMlocal("지역테스트..." + j);
			mapdto.setMcontent("내용 테스트... " + j);
			mapdto.setBeginLat("1234" + j);
			mapdto.setBeginLng("12345" + j);
			
			mapdao.write(mapdto);
		}
	}
	
	// 기록 보기
	@Test @Disabled
	void view_test() {
		logger.info("게시글 보기 : " + mapdao.view(49).toString());
	}
	
	// 기록 수정하기 
	@Test @Disabled
	void update_test() {
		mapdto.setMnum(2);
		mapdto.setMtitle("타이틀 수정 테스트");
		mapdto.setMlocal("지역수정");
		mapdto.setMcontent("내용수정");
		mapdto.setBeginLat("54321");
		mapdto.setBeginLng("4321");
		
		mapdao.update(mapdto);
	}
	
	// 기록 리스트 
	@Test @Disabled
	void list_test() {
		List<MapInfoDTO> list = mapdao.maplist();
		logger.info(list.toString());
	}
	
	// 기록 삭제 테스트
	@Test @Disabled
	void delete_test() {
		mapdao.delete(2);
	}
}

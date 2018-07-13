package com.project.pickplace.member;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.project.pickplace.member.service.MemberService;
import com.project.pickplace.member.vo.MemberVO;


@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class MemberTest {

	private static final Logger logger = LoggerFactory
			.getLogger(MemberTest.class);
	
	@Autowired
	MemberService memberservice;
	
	@Test
	void insert_test() {
		MemberVO memberVO = new MemberVO();
		
		memberVO.setKakaoemail("minook1231@naver.com");
		memberVO.setKakaoid("1234");
		memberVO.setKakaonickname("123");
		
		memberservice.memberInsert(memberVO);
		
		
	}

}
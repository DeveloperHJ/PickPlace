package com.project.pickplace.member.service;

import java.util.List;
import com.project.pickplace.member.vo.MemberVO;


public interface MemberService {
	
	// 회원등록
	public void memberInsert(MemberVO memberVO);

	// 회원목록 가져오기
	public List<MemberVO> getMemberAll();
	
	int memberCheck(String kakaoid);
}
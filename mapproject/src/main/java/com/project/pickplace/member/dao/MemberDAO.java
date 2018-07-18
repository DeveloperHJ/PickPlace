package com.project.pickplace.member.dao;


import java.util.List;

import com.project.pickplace.member.vo.MemberVO;


public interface MemberDAO {

	// 회원등록
	public void insert(MemberVO memberVO);
	
	// 회원목록 가져오기
	public List<MemberVO> getMemberList();
	
	// 회원 재방문 체크
	public int memberCheck(String kakaoid);
} 
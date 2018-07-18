package com.project.pickplace.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.pickplace.member.dao.MemberDAO;
import com.project.pickplace.member.vo.MemberVO;


@Service
public class MemberServiceImplXML implements MemberService{

	@Autowired
	@Qualifier("memberDAOImplXML")
	MemberDAO memberDAO;

	@Override
	public void memberInsert(MemberVO memberVO) {
		memberDAO.insert(memberVO);
		
	}

	@Override
	public List<MemberVO> getMemberAll() {

		return memberDAO.getMemberList();
	}

	@Override
	public int memberCheck(String kakaoid) {
		
		// 1을 리턴 받은걸 다시 1로 리턴함.
		return memberDAO.memberCheck(kakaoid); 
	}
}
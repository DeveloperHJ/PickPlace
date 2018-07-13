package com.project.pickplace.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.pickplace.member.vo.MemberVO;

@Repository
public class MemberDAOImplXML implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public void insert(MemberVO memberVO) {
		sqlSession.insert("insertMember", memberVO);
	}

	@Override 
	public List<MemberVO> getMemberList() {
		return sqlSession.selectList("getMemberAll");
	}
}
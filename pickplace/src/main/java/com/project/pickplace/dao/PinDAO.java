package com.project.pickplace.dao;

import java.util.List;

import com.project.pickplace.dto.PinInfoDTO;


// PinInfo 데이터베이스에 들어가는 관련 메소드 DAO 
public interface PinDAO {
	// 핀 등록
	void insert(PinInfoDTO pindto);
	
	/**
	 * 전체 핀 목록 가져오기
	 * @return List<PinInfoDTO> list;
	 */
	List<PinInfoDTO> pinList();
	
	/** 
	 * 해당 ID, 해당 MapInfo에 해당 하는 핀 목록 가져오기 
	 * @param mnum : 맵 넘버
	 * @return List<PinInfoDTO> list;
	 */
	List<PinInfoDTO> pinList(Integer mnum);
	
	// 핀 수정
	
	// 핀 삭제
	
	// 핀 정보 가져오기 
	PinInfoDTO pinView(Integer pnum);
}

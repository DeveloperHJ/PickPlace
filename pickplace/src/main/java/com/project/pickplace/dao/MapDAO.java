package com.project.pickplace.dao;

import java.util.List;

import com.project.pickplace.dto.MapInfoDTO;

public interface MapDAO {
	
	//기록 보기 
	MapInfoDTO view(Integer mnum);
	
	//기록 만들기
	void write(MapInfoDTO mapdto);
	
	//기록 수정하기 
	void update(MapInfoDTO mapdto);
	
	//기록 삭제하기 
	void delete(Integer mnum);
	
	//여행 기록 목록보기 
	List<MapInfoDTO> maplist();
	
	//해당 아이디 모든 기록 가져오기 
	List<MapInfoDTO> maplist(String kakaoid);
}

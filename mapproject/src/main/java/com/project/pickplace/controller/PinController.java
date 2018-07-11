package com.project.pickplace.controller;

import static org.springframework.web.bind.annotation.RequestMethod.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.pickplace.dao.PinDAO;
import com.project.pickplace.dto.PinInfoDTO;

@Controller
@RestController
@RequestMapping("/pin")
public class PinController {
	private static final Logger logger = LoggerFactory.getLogger(PinController.class);
	
	@Autowired
	@Qualifier("pinDAOImplXML")
	PinDAO pindao;
	
	//RestController 테스트
	@RequestMapping("/hello")
	public String hello() {
		return "hello!";
	}
	
	//핀 등록
	@RequestMapping(value="/insert", method=POST)
	public ResponseEntity<String> insert(@RequestBody PinInfoDTO pindto)
	{
		logger.info("insert POST ..." + pindto.toString());
		ResponseEntity<String> responseEntity = null;
		
		try {
			pindao.insert(pindto);
			responseEntity = new ResponseEntity<>("Success", HttpStatus.OK);
		} catch (Exception e) {
			responseEntity = new ResponseEntity<>("Fail", HttpStatus.BAD_REQUEST);
		}
		
		return responseEntity;
	}
	
	//핀 리스트 불러오기
	@RequestMapping(value="/list")
	public ResponseEntity<Map<String, Object>> list() {
		logger.info("list....");
		ResponseEntity<Map<String, Object>> responseEntity = null;
		Map<String, Object> map = new HashMap<>();
		
		try {
			map.put("item", pindao.pinList());
			responseEntity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			responseEntity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return responseEntity;
	}
	
	//핀 리스트 불러오기
	@RequestMapping(value="/list/{mnum}")
	public ResponseEntity<Map<String, Object>> list(@PathVariable Integer mnum) {
		logger.info("list....");
		ResponseEntity<Map<String, Object>> responseEntity = null;
		Map<String, Object> map = new HashMap<>();
		
		try {
			map.put("item", pindao.pinList(mnum));
			responseEntity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			responseEntity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return responseEntity;
	}
}

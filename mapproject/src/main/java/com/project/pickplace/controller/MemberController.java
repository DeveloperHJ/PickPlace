package com.project.pickplace.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.pickplace.member.service.MemberService;
import com.project.pickplace.member.vo.MemberVO;


/**
 * Handles requests for the application home page.
 */
@Controller
@RestController
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired(required = true)
	@Qualifier("memberServiceImplXML")
	MemberService memberService;

/*	@RequestMapping("/member")
	public String memberJoin(Model model) {
		
		
		model.addAttribute("memberVO", new MemberVO());
		return "/member";
	}*/

	@RequestMapping(value = "/memberJoinOK", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody MemberVO memberVO) {
		logger.info("insert POST ..." + memberVO.toString());
		ResponseEntity<String> responseEntity = null;

		try {
			
			memberService.memberInsert(memberVO);
			responseEntity = new ResponseEntity<>("Success", HttpStatus.OK);
		} catch (Exception e) {
			responseEntity = new ResponseEntity<>("Fail", HttpStatus.BAD_REQUEST);
		}

		return responseEntity;
	}

/*	@RequestMapping(value = "/memberJoinOK", method = RequestMethod.POST)
	public String memberJoinOK(@Valid MemberVO memberVO, BindingResult result) {
		if (result.hasErrors()) {
			logger.info("회원가입시 오류 발생~!!");
			return "/member/memberJoin";
		} else {
			memberService.memberInsert(memberVO);
		}
		return "redirect:/member/memberList";
	}*/
}
package com.project.pickplace.member.vo;

import javax.persistence.Entity;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.NoArgsConstructor;

/*KAKAO_ID	VARCHAR2(20 BYTE)		Yes		1	카카오톡고유아이디
KAKAO_EMAIL	VARCHAR2(40 BYTE)		No		2	카카오톡이메일
KAKAO_NICKNAME	VARCHAR2(20 BYTE)	No		3	카카오톡닉네임*/



@Entity
@Data // getter,setter,toString,equals,hashCode 자동생성
@NoArgsConstructor // 디폴트생성자
//@Slf4j // 로그 멤버변수 생성 log
public class MemberVO {
	
	private String kakaoid;
	
	@Email
	@NotNull
	private String kakaoemail;
	
	@NotNull
	private String kakaonickname;
}
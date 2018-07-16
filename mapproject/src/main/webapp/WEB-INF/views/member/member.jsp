<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Custom Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<script>
$(document).ready(function(){
	Kakao.init('35c746c7c031b1c1d304d8dcde651b9f');
	function getKakaotalkUserProfile(){
		Kakao.API.request({
			url: '/v1/user/me',
			success: function(res) {
				console.log(res);
							$.ajax({
								
							type:"POST",
							url:"/memberJoinOK",
							headers:{
								"Content-Type" : "application/json; charset=utf-8",
								"X-HTTP-Method-Override" : "POST"
							},
							dataType: "text",
							
							data: JSON.stringify({
								kakaoid			: res.id,				
								kakaoemail		: res.kaccount_email,
								kakaonickname	: res.properties.nickname
							}),
						     success:function(result){
						         console.log(result);
						         alert("회원등록이 완료되었습니다.");
						      },
						      error:function(data){
						         console.log(data);
						         alert("회원등록에 실패했습니다.");
						      }
						}); 
				
		 		$("#kakao-profile").append(res.properties.nickname);
			},
			fail: function(error) {
				console.log(error);
			}
		});
	}
	
	function createKakaotalkLoginForm(){
		$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
		var loginBtn = $("<img/>",{"class":"kakao-login-btn","src":"//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg","width":"15%", "height":"15%"});
			
		loginBtn.click(function(){

			Kakao.Auth.loginForm({
 						persistAccessToken: true,
				persistRefreshToken: true,
				
				success: function(authObj) {
					getKakaotalkUserProfile();
					createKakaotalkLogout();
				},
				fail: function(err) {
					console.log(err);
				}
			});
		});
		
		$("#kakao-logged-group").prepend(loginBtn)
	}
	
	
	function createKakaotalkLogout(){
		$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
		var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃;;"});
	
		logoutBtn.click(function(){					
			Kakao.Auth.logout(function(data){

			});
			
			createKakaotalkLoginForm();
			$("#kakao-profile").text("");
		});

		$("#kakao-logged-group").prepend(logoutBtn);
	}
	
	if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
		createKakaotalkLogout();
		getKakaotalkUserProfile();
	}else{
		createKakaotalkLoginForm();
	}
});
</script>

</head>
<body>
	<div id="kakao-logged-group"></div>
	<div id="kakao-profile"></div>
</body>
</html>
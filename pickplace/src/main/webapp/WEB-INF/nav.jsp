<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--=================== side menu ====================-->
<jsp:include page="header.jsp" flush="true" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<header>
	<div class="navbar navbar-default navbar-static-top" style="position: sticky; background-color: #68A4C4">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                  </button>
				<a class="navbar-brand" href="/map"><img src="/moderna/img/pickplace.png" alt="pickplace-logo"></a>
			</div>
			<div class="navbar-collapse collapse" id=".navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="/map">Home</a></li>
					<li><a id="kakao-logged-group"></a></li>
					<li><a href="/map/list">MyPage</a></li>
				</ul>
			</div>
		</div>
	</div>
</header>

<script>
	$(document).ready(function(){
		var check = 0;
		Kakao.init('df8bb19db219b164017e5e5170474bfb');
		
		
		function createKakaotalkLoginForm(){
			$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
			var loginBtn = $("<a/>",{"class":"kakao-login-btn", "text":"Logout", "style":"color:#222; padding-right:15px;"});
 			
			loginBtn.click(function(){

				Kakao.Auth.loginForm({
  						persistAccessToken: true,
					persistRefreshToken: true,
					
					success: function(authObj) {
						check = 1;
						createKakaotalkLogout();	
						getKakaotalkUserProfile();
					
					},
					fail: function(err) {
						console.log(err);
					}
				});
			});
			
			$("#kakao-logged-group").prepend(loginBtn)
		}
		
		
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
							        
							      },
							      error:function(data){
							    	  
							         console.log(data);
							         
							      }
							});
					
			 		$("#kakao-profile").append(res.properties.nickname);
				},
				fail: function(error) {
					console.log(error);
				}
			});
		}
		
		function createKakaotalkLogout(){
			$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
			var logoutBtn = $("<a/>",{"class":"kakao-login-btn","text":"Logout"});
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

<jsp:include page="header.jsp" flush="true" />
<!--=================== side menu end====================-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<!--=================== side menu ====================-->
<div class="col-lg-2 col-md-3 col-12 menu_block">

    <!--logo -->
	<div class="logo_box">
	    <a href="/map">
	        <img src="/cocoon/img/pickplace.png" alt="cocoon">
	    </a>
	</div>
	<!--logo end-->

	<!-- 카카오 로그인 -->
	<div style="padding-left: 30px;">
		<div id="kakao-logged-group"></div>
		<div id="kakao-profile"></div>
	</div>
    <!-- 카카오 로그인 -->

	<!--main menu -->
	<div class="side_menu_section">
	    <ul class="menu_nav">
	        <li>
	            <a href="/map">Home</a>
	        </li>
	        <li>
	            <a href="#">About Us</a>
	        </li>
	        <li>
	            <a href="/map/list">My Page</a>
	        </li>
	    </ul>
	</div>
	<!--main menu end -->

	<!--social and copyright -->
	<div class="side_menu_bottom">
	    <div class="side_menu_bottom_inner">
	        <div class="copy_right">
	            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	        <p class="copyright">Copyright &copy;<script>document.write(new Date().getFullYear());</script> 
	        All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> 
	        by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
	        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	        </div>
	    </div>
	</div>
	<!--social and copyright end -->
</div>
<!--=================== side menu end====================-->


<!------------------- 로그인 스크립트 시작 ----------------------->
<script>
   $(document).ready(function(){
      var check = 0;
      Kakao.init('df8bb19db219b164017e5e5170474bfb');
      
      
      function createKakaotalkLogin(){
         $("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
         var loginBtn = $("<img/>",{"class":"kakao-login-btn","src":"//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"});
          
         loginBtn.click(function(){

            Kakao.Auth.login({
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
      
      function createKakaotalkLoginForm(){
         $("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
         var loginBtn = $("<img/>",{"class":"kakao-login-btn","src":"//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"});
          
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
                           
                           kakaoid         : res.id,            
                           kakaoemail      : res.kaccount_email,
                           kakaonickname   : res.properties.nickname
                        }),
                          success:function(result){
                              console.log(result);
                              alert("핀이 등록되었습니다.");
                           },
                           error:function(data){
                              
                              console.log(data);
                              alert("핀이 정상적으로 등록되지 않았습니다.");
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
         var logoutBtn = $("<img/>",{"class":"kakao-login-btn","src":"/cocoon/img/kakaologout.png","width":"15%", "height":"15%"});
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
         createKakaotalkLogin();
      }
   });
</script>
<!------------------- 로그인 스크립트 끝 ----------------------->

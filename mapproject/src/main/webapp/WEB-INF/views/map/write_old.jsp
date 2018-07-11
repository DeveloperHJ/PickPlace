<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../../header.jsp" flush="true" />

<body>
<div class="loader">
	<div class="loader-outter"></div>
	<div class="loader-inner"></div>
</div>

<!-- 움직이는 컨테이너 클래스 시작 -->
<div class="body-container container-fluid">
	<!-- 모바일화면일 때 나타나는 메뉴 버튼 -->
	<a class="menu-btn" href="javascript:void(0)"> <i
		class="ion ion-grid"></i>
	</a>

	<div class="row justify-content-center">

		<jsp:include page="../../nav.jsp" flush="true" />

		<!--=================== content 시작 ====================-->
		<div class="col-lg-10 col-md-5 col-12 body_block align-content-center">
		<form action="/map/write" method="post">
		<!-- mnum, kakaoEmail, mtitle, mlocal, mcontent, beginLat, beginLng (7)-->
		
			<input type="hidden" name="kakaoEmail" class="form-control" value="test@test.com">
			<input type="text" name="mtitle" class="form-control" placeholder="나만의 지도 제목을 입력해주세요.">
			<input type="text" name="mlocal" class="form-control" placeholder="어떤 지역 중심의 지도인가요?">
			<input type="text" name="mcontent" class="form-control" placeholder="지도 설명">
			<input type="text" name="beginLat" class="form-control" placeholder="지도 시작 위도">
			<input type="text" name="beginLng" class="form-control" placeholder="지도 시작 경도">
			
			<button type="submit">등록</button>
		</form>
		</div>
		<!--=================== content 끝 ======================-->
		
	</div>
</div>

<!-- 스크립트 모음 -->
<jsp:include page="../../footer.jsp" flush="true" />
</body>
</html>
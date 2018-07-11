<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

	<!-- 컨테이너 row 시작 -->
	<div class="row justify-content-center">
		<jsp:include page="../../nav.jsp" flush="true" />

		<!--=================== 컨테이너 column content 시작 ====================-->
		<div
			class="col-lg-10 col-md-9 col-12 body_block align-content-center">
			<div class="portfolio">
				<div class="container-fluid">
					<!-- 기록 만들기 버튼 -->
					<a href="#" data-toggle="modal" data-target="#myModal" title="${mapdto.mtitle}">
					<img src="/cocoon/img/mapwrite.png" alt="mapwrite"  width="97.5" height="97.5">
					</a>
					
					<!--=================== 기록 목록 시작 ====================-->
					<div class="grid img-container justify-content-center no-gutters">
						<div class="grid-sizer col-sm-12 col-md-6 col-lg-3"></div>

						<c:forEach items="${maplist}" var="mapdto">
							<div class="grid-item  design col-sm-12 col-md-6 col-lg-3">
								<a href="/map/mapview?mnum=${mapdto.mnum}">
									<div class="project_box_one">
										<!-- 나의 기록 박스 -->
										<div style="height: 360px;">${mapdto.mtitle}</div>
										<div class="product_info">
											<div class="product_info_text">
												<div class="product_info_text_inner">
													<i class="ion ion-plus"></i>
													<h4>
														<b>${mapdto.mtitle}</b><br>${mapdto.mcontent}</h4>
												</div>
											</div>
										</div>
										<!-- 나의 기록 박스 끝 -->
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
					<!--=================== 작품집 끝 ====================-->
				</div>
			</div>
			<!--=================== content 끝 ====================-->
		</div>
	</div>
	<!-- 컨테이너 row 끝 -->
</div>
<!-- 움직이는 컨테이너 클래스 끝 -->

<!-- 기록 만들기 모달 창 시작 -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			
			<!-- mnum, kakaoEmail, mtitle, mlocal, mcontent, beginLat, beginLng (7)-->
			<form action="/map/write" method="post">
			
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">나의 지도 만들기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
					<input type="hidden" name="kakaoEmail" class="form-control" value="test@test.com">
					<input type="text" name="mtitle" class="form-control" placeholder="나만의 지도 제목을 입력해주세요.">
					  <!-- 선택창은 못생겼음
					  <select class="form-control" name="mlocal">
					    <option value="전국">
					    	전국</option>
					    <option value="서울">		    
					    	서울</option>
					    <option value="울산">	
					    	울산</option>
					    <option value="부산">
					    	부산</option>
					  </select>  
					  -->
					<input type="text" name="mlocal" class="form-control" placeholder="어떤 지역 중심의 지도인가요?  ex)전국, 서울, 부산…">
					<input type="text" name="mcontent" class="form-control" placeholder="어떤 지도인가요? 간단한 설명을 입력할 수 있습니다.">
					<input type="hidden" name="beginLat" class="form-control" value="123456">
					<input type="hidden" name="beginLng" class="form-control" value="1234567">
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="submit" class="btn btn-danger" >등록</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
			</form>

		</div>
	</div>
</div>
<!-- 기록 만들기 모달 창 끝 -->

<!-- 스크립트 모음 -->
<jsp:include page="../../footer.jsp" flush="true" />

</body>
</html>
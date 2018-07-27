<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../header.jsp" flush="true" />

<jsp:include page="../../nav.jsp" flush="true" />

<script>
// Map write Script
$(function() {
	$("#submitBtn").click(function() {
        if($("#mlocal > option:selected").val() == '99') {
        	alert("지역을 선택해주세요!");
        } else {
	        var mlocal = document.getElementById("mlocal");
	        var areaCode = mlocal.options[mlocal.selectedIndex].value;
	        
	        var lat = getLatLngCenter(areaCode, 'lat');
	        var lng = getLatLngCenter(areaCode, 'lng');
			
	        $("#beginLat").val(lat);
	        $("#beginLng").val(lng);
	        
			$('#mapWrite').submit();
        }
	});
});

function getLatLngCenter(areaCode, latlng) {
	var lat, lng; 
	var beginLatLng;
	
   switch(areaCode) {
      case '1':
         lat = 37.557750452485635;
         lng = 126.97501055346655;
         break;
      case '2':
         lat = 37.386534428365266;
         lng = 126.64552533908758;
         break;
      case '3':
         lat = 36.325302330271185;
         lng = 127.3859580408177;
         break;
      case '4':
         lat = 35.8815677641002;
         lng = 128.59712964326022;
         break;
      case '5':
         lat = 35.14914624766172;
         lng = 126.86339230622634;
         break;
      case '6':
         lat = 35.16361404389137;
         lng = 129.0830419992461;
         break;
      case '7':
         lat = 35.532380960023396;
         lng = 129.35216026190272;
         break;
      case '8':
         lat = 36.487077796338696;
         lng = 127.28390926365512;
         break;
      case '31':
         lat = 37.46716135397679;
         lng = 127.11792344838034;
         break;
      case '32':
         lat = 37.676844678218934;
         lng = 128.49663828911716;
         break;
      case '33':
         lat = 36.59572816261608;
         lng = 127.66302138630323;
         break;
      case '34':
         lat = 36.422243288308316;
         lng = 126.99928635621353;
         break;
      case '35':
         lat = 36.279155411855136;
         lng = 128.8227827174454;
         break;
      case '36':
         lat = 35.25319638515488;
         lng = 128.2257328277327;
         break;
      case '37':
         lat = 35.79469877531789;
         lng = 126.9539806747013;
         break;
      case '38':
         lat = 34.821521368613794;
         lng = 126.91430378714884;
         break;
      case '39':
         lat = 33.37141453965898;
         lng = 126.55813483405176;
         break;
      default:
         break;
   }
   
   if(latlng == 'lat') {
	   beginLatLng = lat;
   } else if(latlng == 'lng') {
	   beginLatLng = lng;
   }
   
   return beginLatLng;
}

</script>


<section id="inner-headline">
	<div class="container" style="align-content: center;">
		<div class="row">
			<div class="col-lg-12">
				<ul class="breadcrumb">
					<li><a href="#"><i class="fa fa-home"></i></a>
					<i class="icon-angle-right"></i></li>
					<li class="active">지도목록</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
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

						<!--=================== 컨테이너 column content 시작 ====================-->
						<div
							class="col-lg-12 col-md-6 col-12 body_block align-content-center">
							<div class="portfolio">
								<div class="container-fluid">
									<!-- 기록 만들기 버튼 -->
									<div style='vertical-align: middle; text-align: center;'>
										<h4>
											아래의 '+'를 눌러서 나만의 여행지도 작성하기!<br> 
											<a href="#" data-toggle="modal" data-target="#myModal"> 
											<img src="/moderna/img/+.png" alt="mapwrite" width="97.5" height="97.5">
											</a>
										</h4>
									</div>

									<!--=================== 기록 목록 시작 ====================-->
									<div class="grid justify-content-center no-gutters" style="">
										<!-- <div class="grid-sizer col-sm-12 col-md-6 col-lg-3"></div> -->

										<c:forEach items="${maplist}" var="mapdto">
											<!-- <a href="#" data-toggle="modal" data-target="#viewModal"> -->
											<a href="/map/mapview?mnum=${mapdto.mnum}">
												<div class="card text-white bg-dark mb-3" style="width: 50rem; height: 18rem; margin: 15px; display: inline-block">
													<div class="card-header">${mapdto.mtitle}</div>
													<div class="card-body">
														<h5 class="card-title" style="color:white;">${mapdto.mcontent}</h5>
														<p class="card-text">
															작성일 : ${mapdto.mcdate}<br> 수정일 : ${mapdto.mudate}
														</p>
													</div>
												</div> <!-- 나의 기록 박스 끝 -->
											</a>
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
			</div>
		</div>
	</div>
	<!-- 움직이는 컨테이너 클래스 끝 -->

	<!-- 기록 만들기 모달 창 시작 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-centered modal-center">
			<div class="modal-content">

				<!-- mnum, kakaoid, mtitle, mlocal, mcontent, beginLat, beginLng (7)-->
				<form action="/map/write" method="post" id="mapWrite">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">나의 지도 만들기</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<input type="hidden" name="kakaoid" class="form-control" value="itskim3"> 
						<input type="text" name="mtitle" class="form-control" placeholder="나만의 지도 제목을 입력해주세요.">
						<select class="form-control" name="mlocal" id="mlocal">
							<option value="99">만드실 지도의 대표 지역을 선택해주세요.</option>
                            <option value="0">전국</option>
                            <option value="1">서울</option>
                            <option value="2">인천</option>
                            <option value="3">대전</option>
                            <option value="4">대구</option>
                            <option value="5">광주</option>
                            <option value="6">부산</option>
                            <option value="7">울산</option>
                            <option value="8">세종</option>
                            <option value="31">경기</option>
                            <option value="32">강원</option>
                            <option value="33">충북</option>
                            <option value="34">충남</option>
                            <option value="35">경북</option>
                            <option value="36">경남</option>
                            <option value="37">전북</option>
                            <option value="38">전남</option>
                            <option value="39">제주</option>
                       </select> 
						<input type="text" name="mcontent" class="form-control" placeholder="어떤 지도인가요? 간단한 설명을 입력할 수 있습니다."> 
						<input type="hidden" id="beginLat" name="beginLat" class="form-control">
						<input type="hidden" id="beginLng" name="beginLng" class="form-control">
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" id="submitBtn" class="btn btn-danger">등록</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</form>

			</div>
		</div>
	</div>
	<!-- 기록 만들기 모달 창 끝 -->

<jsp:include page="../../header.jsp" flush="true" />
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
</body>
</html>
<jsp:include page="../../footer.jsp" flush="true" />
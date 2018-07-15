<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
    .map_addrInfo {position:relative;width:100%;height:350px;}
    .addrTitle {font-weight:bold;display:block;font-size:14px;}
    .headAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddress {display:block;margin-top:2px;font-weight: normal;}
    .bubjungAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    
    .infoWindowDiv {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .infoWindowDiv * {padding: 0;margin: 0;}
    .infoWindowDiv .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .infoWindowDiv .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>

<body>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df8bb19db219b164017e5e5170474bfb&libraries=services,clusterer,drawing"></script>
		
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
		<div class="col-lg-10 col-md-9 col-12 align-content-center" style="background-color: #DFDFDF;">
			<div class="map_addrInfo" style="width: 100%; height: 100%; float: left;">
			   <div id="map" style="width:100%;height:800px;position:relative;overflow:hidden;">
			   </div>
			   <div class="headAddr">
			       <span class="addrTitle">지도중심기준 행정동 주소정보</span>
			       <span id="centerAddress"></span>
			   </div>
			</div>
			<p id="result">주소값</p>
		</div>
		<!--=================== content 끝 ====================-->
	</div>
</div>

<!-- 핀 등록 시 기록 선택 모달창 -->
<div class="modal fade" tabindex="-1" role="dialog" id="selectMap">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <label class="input-group-text" for="mapTitleList">목록</label>
			  </div>
			  <select class="custom-select" id="mapTitleList">
			    <option selected>해당 핀을 저장하실 목록을 선택해주세요~</option>
			    <c:forEach items="${mymaplist}" var="mapdto">
		   			<option value="${mapdto.mnum}">${mapdto.mtitle}</option>
		  		</c:forEach>  
			  </select>
		  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="savePin">저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- 핀 등록 시 기록 선택 모달창 끝 -->


<!-- 지도 스크립트 -->
<script>
 var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
     center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
     level : 12 // 지도의 확대 레벨 
 });
 
 // 마커 클러스터러 생성
 var clusterer = new daum.maps.MarkerClusterer({
     map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
     averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
     minLevel: 10 // 클러스터 할 최소 지도 레벨 
 });
 
 // 주소-좌표 변환 객체 생성 
 var geocoder = new daum.maps.services.Geocoder();
 
 // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시 
 searchAddrFromCoords(map.getCenter(), displayCenterInfo);  

 // JQuery로 getJSON, 마커 생성 및 클러스터러 객체에 넘겨줌. 
 // 데이터에 근거한 마커 표시, 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
 //	resources/json/ulsanlist2.json : 울산 지역 데이터
 // /pin/list : 우리 데이터
/*  $.get("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?" +
		 "ServiceKey=MaGP4FtoJKEQP9EbzPCPcOzp7Ko2WN1%2B4b60alL0v0OYT3EGo4daFaOFoKiulrPJKHNCvkdm%2FjWXHv7TviAAMg%3D%3D" + 
		 "&contentTypeId=&areaCode=&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide" + 
		 "&arrange=A&numOfRows=25000&_type=json" data.response.body.items.item*/
	$.get("resources/json/ulsanlist2.json"
		, function(data) {   
     var markers = $(data.item).map(function(i, position) {
        var marker = new daum.maps.Marker({
             position : new daum.maps.LatLng(position.lat, position.lng)
         });
         
        var infoContent = document.createElement('div');
   
        var btn = document.createElement('button');
        btn.innerHTML = '내 기록에 저장하기';
        infoContent.appendChild(btn); 
        infoContent.innerHTML = '<div class="infoWindowDiv">' + 
						        '    <div class="info">' + 
						        '        <div class="title">' + 
						        '            장소정보' + 
						        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
						        '        </div>' + 
						        '        <div class="body">' + 
						        '            <div class="img">' +
						        '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
						        '           </div>' + 
						        '            <div class="desc">' + 
						        '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
						        '                <div class="jibun ellipsis">' + marker.getPosition().getLat() + ', ' + marker.getPosition().getLng() + '</div>' +
						        '				 <button type="button" onclick="insertPin(' + marker.getPosition().getLat() + ',' + marker.getPosition().getLng() + ')">내 기록에 저장하기</button>' +
						        '            </div>' + 
						        '        </div>' + 
						        '    </div>' +    
						        '</div>';
/*         infoContent.innerHTML = '<div id="infoWindowDiv">' + 
        	'위도 : ' + marker.getPosition().getLat() + ' 경도 : ' + marker.getPosition().getLng() + '<br></div>'; */
        
       infoRemovable = true; // 인포윈도우 X 버튼 생성 
       
       // 인포윈도우 객체 생성
       var infoWindow = new daum.maps.InfoWindow({
          content : infoContent,  
          removable : infoRemovable
       });
       
       // 마커 클릭 시 인포윈도우 생성 이벤트 
       daum.maps.event.addListener(marker, 'click', function(mouseEvent) {
            searchDetailAddrFromCoords(marker.getPosition(), function(result, status) {
              if(status == daum.maps.services.Status.OK) {
                 var detailAddress = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                       detailAddress += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
                     
                    var addContent = '<div class="bubjungAddr">' +
                                     '<span class="title">법정동 주소정보</span>' + 
                                     detailAddress + '</div>';
              }
               
               // 받아온 도로명 주소 인포윈도우에 띄우기
               /* infoWindow.setContent(addContent);   */
               
               // 기본 인포윈도우 띄우기
               infoWindow.open(map, marker);
               
               // 버튼 클릭 시 모달 창 팝업
               btn.addEventListener('click', function() { 
	               $('#selectMap').modal({
	            	   keyboard: true
	               });
	               
	               $('#savePin').off('click');
	               
	                // 모달 저장버튼 클릭 시 핀 등록
	           		$('#savePin').on('click', function(e) {
	           			e.preventDefault();
	           			var mapList = document.getElementById("mapTitleList");
	           			var mnum = mapList.options[mapList.selectedIndex].value;
	           			insertPin(mnum, marker.getPosition());
	           		});
               });  
             }); 
        }); 
         
         return marker;
         
         clickable: true;              
     });   // var markers 끝.
     
     clusterer.addMarkers(markers);
 }); // $.get() 끝.
 
 // 핀 등록 메서드 mnum, positions
 function insertPin(lat, lng){
   console.log("LAT" + lat);
   console.log("lNG" + lng);
   $.ajax
   ({
      type:"POST",
      url:"/pin/insert",
      headers:{
         "Content-Type" : "application/json; charset=utf-8",
         "X-HTTP-Method-Override" : "POST"
      },
      dataType: "text",
      data: JSON.stringify({
         mnum: 1, 
         pmemo: "test...",
         ptheme:"blue2",
         pinLat: lat,
         pinLng: lng,
         rate:"1"
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
 }

 // =================================== ▼ 좌표를 통해 주소 표시 메서드 ▼ ============================== 
 // ===================================== 아직 반영하지 않음 ==========================================
 
 // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
 daum.maps.event.addListener(map, 'idle', function() {
     searchAddrFromCoords(map.getCenter(), displayCenterInfo);
 });
 
 function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
 }

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === daum.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddress');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
} 
</script>

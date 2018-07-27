<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<style>
    .wrap {position: absolute;left:-213px;bottom:70px;width:400px;height:132px;text-align: left;overflow: hidden;font-size: px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 400px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 2px 0 0 10px; height: 35px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold; background-color:#64D0FF; }
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 0px 0 0 90px;height: 140px;margin-top: 0px; margin-bottom: 2px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis; white-space: nowrap;font-size: 11px;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 74px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden; padding-bottom: 5px;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    .star {width:7%; height:7%}
    .star2 {width:10%; height:14%}
    
.map_wrap, .map_wrap * {
   margin: 0;
   padding: 0;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
   color: #000;
   text-decoration: none;
}

.map_wrap {
   position: relative;
   width: 100%;
   height: 500px;
}

.title {
   font-weight: bold;
   display: block;
}

.hAddr {
   position: absolute;
   left: 2px;
   top: 10px;
   border-radius: 2px;
   background: #fff;
   background: rgba(255, 255, 255, 0.8);
   z-index: 1;
   padding: 5px;
   margin-left: 10px;
}

#centerAddr {
   display: block;
   margin-top: 2px;
   font-weight: normal;
}

.bAddr {
   padding: 5px;
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

#menu_wrap {
   position: absolute;
   top: 0;
   left: 0;
   bottom: 0;
   width: 250px;
   margin: 10px 0 30px 10px;
   padding: 5px;
   overflow-y: auto;
   background: rgba(255, 255, 255, 0.7);
   z-index: 1;
   font-size: 12px;
   border-radius: 10px;
}

.bg_white {
   background: #fff;
}

#menu_wrap hr {
   display: block;
   height: 1px;
   border: 0;
   border-top: 2px solid #5F5F5F;
   margin: 3px 0;
}

#menu_wrap .option {
   text-align: center;
}

#menu_wrap .option p {
   margin: 10px 0;
}

#menu_wrap .option button {
   margin-left: 5px;
}

#placesList li {
   list-style: none;
}

#placesList .item {
   position: relative;
   border-bottom: 1px solid #888;
   overflow: hidden;
   cursor: pointer;
   min-height: 65px;
}

#placesList .item span {
   display: block;
   margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

#placesList .item .info {
   padding: 10px 0 10px 55px;
}

#placesList .info .gray {
   color: #8a8a8a;
}

#placesList .info .jibun {
   padding-left: 26px;
   background:
      url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
      no-repeat;
}

#placesList .info .tel {
   color: #009900;
}

#placesList .item .markerbg {
   float: left;
   position: absolute;
   width: 36px;
   height: 37px;
   margin: 10px 0 0 10px;
   background:
      url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
      no-repeat;
}

#placesList .item .marker_1 {
   background-position: 0 -10px;
}

#placesList .item .marker_2 {
   background-position: 0 -56px;
}

#placesList .item .marker_3 {
   background-position: 0 -102px
}

#placesList .item .marker_4 {
   background-position: 0 -148px;
}

#placesList .item .marker_5 {
   background-position: 0 -194px;
}

#placesList .item .marker_6 {
   background-position: 0 -240px;
}

#placesList .item .marker_7 {
   background-position: 0 -286px;
}

#placesList .item .marker_8 {
   background-position: 0 -332px;
}

#placesList .item .marker_9 {
   background-position: 0 -378px;
}

#placesList .item .marker_10 {
   background-position: 0 -423px;
}

#placesList .item .marker_11 {
   background-position: 0 -470px;
}

#placesList .item .marker_12 {
   background-position: 0 -516px;
}

#placesList .item .marker_13 {
   background-position: 0 -562px;
}

#placesList .item .marker_14 {
   background-position: 0 -608px;
}

#placesList .item .marker_15 {
   background-position: 0 -654px;
}

#pagination {
   margin: 10px auto;
   text-align: center;
}

#pagination a {
   display: inline-block;
   margin-right: 10px;
}

#pagination .on {
   font-weight: bold;
   cursor: default;
   color: #777;
}

#pinWriteInfo {
   font-size:10px;
}

.star {width:18%; height:12%}

.overlay {
    position:absolute;
    left: -50px;
    top:0;
    bottom: 40px;
    width:300px;
    height: 200px;
    background: #fff;
    border:1px solid #ccc;
    border-radius: 5px;
    padding:5px;
    font-size:12px;
    text-align: center;
    white-space: pre;
    word-wrap: break-word;
}

</style>

<jsp:include page="../../header.jsp" flush="true" />
<jsp:include page="../../nav.jsp" flush="true" />

<section id="inner-headline">
         <div class="container">
            <div class="row">
               <div class="col-lg-12">
               </div>
            </div>
         </div>
</section>

<script>
function searchDiv() {
    var searchDiv = document.getElementById("menu_wrap");
    if (searchDiv.style.display === "none") {
       searchDiv.style.display = "block";
    } else {
       searchDiv.style.display = "none";
    }
}
</script>

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

   <!-- 컨테이너 row 시작 -->
   <div class="row justify-content-center">
      <h4 style="text-align: center;">새로운 장소를 등록하길 원하시나요? 원하는 위치에 지도를
            우클릭해주세요! 지도의 다른 위치를 클릭하면 마커가 사라집니다.</h4>
      <!--======================================= Content1 - Map 시작 ======================================-->
      <div class="col-lg-9 col-md-9 col-12 align-content-center">
         <div class="map_wrap" style="width: 100%; height: 60%; float: left; padding-bottom: 10px;">
            <div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"><p></div>
                 <div class="hAddr">
                        <span class="title">선택반경기준 주소정보</span> <span id="centerAddr"></span>
                 </div>
            <div id="menu_wrap" class="bg_white" style="display: none;">
               <div class="option">
                  <div>
                     <form onsubmit="searchPlaces(); return false;">
                        키워드 : <input type="text" value="" placeholder="검색어를 입력해 주세요" id="keyword" size="15">
                        <button type="submit">검색하기</button>
                     </form>
                  </div>
               </div>
               <hr>
               <ul id="placesList"></ul>
               <div id="pagination"></div>
            </div>
         </div>
      </div>
      <!--======================================= Content1 - Map 끝 ======================================-->
      
      <!--==================================== content2 - MapInfo 시작 ===================================-->                                 
      <div class="col-lg-3 col-md-3 col-12 align-content-center">
         <form name="pinWrite" id="pinWriteForm">
            <div id="pinWriteInfo" class="card" style="margin:2px; padding:2px; padding-bottom:30px; padding-right:10px; display: none; height:558px;">
              <div class="card-body">
                <h5 class="card-title" style="color: white;">나만의 장소 등록하기</h5>
                   <input type="hidden" name="mnum" id="mnum" value="${view.mnum}" />
                   <input type="hidden" name="ptheme" id="ptheme" value="blue" />
                   <input type="hidden" name="rate" id="rate" value="" />
                   <input type="hidden" name="pinLat" id="pinLat" />
                   <input type="hidden" name="pinLng" id="pinLng" /> 
                <h6 class="card-subtitle mb-2 text-muted">
                      <input class="form-control" type="text" name="ptitle" id="ptitle" placeholder="장소 이름을 입력해주세요." style="width:100%; height: 30px;" /></h6>
                <p class="card-text">
                   <textarea class="form-control" name="pmemo" id="pmemo" cols="50" rows="3" placeholder="내 장소에 대한 간단한 메모를 입력할 수 있습니다. 25자 이내" 
                   			 style="width:100%; resize: none;"></textarea>
                   <h6>별점을 선택해주세요!</h6> 
                       <IMG class="star" id=image1 onmouseover=show(1) onclick=mark(1) onmouseout=noshow(1) src="/moderna/img/star.png">
                      <IMG class="star" id=image2 onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2) src="/moderna/img/star.png">
                      <IMG class="star" id=image3 onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3) src="/moderna/img/star.png">
                      <IMG class="star" id=image4 onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4) src="/moderna/img/star.png">
                      <IMG class="star" id=image5 onmouseover=show(5) onclick=mark(5) onmouseout=noshow(5) src="/moderna/img/star.png">
                </p>
                <div style="margin-top: 5px;">
                   <input type="button" style="float: right;" class="btn btn-success btn-sm" onclick="myPininsert()" value="내 장소 저장하기">
                </div>
              </div>
            </div>
         </form>
      </div>
      <p>
      <br/>
	</div>
    <!--==================================== content2 - MapInfo 끝 ===================================-->
   
<!--==================================== 기록 정보 테이블 DIV ===================================-->
<div style="float: right;">
         <button class="btn btn-info" onclick="searchDiv()">장소 검색하기</button>&nbsp;
         <button class="btn btn-info" onclick="deleteMap()">이 기록 삭제</button> 
</div>
    
<div class="container-fluid" style="padding-top: 30px;">
	<table class="table table-hover">
	<thead>
		<tr>
		   <th>제목</th>
		   <th>내용</th>
		   <th>작성일</th>
		   <th>수정일</th>
		</tr>
	</thead>
		<tfoot>
			<tr>
			<td>${view.mtitle}</td>
			<td>${view.mcontent}</td>
			<td>${view.mcdate}</td>
			<td>${view.mudate}</td>
			</tr>
		</tfoot>
	</table>
	</div>
</div>
<!--==================================== 기록 정보 테이블 DIV ===================================-->

<!-------------------------------------- 지도스크립트 시작 ---------------------------------------->
<script>
var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
    level : 11 // 지도의 확대 레벨 
});

// 마커 클러스터러를 생성합니다 
var clusterer = new daum.maps.MarkerClusterer({
   map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
   averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
   minLevel : 10 // 클러스터 할 최소 지도 레벨 
});

var beginLat = ${view.beginLat};
var beginLng = ${view.beginLng};
 
// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
$.getJSON("/pin/list/"+${view.mnum}, function(data) {
	var centerLatLng = new daum.maps.LatLng(beginLat, beginLng);
	map.setCenter(centerLatLng);
	
   var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',    
   imageSize = new daum.maps.Size(32, 34), // 마커이미지의 크기입니다
   imageOption = {
      offset : new daum.maps.Point(27, 69)
   }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
   //마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
   var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
   
   // 데이터에서 좌표 값을 가지고 마커를 표시합니다
   // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
   var markers = $(data.item).map(function(i, position) {
      var marker = new daum.maps.Marker({
         position : new daum.maps.LatLng(position.pinLat, position.pinLng),
         image : markerImage
      });

      // rate 세팅
      var stringRate = position.rate;
      var intRate = 1; 
      var star = '';

      switch(stringRate) {
         case 1 : 
            intRate = 1;
            break;
         case 2 :
            intRate = 2;
            break;
         case 3 : 
            intRate = 3;
            break;
         case 4 : 
            intRate = 4;
            break;
         case 5 : 
            intRate = 5;
            break;
         };
         
      for(var i = 0; i<intRate; i++){
         star += '<img class="star2" src="/moderna/img/star_full.png">';
      }
      for(var i = 0; i<5-intRate; i++){
         star += '<img class="star2" src="/moderna/img/star.png">';
      }
     
      // 오버레이 DOM 객체로 div 생성 
      var wrap = document.createElement('div');
        wrap.className = 'wrap';

        var info = document.createElement('div');
        info.className = 'info';

        var title = document.createElement('div');
        title.className = 'title';
        title.innerHTML = position.ptitle;

        var close = document.createElement('div');
        close.className = 'close';
        close.onclick = function() { closeOverlay() };

        var body = document.createElement('div');
        body.className = 'body';

        var img = document.createElement('div');
        img.className = 'img';

        var firstimage = document.createElement('img');
        firstimage.src = '/moderna/img/nullimage.png';
        firstimage.width = '73';
        firstimage.height = '70';
		
        var desc = document.createElement('div');
        desc.className = 'desc';
        
        var ellipsis = document.createElement('div');
        ellipsis.className = 'ellipsis';
        ellipsis.innerHTML = position.pmemo;
        
        var ellipsis2 = document.createElement('div');
        ellipsis2.className = 'ellipsis';
        ellipsis2.innerHTML = star;
        
        var jibun = document.createElement('div');
        jibun.className = 'jibun ellipsis';
 
        img.appendChild(firstimage);
        
        desc.appendChild(ellipsis);
        desc.appendChild(ellipsis2);
        desc.appendChild(jibun);

        body.appendChild(img);
        body.appendChild(desc);
        
        title.appendChild(close);

        info.appendChild(title);
        info.appendChild(body);

        wrap.appendChild(info);

		// 커스텀 오버레이 객체 생성
		var overlay = new daum.maps.CustomOverlay({
		   content : wrap,  
		}); 
		
		// 마커 클릭 시 커스텀오버레이 생성 이벤트 
		daum.maps.event.addListener(marker, 'click', function(mouseEvent) {
 				// 주소명 넣기
			   searchDetailAddrFromCoords(marker.getPosition(), function(result, status) {
				      if (status === daum.maps.services.Status.OK) {
				    	  jibun.innerHTML =  !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
				    	  jibun.innerHTML += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
				      }
			   }); 
		 overlay.setMap(map);
		 overlay.setPosition(marker.getPosition());
		}); 
		  
		// 오버레이 닫기 메서드 
		function closeOverlay() {
		  overlay.setMap(null);     
		}
		
      return marker;
      
      clickable:true;
   }); // var markers 끝.
     
   clusterer.addMarkers(markers);
}); // $.getJSON() 끝. 

// 기록 삭제 메소드
function deleteMap() {
    msg = "회원님이 등록한 마커도 모두 삭제됩니다. 정말 삭제하시겠습니까?";
    if (confirm(msg)!=0) {
    	location.href='/map/delete?mnum=${view.mnum}'
    } 
}

//========================================== 새 장소 등록 관련 우클릭 이벤트 시작 ========================================

var locked = 0;

<!-- 채워져 있는 별 이미지 넣는 부분 -->
function show(star) 
{
   if (locked) { 
      locked=0;
      $("#rate").val(0);
   };
   
   var i;
   var image;
   var el;
   var e = document.getElementById('rate');
   var stateMSG;

 for (i=1; i<=star; i++) {
     image = 'image' + i;
     el = document.getElementById(image); 
     el.src="/moderna/img/star_full.png";
 }

   switch (star) {
      case 1:
         stateMSG = "2";
         break;
      case 2:
         stateMSG = "4";
         break;
      case 3:
         stateMSG = "6";
         break;
      case 4:
         stateMSG = "8";
         break;
      case 5:
         stateMSG = "10";
         break;
      default:
         stateMSG = "";
   }

   document.innerHTML = stateMSG;
}

//비어있는 별 이미지 넣는 부분
function noshow(star)
{
 if (locked) return;
 var i;
 var image;
 var el;

 for (i=1; i<=star; i++) {
     image = 'image' + i;
     el = document.getElementById(image);
     el.src="/moderna/img/star.png";
 }
} 

function lock(star)
{
 show(star);
 locked = 1;
}

function mark(star)
{   
   lock(star);
   $("#rate").val(star);
}

var pinMarkerImg = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',    
pinImageSize = new daum.maps.Size(32, 34), // 마커이미지의 크기입니다
pinImageOption = {
   offset : new daum.maps.Point(10, 30)
}; 

var pinMarkerImage = new daum.maps.MarkerImage(pinMarkerImg, pinImageSize, pinImageOption);

var pinMarker = new daum.maps.Marker({
 draggable : true,
 image : pinMarkerImage
});

daum.maps.event.addListener(map, 'rightclick', function(mouseEvent) { 
 var latlng = mouseEvent.latLng; 
   console.log(latlng.getLat());
   console.log(latlng.getLng());
 
 pinMarker.setPosition(latlng);
 pinMarker.setMap(map);
 
 $("#pinWriteInfo").show();
 $("#pinLat").val(latlng.getLat());
 $("#pinLng").val(latlng.getLng());
});

daum.maps.event.addListener(map, 'click', function(mouseEvent) { 
   pinMarker.setMap(null);
   $("#pinWriteInfo").hide();
});

function myPininsert() {
   var mnum = $("#mnum").val(),
      pmemo = $("#pmemo").val(), 
      ptheme = $("#ptheme").val(),
      pinLat = $("#pinLat").val(),
      pinLng = $("#pinLng").val(),
      rate = $("#rate").val(),
      ptitle = $("#ptitle").val();
   
   if(rate == 0) {
      alert("별점을 입력해주세요!");
   } else if(ptitle == null) {
      alert("장소 이름을 입력해주세요!");
   } else {
        $.ajax({
         type: "POST",
         url: "/pin/insert",
         headers:{
            "Content-Type" : "application/json; charset=utf-8",
            "X-HTTP-Method-Override" : "POST"
         },
         dataType: "text",
         data: JSON.stringify({
            mnum : mnum,
            pmemo : pmemo, 
            ptheme : ptheme,
            pinLat : pinLat,
            pinLng : pinLng,
            rate : rate,
            ptitle : ptitle
         }),
         success: function(result){
            alert('핀 등록 성공');
            $("#pmemo").val('');
            $("#ptitle").val('');
            noshow(5);
         },
         error:function(e){
            alert('핀 등록 실패');
            console.log("실패" + e)
         }
      });
   }
};

//========================================== 새 장소 등록 관련 우클릭 이벤트 끝 ========================================

// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);


//===================================== 좌표를 통한 주소 정보 표시 이벤트 ==========================================
//중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', function() {
   searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

//좌표로 주소 정보 요청 메서드
function searchAddrFromCoords(coords, callback) {
   geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
}

//좌표로 법정동 상세 주소 정보 요청 메서드
function searchDetailAddrFromCoords(coords, callback) {
   geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
   if (status === daum.maps.services.Status.OK) {
      var infoDiv = document.getElementById('centerAddr');

      for (var i = 0; i < result.length; i++) {
         // 행정동의 region_type 값은 'H' 이므로
         if (result[i].region_type === 'H') {
            infoDiv.innerHTML = result[i].address_name;
            break;
         }
      }
   }
}


// =========================================== 검색 관련 스크립트 시작 ===========================================
// 마커를 담을 배열입니다
var markers = [];

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

   /*  if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    } */

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
        alert('검색 결과가 존재하지 않습니다.');
        return;
    } else if (status === daum.maps.services.Status.ERROR) {
        alert('검색 결과 중 오류가 발생했습니다.');
        return;
    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    map.setCenter(marker.getPosition());
    map.setLevel(2);
    infowindow.setContent(content);
    infowindow.open(map, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>

<jsp:include page="../../footer.jsp" flush="true" />
</body>
</html>
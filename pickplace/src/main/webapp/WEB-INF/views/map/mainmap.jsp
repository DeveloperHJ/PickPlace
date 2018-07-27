<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.map_wrap {
   width: 100%;
   height: 1000px;
}

.title {
   font-weight: bold;
   display: block;
}

.hAddr {
   position: absolute;
   left: 10px;
   top: 10px;
   border-radius: 2px;
   background: #fff;
   background: rgba(255, 255, 255, 0.8);
   z-index: 1;
   padding: 5px;
   margin-left: 40px;
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

</style>

<jsp:include page="../../header.jsp" flush="true" />


<body>
   <div id="wrapper">
      <jsp:include page="../../nav.jsp" flush="true" />

      <section id="featured">
         <!-- start slider -->
         <div class="container" style="width: 80%; height: 100%">
            <div class="row">
               <div class="col-lg-12">
                  <!-- Slider -->
                  <div id="main-slider" class="flexslider">
                     <ul class="slides">
                        <li><img src="/moderna/img/크기변환_제주유채꽃밭.jpg" alt="" />
                           <div class="flex-caption">
                              <h3>어디로 여행갈까?</h3>
                              <p>PickPlace에서 제공하는 지도를 보고 인기여행지 파악하기!</p>
                              <a id="tobody" href="#callaction" class="btn btn-theme">지도보러 가기!</a>
                           </div></li>
                        <li><img src="/moderna/img/서울1.png" alt="" />
                           <div class="flex-caption">
                              <h3>
                                 나만의<br>여행기록하기!
                              </h3>
                              <p>내가 가고싶은 곳, 갔던 곳을 핀으로 콕! 찍고 별점과 후기를 남겨요!</p>
                              <!-- <a href="#" class="btn btn-theme">Learn More</a> -->
                           </div></li>
                        <li><img src="/moderna/img/크기변환_제주바다.jpg" alt="" />
                           <div class="flex-caption">
                              <h3>
                                 나의 기록을<br>공유한다!
                              </h3>
                              <p>내가 기록한 여행정보를 다른 사람들도 볼 수 있어요!</p>
                              <!-- <a href="#" class="btn btn-theme">Learn More</a> -->
                           </div></li>
                     </ul>
                  </div>
                  <!-- end slider -->
               </div>
            </div>
         </div>
      </section>

      <div class="row">
         <div class="col-lg-12">
            <div class="solidline"></div>
         </div>
      </div>

      <!-- 메인제목적을곳 -->
      <section id="callaction" class="callaction" style="background-color: #DFDFDF; height: 300px;">
         <div class="container">
            <div class="row">
               <div class="col-lg-12">
                  <div class="big-cta">
                     <div class="cta-text">
                        <h2>
                           <span>PickPlace</span> 에서 제공하는 관광정보와<br> 사용자들이 만든 여행정보가 표시된 국내지도 보기!
                        </h2>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <script type="text/javascript"
         src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df8bb19db219b164017e5e5170474bfb&libraries=services,clusterer,drawing"></script>
      <section id="content">
         <div style="float: right; padding-right: 84px;">
            <h5>
               <img src="/moderna/img/marker_blue.png" width=32 height=34>Tour API 에서 제공하는 여행지정보(공공데이터) &nbsp;&nbsp; 
               <img src="/moderna/img/marker_green.png" width=32 height=34>PickPlace의 회원들이 소개하는 여행지정보
            </h5>
         </div>
         <div class="container-fluid">
            <div class="row">
               <div class="col-lg-12">
                  <div class="row">
                     <!-- ==================== 지도 소스 시작 ======================================================== -->
                     <div class="map_wrap">
                        <div id="map" style="width: 95%; height: 80%; position: relative; overflow: hidden; margin-left: 45px;"></div>
                        <div class="hAddr">
                           <span class="title">선택반경기준 주소정보</span> <span id="centerAddr"></span>
                        </div>
                     </div>
                     <!--  -->
                     <p id="result"></p>
                     <!-- ==================== 지도 소스 끝 ======================================================== -->
                  </div>
               </div>
            </div>
         </div>
      </section>
   </div>

   <!-- 핀 등록 시 기록 선택 모달창 -->
<div class="modal fade" tabindex="-1" role="dialog" id="selectMap">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">내 정보에 핀 등록하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <div class="input-group mb-3">
           <div class="input-group-prepend">
             <label class="input-group-text" for="mapTitleList">저장할 수 있는 목록</label>
           </div>
           <select class="form-control" id="mapTitleList">
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

<!-- 첫 화면 시작 시 선택 모달창 시작 -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">여행정보 지역 선택</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
          <div class="form-group">
          <label for="exampleFormControlSelect2">보고 싶은 지역을 골라주세요! <br> 데이터가 많을 시 로딩시간이 길어질 수 있습니다.</label>
          <select class="form-control" id="addressList">
          <option value="0">지역을 선택해주세요.</option>
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
          <input type="checkbox" id="memberListchk" name="memberListchk" value="memberListchk" />회원들이 소개한 여행지역만 보기
        </div>
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
        <button type="button" id="goPickPlace" class="btn btn-primary" onclick="return goPickPlace();">PickPlace 시작하기!</button>
      </div>
    </div>
  </div>
</div>
<!-- 핀 등록 시 기록 선택 모달창 끝 -->

<jsp:include page="../../header.jsp" flush="true" />
<!-- 지도 스크립트 -->
<script>
$(document).ready(function(){
   $("#tobody").on('click', function(event){
	    if(this.hash !== ""){
	        event.preventDefault();
	        
	        var hash = this.hash;
	        
	        $('html, body').animate({
	          scrollTop :$(hash).offset().top
	        },500, function(){
	         
	          window.location.hash = hash;
	        });
	     }
   });
   
   $('#goPickPlace').on('click', function(event){
	    if(this.hash !== ""){
	        event.preventDefault();
	        
	        var hash = this.hash;
	        
	        $('html, body').animate({
	          scrollTop :$(hash).offset().top
	        },500, function(){
	         
	          window.location.hash = hash;
	        });
	     }
   });
});

$(function() {
   $('#exampleModalCenter').modal('show');
});

var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
    level : 11, // 지도의 확대 레벨 
    maxLevel: 11
});

function goPickPlace() {
	location.href="#content"; 

   if($("#memberListchk").prop("checked")) {
      getMemberMapList();
      $('#exampleModalCenter').modal('hide');
   } else {
      console.log($("#addressList > option:selected").val());
      if($("#addressList > option:selected").val() && $("#addressList > option:selected").val() != '0') {
         var addList = document.getElementById("addressList");
         var areaCode = addList.options[addList.selectedIndex].value;
         
         getMemberMapList();
         getMapList(areaCode); 

         // 맵 중심 변경
         var centerLatLng = getLatLngCenter(areaCode);
         map.setCenter(centerLatLng); 
         
         $('#exampleModalCenter').modal('hide');
      } else {
         alert("지역을 선택해주세요!");
         return false;
      }
   }; 
}

// 마커 클러스터러 생성
var clusterer = new daum.maps.MarkerClusterer({
   map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 10, // 클러스터 할 최소 지도 레벨 
    minClusterSize: 10 
});

// 주소-좌표 변환 객체 생성 
var geocoder = new daum.maps.services.Geocoder();

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시 
searchAddrFromCoords(map.getCenter(), displayCenterInfo);  

function getLatLngCenter(areaCode) {
   console.log("getLatLngCenter.areaCode : " + areaCode);
   var lat;
   var lng; 
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
   
   var latlng = new daum.maps.LatLng(lat, lng);
   return latlng;
}

// JQuery로 getJSON, 마커 생성 및 클러스터러 객체에 넘겨줌. 
// 데이터에 근거한 마커 표시, 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
//   resources/json/ulsanlist2.json : 울산 지역 데이터
// /pin/list : 우리 데이터
/*  $.get("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?" +
       "ServiceKey=MaGP4FtoJKEQP9EbzPCPcOzp7Ko2WN1%2B4b60alL0v0OYT3EGo4daFaOFoKiulrPJKHNCvkdm%2FjWXHv7TviAAMg%3D%3D" + 
       "&contentTypeId=&areaCode=&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide" + 
       "&arrange=A&numOfRows=25000&_type=json" data.response.body.items.item*/

function getMemberMapList() {
   $.get("/pin/list", function(data) {   
         var imageSrc = '/moderna/img/marker_green.png',    
         imageSize = new daum.maps.Size(32, 34), // 마커이미지의 크기입니다
         imageOption = {
            offset : new daum.maps.Point(27, 69)
         }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
            
         //마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
         var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
      
          var markers = $(data.item).map(function(i, position) {
             console.log(data.item);
             console.log(data);
                var marker = new daum.maps.Marker({
                  position : new daum.maps.LatLng(position.pinLat, position.pinLng),
                  image: markerImage
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
                  star += '<img class="star" src="/moderna/img/star_full.png">';
               }
               for(var i = 0; i<5-intRate; i++){
                  star += '<img class="star" src="/moderna/img/star.png">';
               }
               
               var pmemo = position.pmemo;
               
               // pmemo 세팅
               if(position.pmemo == null) {
            	   pmemo = '';
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
                 desc.innerHTML = '<div class="ellipsis">' + pmemo + '</div>' + 
                             '<div class="ellipsis">' + star + '</div>' + 
                             '<div style="float:right; padding-right:5px; padding-bottom:5px;">' +
                             '<button class="btn btn-success btn-sm" type="button" ptitle="' + position.ptitle + '" onclick="modalPopup(this,' + marker.getPosition().getLat() + ',' + marker.getPosition().getLng() + ')">내 기록에 저장하기</button>' +
                             '</div>';
                 img.appendChild(firstimage);

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
            overlay.setMap(map);
            overlay.setPosition(marker.getPosition());
           }); 
            
           // 오버레이 닫기 메서드 
           function closeOverlay() {
             overlay.setMap(null);     
           }
           
          return marker;
            
          clickable: true;
        });  // var markers 끝.
       
       clusterer.addMarkers(markers);
   }); 
}; // function getMemberMapList() 끝.
         
   //공공데이터용 핀 불러오기 메서드
   function getMapList(areaCode) {
      $.get("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?" +
            "ServiceKey=MaGP4FtoJKEQP9EbzPCPcOzp7Ko2WN1%2B4b60alL0v0OYT3EGo4daFaOFoKiulrPJKHNCvkdm%2FjWXHv7TviAAMg%3D%3D&" +
            "contentTypeId=&areaCode=" + areaCode + 
            "&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&"+
            "MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=10000&_type=json"
            , function(data) {   
            
            
            var imageSrc = '/moderna/img/marker_blue.png',    
            imageSize = new daum.maps.Size(32, 34), // 마커이미지의 크기입니다
            imageOption = {
               offset : new daum.maps.Point(27, 69)
            }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
               
            //마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
            var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
         
             var markers = $(data.response.body.items.item).map(function(i, position) {
                var marker = new daum.maps.Marker({
                  position : new daum.maps.LatLng(position.mapy, position.mapx),
                  image: markerImage
              });
             
            // img 세팅
            var positionImg = position.firstimage;
            
            if(positionImg == null) {
               positionImg = '/moderna/img/nullimage.png';
            }
            
            // addr 세팅
            var positionAddr2 = position.addr2;
            
            if(positionAddr2 == null) {
            	position.addr2 = '';
            }
            
           // 오버레이 DOM 객체로 div 생성 
           var wrap = document.createElement('div');
          wrap.className = 'wrap';
   
          var info = document.createElement('div');
          info.className = 'info';
   
          var title = document.createElement('div');
          title.className = 'title';
          title.innerHTML = position.title;
   
          var close = document.createElement('div');
          close.className = 'close';
          close.onclick = function() { closeOverlay() };
   
          var body = document.createElement('div');
          body.className = 'body';
   
          var img = document.createElement('div');
          img.className = 'img';
   
          var firstimage = document.createElement('img');
          firstimage.src = positionImg;
          firstimage.width = '73';
          firstimage.height = '70';
   
          var desc = document.createElement('div');
          desc.className = 'desc';
          desc.innerHTML = '<div class="ellipsis">' + position.addr1 + position.addr2 + '</div>' + 
                          '<div style="float:right; padding-right:5px; padding-top:3px;">' +
                          '<button class="btn btn-success btn-sm" type="button" ptitle="' + position.title + '" onclick="modalPopup(this,' + marker.getPosition().getLat() + ',' + marker.getPosition().getLng() + ')">내 기록에 저장하기</button>' +
                          '</div>';
   
          img.appendChild(firstimage);
   
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
             overlay.setMap(map);
             overlay.setPosition(marker.getPosition());
          }); 
           
          // 오버레이 닫기 메서드 
           function closeOverlay() {
             overlay.setMap(null);     
           }
            
          return marker;
            
          clickable: true;
        });  // var markers 끝.
       
       clusterer.addMarkers(markers);
   }); 
}; // function getMapList(areaCode) 끝.


//버튼 클릭 시 모달 창 팝업
function modalPopup(e, lat, lng) {  
   var ptitle = e.getAttribute("ptitle");
   
   console.log("모달창: " + ptitle);
   console.log("모달창: " + lat, lng);  
   
   $('#selectMap').modal({
      keyboard: true
   });
   
   $('#savePin').off('click');
     
   // 모달 저장버튼 클릭 시 핀 등록
   $('#savePin').on('click', function(e) {
      e.preventDefault();
      var mapList = document.getElementById("mapTitleList");
      var mnum = mapList.options[mapList.selectedIndex].value;
      insertPin(mnum, ptitle, lat, lng); 
   });
};  
 
// 핀 등록 메서드 mnum, positions
function insertPin(mnum, ptitle, lat, lng){
  console.log("mnum" + mnum);
  console.log("ptitle" + ptitle);
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
         mnum: mnum, 
         pmemo: "",
         ptheme:"ptheme",
         pinLat: lat,
         pinLng: lng,
         rate:"0",
         ptitle: ptitle
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
        var infoDiv = document.getElementById('centerAddr');

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
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
</body>
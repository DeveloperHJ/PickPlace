<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../../header.jsp" flush="true" />

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
	<a class="menu-btn" href="javascript:void(0)"> 
		<i class="ion ion-grid"></i>
	</a>

	<!-- 컨테이너 row 시작 -->
	<div class="row justify-content-center">
		<jsp:include page="../../nav.jsp" flush="true" />
	
		<!--======================================= Content1 - Map 시작 ======================================-->
		<div class="col-lg-8 col-md-6 col-12 body_block align-content-center" style="background-color: #DFDFDF;">
	
            <div class="map_wrap" style="width: 100%; height: 100%; float: left;">
               <div id="map"
                  style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
					   
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
	            <p>
	               <!-- <em>지도 중심좌표가 변경되면 지도 정보가 표출됩니다</em> -->
	            </p>
	            <p id="result"></p>
            </div>
		</div>
		<!--======================================= Content1 - Map 끝 ======================================-->
		
		<!--==================================== content2 - MapInfo 시작 ===================================-->
		<div class="col-lg-2 col-md-3 col-12 body_block align-content-center" style="font-size: 14px; background-color: #DFDFDF;">
			<button class="btn btn-outline-info" onclick="searchDiv()">검색하기</button>
			<button class="btn btn-outline-info" onclick="selectOverlay('MARKER')">Marker</button>
			<button class="btn btn-outline-info" onclick="selectOverlay('POLYLINE')">Line</button>
		<a href="/map/delete?mnum=${view.mnum}">삭제</a>
			${view.mnum} <br>
			${view.kakaoid} <br>
			${view.mtitle} <br>
			${view.mlocal} <br>
			${view.mcontent} <br>
			${view.mcdate} <br>
			${view.mudate} <br>
			${view.beginLat} <br>
			${view.beginLng}
		</div>
		<!--==================================== content2 - MapInfo 끝 =====================================-->
	
	</div>
</div>

<!-- 지도스크립트 시작 -->
<script>
var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
    level : 6 // 지도의 확대 레벨 
});

// 마커 클러스터러를 생성합니다 
var clusterer = new daum.maps.MarkerClusterer({
   map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
   averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
   minLevel : 10, // 클러스터 할 최소 지도 레벨 
   calculator : [ 10, 30, 50 ], // 클러스터의 크기 구분 값, 각 사이값마다 설정된 text나 style이 적용된다
   styles : [ { // calculator 각 사이 값 마다 적용될 스타일을 지정한다
      width : '30px',
      height : '30px',
      background : 'rgba(51, 204, 255, .8)',
      borderRadius : '15px',
      color : '#000',
      textAlign : 'center',
      fontWeight : 'bold',
      lineHeight : '31px'
   },
      {
         width : '40px',
         height : '40px',
         background : 'rgba(255, 153, 0, .8)',
         borderRadius : '20px',
         color : '#000',
         textAlign : 'center',
         fontWeight : 'bold',
         lineHeight : '41px'
      },
      {
         width : '50px',
         height : '50px',
         background : 'rgba(255, 51, 204, .8)',
         borderRadius : '25px',
         color : '#000',
         textAlign : 'center',
         fontWeight : 'bold',
         lineHeight : '51px'
      },
      {
         width : '60px',
         height : '60px',
         background : 'rgba(255, 80, 80, .8)',
         borderRadius : '30px',
         color : '#000',
         textAlign : 'center',
         fontWeight : 'bold',
         lineHeight : '61px'
      }
   ]
});
 
 // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
 $.getJSON("/pin/list/"+${view.mnum}, function(data) {
	 var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
		imageSize = new daum.maps.Size(32, 34), // 마커이미지의 크기입니다
		imageOption = {
	   		offset : new daum.maps.Point(27, 69)
		}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
	//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);

	 
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    var markers = $(data.item).map(function(i, position) {
       return new daum.maps.Marker({
          position : new daum.maps.LatLng(position.pinLat, position.pinLng),
		  image : markerImage
       });
    }); 

    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers);
 }); 
 

 //커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
 var content = '<div class="customoverlay">' +
    '  <a href="http://map.daum.net/link/map/11394059" target="_blank">' +
    '    <span class="title">구의야구공원</span>' +
    '  </a>' +
    '</div>';

 //커스텀 오버레이가 표시될 위치입니다 
 var position = new daum.maps.LatLng(37.54699, 127.09598);

 //커스텀 오버레이를 생성합니다
 var customOverlay = new daum.maps.CustomOverlay({
    map : map,
    position : position,
    content : content,
    yAnchor : 1
 });

 var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
    map : map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
    drawingMode : [ // drawing manager로 제공할 그리기 요소 모드입니다
       daum.maps.drawing.OverlayType.MARKER,
       daum.maps.drawing.OverlayType.POLYLINE,
    ],
    // 사용자에게 제공할 그리기 가이드 툴팁입니다
    // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
    guideTooltip : [ 'draw', 'drag', 'edit' ],
    markerOptions : { // 마커 옵션입니다 
       draggable : true, // 마커를 그리고 나서 드래그 가능하게 합니다 
       removable : true // 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다  
    },
    polylineOptions : { // 선 옵션입니다
       draggable : true, // 그린 후 드래그가 가능하도록 설정합니다
       removable : true, // 그린 후 삭제 할 수 있도록 x 버튼이 표시됩니다
       editable : true, // 그린 후 수정할 수 있도록 설정합니다 
       strokeColor : '#39f', // 선 색
       hintStrokeStyle : 'dash', // 그리중 마우스를 따라다니는 보조선의 선 스타일
       hintStrokeOpacity : 0.5 // 그리중 마우스를 따라다니는 보조선의 투명도
    }
 };

 // 위에 작성한 옵션으로 Drawing Manager를 생성합니다
 var manager = new daum.maps.drawing.DrawingManager(options);

 // 버튼 클릭 시 호출되는 핸들러 입니다
 function selectOverlay(type) {
    // 그리기 중이면 그리기를 취소합니다
    manager.cancel();

    // 클릭한 그리기 요소 타입을 선택합니다
    manager.select(daum.maps.drawing.OverlayType[type]);
 }

 // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
 var mapTypeControl = new daum.maps.MapTypeControl();

 // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
 // daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
 map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

 // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
 var zoomControl = new daum.maps.ZoomControl();
 map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

 // 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
 daum.maps.event.addListener(map, 'center_changed', function() {

    // 지도의  레벨을 얻어옵니다
    var level = map.getLevel();

    // 지도의 중심좌표를 얻어옵니다 
    var latlng = map.getCenter();

    var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
    message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';

    var resultDiv = document.getElementById('result');
    resultDiv.innerHTML = message;

 });

 // 주소-좌표 변환 객체를 생성합니다
 var geocoder = new daum.maps.services.Geocoder();

 var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new daum.maps.InfoWindow({
       zindex : 1
    }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

 // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
 searchAddrFromCoords(map.getCenter(), displayCenterInfo);

 // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
 daum.maps.event.addListener(map, 'click', function(mouseEvent) {
   searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
      if (status === daum.maps.services.Status.OK) {
         var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
         detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';

         var content = '<div class="bAddr">' +
            '<span class="title">주소정보</span>' +
            detailAddr +
            '</div>';
            
         // 마커를 클릭한 위치에 표시합니다 
         marker.setPosition(mouseEvent.latLng);
         marker.setMap(map);
         
         // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
         infowindow.setContent(content);
         infowindow.open(map, marker);
      }
   });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
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
<!-- 지도스크립트 끝 -->

<!-- 스크립트 CDN 모음 -->
<jsp:include page="../../footer.jsp" flush="true" />

</body>
</html>
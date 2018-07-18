<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../header.jsp" flush="true" />

<script>
$(function() {
	$('#exampleModalCenter').modal('show');
	
	$('#goPickplace').on('click', function() {
		alert("클릭");
		var addList = document.getElementById("addressList");
		var areaCode = addList.options[addList.selectedIndex].value;
		
		alert(areaCode);
		$('#exampleModalCenter').modal('hide');
		getMapList(areaCode);
	});
 
});
</script>

<!-- 움직이는 컨테이너 클래스 시작 -->
<div class="body-container container-fluid">
	<div class="row justify-content-center">

		<jsp:include page="../../nav.jsp" flush="true" />

		<!--=================== content 시작 ====================-->
		<div class="col-lg-10 col-md-9 col-12 align-content-center" style="background-color: #DFDFDF;">
			
		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		          <div class="form-group">
				    <label for="exampleFormControlSelect2">보고 싶은 지역을 골라주세요! <br> 데이터가 많을 시 로딩시간이 길어질 수 있습니다.</label>
				    <select multiple class="form-control" id="addressList">
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
				  </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" id="goPickPlace" class="btn btn-primary">PickPlace 시작하기!</button>
		      </div>
		    </div>
		  </div>
		</div>
		</div>
		<!--=================== content 끝 ====================-->
	</div>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
let sellerSession = null;
function getMyId(){
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			//js 작업공간
			if(response.result == "success"){
				sellerSession = response.id; 
			}
		}
	}
	//get방식
	xhr.open("get","./getMyID",false);
	xhr.send();
}
function getHotelList(){
	const xhr = new XMLHttpRequest();
	const listBox = document.getElementById("listBox");
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4&&xhr.status==200){
			const response = JSON.parse(xhr.responseText);
			if(response.result =="success"){
			for(list of response.hotelInfo){
			const col = document.createElement("div");
			col.classList.add("col-6","ps-4","pe-4","mt-4");
			listBox.appendChild(col);
			
			const a = document.createElement("a");
			a.href="./sellerMainPage?id=" +list.hotelDto.id;
			a.style.textDecoration = "none";
			col.appendChild(a);
			
			const card = document.createElement("div");
			card.classList.add("card");
			a.appendChild(card);
			
			const img = document.createElement("img");
			img.src = "/uploadFiles/"+list.hotelDto.hotel_img;
			img.classList.add("card-img-top");
			img.style.width ="483px";
			img.style.height ="250px";
			card.appendChild(img);
			
			const cardBody = document.createElement("div");
			cardBody.classList.add("card-body");
			card.appendChild(cardBody);
			
			const row1= document.createElement("div");
			row1.classList.add("row");
			cardBody.appendChild(row1);
			
			const cateCol = document.createElement("div");
			cateCol.classList.add("col","text-center","text-secondary");
			cateCol.innerText = list.category.category;
			row1.appendChild(cateCol);
			
			const row2= document.createElement("div");
			row2.classList.add("row");
			cardBody.appendChild(row2);
			
			const nameCol = document.createElement("div");
			nameCol.classList.add("col","text-center","fw-semibold","fs-5");
			nameCol.innerText= list.hotelDto.hotel_name;
			row2.appendChild(nameCol);
			}
			}
		}else{
			const failCol = document.createElement("div");
			failCol.classList.add("col","mt-5","text-center","fw-semibold","fs-2");
			failCol.innerText = "등록된 숙소가 없습니다."
		}
	}
	xhr.open("get","./getHotelList?seller_id="+sellerSession);
	xhr.send();
}
function getHotelRegisterPage(){
	const modal = bootstrap.Modal.getOrCreateInstance("#registerHotelPage");
	const xhr = new XMLHttpRequest();
	const selectBox = document.getElementById("categori_select");
	const checkBox = document.getElementById("checkbox");
	selectBox.innerHTML ="";
	checkBox.innerHTML ="";
	const FirstOption = document.createElement("option")
	FirstOption.innerText = "숙소분류";
	FirstOption.selected = true;
	selectBox.appendChild(FirstOption);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			for(list of response.cateList){
				var option = document.createElement("option");
				option.value = list.id;
				option.innerText = list.category;
				
				selectBox.appendChild(option);
			}
			for(list of response.syscateList){
				var col = document.createElement("div");
				col.classList.add("col-2");
				col.innerText =list.category;
				var checkbox = document.createElement("input");
				checkbox.type = 'checkbox';
				checkbox.value = list.id;
				checkbox.classList.add("check");
				col.appendChild(checkbox);
				checkBox.appendChild(col);
			}
			modal.show();
		}
	}
	//get방식
	xhr.open("get","./getHotelCategory");
	xhr.send();
}
function uploadFile() {
	const modal = bootstrap.Modal.getOrCreateInstance("#registerHotelPage");
	  var fileInput = document.getElementById('hotel_img');
	  var file = fileInput.files[0]; // 업로드할 파일 가져오기
	  var docuInput =document.getElementById('docu'); 
	  var files = docuInput.files;
	  var nameInput = document.getElementById('hotel_name');
	  var name = nameInput.value; 
	  var selectInput = document.getElementById('categori_select');
	  var select = selectInput.value; 
	  var locInput = document.getElementById('hotel_loc');
	  var loc = locInput.value; 
	  var telInput = document.getElementById('hotel_tel');
	  var tel = telInput.value; 
	  var contentInput = document.getElementById('content');
	  var content = contentInput.value; 
	  var checkList = document.getElementsByClassName("check");
	  var selectedValues = [];
	  for (var i = 0; i < checkList.length; i++) {
	    if (checkList[i].checked) {
	      selectedValues.push(checkList[i].value);
	    }
	  }	
	  var formData = new FormData();
	  for(var i=0; i< files.length; i++){
		  formData.append('files',files[i]);
	  }
	  formData.append('file', file); // 파일 추가
	  formData.append('hotel_name', name); // 다른 데이터 추가
	  formData.append('hotel_category_id', select);
	  formData.append('hotel_loc', loc);
	  formData.append('hotel_tel', tel);
	  formData.append('content', content);
	  formData.append('seller_id', sellerSession);
	  formData.append('checkList', selectedValues.join(','));
	  var xhr = new XMLHttpRequest();
	  xhr.open('post', './registerHotel');
	  
	  xhr.onreadystatechange = function() {
	  if(xhr.readyState == 4 && xhr.status == 200){
		const response = JSON.parse(xhr.responseText);
		modal.hide();
		getHotelList;
	  }	
	  }
	  xhr.send(formData);
	}
window.addEventListener("DOMContentLoaded",function(){
	getMyId();
	getHotelList();
});
</script>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col">
			<jsp:include page="../common/sellerTopNavi.jsp"></jsp:include>
		</div>
	</div>
	  <div class="row">
            <div class="col-2 bg-black text-white" style="height: 100;">
                <div class="row mt-5">
                    <div class="col-1"></div>
                    <div class="col-8">
                            <div class="row">
                                <div class="col fw-semibold fs-5 pt-2 ps-3 small text-secondary">
                                   판매자명
                                </div>
                            </div>
                            <div class="row pt-0">
                                <div class="col fw-semibold fs-5 pt-2 ps-3">
                                    ${sessionSeller.seller_name }
                                </div>
                            </div>
                     </div>
                </div>
                <div class="row mt-5">
                    <div class="col-1"></div>
                    <div class="col text-secondary fw-bold fs-5">
                        정보 관리
                    </div>
                </div>
                 <div class="row mt-4">
                    <div class="col-1"></div>
                    <div class="col fw-semibold pb-0">
                        <i class="bi bi-house-check fs-4 text-info pt-5"></i><span class="ps-3 text-white fs-5 pt-0">등록한 숙소</span>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-1"></div>
                    <div class="col fw-semibold pb-0">
                        <i class="bi bi-card-list fs-4 text-secondary pt-5"></i><span class="ps-3 text-white fs-5 pt-0">내 정보</span>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-1"></div>
                    <div class="col fw-semibold pb-0">
                        <i class="bi bi-wallet fs-4 text-secondary pt-5"></i><span class="ps-3 text-white fs-5 pt-0">수익</span>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-1"></div>
                    <div class="col fw-semibold pb-0">
                        <i class="bi bi-graph-up-arrow fs-4 text-secondary pt-5"></i><span class="ps-3 text-white fs-5 pt-0">대시보드</span>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-1"></div>
                    <div class="col text-secondary fw-bold fs-5">
                        서비스
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-1"></div>
                    <div class="col fw-semibold pb-0">
                        <i class="bi bi-signpost fs-4 text-secondary pt-5"></i><span class="ps-3 text-white fs-5 pt-0">고객센터</span>
                    </div>
                </div>
                <div class="row mt-4 mb-5">
                    <div class="col-1"></div>
                    <div class="col fw-semibold pb-0">
                        <i class="bi bi-question-circle fs-4 text-secondary pt-5"></i><span class="ps-3 text-white fs-5 pt-0">문의/요청</span>
                    </div>
                </div>
                <div class="row mt-5">
                        <div class="col-1"></div>
                        <div class="col pb-5 d-grid"><button type="button" class="btn btn-light btn-lg pt-4 pb-4 fw-semibold" onclick="getHotelRegisterPage()">숙소등록</button></div>
                        <div class="col-1"></div>
                </div>
            </div>
            <div class="col bg-secondary bg-opacity-10">
                <div class="row mt-2 ms-2">
                    <div class="col fw-semibold fs-2"><i class="bi bi-house-check pe-3"></i>등록한 숙소</div>
                </div>
               <div class="row mt-1">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="row" id="listBox">
                        
                        </div>
                    </div> 
                    <div class="col-2"></div>
               </div>
            </div>
    
        </div>
</div>





<!-- 등록 모달 -->

<div class="modal fade modal-dialog modal-xl" id="registerHotelPage" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
     
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">숙소 등록</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
     
		<div class="row">
			<div class="col-1"></div>
			<div class="col text-center">
				<div class="row mt-1">
					<div class="col form-floating">
						<input type="text" class="form-control" id="hotel_name" placeholder="숙소명">
						<label for="hotel_name">숙소명</label>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col form-floating">
						<select class="form-select" aria-label="Default select example" id="categori_select">
						</select>
					</div>
				</div>
				<div class="row mt-1">
				<div class="col-4 form-floating">
					<div id="map" style="width:250px;height:200px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8a1d90f3a65f2e8f2e4e69aac5b93be"></script>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8a1d90f3a65f2e8f2e4e69aac5b93be&libraries=services"></script>
					
					<script>

						const myModalEl = document.getElementById('registerHotelPage')
						myModalEl.addEventListener('shown.bs.modal', event => {
							var container = document.getElementById('map');
							var options = {
								center: new kakao.maps.LatLng(33.450701, 126.570667),
								level: 3
							};
					
							var map = new kakao.maps.Map(container, options);
							
							var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);
							
							var marker = new kakao.maps.Marker({
								position: markerPosition
							});
							marker.setMap(map);
							

							
							})
					</script>
					</div>
				</div>
				<div class="row" id="checkbox">
						
				</div>
				<div class="row mt-1">
					<div class="col form-floating">
						<input type="text"  class="form-control" id="hotel_loc" placeholder="숙소 위치">
						<label for="hotel_loc">숙소 위치</label>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col form-floating">
						<input type="text"  class="form-control" id="hotel_tel" placeholder="대표번호">
						<label for="hotel_tel">대표번호</label>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col form-floating">
						<input type="text"  class="form-control" id="content" placeholder="소개">
						<label for="content">숙소 소개</label>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col text-start">
						<label for="hotel_img">호텔 사진</label>
						<input type="file" id="hotel_img">
					</div>
				</div>
				<div class="row mt-1">
				<div class="col text-start">
				  <label for="docu" >서류</label>
				  <input type="file" id="docu" multiple>
				</div>
				</div>
				<div class="row" style="height:20px;"></div>
	
			</div>
			<div class="col-1"></div>
		</div>
		
      </div>
      <div class="modal-footer">
       	<button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="uploadFile()">등록</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>    
      </div>
      </div>
	</div>
	</div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
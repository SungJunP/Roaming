<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>



function getMyHotel(target){
	const xhr = new XMLHttpRequest();
	
	const hotelNameBox = document.getElementById("hotelNameBox");
	const hotelImgBox = document.getElementById("hotelImgBox");
	const buttonBox = document.getElementById("groupPlus");
	
	const selectBox = document.getElementById("groupSelectBox");
	const groupImgBox = document.getElementById("groupImgBox");
	groupImgBox.src="";
	
	const groupBoxes = document.getElementsByClassName("groupClass");
	for(var i=0; i <groupBoxes.length; i++ ){
		 const groupBox = groupBoxes[i];
		 groupBox.innerHTML = "";

	}

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				hotelNameBox.innerText = response.hotelInfo.hotel_name;
				hotelImgBox.src = "/uploadFiles/"+response.hotelInfo.hotel_img;
				buttonBox.setAttribute("onclick","groupRegiModal("+response.hotelInfo.id+")");
				hotelId = response.hotelInfo.id;
				 getFirstGroup()
				selectBox.innerHTML="";

				for(list of response.groupList){ // 그룹리스트
					var option = document.createElement("option");
			          option.value = list.id;
			          option.innerText = list.room_group_name;
			          selectBox.appendChild(option);			         
			        }
				
				
			      	
			
				} else {
			        var option = document.createElement("option");
			        option.innerText = "호텔을 등록하세요";
			        selectBox.appendChild(option);
			      }
				}
		
	
	
}
		//get방식
		xhr.open("get","./getMyHotel?id="+target);
		xhr.send();
		
}


function getGroupInfo(id){ //그룹정보
	const xhr = new XMLHttpRequest();
	const groupImgBox = document.getElementById("groupImgBox");
	const buttonBox = document.getElementById("roomButtonBox");
	const groupInfoButtonBox = document.getElementById("groupInfoButtonBox");

	buttonBox.innerHTML = "";
	groupInfoButtonBox.innerHTML = "";
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				groupImgBox.src = "/uploadFiles/"+response.groupInfo.room_group_img;
				groupImgBox.setAttribute("onclick","detailImgModal("+response.groupInfo.id+")");
				const button = document.createElement("button");
				button.type = "button";
				button.classList.add("btn");
				button.classList.add("btn-primary");
				button.setAttribute("onclick","roomRegiModal("+response.groupInfo.id+")")
				button.innerText = "호실 등록";
				buttonBox.appendChild(button);
				const infoButton =document.createElement("button");
				infoButton.type = "button";
				infoButton.classList.add("btn");
				infoButton.classList.add("btn-primary"); 
				infoButton.setAttribute("onclick","roomInfoModal("+response.groupInfo.id+")")
				infoButton.innerText = "그룹정보";
				groupInfoButtonBox.appendChild(infoButton);
				
			}
		}
	}
		
	//get방식
	xhr.open("get","./getGroupInfo?id="+id);
	xhr.send();
}

function groupRegiModal(id){
	const modal = bootstrap.Modal.getOrCreateInstance("#groupRegiModal");
	
	const regibutton= document.getElementById("registerGroup");
	regibutton.setAttribute("onclick","uploadGroup("+id+")");
	getViewList();
	const categoryBox = document.getElementById("categoryBox");
	const optionBox = document.getElementById("optionBox");
	const optionpriceBox = document.getElementById("optionpriceBox");
	categoryBox.innerHTML="";
	optionBox.innerHTML="";
	optionpriceBox.innerHTML="";
	
	const divcate = document.createElement("div");
	divcate.classList.add("col-2");
	divcate.classList.add("form-floating");
	const cateinput = document.createElement('input');
	cateinput.type = "text";
	cateinput.classList.add("form-control");
	cateinput.classList.add("category");
	cateinput.id ="category_name";
	divcate.appendChild(cateinput);
	const catelabel = document.createElement("label")
	catelabel.setAttribute("for", "category_name");
	catelabel.innerText = "추가카테고리";
	divcate.appendChild(catelabel);
	const cateplusdiv = document.createElement("div");
	cateplusdiv.classList.add("col-1");
	cateplusdiv.classList.add("text-start");
	cateplusdiv.setAttribute("onclick","categoryPlus()");
	cateplusdiv.id="cateplus";
	cateplusdiv.innerText = "+";
	
	categoryBox.appendChild(divcate);
	categoryBox.appendChild(cateplusdiv);

	const div = document.createElement("div");
	div.classList.add("col-2");
	div.classList.add("form-floating");
	const input = document.createElement('input');
	input.type = "text";
	input.classList.add("form-control");
	input.classList.add("option");
	input.id ="plus_option";
	div.appendChild(input);
	const label = document.createElement("label")
	label.setAttribute("for", "plus_option");
	label.innerText = "추가옵션";
	div.appendChild(label);
	const plusdiv = document.createElement("div");
	plusdiv.classList.add("col-1");
	plusdiv.classList.add("text-start");
	plusdiv.setAttribute("onclick","optionPlus()");
	plusdiv.id="optionplus";
	plusdiv.innerText = "+";
	
	optionBox.appendChild(div);
	optionBox.appendChild(plusdiv);
	const pricediv = document.createElement("div");
	pricediv.classList.add("col-2");
	pricediv.classList.add("form-floating");
	const priceinput = document.createElement('input');
	priceinput.type = "number";
	priceinput.value=0;
	priceinput.classList.add("form-control");
	priceinput.classList.add("optionprice");
	priceinput.id ="optionprice";

	pricediv.appendChild(priceinput);
	const pricelabel = document.createElement("label")
	pricelabel.setAttribute("for", "optionprice");
	pricelabel.innerText = "옵션가격";
	pricediv.appendChild(pricelabel);
	optionpriceBox.appendChild(pricediv);
	modal.show();
}


function getMyHotelList() {
	  const xhr = new XMLHttpRequest();
	  const selectBox = document.getElementById("selectBox");
	  selectBox.innerHTML="";
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState == 4 && xhr.status == 200) {
	      const response = JSON.parse(xhr.responseText);
	      if (response.result == "success") {
	        for (hotelList of response.hotelList) {
	          var option = document.createElement("option");
	          option.value = hotelList.id;
	          option.innerText = hotelList.hotel_name;
	          selectBox.appendChild(option);
	        }

	        selectBox.addEventListener("change", function() {
	          const selectedOption = selectBox.value;
	          getMyHotel(selectedOption);
	          
	        });
	      } else {
	        var option = document.createElement("option");
	        option.innerText = reason;
	        selectBox.appendChild(option);
	      }
	    }
	  }

	  // GET 방식으로 요청을 보냅니다.
	  xhr.open("GET", "./getMyHotelList?seller_id=" + sellerSession);
	  xhr.send();
	}


let hotelId = null;
function getMyFirstHotel(){
	const xhr = new XMLHttpRequest();

	  xhr.onreadystatechange = function() {
	    if (xhr.readyState == 4 && xhr.status == 200) {
	      const response = JSON.parse(xhr.responseText);
	     if(response.result=="success"){
	    	 hotelId = response.id;
	      	 getMyHotel(hotelId);
	     	 getFirstGroup()
	     }else if(response.result=="fail"){
	    	const hotelNameBox = document.getElementById("hotelNameBox");
			hotelNameBox.innerText = "숙소를 등록하세요";	    	
	     }
	     
	    }
	  }
	  // GET 방식으로 요청을 보냅니다.
	  xhr.open("GET", "./getMyFirstHotel?seller_id=" + sellerSession);
	  xhr.send();
}


function categoryPlus(){
	const categoryBox = document.getElementById("categoryBox");
	const plus = document.getElementById("cateplus");
	const div = document.createElement("div");
	div.classList.add("col-2");
	div.classList.add("form-floating");
	const input = document.createElement('input');
	input.type = "text";
	input.classList.add("form-control");
	input.classList.add("category");
	input.id ="category_name";
	div.appendChild(input);
	const label = document.createElement("label")
	label.setAttribute("for", "category_name");
	label.innerText = "추가카테고리";
	div.appendChild(label);
	const plusdiv = document.createElement("div");
	plusdiv.classList.add("col-1");
	plusdiv.classList.add("text-start");
	plusdiv.setAttribute("onclick","categoryPlus()");
	plusdiv.id="cateplus";
	plusdiv.innerText = "+";
	
	categoryBox.removeChild(plus);
	categoryBox.appendChild(div);
	categoryBox.appendChild(plusdiv);
	
}

function optionPlus(){
	const optionBox = document.getElementById("optionBox");
	const optionpriceBox = document.getElementById("optionpriceBox");
	const plus = document.getElementById("optionplus");
	const div = document.createElement("div");
	div.classList.add("col-2");
	div.classList.add("form-floating");
	const input = document.createElement('input');
	input.type = "text";
	input.classList.add("form-control");
	input.classList.add("option");
	input.id ="plus_option";
	div.appendChild(input);
	const label = document.createElement("label")
	label.setAttribute("for", "plus_option");
	label.innerText = "추가옵션";
	div.appendChild(label);
	const plusdiv = document.createElement("div");
	plusdiv.classList.add("col-1");
	plusdiv.classList.add("text-start");
	plusdiv.setAttribute("onclick","optionPlus()");
	plusdiv.id="optionplus";
	plusdiv.innerText = "+";
	
	optionBox.removeChild(plus);
	optionBox.appendChild(div);
	optionBox.appendChild(plusdiv);
	const pricediv = document.createElement("div");
	pricediv.classList.add("col-2");
	pricediv.classList.add("form-floating");
	const priceinput = document.createElement('input');
	priceinput.type = "number";
	priceinput.value=0;
	priceinput.classList.add("form-control");
	priceinput.classList.add("optionprice");
	priceinput.id ="optionprice";

	pricediv.appendChild(priceinput);
	const pricelabel = document.createElement("label")
	pricelabel.setAttribute("for", "optionprice");
	pricelabel.innerText = "옵션가격";
	pricediv.appendChild(pricelabel);
	optionpriceBox.appendChild(pricediv);
}


function uploadGroup(id) {
	const modal = bootstrap.Modal.getOrCreateInstance("#groupRegiModal");
	  var fileInput = document.getElementById('file');
	  var file = fileInput.files[0]; // 업로드할 파일 가져오기
	  var filesInput =document.getElementById('files'); 
	  var files = filesInput.files;
	  var nameInput = document.getElementById('room_group_name');
	  var name = nameInput.value; 
	  var priceInput = document.getElementById('price');
	  var price = priceInput.value; 
	  var fixedInput = document.getElementById('fixed_number');
	  var fixed = fixedInput.value; 
	  var roomViewRadios = document.querySelectorAll('input[name="view"]:checked');
	  var view_id = roomViewRadios[0].value;
	  var cateList = document.getElementsByClassName("category");
	  var cateValues = [];
	  console.log(cateList[0].value);
	  var optionList = document.getElementsByClassName("option");
	  var optionValues = [];
	  var priceList = document.getElementsByClassName("optionprice");
	  var priceValues = [];
	  for (var i = 0; i < cateList.length; i++) {
		  if (cateList[i].value) {
		    cateValues.push(cateList[i].value);
		  }
		}

		for (var i = 0; i < optionList.length; i++) {
		  if (optionList[i].value) {
		    optionValues.push(optionList[i].value);
		  }
		}

		for (var i = 0; i < priceList.length; i++) {
		  if (priceList[i].value) {
		    priceValues.push(priceList[i].value); 
		  }
		}
	  var formData = new FormData();
	  for(var i=0; i< files.length; i++){
		  formData.append('files',files[i]);
	  }
	  formData.append('file', file); // 파일 추가
	  formData.append('room_group_name', name); // 다른 데이터 추가
	  formData.append('price', price);
	  formData.append('fixed_number', fixed);
	  formData.append('view_id', view_id);
	  formData.append('hotel_id', id);
	  formData.append('cateList', cateValues.join(','));
	  formData.append('priceList', priceValues.join(','));
	  formData.append('optionList', optionValues.join(','));
	  var xhr = new XMLHttpRequest();
	  xhr.open('post', './registerGroup');
	  
	  xhr.onreadystatechange = function() {
	  if(xhr.readyState == 4 && xhr.status == 200){
		const response = JSON.parse(xhr.responseText);
		getFirstGroup();
		getMyHotel(id);
		modal.hide();
	  }	
	  }
	  xhr.send(formData);
	}


function getFirstGroup(){
	const xhr = new XMLHttpRequest();

	  xhr.onreadystatechange = function() {
	    if (xhr.readyState == 4 && xhr.status == 200) {
	      const response = JSON.parse(xhr.responseText);
	     if(response.result=="success"){
	    	 const groupId = response.groupId;
	    	 getGroupInfo(groupId);
	    	 
	     }
	     
	    }
	  }
	  // GET 방식으로 요청을 보냅니다.
	  xhr.open("GET", "./getFirstGroup?hotel_id="+hotelId);
	  xhr.send();
}

function detailImgModal(id){
	const modal = bootstrap.Modal.getOrCreateInstance("#detailImg");
	const imgbox = document.getElementById("detailImageBox");
	const xhr = new XMLHttpRequest();
	imgbox.innerHTML = "";
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState == 4 && xhr.status == 200) {
	      const response = JSON.parse(xhr.responseText);
	      for (let i = 0; i < response.image.length; i++) {
	    	 
	    	  const div = document.createElement("div");
	    	  div.classList.add("carousel-item");
	    	  if (i === 0) {
		    	    div.classList.add("active");
		    	  }
	    	  const img = document.createElement("img");
	    	  img.src = "/uploadFiles/" + response.image[i].detail_img;
	    	  img.classList.add("d-block");
	    	  img.classList.add("w-100");

	    	  div.appendChild(img);
	    	  imgbox.appendChild(div);

	    	 
	    	}
	     	modal.show();
	    }
	  }
	  // GET 방식으로 요청을 보냅니다.
	  xhr.open("GET", "./getGroupDetailImage?room_group_id="+id);
	  xhr.send();
	
}

function getViewList(){  // 뷰 갖고오기
	const xhr = new XMLHttpRequest();
	const viewListBox = document.getElementById("viewListBox");
	viewListBox.innerHTML="";
	
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState == 4 && xhr.status == 200) {
	      const response = JSON.parse(xhr.responseText);
	      for (list of response.viewList) {
	    	  const label = document.createElement("label");

	    	  const input = document.createElement("input");
	    	  input.type = "radio";
	    	  input.value = list.id;
	    	  input.name = "view";
	    	  input.id = "view";

	    	  const labelText = document.createTextNode(list.room_view); // 레이블 텍스트

	    	  label.appendChild(input);
	    	  label.appendChild(labelText);
	    	  viewListBox.appendChild(label);
	    	}
	    }
	  }
	  // GET 방식으로 요청을 보냅니다.
	  xhr.open("GET", "./getViewList");
	  xhr.send();
}

function roomRegiModal(id){ // 룸등록모달
	const modal = bootstrap.Modal.getOrCreateInstance("#roomRegiModal")
	const roomRegister = document.getElementById("roomRegister");
	roomRegister.setAttribute("onclick","roomRegister("+id+")");
	modal.show();
}

function roomRegister(id){ // 룸등록프로세스
	const xhr = new XMLHttpRequest();

	const roomNumber = document.getElementById("room_number");
	const room_number = roomNumber.value;
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState == 4 && xhr.status == 200) {
	      const response = JSON.parse(xhr.responseText);
	     
	    }
	  }
	  xhr.open("GET", "./roomRegister?room_group_id="+id+"&room_number="+room_number);
	  xhr.send();
}

function roomInfoModal(id){// 그룹정보
	const modal = bootstrap.Modal.getOrCreateInstance("#roomInfoModal");
	const xhr = new XMLHttpRequest();
	const plusOptionBox = document.getElementById("plusOptionBox");
	const customBox = document.getElementById("customBox");
	const viewBox =document.getElementById("viewBox");
	const roomBox = document.getElementById("roomBox");
	plusOptionBox.innerHTML ="";
	customBox.innerHTML ="";
	roomBox.innerHTML ="";
	viewBox.innerHTML = "";
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState == 4 && xhr.status == 200) {
	      const response = JSON.parse(xhr.responseText);
	      for(option of response.info.plusOption){
	    	  const div = document.createElement("div");
	    	  div.classList.add("col-2");
	    	  div.innerText = option.plus_option +"("+option.price+"원)";
	    	  plusOptionBox.appendChild(div);
	      }
	      for(custom of response.info.custom){
	    	  const div = document.createElement("div");
	    	  div.classList.add("col-2");
	    	  div.innerText = custom.category_name;
	    	  customBox.appendChild(div);
	      }
	      for(room of response.info.room){
	    	  const div = document.createElement("div");
	    	  div.classList.add("col-4");
	    	  div.innerText = room.room_number +" 호";
	    	  roomBox.appendChild(div);
	      }
	      viewBox.innerText = response.info.view.room_view;
	      modal.show();
	    }
	  }
	  xhr.open("GET", "./getGroupDetailInfo?room_group_id="+id);
	  xhr.send();
}

window.addEventListener("DOMContentLoaded",function(){
	getMyId();
	getMyHotelList();
	
	getMyFirstHotel();

	
});	
</script>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<jsp:include page="../common/sellerTopNavi.jsp"></jsp:include>
		</div>
		<div class="col-2"></div>
	</div>
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<div class="row mt-5">
				<div class="col-2">
					<select class="form-select" aria-label="Default select example" id="selectBox">
					</select>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col fs-2 fw-bold" id="hotelNameBox"></div>
			</div>
			<div class="row mt-3">
				<div class="col-3 img-fluid">
					<img id="hotelImgBox" width="210" height="210" class="rounded">
				</div>
				<div class="col-5">
					<div class="row">
						<div class="col fw-bold">
							입점 승인 여부
						</div>
					</div>
					<div class="row">
						<div class="col" id="statusBox">Y</div>
					</div>
				</div>
				<div class="col" id="buttonBox">
					<button type="button" class="btn btn-primary" id="groupPlus">객실그룹 등록</button>
					<button type="button" class="btn btn-primary">영업개시</button>
				</div>
			</div>			
			<div class="row mt-5">
				<div class="col fs-3 fw-bold">
					객실그룹 관리
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-2">
					 <select class="form-select" aria-label="Default select example" id="groupSelectBox">
					</select>	
				</div>
			</div>

			<div class="row mt-5">
				<div class="col-3 img-fluid">
						<img id="groupImgBox" width="210" height="210" class="rounded">
				</div>
				<div class="col-2">
					<div class="row">
						<div class="col groupClass" id="groupInfoButtonBox">
						</div>
					</div>
					<div class="row">
						<div class="col groupClass" id="roomButtonBox">
						</div>
					</div>
				</div>
			</div>
		
		
		
		</div>
		<div class="col-2"></div>
	</div>
</div>





<!-- 등록 모달 -->
<form id="uploadForm">
<div class="modal fade modal-xl" id="groupRegiModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">룸그룹 등록</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

		<div class="row">
			<div class="col-1"></div>
			<div class="col text-center">
				<div class="row mt-1">
					<div class="col form-floating">
						<input type="text" class="form-control" id="room_group_name">
						<label for="hotel_name">그룹명</label>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col form-floating">
						<input type="text"  class="form-control" id="price">
						<label for="hotel_loc">가격</label>
					</div>
				</div>
				<div class="row mt-1">
		       		<div class="col" id="viewListBox"></div>
		       	</div>
				<div class="row mt-1">
					<div class="col form-floating">
						<input type="text"  class="form-control" id="fixed_number">
						<label for="hotel_loc">정원</label>
					</div>
				</div>
				<div class="row mt-1"  id="categoryBox">
					<div class="col-2 form-floating">

					</div>
					<div class="col-1 text-start" onclick = "categoryPlus()" id="cateplus">+</div>
				</div>
				<div class="row mt-1" id="optionBox">
					<div class="col-2 form-floating">
						<input type="text"  class="form-control" id="plus_option">
						<label for="plus_option">추가옵션</label>
					</div>
					<div class="col-1 text-start" onclick = "optionPlus()" id="optionplus">+</div>
				</div>
				<div class="row" id="optionpriceBox">
					<div class="col-2 form-floating">
						<input type="number" class="form-control" id="optionprice" value="0">
						<label for="price">옵션가격</label>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col text-start">
						<label for=file>대표사진</label>
						<input type="file" id="file">
					</div>
				</div>
				<div class="row mt-1" >
				<div class="col text-start">
				  <label for="files" >상세이미지</label>
				  <input type="file" id="files" multiple>
				</div>
				</div>
	
			</div>
			<div class="col-1"></div>
		</div>
		
      </div>
      <div class="modal-footer">
       	<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="registerGroup" >등록</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>    
      </div>
      </div>
	</div>
	</div>
</form>

<!-- 상세사진 모달 -->
<div class="modal fade modal-lg" id="detailImg" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">상세사진</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<div id="carouselExample" class="carousel slide">
		  <div class="carousel-inner" id="detailImageBox">
		
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 



<!-- 호실 등록 모달 -->
<div class="modal fade modal-lg" id="roomRegiModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">호실 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="row">
       		<div class="col">
       			<div class="col-2 form-floating">
					<input type="number" class="form-control" id="room_number">
					<label for="room_number">방 번호</label>
				</div>
       		</div>
       	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="roomRegister">등록</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 




<!-- 그룹정보 모달 -->
<div class="modal fade modal-lg" id="roomInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">정보</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col" id="viewBox"></div>
      	</div>
       	<div class="row mt-2">
       		<div class="col">추가옵션</div>
       	</div>
       	<div class="row mt-2" id="plusOptionBox">
       		
       	</div>
       	<div class="row mt-5">
       		<div class="col">추가카테고리</div>
       	</div>
       	<div class="row mt-2" id="customBox">
       		
       	</div>
       	<div class="row mt-5">
     		<div class="col">호실정보</div>
       	</div>
       	<div class="row mt-3" id="roomBox">
       		
       	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>
let groupSelectBox = document.getElementById("groupSelectBox");
groupSelectBox.addEventListener("change", function() {
    const selectedOption = groupSelectBox.value;
    console.log(selectedOption)
    getGroupInfo(selectedOption);
  });
</script>
</body>
</html>
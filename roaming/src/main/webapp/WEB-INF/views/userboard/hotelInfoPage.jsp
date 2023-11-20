<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
	.custom-text-color {
    color: #58ACFA !important;
  }
  
  .image-hover {
    transition: filter 0.3s;
  }

  .image-hover:hover {
    filter: brightness(75%);
  }
 

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script>
const hotelId = new URLSearchParams(location.search).get("id");    // url에 id= 여기 갖고온다.
var dayDifference = new URLSearchParams(location.search).get("dayDifference");

let userId = null;

function getUserId(){
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				userId = response.userId;
			}
		}
	}
	xhr.open("get","./getUserId",false);
	xhr.send();
}


function getHotelInfo(){
	const xhr = new XMLHttpRequest();
	const hotelNameBox = document.getElementById("hotelNameBox");
	const hotelCategoy = document.getElementById("hotelCategoy");
	const loc = document.getElementById("loc");
	const mainImageBox = document.getElementById("mainImageBox");
	
	const images = document.getElementsByClassName("roomimages");
	const imageGroup = document.getElementById("imageGroup");
	const totalImageCountBox = document.getElementById("totalImageCountBox");
	const totalImageCount = document.getElementById("totalImageCount");
	
	const categoryBox = document.getElementById("categoryBox");
	categoryBox.innerHTML ="";
	
	const contentBox = document.getElementById("contentBox")
	mainImageBox.setAttribute("onclick","getImageModal("+hotelId+",0)");
	totalImageCount.setAttribute("onclick","getImageModal("+hotelId+",4)");
	
	const starValueBox = document.getElementById("starValueBox");
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 &&  xhr.status==200){
			const response = JSON.parse(xhr.responseText);
			
			contentBox.innerText = response.info.hotelDto.content;
			hotelNameBox.innerText = response.info.hotelDto.hotel_name;
			hotelCategoy.innerText = response.info.category.category;
			loc.innerText = " "+ response.info.hotelDto.hotel_loc;
			
			const starSpan = document.createElement("span");
			starSpan.classList.add("text-primary","small","pe-1");
			//별점작업
			const starIcon = document.createElement("i");
			starIcon.classList.add("bi","bi-star");
			const starIcon1 = document.createElement("i");
			starIcon1.classList.add("bi","bi-star");
			const starIcon2 = document.createElement("i");
			starIcon2.classList.add("bi","bi-star");
			const starIcon3 = document.createElement("i");
			starIcon3.classList.add("bi","bi-star");
			const starIcon4 = document.createElement("i");
			starIcon4.classList.add("bi","bi-star");
			
			const halfStar = document.createElement("i");
			halfStar.classList.add("bi","bi-star-half");
			
			
			const fillStar = document.createElement("i");
			fillStar.classList.add("bi","bi-star-fill");
			const fillStar1 = document.createElement("i");
			fillStar1.classList.add("bi","bi-star-fill");
			const fillStar2 = document.createElement("i");
			fillStar2.classList.add("bi","bi-star-fill");
			const fillStar3 = document.createElement("i");
			fillStar3.classList.add("bi","bi-star-fill");
			const fillStar4 = document.createElement("i");
			fillStar4.classList.add("bi","bi-star-fill");
			
			if(response.info.star >= 0 && response.info.star < 1){
				starSpan.appendChild(starIcon);
				starSpan.appendChild(starIcon1);
				starSpan.appendChild(starIcon2);
				starSpan.appendChild(starIcon3);
				starSpan.appendChild(starIcon4);
			}else if(response.info.star >= 1 && response.info.star < 1.5){
				starSpan.appendChild(fillStar);
				starSpan.appendChild(starIcon);
				starSpan.appendChild(starIcon1);
				starSpan.appendChild(starIcon2);
				starSpan.appendChild(starIcon3);
			}else if(response.info.star >= 1.5 && response.info.star < 2){
				starSpan.appendChild(fillStar);
				starSpan.appendChild(halfStar);
				starSpan.appendChild(starIcon);
				starSpan.appendChild(starIcon1);
				starSpan.appendChild(starIcon2);
			}else if(response.info.star >= 2 && response.info.star < 2.5){
				starSpan.appendChild(fillStar);
				starSpan.appendChild(fillStar1);
				starSpan.appendChild(starIcon);
				starSpan.appendChild(starIcon1);
				starSpan.appendChild(starIcon2);
			}else if(response.info.star >= 2.5 && response.info.star < 3){
				starSpan.appendChild(fillStar);
				starSpan.appendChild(fillStar);
				starSpan.appendChild(halfStar);
				starSpan.appendChild(starIcon);
				starSpan.appendChild(starIcon1);
			}else if(response.info.star >= 3 && response.info.star < 3.5){
				starSpan.appendChild(fillStar);
				starSpan.appendChild(fillStar1);
				starSpan.appendChild(fillStar2);
				starSpan.appendChild(starIcon);
				starSpan.appendChild(starIcon1);
			}else if(response.info.star >= 3.5 && response.info.star < 4){
				starSpan.appendChild(fillStar);
				starSpan.appendChild(fillStar1);
				starSpan.appendChild(fillStar2);
				starSpan.appendChild(halfStar);
				starSpan.appendChild(starIcon);
			}else if(response.info.star >= 4 && response.info.star < 4.5){
				starSpan.appendChild(fillStar);
				starSpan.appendChild(fillStar1);
				starSpan.appendChild(fillStar2);
				starSpan.appendChild(fillStar3);
				starSpan.appendChild(starIcon);
			}else if(response.info.star >= 4.5 && response.info.star < 5){
				starSpan.appendChild(fillStar);
				starSpan.appendChild(fillStar1);
				starSpan.appendChild(fillStar2);
				starSpan.appendChild(fillStar3);
				starSpan.appendChild(halfStar);
			}else if(response.info.star == 5){
				starSpan.appendChild(fillStar);
				starSpan.appendChild(fillStar1);
				starSpan.appendChild(fillStar2);
				starSpan.appendChild(fillStar3);
				starSpan.appendChild(fillStar4);
			}
			
			starValueBox.appendChild(starSpan);
			
			const starPointBox = document.createElement("span");
			starPointBox.classList.add("small","fw-bold","ps-1");
			starPointBox.innerText = response.info.star
			starValueBox.appendChild(starPointBox);
			
			
			const reviewValueBox = document.createElement("span");
			reviewValueBox.classList.add("small","text-secondary","fw-bold");
			reviewValueBox.innerText = "("+response.info.review+")";
			starValueBox.appendChild(reviewValueBox);
			
			
			// 이미지작업
			mainImageBox.src = "/uploadFiles/"+response.info.hotelDto.hotel_img;
			
			var roomGroupDtoLength = response.info.roomGroupDto.length;
			var roomGroupImgDtoLength = response.info.roomGroupImgDto.length;

			for (var i = 0; i < Math.min(3, roomGroupDtoLength + roomGroupImgDtoLength); i++) {
			  if (i < roomGroupDtoLength) {
			    images[i].src = "/uploadFiles/" + response.info.roomGroupDto[i].room_group_img;
			  } else {
			    images[i].src = "/uploadFiles/" + response.info.roomGroupImgDto[i - roomGroupDtoLength].detail_img;
			  }
			  images[i].setAttribute("onclick", "getImageModal(" + hotelId+","+(i+1)+ ")");
			}
			
			if(roomGroupDtoLength+roomGroupImgDtoLength -4 > 0){
				totalImageCount.innerText = "+" +(roomGroupDtoLength + roomGroupImgDtoLength - 3);
			}else{
				totalImageCount.innerText = "0";
			}
			//필터(커스텀카테고리,뷰)
			const filterInput =document.getElementById("filterInput");
			
			for(var i = 0; i<response.info.view.length-1; i++){
				const input = document.createElement("input");
				input.type= "radio";
				input.name= "view";
				input.value= response.info.view[i].id;
			
				
			  const label = document.createElement("label");
			  label.appendChild(input);
			  label.appendChild(document.createTextNode(response.info.view[i].room_view));
			
			  filterInput.appendChild(label);
			  
			
			}
			
			  //카테고리 리스트
			  response.info.system.forEach(function(category){
				  console.log(1);
				  if(category.category == "바베큐장"){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-fire","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "바베큐";			  
				  }else if(category.category == "노래방"){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-music-note-beamed","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "노래방";
				  }else if(category.category == "레스토랑"){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-cup-straw","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "레스토랑";
			 	 }else if(category.category == "매점/편의점"){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-cart","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "매점/편의점";
			 	 }else if(category.category == "수영장"){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-water","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "수영장";
			 	 }else if(category.category == "피트니스"){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-person","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "피트니스";
			 	 }else if(category.category == "객실내흡연"){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-magic","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "흡연";
			 	 }else if(category.category == "금연"){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-x-lg","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "금연";
			 	 }else if(category.category == "룸서비스"){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-emoji-laughing","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "룸서비스";
			 	 }else if(category.category == "무료주차"){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-sign-no-parking","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "무료주차";
			 	 }else if(category.category == "바/라운지"){
					  const col = document.createElement("div");
					  col.classList.add("col-2");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-trash2","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "바/라운지";
			 	 }else if(category.category == "반려동물 동반가능"){
					  const col = document.createElement("div");
					  col.classList.add("col-2");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-android","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "반려동물";
			 	 }else if(category.category == "조식 서비스"){
					  const col = document.createElement("div");
					  col.classList.add("col-2");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi"," bi-cup-hot","fs-2");
					  row.appendChild(i);
					  col2.innerText = "조식";
			 	 }else if(category.category == "취사가능"){
					  const col = document.createElement("div");
					  col.classList.add("col-2");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","mb-1");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi"," bi-check-lg","fs-2");
					  row.appendChild(i);
					  col2.innerText = "취사";
			 	 }else if(category.category == "WIFI "){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-wifi","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "WIFI";
			 	 }else if(category.category == "24시간 프론트"){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi"," bi-universal-access","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "24시프론트";
			 	 }else if(category.category == "루프탑"){
					  const col = document.createElement("div");
					  col.classList.add("col-2","mb-1");
					  categoryBox.appendChild(col);
					  
					  const row = document.createElement("div");
					  row.classList.add("row");
					  col.appendChild(row);
					  
					  const row2= document.createElement("div");
					  row2.classList.add("row");
					  col.appendChild(row2);
					  
					  const col2 = document.createElement("div");
					  col2.classList.add("col","text-center");
					  row2.appendChild(col2);
					  const i = document.createElement("i");
					  i.classList.add("bi","bi-stars","fs-2","text-center");
					  row.appendChild(i);
					  col2.innerText = "루프탑";
			 	 }
			  })
				  
			  
				 
					  
			
		}
		
	}
	xhr.open("get","./getHotelInfo?id="+hotelId);
	xhr.send();
}



function getImageModal(id,index){
	const modal = bootstrap.Modal.getOrCreateInstance("#getImageModal");
	const xhr = new XMLHttpRequest();
	const totalImageBox = document.getElementById("totalImageBox");
	totalImageBox.innerHTML = "";
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status==200){
			const response = JSON.parse(xhr.responseText);
			var roomGroupDtoLength = response.info.roomGroupDto.length;
			var roomGroupImgDtoLength = response.info.roomGroupImgDto.length;
			
			const div = document.createElement("div");
	    	div.classList.add("carousel-item");
	    	if(index==0){
	    		div.classList.add("active");
	    	}
			const img = document.createElement("img");
	    	img.src = "/uploadFiles/" + response.info.hotelDto.hotel_img;
	    	img.classList.add("img-fluid");
	    	div.appendChild(img);
	    	totalImageBox.appendChild(div);
	    	
			for (var i = 0; i < (roomGroupDtoLength + roomGroupImgDtoLength); i++) {	 
				const div = document.createElement("div");
		    	div.classList.add("carousel-item");
		    	if(index == i+1){
		   			  div.classList.add("active");
		   		  }
				
				if (i < roomGroupDtoLength) {
					 const img = document.createElement("img");
			    	  img.src = "/uploadFiles/" + response.info.roomGroupDto[i].room_group_img;
			    	  img.classList.add("d-block", "w-100");
			    	  div.appendChild(img);
			    	  totalImageBox.appendChild(div);
			    	  } else {
			    		  const img = document.createElement("img");
				    	  img.src = "/uploadFiles/" + response.info.roomGroupImgDto[i - roomGroupDtoLength].detail_img;
				    	 
				    	  img.classList.add("d-block", "w-100");
				    	  div.appendChild(img);
				    	  totalImageBox.appendChild(div);
				    	  }   	 
		    	}
			modal.show();
		}
	}
	xhr.open("get","./getHotelInfo?id="+id);
	xhr.send();
}
// 날짜 collapse
function getDateCollapse(){
	const collapse = bootstrap.Collapse.getOrCreateInstance("#dateCollapse");
	
	collapse.show();
	
	
	
}

function hideDateCollapse(){
	const collapse = bootstrap.Collapse.getOrCreateInstance("#dateCollapse");
	const dayBox = document.getElementById("dayBox");

	const startDay = document.getElementById("startDay");
	const endDay = document.getElementById("endDay");

	const inputStart = new Date(startDay.value);
	const inputEnd = new Date(endDay.value);
	
	const timeDiff = Math.abs(inputEnd.getTime() - inputStart.getTime());
	const diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
	dayDifference = diffDays;

	var monthNames = [
	  "01", "02", "03", "04", "05", "06",
	  "07", "08", "09", "10", "11", "12"
	];

	var dayNames = [
	  "일", "월", "화", "수", "목", "금", "토"
	];

	var smonth = monthNames[inputStart.getMonth()];
	var sday = inputStart.getDate().toString().padStart(2, '0');
	var sdayOfWeek = dayNames[inputStart.getDay()];
	var syear = inputStart.getFullYear().toString().slice(-2); // 두 자리 수 연도 가져오기

	var emonth = monthNames[inputEnd.getMonth()];
	var eday =  inputEnd.getDate().toString().padStart(2, '0');
	var edayOfWeek = dayNames[inputEnd.getDay()];
	var eyear = inputEnd.getFullYear().toString().slice(-2); // 두 자리 수 연도 가져오기

	var start = syear + "/" + smonth + "/" + sday + "/(" + sdayOfWeek + ")";
	var end = eyear + "/" + emonth + "/" + eday + "/(" + edayOfWeek + ")";

	dayBox.innerText = start + " - " + end;
	
	collapse.hide();
}



// 인원collapse
function getPeopleCollapse(){
	const collapse = bootstrap.Collapse.getOrCreateInstance("#peopleCollapse");
	
	collapse.show();
	
	
	
}

function hidePeopleCollapse(){
	const collapse = bootstrap.Collapse.getOrCreateInstance("#peopleCollapse");
	const peopleInput = document.getElementById("peopleInput");
	const peopleBox = document.getElementById("peopleBox");
	peopleBox.innerText = peopleInput.value;
	collapse.hide();
}

//필터collapse
function getFilterCollapse(){
	const collapse = bootstrap.Collapse.getOrCreateInstance("#filterCollapse");
	
	collapse.show();
	
	
	
}

function hideFilterCollapse(){
	const collapse = bootstrap.Collapse.getOrCreateInstance("#filterCollapse");
	const filterBox = document.getElementById("filterBox");
	const filterInput = document.querySelector("input[name=view]:checked");
	const viewId = filterInput.value;
	if(viewId== 1){
		filterBox.innerText = "오션뷰";
	}else if(viewId==2){
		filterBox.innerText="시티뷰";
	}else if(viewId==3){
		filterBox.innerText ="포레스트뷰";
	}else{
		filterBox.innerText ="없음";
	}
	
	
	collapse.hide();
}
//그룹 갖고오기

// 변환된 값 출력
var startDay = '${startDate}'
var endDay = '${endDate}'

var fixedNumber = ${people};
var viewNumber = 0;

function getGroupList(){
	const xhr = new XMLHttpRequest();
	const groupListBox = document.getElementById("groupListBox");
	groupListBox.innerHTML ="";
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
			for(list of response.group){
				const card1 = document.createElement("div");
		        card1.classList.add("card", "mt-5");

		        const card1row = document.createElement("div");
		        card1row.classList.add("row", "mt-3", "mb-3");
		        card1.appendChild(card1row);

		        const imgcol = document.createElement("div");
		        imgcol.classList.add("col-3", "ms-3");
		        card1row.appendChild(imgcol);

		        const img = document.createElement("img");
		        img.src ="/uploadFiles/"+ list.roomGroupDto.room_group_img;
		        img.classList.add("img-fluid");
		        imgcol.appendChild(img);

		        const contentCol = document.createElement("div");
		        contentCol.classList.add("col");
		        card1row.appendChild(contentCol);

		        const cardBody = document.createElement("div");
		        cardBody.classList.add("card-body");
		        contentCol.appendChild(cardBody);

		        const roomRow = document.createElement("div");
		        roomRow.classList.add("row");
		        cardBody.appendChild(roomRow);

		        const roomCol = document.createElement("div");
		        roomCol.classList.add("col", "fw-semibold", "fs-5");
		        roomCol.textContent = list.roomGroupDto.room_group_name;
		        roomRow.appendChild(roomCol);

		        const capacityRow = document.createElement("div");
		        capacityRow.classList.add("row");
		        cardBody.appendChild(capacityRow);

		        const capacityCol = document.createElement("div");
		        capacityCol.classList.add("col", "small");

		        const capacityIcon = document.createElement("i");
		        capacityIcon.classList.add("bi", "bi-person", "text-primary");

		        const capacityText = document.createElement("span");
		        capacityText.textContent = list.roomGroupDto.fixed_number +"인";

		        capacityCol.appendChild(capacityIcon);
		        capacityCol.appendChild(capacityText);
		        capacityRow.appendChild(capacityCol);

		        groupListBox.appendChild(card1);
			        
				const card2 = document.createElement("div");
				card2.classList.add("card");

				const row2 = document.createElement("div");
				row2.classList.add("row", "mt-2");
				card2.appendChild(row2);

				const col2 = document.createElement("div");
				col2.classList.add("col", "ms-3");
				row2.appendChild(col2);

				const cardBody2 = document.createElement("div");
				cardBody2.classList.add("card-body");
				col2.appendChild(cardBody2);

				const innerRow1 = document.createElement("div");
				innerRow1.classList.add("row");
				cardBody2.appendChild(innerRow1);

				const innerCol1 = document.createElement("div");
				innerCol1.classList.add("col", "fw-semibold", "fs-6");
				
				const textColors = ["text-primary", "text-secondary", "text-info","text-warning","text-danger"]; 
				for(var i = 0; i < list.customCategory.length; i++){
					var cusSpan = document.createElement("span");
					cusSpan.classList.add("small",textColors[i % textColors.length],"me-2","fw-semibold");
					cusSpan.innerText = list.customCategory[i].category_name;
					innerCol1.appendChild(cusSpan);
				}

				if(list.view.id == 1){
					var viewSpan = document.createElement("span");
					viewSpan.classList.add("small","text-info","me-2","fw-semibold");
					viewSpan.innerText = list.view.room_view;
					innerCol1.appendChild(viewSpan);
				}else if(list.view.id==2){
					var viewSpan = document.createElement("span");
					viewSpan.classList.add("small","text-warning","me-2","fw-semibold");
					viewSpan.innerText = list.view.room_view;
					innerCol1.appendChild(viewSpan);
				}else if(list.view.id==3){
					var viewSpan = document.createElement("span");
					viewSpan.classList.add("small","text-success","me-2","fw-semibold");
					viewSpan.innerText = list.view.room_view;
					innerCol1.appendChild(viewSpan);
				}
				
				innerRow1.appendChild(innerCol1);

				const innerCol2 = document.createElement("div");
				innerCol2.classList.add("col", "text-end", "text-primary");
				innerCol2.setAttribute("onclick","getGroupImage("+list.roomGroupDto.id+")");
				innerCol2.textContent = "자세히";
				innerRow1.appendChild(innerCol2);

				const innerRow2 = document.createElement("div");
				innerRow2.classList.add("row", "mt-3");
				cardBody2.appendChild(innerRow2);

				const innerCol3 = document.createElement("div");
				innerCol3.classList.add("col");
				innerRow2.appendChild(innerCol3);
				const priceSpan = document.createElement("span");
				priceSpan.classList.add("fw-semibold","fs-5");
				const listPrice = list.roomGroupDto.price * dayDifference;
				priceSpan.innerText = listPrice.toLocaleString();
				
				innerCol3.appendChild(priceSpan);

				const smallSpan = document.createElement("span");
				smallSpan.classList.add("small");
				smallSpan.innerText = " 원";
				innerCol3.appendChild(smallSpan);

				const innerCol4 = document.createElement("div");
				innerCol4.classList.add("col", "text-end");
				innerRow2.appendChild(innerCol4);
				
				//입력된 날짜
				const dayBox = document.getElementById("dayBox");
				const date = dayBox.innerText;
				const [startDate,endDate] = date.split("-");
				
				const reservationButton = document.createElement("a");
				reservationButton.classList.add("btn", "btn-outline-primary", "fs-6", "fw-semibold", "custom-text-color");
				reservationButton.style.setProperty("--bs-btn-padding-y", ".5rem");
				reservationButton.style.setProperty("--bs-btn-padding-x", "1.4rem");
				reservationButton.style.setProperty("--bs-btn-font-size", ".75rem");
				reservationButton.style.height = "3rem";
				reservationButton.textContent = "예약";
				reservationButton.href = "./hotelReservePage?groupId="+list.roomGroupDto.id+"&startDate="+startDate+"&endDate="+endDate+"&dayDiffrence="+dayDifference;
				innerCol4.appendChild(reservationButton);

				groupListBox.appendChild(card2);

			}
			}else if(response.result == "fail"){
				const fail = document.createElement("div");
				fail.classList.add("col","text-center","mt-5","mb-5","fs-2","fw-semibold");
				fail.innerText = "예약 가능한 숙소가 없습니다.";
				groupListBox.appendChild(fail)
			}
		}
	}
	xhr.open("get","./getGroupList?startDay="+startDay+"&endDay="+endDay+"&hotel_id="+hotelId+"&fixed_number="+fixedNumber+"&view_id="+viewNumber);
	xhr.send();
}
function groupSearch(){
	const dayFilterBox = document.getElementById("dayBox");
	const peopleFilterBox = document.getElementById("peopleBox");
	const viewFilterBox  = document.getElementById("filterBox");
	
	const filterDate = dayFilterBox.innerText;
	const [filterStart,filterEnd] = filterDate.split("-");
	
	startDay = filterStart; 
	endDay = filterEnd;
	fixedNumber = peopleFilterBox.innerText;
	
	if(viewFilterBox.innerText != '필터'){
		if(viewFilterBox.innerText == '오션뷰'){
			viewNumber = 1;
		}else if(viewFilterBox.innerText == '시티뷰'){
			viewNumber = 2;
		}else if(viewFilterBox.innerText == '포레스트뷰'){
			viewNumber = 3;
		}
	}
	
	getGroupList();
	
}


//그룹이미지 모달
function getGroupImage(groupId){
	const modal = bootstrap.Modal.getOrCreateInstance("#groupImageModal")
	const groupImageBox = document.getElementById("groupImageBox");
	const xhr = new XMLHttpRequest();
	groupImageBox.innerHTML ="";
	xhr.onreadystatechange = function(){
		if(xhr.readyState ==4 && xhr.status ==200){
			const response = JSON.parse(xhr.responseText);
			for(var i =0; i<response.images.length; i++){
				const div = document.createElement("div");
		    	div.classList.add("carousel-item");
		    	if(i==0){
		    		div.classList.add("active");
		    	}
		    	const img = document.createElement("img");
		    	img.src = "/uploadFiles/" + response.images[i].detail_img;
		    	img.classList.add("img-fluid");
		    	div.appendChild(img);
		    	groupImageBox.appendChild(div);
		    	

			}
			modal.show();
		}
	}
	xhr.open("get","./getGroupImage?room_group_id="+groupId);
	xhr.send();
}

function getLocation(){
	const modal = bootstrap.Modal.getOrCreateInstance("#locationModal");
	modal.show();	
}

function getReviewList(){
	const reviewBox =document.getElementById("reviewBox");
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				for(list of response.review){
					const row1 = document.createElement("div");
					row1.classList.add("row","mt-4","border-bottom","pb-4");
					reviewBox.appendChild(row1);
					
					const col9 = document.createElement("div");
					col9.classList.add("col-9");
					row1.appendChild(col9);
					
					const row2 = document.createElement("div");
					row2.classList.add("row");
					col9.appendChild(row2);
					
					const namecol = document.createElement("div");
					namecol.classList.add("col");
					var star = "";
					for(var index =0; index<list.reviewDto.star; index++){
						star += '★';
					}
					namecol.innerText = star +'\u00A0'+'\u00A0'+list.userDto.user_name;
					row2.appendChild(namecol);
					
					const row3 = document.createElement("div");
					row3.classList.add("row");
					col9.appendChild(row3);
					
					const datecol = document.createElement("div");
					datecol.classList.add("col-2","small","text-secondary");
					const regdate = new Date(list.reviewDto.review_date);
					var monthNames = [
						  "01", "02", "03", "04", "05", "06",
						  "07", "08", "09", "10", "11", "12"
						];

					var dayNames = [
						  "일", "월", "화", "수", "목", "금", "토"
						];
					var month = monthNames[regdate.getMonth()];
					var day = regdate.getDate().toString().padStart(2, '0');
					var year = regdate.getFullYear().toString().slice(-2); // 두 자리 수 연도 가져오기
					var date = year + "/" + month + "/" + day;
					
					datecol.innerText = date;
					row3.appendChild(datecol);
					
					const groupcol = document.createElement("div");
					groupcol.classList.add("col","small","text-secondary");
					groupcol.innerText = list.roomGroupDto.room_group_name;
					row3.appendChild(groupcol);
					
					const row4 = document.createElement("div");
					row4.classList.add("row","mt-2");
					col9.appendChild(row4);
					
					const contentcol = document.createElement("div");
					contentcol.classList.add("col-9");
					contentcol.innerText = list.reviewDto.content;
					row4.appendChild(contentcol);
					
					const imgcol = document.createElement("div");
					imgcol.classList.add("col");
					row1.appendChild(imgcol);
					
					const img =document.createElement("img");
					img.src = "/uploadFiles/"+list.roomGroupDto.room_group_img;
					img.classList.add("img-fluid");
					
					imgcol.appendChild(img);
				}
				
			}else{
				const faildiv = document.createElement("div");
				faildiv.classList.add("row","mt-5");
				
				const failcol = document.createElememt("div");
				failcol.classList.add("col","text-center","fs-1","fw-semibold");
				failcol.innerText = "리뷰가 없습니다.";
				faildiv.appendChild(failcol);
				
				reviewBox.appendChild(faildiv);
			}
			
		}
	}
	xhr.open("get","./getReviewList?hotel_id="+hotelId);
	xhr.send();
}

function getMyUseLike(){
	const xhr = new XMLHttpRequest();
	const likeheart = document.getElementById("likeheart");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.useCount == 1){
				likeheart.classList.add("bi-heart-fill");
				likeheart.classList.remove("bi-heart");
			}else if(response.useCount ==0){
				likeheart.classList.add("bi-heart");
				likeheart.classList.remove("bi-heart-fill");
			}
			
		}
	}
	xhr.open("get","./getMyUseLike?user_id="+userId+"&hotel_id="+hotelId,false);
	xhr.send();
}

function toggleLike(){
	const xhr = new XMLHttpRequest();
	const likeheart = document.getElementById("likeheart");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			getMyUseLike();
		}
	}
	xhr.open("get","./toggleLike?user_id="+userId+"&hotel_id="+hotelId);
	xhr.send();
}
window.addEventListener("DOMContentLoaded",function(){
	getUserId();
	getHotelInfo();
	getGroupList();
	getReviewList();
	getMyUseLike();
	
});
</script>

</head>
<body>
<div class="container-fluid">
	<div class="row border-bottom mb-5">

		<div class="col">
			<jsp:include page="../common/topNavi.jsp"></jsp:include>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col-3"></div>
		<div class="col">
			<div class="row">
				<div class="col fs-2 fw-bold" id="hotelNameBox"> <!-- 호텔명 -->
					
				</div>
				<div class="col text-end"> <!-- 위치보기버튼 -->
					<button type="button" class="btn btn-outline-secondary btn-lg text-secondary fw-semibold fs-6" onclick="getLocation()"><i class="bi bi-map text-primary"></i>&nbsp;위치보기</button>	
				</div>
			</div>
			<div class="row">
				<div class="col text-secondary small pb-0 pt-5" id="hotelCategoy"> <!-- 호텔분류 -->
					
				</div>
				<div class="col text-end">
					<i class="bi bi-heart text-danger fs-4 btn" id="likeheart" onclick="toggleLike()"></i>
				</div>
			</div>
			<div class="row mt-0 pb-4 border-bottom">
				<div class="col small" id="starValueBox"> <!-- 별점 -->
 
				</div>
				
			</div>
			<div class="row mt-3 pb-4 border-bottom">
				<div class="col"><!-- 주소 -->
					<i class="bi bi-geo-alt"></i><span id="loc"></span>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col"> <!-- 사진 -->
					<div class="card" style="width: 57rem;">
						<img  class="image-hover" id="mainImageBox" style="height:510px; width:914px;">
					</div>
				</div>
			</div>
			<div class="row mt-1">
				<div class="col pe-4">
					<div class="card-group" id="imageGroup">
					  <div class="card">
						<img  class="image-hover roomimages" style="height:150px; width:227px;" >
					  </div>
					  <div class="card">
						<img  class="image-hover roomimages"style="height:150px; width:227px;" >
					  </div>
					  <div class="card">
						<img class="image-hover roomimages" style="height:150px; width:227px;">
					  </div>
					  <div class="card text-bg-secondary" id="totalImageCountBox">
						<div class="card-body text-center fs-1 pt-4  image-hover" id="totalImageCount">
							
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="card mt-5"> <!-- 검색 -->
			  <div class="card-body p-2">
			    <div class="row">
			      <div class="col-4 d-grid pe-1">
			        <button type="button" class="btn btn-outline-secondary dropdown-toggle text-start text-dark fw-semibold" onclick="getDateCollapse()">
			          <i class="bi bi-calendar text-primary"></i>&nbsp; <span id="dayBox">${startDate } - ${endDate }</span>
			        </button>
			      </div>
			      <div class="col-3 d-grid ps-0 pe-1">
			        <button type="button" class="btn btn-outline-secondary dropdown-toggle text-start text-dark fw-semibold" onclick="getPeopleCollapse()">
			          <i class="bi bi-person text-primary"></i>&nbsp; <span id="peopleBox">${people}</span>명
			        </button>
			      </div>
			      <div class="col-3 d-grid ps-0 pe-1">
			        <button type="button" class="btn btn-outline-secondary dropdown-toggle text-start text-dark" onclick="getFilterCollapse()">
			        	<span id="filterBox">필터</span>
			        </button>
			      </div>
			      <div class="col-2 ps-0 d-grid">
			        <button type="button" class="btn btn-outline-primary fs-6 fw-semibold custom-text-color" style="--bs-btn-padding-y: .5rem; --bs-btn-padding-x: 1.4rem; --bs-btn-font-size: .75rem; height: 3.5rem;" onclick="groupSearch()">
			          검색
			        </button>
			      </div>
			    </div>
			    <div class="row">
			    	<div class="col">
			    		<div class="collapse" id="dateCollapse">
						  <div class="row">
						  	<div class="col">
						  		<input type="date" id="startDay">부터
						  		<input type="date" id="endDay">
						  		<button type="button" class="btn btn-outline-primary" onclick="hideDateCollapse()">적용</button>
						  	</div>
						  </div>
						</div>
			    	</div>
			    </div>
			    <div class="row">
			    	<div class="col">
			    		<div class="collapse" id="peopleCollapse">
						  <div class="row">
						  	<div class="col  text-center">
						  		<input type="number" min="1" value="1" class="text-end" id="peopleInput"><span>명</span>
						  		<button type="button" class="btn btn-outline-primary" onclick="hidePeopleCollapse()">적용</button>
						  	</div>
						  </div>
						</div>
			    	</div>
			    </div>
			    <div class="row">
			    	<div class="col">
			    		<div class="collapse" id="filterCollapse">
						  <div class="row">
						  	<div class="col text-end">
						  		<span id="filterInput"></span>
						  		<button type="button" class="btn btn-outline-primary" onclick="hideFilterCollapse()">적용</button>
						  	</div>
						  </div>
						</div>
			    	</div>
			    </div>
			  </div>
			</div>
			<div class="row mt-5" id="groupListBox">
				
				
				
			</div>
		
		
		
		
		</div>
		<div class="col-3"></div>
	</div>
	<div class="row mt-5 border-top border-bottom pb-5">
		<div class="col-3"></div>
		<div class="col-1">
			<div class="row">
				<div class="col mt-5 fw-semibold">
					소개
					
				</div>
			</div>
		</div>
		<div class="col-5 ps-0 mt-5 text-start" id="contentBox">

		</div>
		<div class="col-3"></div>
	 </div>
	 <div class="row mt-4">
	 	<div class="col-3"></div>
	 	<div class="col">
	 		<div class="row border-bottom pb-3">
	 			<div class="col-2 fw-semibold">
	 				체크인/체크아웃
	 			</div>
	 			<div class="col">체크인 - 15:00 / 체크아웃 - 11:00
	 			</div>
	 		</div>
	 		<div class="row mt-4 mb-5 border-bottom pb-4">
	 			<div class="col-1 fw-semibold pt-3 me-4">
	 				서비스
	 			</div>
	 			<div class="col">
	 				<div class="row"  id="categoryBox">
	
	 				</div>
					
				</div>
	 		</div>
	 		<div class="row mt-5">
	 			<div class="col fs-2 fw-semibold">
	 				후기
	 			</div>
	 		</div>
	 		<div class="row mt-5">
	 			<div class="col text-end">
	 				추천순 &nbsp; 최신순
	 			</div>
	 		</div>
	 		<div class="row mt-5">
	 			<div class="col" id="reviewBox">
	 				
	 				
				</div>
	 		</div>
	 		
	 	</div>
	 	<div class="col-3"></div>
	 </div>
</div>


<!-- 사진 모달 -->
<div class="modal fade modal-lg" id="getImageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<div id="groupCarousel" class="carousel slide">
       	<div class="row">
		  <div class="carousel-inner" id="totalImageBox">
		  </div>
		</div>

		  <button class="carousel-control-prev" type="button" data-bs-target="#groupCarousel" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#groupCarousel" data-bs-slide="next">
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



<!-- 그룹사진 모달 -->
<div class="modal fade modal-lg" id="groupImageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<div id="carouselExample" class="carousel slide">
       	<div class="row">
		  <div class="carousel-inner" id="groupImageBox">
		  </div>
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


<!-- 지도 모달 -->
<div class="modal fade modal-lg" id="locationModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	
		<div id="maap" style="width:770px;height:400px;"></div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8a1d90f3a65f2e8f2e4e69aac5b93be&libraries=services"></script> 
<script>
const name = document.getElementById("hotelNameBox");
const loc = document.getElementById("loc"); 

const myModalEl = document.getElementById('locationModal')
myModalEl.addEventListener('shown.bs.modal', event => {
	var mapContainer = document.getElementById('maap'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(loc.innerText, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name.innerText+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
	})
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
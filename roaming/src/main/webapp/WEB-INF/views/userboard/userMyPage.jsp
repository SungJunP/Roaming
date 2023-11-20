<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>Insert title here</title>



<script>

let userId= null;

function getUserId(){
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result =="success"){
				userId = response.userId;
			}
		}
	}
	xhr.open("get","./getUserId",false);
	xhr.send();
}

//현재 날짜 생성
var current = new Date();
// 내일
var next = new Date(current);
next.setDate(current.getDate() + 1);

// 월 이름 배열
var month = [
  "01", "02", "03", "04", "05", "06",
  "07", "08", "09", "10", "11", "12"
];

// 요일 이름 배열
var day = [
  "일", "월", "화", "수", "목", "금", "토"
];

// 월, 일, 요일 추출
var currentMonth = month[current.getMonth()];
var currentDay = current.getDate().toString().padStart(2, '0');
var currentDayOfWeek = day[current.getDay()];
var currentYear = current.getFullYear().toString().slice(-2); // 두 자리 수 연도 가져오기
//내일
var nexttMonth = month[next.getMonth()];
var nextDay = next.getDate().toString().padStart(2, '0');
var nextDayOfWeek = day[next.getDay()];
var nextYear = next.getFullYear().toString().slice(-2); // 두 자리 수 연도 가져오기

// 변환된 값 출력
var startDay = currentYear + "/" + currentMonth + "/" + currentDay + "/(" + currentDayOfWeek + ")";
var endDay = nextYear + "/" + nexttMonth + "/" + nextDay + "/(" + nextDayOfWeek + ")";



function getReserveList(number){ // 1이면 예정 2면 이전
	const xhr = new XMLHttpRequest();
	const listBox = document.getElementById("listBox");
	const button1 = document.getElementById("button1");
	const button2 = document.getElementById("button2");
	const button3 = document.getElementById("button3");
	listBox.innerHTML = "";
	if(number == 1){
		button1.classList.add("bg-secondary");
		button2.classList.remove("bg-secondary");
		button3.classList.remove("bg-secondary");
		
	}else if(number ==2){
		button2.classList.add("bg-secondary");
		button1.classList.remove("bg-secondary");
		button3.classList.remove("bg-secondary");
	}
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status ==200){
			const response = JSON.parse(xhr.responseText);
			for(list of response.list){
				const row1 = document.createElement("div");
				row1.classList.add("row","mt-5");
				listBox.appendChild(row1);
				
				const imgcol = document.createElement("div");
				imgcol.classList.add("col-2","pe-0");
				row1.appendChild(imgcol);
				
				const imgLink = document.createElement("a");
				imgLink.href = "./hotelInfoPage?id="+list.hotelDto.id+"&startDate="+startDay+"&endDate="+endDay+"&people="+2;
						
				const img = document.createElement("img");
				img.src = "/uploadFiles/" +list.roomGroupDto.room_group_img;
				img.style.width= "100px";
				img.style.height= "100px";
				imgLink.appendChild(img);
				
				imgcol.appendChild(imgLink);
				
				const infocol = document.createElement("div");
				infocol.classList.add("col","ps-0");
				row1.appendChild(infocol);
				
				const namerow = document.createElement("div");
				namerow.classList.add('row');
				infocol.appendChild(namerow);
				
				const namecol = document.createElement("div");
				namecol.classList.add("col","fw-semibold","fs-6");
				namecol.innerText = list.hotelDto.hotel_name + "("+list.roomGroupDto.room_group_name+")";
				namerow.appendChild(namecol);
				if(number==2 && list.reviewCount == 0){
					const reviewCol = document.createElement("div");
					reviewCol.classList.add("col","text-end");
					namerow.appendChild(reviewCol);
					
					const reviewButton = document.createElement("button");
					reviewButton.classList.add("btn","btn-light","text-dark","small");
					reviewButton.innerText = "리뷰작성";
					reviewButton.setAttribute("onclick","reviewModal("+list.reserveDto.id+")")
					reviewCol.appendChild(reviewButton);
				}
				
				const reserveRow = document.createElement("div");
				reserveRow.classList.add("row");
				infocol.appendChild(reserveRow);
				
				const reserveCol = document.createElement("div");
				reserveCol.classList.add("col","text-secondary","fs-6");
				
				const startday = new Date(list.reserveDto.start_date);
				const endday = new Date(list.reserveDto.end_date);
				
				var monthNames = [
					  "01", "02", "03", "04", "05", "06",
					  "07", "08", "09", "10", "11", "12"
					];

				var dayNames = [
					  "일", "월", "화", "수", "목", "금", "토"
					];
				
				var smonth = monthNames[startday.getMonth()];
				var sday = startday.getDate().toString().padStart(2, '0');
				var sdayOfWeek = dayNames[startday.getDay()];
				var syear = startday.getFullYear().toString().slice(-2); // 두 자리 수 연도 가져오기

				var emonth = monthNames[endday.getMonth()];
				var eday =  endday.getDate().toString().padStart(2, '0');
				var edayOfWeek = dayNames[endday.getDay()];
				var eyear = endday.getFullYear().toString().slice(-2); // 두 자리 수 연도 가져오기

				var start = syear + "/" + smonth + "/" + sday + "/(" + sdayOfWeek + ")";
				var end = eyear + "/" + emonth + "/" + eday + "/(" + edayOfWeek + ")";
				
				reserveCol.innerText = start + " 15시 00분 ~ " + end + " 11시 00분";
				reserveRow.appendChild(reserveCol);
				
				const optionRow = document.createElement("div");
				optionRow.classList.add("row");
				infocol.appendChild(optionRow);
				
				for(option of list.plusList){
					const optionCol = document.createElement("div");
					optionCol.classList.add("col-3","text-secondary","fs-6");
					const price = option.price;
					optionCol.innerText = option.plus_option + "("+price.toLocaleString()+")";
					optionRow.appendChild(optionCol);
				}
				
				const row2 = document.createElement("div");
				row2.classList.add("row","mt-3","border-bottom","pb-3");
				listBox.appendChild(row2);
				
				const priceTextCol = document.createElement("div");
				priceTextCol.classList.add("col","text-secondary","fs-6");
				priceTextCol.innerText = "결제 금액";
				row2.appendChild(priceTextCol);
				
				const priceCol = document.createElement("div");
				priceCol.classList.add("col","text-end","fw-semibold","fs-5");
				const fprice = list.reserveDto.final_price;
				priceCol.innerText = fprice.toLocaleString() +"원";
				row2.appendChild(priceCol);
				
			}
		}
	}
	xhr.open("get","./getReserveList?filter="+number);
	xhr.send();
}
function reviewModal(reserveId){
	const modal = bootstrap.Modal.getOrCreateInstance("#reviewModal");
	const writeButton= document.getElementById("writeButton");
	writeButton.setAttribute("onclick","writeReviewProcess("+reserveId+")");
	const starBox = document.getElementById("starBox");
	starBox.innerHTML="";
	for(var i=1; i<6; i++){
		const itag = document.createElement("i");
		itag.classList.add("bi","bi-star","fs-1");
		itag.setAttribute("onmouseover","getStarCount("+i+")");
		itag.id ="star"+i;
		starBox.appendChild(itag);
	}
	
	
	
	modal.show();
}

let starCount = 1;

function getStarCount(count){
	const star1 = document.getElementById("star1");
	const star2 = document.getElementById("star2");
	const star3 = document.getElementById("star3");
	const star4 = document.getElementById("star4");
	const star5 = document.getElementById("star5");
	
	starCount = count;
	
	if(count == 1){
		star1.classList.remove("bi-star");
		star1.classList.add("bi-star-fill");
		
		star2.classList.remove("bi-star-fill");
		star2.classList.add("bi-star");
		
		star3.classList.remove("bi-star-fill");
		star3.classList.add("bi-star");
		
		star4.classList.remove("bi-star-fill");
		star4.classList.add("bi-star");
		
		star5.classList.remove("bi-star-fill");
		star5.classList.add("bi-star");
	}else if(count == 2){
		star1.classList.remove("bi-star");
		star1.classList.add("bi-star-fill");
		
		star2.classList.remove("bi-star");
		star2.classList.add("bi-star-fill");
		
		star3.classList.remove("bi-star-fill");
		star3.classList.add("bi-star");
		
		star4.classList.remove("bi-star-fill");
		star4.classList.add("bi-star");
		
		star5.classList.remove("bi-star-fill");
		star5.classList.add("bi-star");
	}else if(count == 3){
		star1.classList.remove("bi-star");
		star1.classList.add("bi-star-fill");
		
		star2.classList.remove("bi-star");
		star2.classList.add("bi-star-fill");
		
		star3.classList.remove("bi-star");
		star3.classList.add("bi-star-fill");
		
		star4.classList.remove("bi-star-fill");
		star4.classList.add("bi-star");
		
		star5.classList.remove("bi-star-fill");
		star5.classList.add("bi-star");
	}else if(count==4){
		star1.classList.remove("bi-star");
		star1.classList.add("bi-star-fill");
		
		star2.classList.remove("bi-star");
		star2.classList.add("bi-star-fill");
		
		star3.classList.remove("bi-star");
		star3.classList.add("bi-star-fill");
		
		star4.classList.remove("bi-star");
		star4.classList.add("bi-star-fill");
		
		star5.classList.remove("bi-star-fill");
		star5.classList.add("bi-star");
	}else{
		star1.classList.remove("bi-star");
		star1.classList.add("bi-star-fill");
		
		star2.classList.remove("bi-star");
		star2.classList.add("bi-star-fill");
		
		star3.classList.remove("bi-star");
		star3.classList.add("bi-star-fill");
		
		star4.classList.remove("bi-star");
		star4.classList.add("bi-star-fill");
		
		star5.classList.remove("bi-star");
		star5.classList.add("bi-star-fill");
	}
	
}

function writeReviewProcess(reserveId){
	const modal = bootstrap.Modal.getOrCreateInstance("#reviewModal");
	
	const contentInput = document.getElementById("content");
	const fileInput = document.getElementById("file");
	
	const content = contentInput.value;
	const file = fileInput.files[0];
	
	const xhr = new XMLHttpRequest();
	var formData = new FormData();
	formData.append("file",file);
	formData.append("content",content);
	formData.append("reserve_id",reserveId);
	formData.append("star",starCount);
	xhr.open("post","./writeReviewProcess");
	xhr.onreadystatechange =  function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			modal.hide();
			getReserveList(2);
			
		}
	}

	xhr.send(formData)
}
function getFavoriteHotelList(){
	const xhr = new XMLHttpRequest();
	const listBox = document.getElementById("listBox");
	const button1 = document.getElementById("button1");
	const button2 = document.getElementById("button2");
	const button3 = document.getElementById("button3");
	listBox.innerHTML = "";

	button1.classList.remove("bg-secondary");
	button2.classList.remove("bg-secondary");
	button3.classList.add("bg-secondary");
		
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				for(list of response.hotelList){
					const row = document.createElement("div");
					row.classList.add("row");
					row.classList.add("mt-3");
					row.classList.add("border-top");
					row.classList.add("border-bottom");
					row.classList.add("border-end");
					
					const imgdiv = document.createElement("div");
					imgdiv.classList.add("col-4","p-0");
					
					const action = document.createElement("a");
					action.href = "./hotelInfoPage?id="+list.hotelDto.id+"&startDate="+startDay+"&endDate="+endDay+"&people="+2;
					
					const img = document.createElement("img");
					img.src = "/uploadFiles/" + list.hotelDto.hotel_img;
					img.style.width = "250px";
					img.style.height = "180px";
					action.appendChild(img);
					imgdiv.appendChild(action);
					
					const col = document.createElement("div");
					col.classList.add("col");
					
					
					const namediv = document.createElement("div");
					namediv.classList.add("row");
					namediv.classList.add("mt-2");
					namediv.classList.add("fs-5");
					namediv.classList.add("fw-semibold");
					
					const namebox = document.createElement("div");
					namebox.classList.add("col");
					namebox.classList.add("text-start");
					namebox.innerText = list.hotelDto.hotel_name;
					namediv.appendChild(namebox);
			
					const infodiv = document.createElement("div");
					infodiv.classList.add("row");
					infodiv.classList.add("mt-2");
					infodiv.classList.add("mb-5");
					
					const infobox = document.createElement("div");
					infobox.classList.add("col");
					infobox.classList.add("text-start","text-secondary");
					const starBox =document.createElement("i");
					starBox.classList.add("bi","bi-star-fill","text-primary")
					infobox.appendChild(starBox);
					
					const textNode = document.createTextNode(list.star + "(" + list.review + ") · " + list.category.category + " · " + list.hotelDto.hotel_loc);
					infobox.appendChild(textNode);
					
					infodiv.appendChild(infobox);
					
					const pricediv = document.createElement("div");
					pricediv.classList.add("row");
					pricediv.classList.add("mt-5");
					
					const pricebox = document.createElement("div");
					pricebox.classList.add("col");
					
					const price = list.price.price;
					const formattedPrice = new Intl.NumberFormat('ko-KR').format(price);
					const pricespan = document.createElement("span");
					pricespan.classList.add("text-start","fs-5","fw-semibold")
					pricespan.innerText = formattedPrice
					pricebox.appendChild(pricespan);
					const won = document.createElement("span");
					won.classList.add("small");
					won.innerText = "원~";
					pricebox.appendChild(won);
					pricediv.appendChild(pricebox);
					
					row.appendChild(imgdiv);
					col.appendChild(namediv);
					col.appendChild(infodiv);
					col.appendChild(pricediv);
					row.appendChild(col);
					
					listBox.appendChild(row);
					
					}
				}else if(response.result == "fail"){
					const div = document.createElement("div");
					div.classList.add("row")
					div.classList.add("mt-5")
					const col = document.createElement("div");
					col.classList.add("col");
					col.classList.add("mt-5");
					col.classList.add("text-center");
					col.classList.add("fw-semibold");
					col.classList.add("fs-4");
					col.innerText = "관심있는 숙소가 없습니다.";
					div.appendChild(col);
					listBox.appendChild(div);
					
				}
		}
	}
	xhr.open("get","./getFavoriteHotelList?user_id="+userId);
	xhr.send();
	
}
window.addEventListener("DOMContentLoaded",function(){
	getUserId();
	getReserveList(1);
	
});
</script>
</head>
<body>
<div class="container-fluid">
	<div class="row border-bottom mb-5">
		<div class="col-2"></div>
		<div class="col">
			<jsp:include page="../common/topNavi.jsp"></jsp:include>
		</div>
		<div class="col-2"></div>
	</div>
</div>
<div class="row mt-5">
	<div class="col-2"></div>
	<div class="col-2">
		<div class="row">
			<div class="col fs-2 fw-semibold">
				 예약내역
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-8">
				<div class="card">
				  <ul class="list-group list-group-flush">
				    <li class="list-group-item  btn btn-light" onclick="getReserveList(1)" id="button1" >예정된 여행</li>
				    <li class="list-group-item btn btn-light" onclick="getReserveList(2)" id="button2">지난 여행</li>
				    <li class="list-group-item btn btn-light" onclick="getFavoriteHotelList()" id="button3">관심 호텔</li>
				  </ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-5 mt-5 mb-4" id="listBox">
		
	</div>
	<div class="col-2"></div>
</div>





<!-- 리뷰 모달 -->
<div class="modal fade modal-lg" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<div class="row mt-2">
       		<div class="col-2"></div>
       		<div class="col">
       			<div class="row">
       				<div class="col text-center" id="starBox">
       					<i class="bi bi-star fs-1" onclick="getStarCount(1)" id="star1"></i><i class="bi bi-star fs-1" onclick="getStarCount(2)"  id="star2"></i><i class="bi bi-star fs-1" onclick="getStarCount(3)"  id="star3"></i><i class="bi bi-star fs-1" onclick="getStarCount(4)"  id="star4"></i><i class="bi bi-star fs-1" onclick="getStarCount(5)"  id="star5"></i>
       				</div>
       			</div>
       			<div class="row">
       				<div class="col">
  						<textarea class="form-control"  rows="6" placeholder="리뷰를 작성해주세요" id="content"></textarea>
       				</div>
       			</div>
       			<div class="row mt-3">
       				<div class="col">리뷰사진</div>
       			</div>
       			<div class="row mt-1">
       				<div class="col">
       					 <input type="file" class="form-control" id="file">
       				</div>
       			</div>
       		</div>
       		<div class="col-2"></div>
       	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="writeButton">작성</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
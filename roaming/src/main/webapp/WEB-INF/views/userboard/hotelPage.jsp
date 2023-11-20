<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .custom-text-color {
    color: #58ACFA !important;
  }
 
 .orderby{
 	font-size: 90%;
 	
 }
	
  .catebutton {
    background-color: #B4E5FF !important;
  }
  
  


.starsize{
	font-size: 200%;

}

.icon-text-wrapper {
  position: relative;
  display: inline-block;
}


.text-overlay {
  position: absolute;
  top: 15px;
  left: 10px;
  color: black;
  font-size: 16px;
  /* 다른 스타일링 옵션을 추가로 적용할 수 있습니다 */
}



</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<script>
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

var dayDifference = 1;
let categoryValue = '전체';
let starValue = 0;	
let checkedValues = []; 
let orderByNumber = 1;

let searchLoc = '';
let searchStart = startDay;
let searchEnd = endDay;
let searchPeople = 2;

function getHotelCategory(category){
	categoryValue = category;
	// JavaScript 코드
	getHotelListByStar(starValue)
}	


function getHotelListByStar(star){
	starValue = star;
	const xhr = new XMLHttpRequest();
	const hotelBox = document.getElementById("hotelBox");
	hotelBox.innerHTML ="";

	var btnAll = document.getElementById('btn-all');
	var btnHotel = document.getElementById('btn-hotel');
	var btnPension = document.getElementById('btn-pension');
	var btnVilla = document.getElementById('btn-villa');
	var btnGuesthouse = document.getElementById('btn-guesthouse');

	btnAll.addEventListener('click', function() {
	    btnAll.classList.add('catebutton'); // 선택한 버튼에 'ac' 클래스 추가
	    btnHotel.classList.remove('catebutton'); // 다른 버튼의 'active' 클래스 제거
	    btnPension.classList.remove('catebutton');
	    btnVilla.classList.remove('catebutton');
	    btnGuesthouse.classList.remove('catebutton');
	});

	btnHotel.addEventListener('click', function() {
	    btnAll.classList.remove('catebutton');
	    btnHotel.classList.add('catebutton');
	    btnPension.classList.remove('catebutton');
	    btnVilla.classList.remove('catebutton');
	    btnGuesthouse.classList.remove('catebutton');
	});

	btnPension.addEventListener('click', function() {
	    btnAll.classList.remove('catebutton');
	    btnHotel.classList.remove('catebutton');
	    btnPension.classList.add('catebutton');
	    btnVilla.classList.remove('catebutton');
	    btnGuesthouse.classList.remove('catebutton');
	});

	btnVilla.addEventListener('click', function() {
	    btnAll.classList.remove('catebutton');
	    btnHotel.classList.remove('catebutton');
	    btnPension.classList.remove('catebutton');
	    btnVilla.classList.add('catebutton');
	    btnGuesthouse.classList.remove('catebutton');
	});

	btnGuesthouse.addEventListener('click', function() {
	    btnAll.classList.remove('catebutton');
	    btnHotel.classList.remove('catebutton');
	    btnPension.classList.remove('catebutton');
	    btnVilla.classList.remove('catebutton');
	    btnGuesthouse.classList.add('catebutton');
	});
	
	var star0 = document.getElementById('star0');
	var star2 = document.getElementById('star2');
	var star3 = document.getElementById('star3');
	var star4 = document.getElementById('star4');
	var star5 = document.getElementById('star5');
	star0.classList.add("text-info");
	star2.classList.add("text-info");
	star3.classList.add("text-info");
	star4.classList.add("text-info");
	star5.classList.add("text-info");
	var starText = document.getElementById("starText");
	star0.addEventListener('click', function() {
		starText.innerText = "전체 등급";
		star0.classList.remove('bi-star');
		star0.classList.add('bi-star-fill'); 
		star2.classList.remove('bi-star-fill');
		star2.classList.add('bi-star');
		star3.classList.remove('bi-star-fill');
		star3.classList.add('bi-star');
		star4.classList.remove('bi-star-fill');
		star4.classList.add('bi-star');
		star5.classList.remove('bi-star-fill');
		star5.classList.add('bi-star');
	});

	star2.addEventListener('click', function() {
		starText.innerText = "2성급 이상";
		star0.classList.add('bi-star-fill'); 
		star0.classList.remove('bi-star');
		star2.classList.add('bi-star-fill');
		star2.classList.remove('bi-star');
		star3.classList.add('bi-star');
		star3.classList.remove('bi-star-fill');
		star4.classList.add('bi-star');
		star4.classList.remove('bi-star-fill');
		star5.classList.add('bi-star');
		star5.classList.remove('bi-star-fill');
	});

	star3.addEventListener('click', function() {
		starText.innerText = "3성급 이상";
		star0.classList.add('bi-star-fill'); 
		star0.classList.remove('bi-star');
		star2.classList.add('bi-star-fill');
		star2.classList.remove('bi-star');
		star3.classList.add('bi-star-fill');
		star3.classList.remove('bi-star');
		star4.classList.add('bi-star');
		star4.classList.remove('bi-star-fill');
		star5.classList.add('bi-star');
		star5.classList.remove('bi-star-fill');
	});

	star4.addEventListener('click', function() {
		starText.innerText = "4성급 이상";
		star0.classList.add('bi-star-fill'); 
		star0.classList.remove('bi-star');
		star2.classList.add('bi-star-fill');
		star2.classList.remove('bi-star');
		star3.classList.add('bi-star-fill');
		star3.classList.remove('bi-star');
		star4.classList.add('bi-star-fill');
		star4.classList.remove('bi-star');
		star5.classList.add('bi-star');
		star5.classList.remove('bi-star-fill');
	});

	star5.addEventListener('click', function() {
		starText.innerText = "5성급";
		star0.classList.add('bi-star-fill'); 
		star0.classList.remove('bi-star');
		star2.classList.add('bi-star-fill');
		star2.classList.remove('bi-star');
		star3.classList.add('bi-star-fill');
		star3.classList.remove('bi-star');
		star4.classList.add('bi-star-fill');
		star4.classList.remove('bi-star');
		star5.classList.add('bi-star-fill');
		star5.classList.remove('bi-star');
	});
	
	
	const inputDateBox = document.getElementById("checkInput");
	const inputPeopleBox = document.getElementById("people");
	
	const inputDate = inputDateBox.value;
	const [inputStart,inputEnd] = inputDate.split("-");
	const inputPeople = inputPeopleBox.value;
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				for(list of response.list){
					const row = document.createElement("div");
					row.classList.add("row");
					row.classList.add("mt-3");
					row.classList.add("border-top");
					row.classList.add("border-bottom");
					row.classList.add("border-end");
					
					const imgdiv = document.createElement("div");
					imgdiv.classList.add("col-4","p-0");
					
					const action = document.createElement("a");
					action.href = "./hotelInfoPage?id="+list.hotelDto.id+"&startDate="+inputStart+"&endDate="+inputEnd+"&people="+inputPeople+"&dayDifference="+dayDifference;
					
					const img = document.createElement("img");
					img.src = "/uploadFiles/" + list.hotelDto.hotel_img;
					img.style.width = "300px";
					img.style.height = "200px";
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
					
					const price = list.price.price * dayDifference;
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
					
					hotelBox.appendChild(row);
					
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
					col.innerText = "예약할 수 있는 숙소가 없습니다.";
					div.appendChild(col);
					hotelBox.appendChild(div);
					
				}
			
		}
	}
	xhr.open("get","./getHotelListByStar?category="+categoryValue+"&star="+star+"&checkBoxValues="+checkedValues+"&orderByNumber="+orderByNumber+"&startDay="+searchStart+
			"&endDay="+searchEnd+"&fixed_number="+searchPeople+"&loc="+searchLoc);
	xhr.send();
}

function hotelSearch(){
	const dayFilterBox = document.getElementById("checkInput");
	const peopleFilterBox = document.getElementById("people");
	const locFilterBox  = document.getElementById("locInput");
	
	const filterDate = dayFilterBox.value;
	const [filterStart,filterEnd] = filterDate.split("-");
	
	searchStart = filterStart; 
	searchEnd = filterEnd;
	searchPeople = peopleFilterBox.value;
	if(locFilterBox.value !='여행지를 입력하세요.'){
	searchLoc = locFilterBox.value;
	}
	
	getHotelListByStar(starValue);
	
}




function getCategoryList(){
	const xhr = new XMLHttpRequest();
	const categoryBox = document.getElementById("categoryBox");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status==200){
			const response = JSON.parse(xhr.responseText);
			for(list of response.cateList){
				const div = document.createElement("div");
				div.classList.add("row");
				div.classList.add("mt-2");
				
				const col = document.createElement("div");
				col.classList.add("col");
				
				const checkBox = document.createElement("input");
				checkBox.type= "checkbox";
				checkBox.value= list.id;
				checkBox.classList.add("checkbox");
				checkBox.setAttribute("onclick","getCheckList()");
				col.appendChild(checkBox);
				const textSpan = document.createElement("span");
				textSpan.innerText = " " + list.category;
				col.appendChild(textSpan);
				div.appendChild(col);
				
				categoryBox.appendChild(div);
				
				
			}
		}
	}
	xhr.open("get","./getCategoryList");
	xhr.send();	
}



function getCheckList() {
  const checkBoxes = document.getElementsByClassName("checkbox");
  checkedValues = []; // 함수 실행마다 초기화
  
  for (let i = 0; i < checkBoxes.length; i++) {
    if (checkBoxes[i].checked) {
      checkedValues.push(checkBoxes[i].value);
    }
  }
  
  console.log(checkedValues);
  getHotelListByStar(starValue)
 
}

function deleteFilter(){
	checkedValues = []; 
	const checkBoxes = document.getElementsByClassName("checkbox");
	for (let i = 0; i < checkBoxes.length; i++) {
		  checkBoxes[i].checked = false;
		}
	
	categoryValue = '전체';
	var btnAll = document.getElementById('btn-all');
	var btnHotel = document.getElementById('btn-hotel');
	var btnPension = document.getElementById('btn-pension');
	var btnVilla = document.getElementById('btn-villa');
	var btnGuesthouse = document.getElementById('btn-guesthouse');
    btnAll.classList.add('catebutton'); 
    btnHotel.classList.remove('catebutton'); 
    btnPension.classList.remove('catebutton');
    btnVilla.classList.remove('catebutton');
    btnGuesthouse.classList.remove('catebutton');

	starValue = 0;
	var star0 = document.getElementById('star0');
	var star2 = document.getElementById('star2');
	var star3 = document.getElementById('star3');
	var star4 = document.getElementById('star4');
	var star5 = document.getElementById('star5');
	
	var starText = document.getElementById("starText");

		starText.innerText = "전체 등급";
		star0.classList.remove('bi-star');
		star0.classList.add('bi-star-fill'); 
		star2.classList.remove('bi-star-fill');
		star2.classList.add('bi-star');
		star3.classList.remove('bi-star-fill');
		star3.classList.add('bi-star');
		star4.classList.remove('bi-star-fill');
		star4.classList.add('bi-star');
		star5.classList.remove('bi-star-fill');
		star5.classList.add('bi-star');


    orderByNumber = 1;
    const reviewOrderBy= document.getElementById("reviewOrderBy");
	const starOrderBy= document.getElementById("starOrderBy");
	const rowPriceOrderBy= document.getElementById("rowPriceOrderBy");
	const highPriceOrderBy= document.getElementById("highPriceOrderBy");
	reviewOrderBy.classList.add("fw-bold");
	starOrderBy.classList.remove("fw-bold");
	rowPriceOrderBy.classList.remove("fw-bold");
	highPriceOrderBy.classList.remove("fw-bold");
	
	getHotelListByStar(starValue)
}


function orderBy(number){
	orderByNumber = number;
	const reviewOrderBy= document.getElementById("reviewOrderBy");
	const starOrderBy= document.getElementById("starOrderBy");
	const rowPriceOrderBy= document.getElementById("rowPriceOrderBy");
	const highPriceOrderBy= document.getElementById("highPriceOrderBy");
	if(number == 1){
		reviewOrderBy.classList.add("fw-bold");
		starOrderBy.classList.remove("fw-bold");
		rowPriceOrderBy.classList.remove("fw-bold");
		highPriceOrderBy.classList.remove("fw-bold");
	}else if(number == 2){
		reviewOrderBy.classList.remove("fw-bold");
		starOrderBy.classList.add("fw-bold");
		rowPriceOrderBy.classList.remove("fw-bold");
		highPriceOrderBy.classList.remove("fw-bold");
	}else if(number ==3){
		reviewOrderBy.classList.remove("fw-bold");
		starOrderBy.classList.remove("fw-bold");
		rowPriceOrderBy.classList.add("fw-bold");
		highPriceOrderBy.classList.remove("fw-bold");
	}else if(number ==4){
		reviewOrderBy.classList.remove("fw-bold");
		starOrderBy.classList.remove("fw-bold");
		rowPriceOrderBy.classList.remove("fw-bold");
		highPriceOrderBy.classList.add("fw-bold");
	}
	getHotelListByStar(starValue)
	
}
//날짜 collapse
function getDateCollapse(){
	const collapse = bootstrap.Collapse.getOrCreateInstance("#dateCollapse");
	
	collapse.show();
	
	
	
}

function hideDateCollapse(){
	const collapse = bootstrap.Collapse.getOrCreateInstance("#dateCollapse");
	const dayBox = document.getElementById("checkInput");

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

	dayBox.value = start + " - " + end;
	
	collapse.hide();
}



window.addEventListener("DOMContentLoaded",function(){
	getHotelListByStar(0);
	getCategoryList();

	
});	
</script>


</head>
<body>
<div class="container-fluid">
		<div class="row">

			<div class="col">
				<jsp:include page="../common/topNavi.jsp"></jsp:include>
			</div>
	
		</div>
		<div class="row mt-3"  style="background-color: #58ACFA;">
			<div class="col-2"></div>
			<div class="col-3  pt-2 pb-3 pe-1 form-floating">
				<input type="text" class="form-control form-control-lg fw-semibold fs-6" id="locInput">
				<label for="people">여행지/숙소이름</label>
			</div>
			<div class="col-3 ps-0 pt-2 pb-3 pe-1 form-floating">
				<input type="text" class="form-control  form-control-lg fw-semibold fs-6" id="checkInput" onclick="getDateCollapse()">
				<label for="people">체크인/체크아웃 날짜</label>
			</div>
			<div class="col-1 ps-0 pt-2 pb-3 pe-1 form-floating">
				<input type="number" class="form-control  form-control-lg fw-semibold fs-6" id="people" value="2">
				<label for="people">인원</label>
			</div>
			<div class="col-1 ps-0 pt-2 pb-3 form-floating">
				<button type="button" class="btn btn-light fs-6 fw-semibold custom-text-color"
				  style="--bs-btn-padding-y: .5rem; --bs-btn-padding-x: 1.4rem; --bs-btn-font-size: .75rem; height: 3.5rem;" onclick="hotelSearch()">
				  검색
				</button>
			</div>
			<div class="col-2"></div>
		</div>
		 <div class="row">
	    	<div class="col">
	    		<div class="collapse" id="dateCollapse">
				  <div class="row">
				  	<div class="col-5"></div>
				  	<div class="col">
				  		<input type="date" id="startDay">부터
				  		<input type="date" id="endDay">
				  		<button type="button" class="btn btn-outline-primary" onclick="hideDateCollapse()">적용</button>
				  	</div>
				  </div>
				</div>
			  </div>
		</div>
		<div class="row mt-4">
			<div class="col-2"></div>
			<div class="col">
				<div class="row">
					<div class="col-3"> <!-- 지도 종류 필터 -->
						<div class="row">
							<div class="col d-grid">
								<button type="button" class="btn btn-outline-secondary btn-lg text-primary fw-semibold"><i class="bi bi-geo-alt-fill"></i> 지도로 보기</button>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col fw-bold fs-5">종류</div>
						</div>
						<div class="row mt-3">
						    <div class="col d-grid">
						        <button type="button" class="btn btn-white border rounded-pill catebutton" onclick="getHotelCategory('전체')" id="btn-all">전체</button>
						    </div>
						</div>
						<div class="row mt-1">
						    <div class="col d-grid">
						        <button type="button" class="btn  btn-white border rounded-pill" onclick="getHotelCategory('호텔')" id="btn-hotel">#호텔</button>
						    </div>
						</div>
						<div class="row mt-1">
						    <div class="col d-grid">
						        <button type="button" class="btn  btn-white border rounded-pill" onclick="getHotelCategory('펜션')" id="btn-pension">#펜션</button>
						    </div>
						</div>
						<div class="row mt-1">
						    <div class="col d-grid">
						        <button type="button" class="btn  btn-white border rounded-pill" onclick="getHotelCategory('풀빌라')" id="btn-villa">#풀빌라</button>
						    </div>
						</div>
						<div class="row mt-1">
						    <div class="col d-grid">
						        <button type="button" class="btn  btn-white border rounded-pill" onclick="getHotelCategory('게하')" id="btn-guesthouse">#게하</button>
						    </div>
						</div>

						<div class="row mt-4 border-top border-bottom">
							<div class="col-4 pt-3 pb-3 text-start fw-semibold fs-5">필터</div><div class="col pt-3 pb-2 text-end btn" onclick="deleteFilter()">전체 초기화</div>
						</div>
						<div class="row mt-3 text-semibold">
							<div class="col fs-6">호텔 등급</div>
						</div>
						<div class="row mt-1">
							<div class="col fs-7 text-secondary" id="starText">전체 등급</div>
						</div>
						<div class="row mt-1 border-bottom pb-4">
							<div class="col">
								<span class="icon-text-wrapper">
								  <i class="bi bi-star-fill text-info starsize" onclick="getHotelListByStar('0')" id="star0"></i>
								  <span class="text-overlay text-secondary fw-semibold"></span>
								</span>
								<span class="icon-text-wrapper">
								  <i class="bi bi-star starsize" onclick="getHotelListByStar('2')" id="star2"></i>
								  <span class="text-overlay text-secondary fw-semibold"></span>
								</span>		
								<span class="icon-text-wrapper">
								  <i class="bi bi-star starsize"  onclick="getHotelListByStar('3')" id="star3"></i>
								  <span class="text-overlay text-secondary fw-semibold"></span>
								</span>		
								<span class="icon-text-wrapper">
								  <i class="bi bi-star starsize" onclick="getHotelListByStar('4')" id="star4"></i>
								  <span class="text-overlay text-secondary fw-semibold"></span>
								</span>		
								<span class="icon-text-wrapper">
								  <i class="bi bi-star starsize" onclick="getHotelListByStar('5')" id="star5"></i>
								  <span class="text-overlay text-secondary fw-semibold"></span>
								</span>							
							</div>
						</div>
					<div class="row mt-4">
						<div class="col fs-5 fw-semibold">카테고리</div>
					</div>
					<div class="row mt-2" > <!-- 여기에 체크박스 넣어주기 -->
						<div class="col" id="categoryBox">
							
						</div>
					</div>
					</div>
					<div class="col ms-3"><!-- 숙소 -->
						<div class="row orderby mb-4">
							<div class="col-6"></div>
							<div class="col text-center">
								<span class="me-3 btn btn-sm fw-bold" onclick="orderBy(1)" id="reviewOrderBy">·많은 후기순</span>
								<span class="me-3 btn btn-sm" onclick="orderBy(2)" id="starOrderBy">·평점순</span>
								<span class="me-3 btn btn-sm" onclick="orderBy(3)" id="rowPriceOrderBy">·낮은 가격순</span>
								<span class="me-3 btn btn-sm" onclick="orderBy(4)" id="highPriceOrderBy">·높은 가격순</span>
							</div>
						
						</div>
						<div class="row">
							<div class="col"  id="hotelBox">
								
							</div>
						</div>
					
					
					</div> 
				</div>
			</div>
			<div class="col-2"></div>
		</div>
</div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>

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

var checkInput = document.getElementById("checkInput");

checkInput.value = startDay +"-"+endDay;

const locBox = document.getElementById("locInput");

const locList = ["서울","대구","부산","여수","강릉","평창"];
const random = Math.floor(Math.random() * 5) + 1;
locBox.value = locList[random];

</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script>
	const postId = new URLSearchParams(location.search).get("id");




	 
	 
	function xml() {
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 & xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				
			
		}
	}
	
	xhr.open("get", "쿼리");
	xhr.send();
}
	

	
	function getDayList() {
		  const container_days = document.getElementById("container_days");
		  const xhr = new XMLHttpRequest();
		  xhr.onreadystatechange = function () {
		    if (xhr.readyState === 4 && xhr.status === 200) {
		      const response = JSON.parse(xhr.responseText);
		      const startDate = new Date(response.postDto.day_start);
		      const endDate = new Date(response.postDto.day_end);
		      
		      for (const data of response.dayList) {
		        const div1 = document.createElement("div");
		        div1.classList.add("row");
		        const div2 = document.createElement("div");
		        div2.classList.add("col", "border-bottom", "text-center", "pt-1");
		        div2.style.height = "60px";
		        const div3 = document.createElement("div");
		        const span1 = document.createElement("span");
		        span1.textContent = "Day " + data.trip_day;
		        const span2 = document.createElement("span");
		        span2.textContent = getFormattedDate(startDate, data.trip_day);
		        
		        div3.appendChild(span1);
		        div3.appendChild(document.createElement("br"));
		        div3.appendChild(span2);
		        div2.appendChild(div3);
		        div1.appendChild(div2);
		        container_days.appendChild(div1);
		      }
		    }
		  }
		  
		  xhr.open("get", "./getDayList?postId=" + postId);
		  xhr.send();
		}

		function getFormattedDate(startDate, dayOffset) {
		  const date = new Date(startDate);
		  date.setDate(date.getDate() + dayOffset - 1);
		  const month = String(date.getMonth() + 1).padStart(2, '0');
		  const day = String(date.getDate()).padStart(2, '0');
		  const weekday = getWeekday(date.getDay());
		  
		  return `${month}.${day} (${weekday})`;
		}

		function getWeekday(day) {
		  const weekdays = ["일", "월", "화", "수", "목", "금", "토"];
		  return weekdays[day];
		}










	

	
	
	/* function getDayList() {
		  const xhr = new XMLHttpRequest();
		  xhr.onreadystatechange = function () {
		    if (xhr.readyState === 4 && xhr.status === 200) {
		      const response = JSON.parse(xhr.responseText);
		      
		      
		      
		      const startDay = new Date(response.postDto.day_start);
		      const endDay = new Date(response.postDto.day_end);
		      const currentDate = new Date(startDay); // 시작 날짜를 기준으로 현재 날짜 설정
		      const container_days = document.getElementById("container_days");
		      console.log("startDay:", startDay);
		      console.log("endDay:", endDay);
		      while (currentDate <= endDay) {
		    	console.log("currentDate:", currentDate);
		        const row1 = document.createElement("div");
		        row1.classList.add("row");

		        const col1 = document.createElement("div");
		        col1.classList.add("col", "border-bottom", "text-center", "pt-1");
		        col1.style.height = "60px";

		        const div1 = document.createElement("div");
		        const span = document.createElement("span");
		        span.textContent = "Day " + getDayNumber(startDay, currentDate); // 날짜번호 계산
		        div1.appendChild(span);
		        col1.appendChild(div1);

		        const div2 = document.createElement("div");
		        const small1 = document.createElement("small");
		        small1.textContent = formatDate(currentDate);
		        div2.appendChild(small1);
		        col1.appendChild(div2);

		        row1.appendChild(col1);
		        currentDate.setDate(currentDate.getDate() + 1);
		        container_days.appendChild(row1);
		        
		        
		        
		        
		        
		        col1.addEventListener("click", function () {
		            handleDaySelection(getDayNumber(startDay, currentDate), new Date(currentDate));
		        });
		      }
		      
		      handleDaySelection(1, new Date(startDay));
		    }
		  };

		  
		  xhr.open("get", "./getDaylist?id=" + postId);
		  xhr.send();
		} */

/* 	function insertDayList() {
		const dayNumber = getDayNumber(startDay, currentDate);
		
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 & xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				
			
		}
	}
	
	xhr.open("POST", "./insertDayList");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("dayList" + dayNumber);
} */
	
	
	
	
	/* // 날짜 번호 계산
	function getDayNumber(startDay, currentDate) {
	  const timeDiff = Math.abs(currentDate.getTime() - startDay.getTime());
	  const dayNumber = Math.ceil(timeDiff / (1000 * 3600 * 24)) + 1;
	  return dayNumber;
	}

	// 날짜 포맷
	function formatDate(date) {
	  const year = date.getFullYear();
	  let month = date.getMonth() + 1;
	  if (month < 10) month = "0" + month;
	  let day = date.getDate();
	  if (day < 10) day = "0" + day;
	  const daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
	  const dayOfWeek = daysOfWeek[date.getDay()];
	  
	  return month + "." + day + " (" + dayOfWeek + ")";
	}

		 
	 
	function handleDaySelection(dayNumber, selectedDate) {

		const dayInfoContainer = document.getElementById("day_info_container");
		  dayInfoContainer.innerHTML = "";

		  const dayInfo = document.createElement("div");
		  dayInfo.classList.add("col", "border-bottom", "text-center", "pt-3");
		  dayInfo.style.height = "60px";
		  dayInfo.innerHTML = "Day " + dayNumber + " | " + formatDate(selectedDate);
		  dayInfoContainer.appendChild(dayInfo);
		}
	  */
	 
	 
	window.addEventListener("DOMContentLoaded", function() {
		  getDayList();
		  
		  
		  
		  
		});
	 
 </script>
<style>
	::placeholder {
 		 font-size: 12px;
	}
</style>
</head>
<body>
	 <div class="container-fluid">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="row">
                    <div class="col">
                    	<jsp:include page="../common/topNavi.jsp"></jsp:include>
                    </div>
                </div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>


    <div class="container-fluid">
        <div class="row" style="height: calc(100vh - 60px);">
            <!-- 첫번째 -->
            <div class="col-1 border-left border-top border-bottom">
                <div class="row">
                    <div class="col border-bottom text-center pt-3" style="height: 60px;">
                        <span>일정</span>
                    </div>
                </div>
                <!-- for -->
                <div id="container_days"></div>
                
                <!-- <div id="container_days" class="row">
                    <div class="col border-bottom text-center pt-1" style="height: 60px;">
                        <div>
                            <span>Day 1</span>
                        </div>
                        <div>
                            <small>06.11 (화요일)</small>
                        </div>
                    </div>
                </div> -->
                <!-- /for -->
            </div>





            <!-- 두번째 -->
            <div class="col-2 border">
                <div id="day_info_container">
                    
                    <!-- <div class="col border-bottom text-center pt-3" style="height: 60px;">
                        <span>Day1&nbsp|&nbsp06.11(화요일)</span>
                    </div> -->
                </div>
                <!-- for -->
                <div class="row">
                    <div class="col border-bottom" style="height: 120px;">
                        <div class="row">
                            <div class="col-10 mt-1 text-center">
                                <span style="font-size: 20px;">노량진 컵밥</span>
                            </div>
                            <div class="col-2 pr-3">
                                <input type="button" style="height: 10px; width: 10px;">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-auto ms-4">
                                <label for="timeInput">시간</label>
                            </div>
                            <div class="col">
                                <input id="timeInput" class="form-control" type="time" style="height: 28px; width: 85%;">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-auto ms-4">
                                <label for="memoInput">메모</label>
                            </div>
                            <div class="col">
                                <input id="memoInput" class="form-control" type="text" placeholder="메모를 작성해주세요." style="height: 28px; width: 85%;">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /for -->
            </div>

            <!-- 세번째 -->
            <div class="col-2 border-bottom">
                <div class="row">
                    <div class="col border-bottom border-top" style="height: 61px;">
                        <form class="d-flex mt-2" role="search" onsubmit="searchPlaces(); return false;">
                            <input id="keyword" class="form-control me-2" type="search" placeholder="검색" aria-label="검색">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col border-bottom" style="height: 60px;">
                        리스트
                    </div>
                </div>
            </div>

            <!-- 네번째 -->
            <div class="col-7 border" style="padding: 1px">
                <div id="map" style="width:100%;height:100%;"></div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6bb230f942595875a71c9910b889e653"></script>
                <script>
                    var container = document.getElementById('map');
                    var options = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667),
                        level: 3
                    };
                    var map = new kakao.maps.Map(container, options);
                    
                </script>
                
            </div>
        </div>

    </div>





    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>

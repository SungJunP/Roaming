<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<meta charset="UTF-8">
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
	
	

		
	
	function createDay() {
		
		  
		  const xhr = new XMLHttpRequest();
		  xhr.onreadystatechange = function () {
		    if (xhr.readyState == 4 && xhr.status == 200) {
		      const response = JSON.parse(xhr.responseText);
		      getDayList();
		    }
	};
		  
		  xhr.open("POST", "./addDay");
		  xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xhr.send("post_id=" + postId);
}
	
	
	
	function getDayList() {
		const dayListBox = document.getElementById("dayListBox");
		const addSchduleBox = document.getElementById("addSchduleBox");
		dayListBox.innerHTML = "";
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 & xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				
				
				for(data of response.dayList) {
					const row1 = document.createElement("div");
					row1.classList.add("mt-3");
					row1.innerText = data.trip_day;
					
					const deleteButton = document.createElement("button");
					deleteButton.classList.add("btn", "btn-primary", "ms-3", "mt-3");
					deleteButton.innerText = "삭제";
					deleteButton.addEventListener("click", function(){
						
						deleteDay(data.id);
						row1.remove();
					});
					const lineBreak1 = document.createElement("br");
					
					const input1 = document.createElement("input");
					input1.setAttribute("type", "text");
					input1.setAttribute("name", "trip_location");
					input1.setAttribute("placeholder", "위치를 입력해주세요");
					
					const input2 = document.createElement("input");
					input2.setAttribute("type", "text");
					input2.setAttribute("name", "trip_memo");
					input2.setAttribute("placeholder", "메모를 입력해주세요");
					
					
					
					row1.appendChild(deleteButton); 
					dayListBox.appendChild(row1);
					row1.appendChild(input1);
					row1.appendChild(input2);
					
				}
			}
		}
	
	xhr.open("get", "./getDayList?id=" + postId);
	xhr.send();
}
	

	function deleteDay(dayId) {
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 & xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				
				getDayList();
		}
	}
	
	xhr.open("get", "./deleteDay?id=" + dayId);
	xhr.send();
}
	
	
	
	
	
	
	
	
	window.addEventListener("DOMContentLoaded", function(){
		getDayList();
	});
	
	
	
	
	
</script>
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" value="${postId}" id="post_id">
	<button onclick="createDay()">일정추가</button>
<br>
<br>



















<div id="dayListBox">

</div>

<div id="addSchduleBox">

</div>
  
 <form action="./planProcess" method="post">
	<input type="submit" value="일정추가">
	<input type="hidden" value="${postId}" name="post_id">
</form>
<br>
<br>

<c:forEach items="${list}" var="map">
    <c:set var="dayDto" value="${map.dayDto}" />
    ${dayDto.trip_day}일차
    <a href="./dayDeleteProcess?id=${dayDto.id}&post_id=${map.postDto.id}">삭제</a>
    <br>
    
    <!-- 새로운 일정 추가 폼 -->
    <form action="./scheduleProcess" method="post">
        <input type="hidden" name="day_id" value="${dayDto.id}">
        <input type="hidden" name="post_id" value="${map.postDto.id}">
        <input type="text" name="trip_location" placeholder="위치를 입력해주세요">
        <input type="text" name="trip_memo" placeholder="메모를 입력해주세요">
        <input type="submit" value="추가">
        <br>
        <br>
    </form>
    
    <!-- 해당 일차의 일정 목록 -->
    <c:forEach items="${map.scheduleDto}" var="scheduleDto">
    <form action="./scheduleUpdateProcess" method="post">
    	<input type="hidden" name="id" value="${scheduleDto.id}">
    	<input type="hidden" name="post_id" value="${map.postDto.id}">
        <input type="text" name="trip_location" value="${scheduleDto.trip_location}" placeholder="위치를 입력해주세요">
        <input type="text" name="trip_memo" value="${scheduleDto.trip_memo}" placeholder="메모를 입력해주세요">
        <button type="submit">수정</button>
        <button type="submit" formaction="./scheduleDeleteProcess">삭제</button>
        
        <br>
    </form>    
    </c:forEach>
    
    <br>
</c:forEach>










<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
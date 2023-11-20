<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Date" %>
<%     
	Date now = new Date();
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	String formattedDateTime = formatter.format(now);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>zimSignFirstPage</title>
<style>

</style>
</head>
<body>
<jsp:include page="../common/topNavi.jsp"/>

<div class="container">
    <div class="row mt-5">
        <div class="col-2"></div>
        <div class="col-8">
        	<div class="row">
        		<div class="col">
        			 <form action="./zimSignFirstProcess" method="post" enctype="multipart/form-data">
					 <div class="row border-bottom border-success text-center mb-5"><h3>맡길 날짜 및 장소</h3></div>
				            <div class="row mb-3">
				                <label for="start_address" class="form-label">출발주소</label>
				                <input type="text" id="start_address" name="start_address" placeholder="출발주소를 입력하세요"
				                    class="form-control">
				            </div>
				            <div class="row mb-3">
				                <label for="arrive_address" class="form-label">도착주소</label>
				                <input type="text" id="arrive_address" name="arrive_address" placeholder="도착주소를 입력하세요"
				                    class="form-control">
				            </div>
				            <div class="row mb-3">
				                <label for="start_date" class="form-label">맡길날짜 및 시간</label>
				                <input type="datetime-local" id="start_date" name="start_date" class="form-control" value="<%= formattedDateTime %>" required>
				            </div>
				            <div class="row mb-3">
				                <label for="arrive_date" class="form-label">찾을날짜 및 시간</label>
				                <input type="datetime-local" id="arrive_date" name="arrive_date" class="form-control" value="<%= formattedDateTime %>" required>
				            </div>
				            <div class="row mb-3">
				            	<div class="col-6"><label for="zimImage">사진<sup style="color : red;">*회수할 장소 및 짐 사진첨부시 더 정확한 서비스 제공가능</sup></label></div>
				            	<div class="col-6"><input type="file" name="zimImage" id="zimImage" accept="image/*" class="form-control"></div>
				            </div>
				            <div class="row mb-3">
				            	<div class="col-6"><a class="btn btn-success" href="./zimMainPage" role="button">홈으로</a></div>
				            	<div class="col-6"><button class="btn btn-success">다음으로</button></div>
				            </div>
				        </form>
				     </div>
        		</div>
        	</div>
        <div class="col-2"></div>
    </div>
</div>

</body>
</html>
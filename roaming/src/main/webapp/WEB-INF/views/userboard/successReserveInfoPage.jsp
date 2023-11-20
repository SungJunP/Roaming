<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
	<div class="row mt-5">
		<div class="col text-center fs-1 fw-semibold">
			예약이 완료 되었습니다.
		</div>
	</div>
	<div class="row mt-5">
		<div class="col-2"></div>
		<div class="col">
			<div class="row mt-5 border-bottom pb-3">
				<div class="col fw-semibold fs-5">
					예약정보
				</div>
			</div>
			<div class="row mt-4"><!-- 호텔명 , 사진, 예약날짜 -->
				<div class="col-2 pe-0"><!-- 숙소사진 -->
					<img width=100px; height=100px; src="/uploadFiles/${info.roomGroupDto.room_group_img}">
				</div>
				<div class="col  ps-0">
					<div class="row"> <!--호텔명 -->
						<div class="col fw-semibold fs-6">
							${info.roomGroupDto.room_group_name}
						</div>
					</div>
					<div class="row"><!-- 예약날짜 -->
						<div class="col text-secondary fs-6">
							${startDate } 15시 00분부터 ~ ${endDate }  11시 00분까지, 1박
						</div>
					</div>
					<div class="row mt-1">
						<c:forEach items="${info.option}" var="list">
						<div class="col-3">
						 	${list.plus_option}(<fmt:formatNumber value="${list.price}" pattern="#,###" var="formattedPrice" />
						${formattedPrice}원)
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="row mt-3 border-bottom pb-3"><!--추옵 전 금액 알려줌 -->
				<div class="col text-secondary fs-6"> 
					 결제 금액
				</div>
				<div class="col text-end fw-semibold fs-5">
					<fmt:formatNumber value="${info.reserveDto.final_price}" pattern="#,###" var="formattedPrice" />
									  ${formattedPrice} 원
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-4"></div>
				<div class="col-2 d-grid">
					<a type="button" class="btn btn-outline-dark" href="./hotelPage">홈</a>
				</div>
				<div class="col-2 d-grid">
					<a  class="btn btn-outline-primary" href="./userMyPage">마이페이지</a>
				</div>
				<div class="col-4"></div>
			</div>		
		</div>
		<div class="col-2"></div>
		</div>
</div>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
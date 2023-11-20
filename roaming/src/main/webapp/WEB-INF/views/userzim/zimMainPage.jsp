<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>zimMainPage</title>
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
        			<div class="row"><h3>짐 배송 서비스로 여행을 여유롭게 즐겨보세요</h3></div>
	        		<div class="row"><img src="/roaming/resources/img/zimBanner.jpg" class="img-fluid"></div>
	        	    <div class="row text-center">
	        	    	<div class="col-4"></div>
	        	   		<div class="col-4"><a class="btn btn-outline-success" href="./zimSignFirstPage" role="button"><h5>예약하기</h5></a></div>
        				<div class="col-4"></div>
        			<div class="row"><img src="/roaming/resources/img/zimMethod.png" class="img-fluid"></div>
        			<div class="row">
        				<div class="col">
        					<div class="row"><h4>리뷰들 들어갈 예정.</h4></div>
							<div class="row">
							  <div class="col-sm-6 mb-3 mb-sm-0">
								<div class="card mb-3" style="max-width: 540px;">
								  <div class="row g-0">
								    <div class="col-md-4">
								      <img src="/uploadRoamingFiles/" class="img-fluid rounded-start" alt="...">
								    </div>
								    <div class="col-md-8">
								      <div class="card-body">
								        <h5 class="card-title">로켓배송 저리가라</h5>
								        <p class="card-text">여기가 더 빠르다</p>
								        <p class="card-text"><small class="text-body-secondary">1일전 update</small></p>
								      </div>
								    </div>
								  </div>
								</div>
							  </div>
							  <div class="col-sm-6">
								<div class="card mb-3" style="max-width: 540px;">
								  <div class="row g-0">
								    <div class="col-md-4">
								      <img src="/uploadRoamingFiles/" class="img-fluid rounded-start" alt="...">
								    </div>
								    <div class="col-md-8">
								      <div class="card-body">
								        <h5 class="card-title">너무 빨리와서 좋았어요</h5>
								        <p class="card-text">숙소 도착하니까 와있더라구요!</p>
								        <p class="card-text"><small class="text-body-secondary">3일전 update</small></p>
								      </div>
								    </div>
								  </div>
								</div>
							  </div>
							</div>
        				</div>
        			</div>
        		</div>
        	</div>
        	<div class="row"></div>
        </div>
        <div class="col-2"></div>
    </div>
  </div>
</div>

</body>
</html>
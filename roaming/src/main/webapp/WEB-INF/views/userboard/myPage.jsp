<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>MainPage</title>
<style>
	.col-main {
		border-left: 1px solid rgba(0, 0, 0, 0.3);	
	}
	.col-top {
		border-top: 1px solid black;
	}
	.col-sub {
		border-left: 1px solid gray;
	}
	.shadow-none {
    	border: none;
    }
 	.card1 {
    	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  	}
  	.bgbg {
  		background-color: rgba(128, 128, 128, 0.1);
  	}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row col-main">
			<div class="col">
				<jsp:include page="../common/topNavi.jsp"></jsp:include>
			</div>
		</div>
		<div class="row">
			<div class="col-2">
				<div class="row">
					<div class="col">프로필 사진</div>
				</div>
			</div>
			<div class="col-8">
				<div class="row">
					<div class="col-3"></div>
					<div class="col">
						<div class="row"></div>
						<div class="row mt-3">
							<div class="col"></div>
							<div class="col">나의 성향 배지</div>
							<div class="col">온도 36.5</div>
						</div>
					</div>
				</div>
				<div class="row">
					 <div class="col-8">
			            <div class="card">
			              <ul class="list-group list-group-flush">
			              <li class="list-group-item btn btn-light">
							  <a href="./orderHistoryPage">주문내역 조회</a>
							</li>
			                <li class="list-group-item btn btn-light">
							  <a href="./couponListPage">쿠폰 리스트</a>
							</li>
			                <li class="list-group-item btn btn-light">
			                  <a href="./userCouponPage">내 쿠폰함</a>
			                </li>
			                <li class="list-group-item btn btn-light">
			                  <a href="./itemListPage">상품 리스트</a>
			                </li>
			                <li class="list-group-item btn btn-light">
			                  <a href="./userMyPage">예약/숙소</a>
			                </li>
			              </ul>
			            </div>
			         </div>
				</div>
				<div class="row">
					<div class="col"><a href="../post/joinConfirmPage">참가신청보기</a>
<a href="../post/participationPage">참가리스트</a></div>
				</div>
				<div class="row"></div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
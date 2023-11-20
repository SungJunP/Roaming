<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>구매 완료</title>
</head>
<body>
	 <div class="container">
	 
		<div class="row">
		<jsp:include page="../common/topNavi.jsp"></jsp:include>
			<div class="col">
				
			</div>
		</div>
	
		<div class="row mt-5">
			<div class="col"></div>
			<div class="col-6">

				<div class="row mt-5">
					<div class="col fw-bold fs-1 text-center">구매완료</div>
				</div>
				<div class="row mt-3">
                    <div class="col d-grid">
                        <a href="./orderHistoryPage" class="btn btn-outline-primary">주문 목록 조회하기</a>
                    </div>
                    <div class="col d-grid">
                        <a href="./itemListPage" class="btn btn-outline-primary">상품 리스트 페이지로 이동</a>
                    </div>
                </div>
                

			</div>
			<div class="col"></div>
		</div>
	</div>
</body>
</html>
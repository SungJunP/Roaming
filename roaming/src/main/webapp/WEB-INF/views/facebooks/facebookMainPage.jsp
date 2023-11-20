<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>facebookMainPage</title>
<style>
	.col-main1 {
		border-bottom: 1px solid gray;
	}
	.col-sub {
		border-left: 1px solid gray;
	}
	.fixed-left-navbar {
      position: fixed;
      top: 0;
      left: 0;
      height: 100vh;
      width: 250px;
      padding: 20px;
      background-color: white;
    }
    .custom-border {
		border-right: 1px solid rgba(128, 128, 128, 0.5);
  		/* border-radius: 15px; */
	}
	.custom-border2 {
		border-left: 1px solid rgba(128, 128, 128, 0.5);
  		/* border-radius: 15px; */
  		height: 100vh;
        width: 250px;
        background-color: white;
	}
	.col-main {
		border-bottom: 1px solid rgba(128, 128, 128, 0.5);
		
	}
	.col-box {
		border: 1px solid rgba(128, 128, 128, 0.5);
		border-radius: 10px;
		box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
	}
	.col-ss {
		border-radius: 50%;
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
	</div>
	<div class="row mt-3">
		<div class="col mt-1"></div>
	</div>
	<div class="row mt-5">
		<div class="col-2"></div>
		<div class="col-8">
			<div class="row">
				<div class="col-2 left-navbar">
					    <ul class="nav flex-column">
					      <!-- <li class="nav-item">
					        <a class="nav-link active" href="#"><img class="img-fluid" src="/facebook/resources/img/"></a>
					      </li> -->
					      <li class="nav-item">
					        <a class="nav-link active text-dark fw-bold fs-5" href="#"><i class="bi bi-house-door-fill"></i> 홈</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fw-bold fs-5" href="#">프로필</a>
					      </li>

					      <li class="nav-item">
					        <a class="nav-link text-dark fw-bold fs-5" href="#"><i class="bi bi-send"></i> 메세지</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fw-bold fs-5" href="./makeFeedPage"><i class="bi bi-file-plus"></i>피드 만들기</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fw-bold fs-5" href="./makeReelsPage"><i class="bi bi-file-plus"></i>릴스 만들기</a>
					      </li>
					    </ul>
				</div>
				<div class="col-1"></div>
				<div class="col-6">
					<div class="row">
						<div class="col col-box">
							<div class="row col-main">
								<div class="col">
									<a class="text-dark text-center fw-bold fs-4" style="display: flex; justify-content: center; text-decoration: none;" href="./feedMainPage"><i class="bi bi-compass"></i> 피드</a>
								</div>
								<div class="col">
									<a class="text-dark text-center fw-bold fs-4" style="display: flex; justify-content: center; text-decoration: none;" href="./reelsMainPage"><i class="bi bi-file-earmark-slides-fill"></i> 릴스</a>
								</div>
							</div>
							<div class="row">
							<!-- foreach 사용해서 반복문 -->
								<div class="col my-2">
									<a href="#">
								    	<img class="img-fluid" src="/roaming/resources/img/cardb.png">
								    </a>
								</div>
								<div class="col my-2">
									<a href="#">
								    	<img class="img-fluid" src="/roaming/resources/img/cardb.png">
								    </a>
								</div>
								<div class="col my-2">
									<a href="#">
								    	<img class="img-fluid" src="/roaming/resources/img/cardb.png">
								    </a>
								</div>
								<div class="col my-2">
									<a href="#">
								    	<img class="img-fluid" src="/roaming/resources/img/cardb.png">
								    </a>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-4">
						<div class="col col-box">
							<div class="row">
								<div class="col-2 my-2">
									<a href="#">
								    	<img class="img-fluid col-ss" style="width:50px; height:50px;" src="/roaming/resources/img/cardb.png">
								    </a>
								</div>
								<div class="col">
									<a class="text-dark fw-bold fs-6 mt-2" style="display: flex; justify-content: start; text-decoration: none;" href="#">닉네임 쓰기</a>
								</div>
							</div>
							<div class="row">
								<div class="col my-2">
									<a href="#">
								    	<img class="img-fluid" src="/roaming/resources/img/exex.jpeg">
								    </a>
								</div>
							</div>
							<div class="row col-main">
								<div class="col">
									<a class="text-dark fw-bold fs-6 mt-2" style="display: flex; justify-content: start; text-decoration: none;" href="#">좋아요 수, 댓글 수, 공유 수</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="text-dark text-center fs-5" style="display: flex; justify-content: center; text-decoration: none;" href="#"><i class="bi bi-compass"></i>좋아요</a>
								</div>
								<div class="col">
									<a class="text-dark text-center fs-5" style="display: flex; justify-content: center; text-decoration: none;" href="#"><i class="bi bi-compass"></i>댓글</a>
								</div>
								<div class="col">
									<a class="text-dark text-center fs-5" style="display: flex; justify-content: center; text-decoration: none;" href="#"><i class="bi bi-compass"></i>공유</a>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-4">
						<div class="col col-box">
							<div class="row">
								<div class="col-2 my-2">
									<a href="#">
								    	<img class="img-fluid col-ss" style="width:50px; height:50px;" src="/roaming/resources/img/cardb.png">
								    </a>
								</div>
								<div class="col">
									<a class="text-dark fw-bold fs-6 mt-2" style="display: flex; justify-content: start; text-decoration: none;" href="#">닉네임 쓰기</a>
								</div>
							</div>
							<div class="row">
								<div class="col my-2">
									<a href="#">
								    	<img class="img-fluid" src="/roaming/resources/img/exex.jpeg">
								    </a>
								</div>
							</div>
							<div class="row col-main">
								<div class="col">
									<a class="text-dark fw-bold fs-6 mt-2" style="display: flex; justify-content: start; text-decoration: none;" href="#">좋아요 수, 댓글 수, 공유 수</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="text-dark text-center fs-5" style="display: flex; justify-content: center; text-decoration: none;" href="#"><i class="bi bi-compass"></i>좋아요</a>
								</div>
								<div class="col">
									<a class="text-dark text-center fs-5" style="display: flex; justify-content: center; text-decoration: none;" href="#"><i class="bi bi-compass"></i>댓글</a>
								</div>
								<div class="col">
									<a class="text-dark text-center fs-5" style="display: flex; justify-content: center; text-decoration: none;" href="#"><i class="bi bi-compass"></i>공유</a>
								</div>
							</div>
						</div>
					</div>
				<!-- foreach 사용해서 반복문 -->
				</div>
				<div class="col-1"></div>
				<div class="col-2">
					<a class="nav-link text-dark fw-bold fs-5" href="#">친구 목록</a>
				</div>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
	<div class="row"></div>
	<div class="row"></div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
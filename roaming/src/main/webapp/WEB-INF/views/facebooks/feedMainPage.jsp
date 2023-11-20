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
		border-bottom: 1px solid rgba(128, 128, 128, 0.3);
		
	}
	.col-box {
		border: 1px solid rgba(128, 128, 128, 0.5);
		border-radius: 10px;
		box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
	}
	.col-ss {
		border-radius: 50%;
	}
	.col-bg {
		background-color: rgba(0, 128, 0, 0.1);
		border-bottom: 1px solid rgba(128, 128, 128, 0.3);
	}
	.overlay {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      font-size: 24px;
      color: white;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
    }
    .overlay-bg {
      position: relative;
    }
    .photo {
    	border-radius: 20px;
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
		<div class="row col-bg col-main">
			<div class="col"></div>
			<div class="col">
				<div class="row mt-5">
					<div class="col fw-bold fs-5 text-center"><i class="bi bi-instagram"></i> 피드</div>
				</div>
				<div class="row mt-4">
					<div class="col fw-bold fs-2 text-center">비슷한 관심사</div>
				</div>
				<div class="row">
					<div class="col fw-bold fs-2 text-center">여행자 피드 구독하기</div>
				</div>
				<div class="row mt-4">
					<div class="col fs-6 text-center">나와 비슷한 멤버를 찾아 팔로우하면</div>
				</div>
				<div class="row">
					<div class="col fs-6 text-center">언제 어디서나 더 가깝게 연결될 수 있어요.</div>
				</div>
				<div class="row mt-5"></div>
				<div class="row mt-5">
					<div class="col"></div>
					<div class="col fs-5 text-center"><a href="./feedMainPage" style="text-decoration: none; opacity: 0.7;" class="text-dark">최신 피드</a></div>
					<div class="col fs-5 text-center"><a href="./feedMainPagePer" style="text-decoration: none; opacity: 0.7;" class="text-dark">인기 피드</a></div>
					<div class="col"></div>
				</div>
			</div>
			<div class="col"></div>
		</div>
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
					<div class="row">
 					
					<c:forEach  var="map" items="${list}">
						<div class="col-md-3 mt-3">
							
							<div class="row">
								<div class="col position-relative">
								<i class="bi bi-heart text-black">${map.count}</i>
								<a href="./feedDetailPage?id=${map.feedDto.id}">
								<img class="img-fluid photo" src="/uploadFiles/${map.feedImageDto.feed_image}"/>
								<input type="hidden" name="id" value="${map.feedDto.id}">
								</a>
								</div>
							</div>
							<div class="row">
								<div class="col fw-bold fs-6 text-start">${map.feedDto.feed_title }</div>
							</div>
							
						</div>
					</c:forEach>
 
					</div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
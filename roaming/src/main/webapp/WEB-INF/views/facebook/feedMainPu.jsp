<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>mainPage</title>
    <style>
        .fixed-left-navbar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 330px;
            background-color: white;
            border-right: 1px solid rgba(128, 128, 128, 0.3);
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .bold-icon {
            text-shadow: 0 0 2px rgba(0, 0, 0, 0.3);
        }
        .dropdown-menu1 {
            transform: translateY(calc(580px));
        }
        .col-bg {
			background-color: rgba(0, 128, 0, 0.1);
			border-bottom: 1px solid rgba(128, 128, 128, 0.3);
		}
		.col-feed {
			border-bottom: 2px solid rgba(128, 128, 128, 1.0);
		}
    </style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-3 fixed-left-navbar">
				<div class="row">
					<div class="col mt-5 mx-2">
						<a class="navbar-brand" href="../userboard/mainPage">
				    		<img class="img-fluid" style="width:130px; height:30px;" src="/roaming/resources/img/logo223.png">
				    	</a>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col left-navbar">
					    <ul class="nav flex-column">
					      <!-- <li class="nav-item">
					        <a class="nav-link active" href="#"><img class="img-fluid" src="/facebook/resources/img/"></a>
					      </li> -->
					      <li class="nav-item">
					        <a class="nav-link active text-dark fs-6" href="./facebookMain"><i class="bi bi-house-door fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;홈</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fs-6" href="#"><i class="bi bi-search fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;검색</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fs-6 col-feed" href="./feedMain"><i class="bi bi-compass-fill fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;피드</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fs-6" href="./reelsMainPage"><i class="bi bi-file-earmark-slides fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;릴스</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fs-6" href="#"><i class="mr-3 bi bi-send fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;메세지</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fs-6" href="#"><i class="mr-3 bi bi-heart fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;알림</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fs-6" href="./makeFeedPage"><i class="bi bi-file-plus fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;피드 만들기</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fs-6" href="./makeReelsPage"><i class="bi bi-file-plus fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;릴스 만들기</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fs-6" href="./myPage">프로필</a>
					      </li>
					      <li class="nav-item dropdown dropup dropdown-menu1">
				          <a class="nav-link dropdown-toggle fw-bold fs-5 text-dark" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				          <c:if test="${!empty sessionUser}">
				          	${sessionUser.user_name}님
				          </c:if>
				          <c:if test="${empty sessionUser}">
				          	로그인
				          </c:if>
				          </a>
				          <ul class="dropdown-menu">
				            <li><hr class="dropdown-divider"></li>
				            <c:choose>
				            	<c:when test="${!empty sessionUser}">
				            		<li><a class="dropdown-item fw-bold fs-6" href="../user/logoutProcess">로그아웃</a></li>
				            		<li><a class="dropdown-item fw-bold fs-6" href="../userboard/myPage">마이페이지</a></li>
				           			<li><a class="dropdown-item fw-bold fs-6" href="#">장바구니</a></li>
				            	</c:when>
				            	<c:otherwise>
				            		<li><a class="dropdown-item fw-bold fs-6" href="../user/loginPage">로그인</a></li>
				            	</c:otherwise>
				            </c:choose>
				          </ul>
				        </li>
					    </ul>
				</div>
				</div>
			</div>
			<div class="col">
				<div class="row col-bg col-main">
					<div class="col"></div>
					<div class="col-6">
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
							<div class="col fs-5 text-center"><a href="./feedMain" style="text-decoration: none; opacity: 0.7;" class="text-dark">최신 피드</a></div>
							<div class="col fs-5 text-center col-feed"><a href="./feedMainPu" style="text-decoration: none; opacity: 0.7;" class="text-dark">인기 피드</a></div>
							<div class="col"></div>
						</div>
					</div>
					<div class="col-2"></div>
				</div>
				<div class="row">
					<div class="col"></div>
					<div class="col-6">
						<div class="row">
						<c:forEach  var="map" items="${list}" varStatus="status">
							<div class="col-md-4 mt-3">
								<div class="row">
									<div class="col position-relative px-1">
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
							<c:if test="${status.index%3==2||status.last}">
								</div><div class="row">
							</c:if>
						</div>
						</c:forEach>
					</div>
					</div>
					<div class="col-2"></div>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
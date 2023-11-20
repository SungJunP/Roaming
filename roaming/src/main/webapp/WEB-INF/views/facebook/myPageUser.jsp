<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script>
	const userId = new URLSearchParams(location.search).get("userId")
	
	var mySessionId = null
	function getSessionId() {
		const xhr = new XMLHttpRequest()
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText)
				if(response.result == "success") {
					mySessionId = response.id
				}
			}
		}
		xhr.open("get", "../user/getMyId", false)
		xhr.send()
	}
	
	function reloadMyBoard() {
		const xhr = new XMLHttpRequest()
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText)
				const boardBox = document.getElementById("getBoardList")
				boardBox.innerHTML = ""
				
				response.list.forEach(function(map) {
					const col1 = document.createElement("div")
					col1.classList.add("col-4", "p-1")
					
					const img = document.createElement("img")
					img.classList.add("img-fluid")
					img.src="/uploadFiles/" + map.feedImageDto.feed_image
					
					const link = document.createElement("a")
					link.href = "./feedDetailPage?id=" + map.feedImageDto.feed_id
					link.appendChild(img)
					
					col1.appendChild(link)
					boardBox.appendChild(col1)
				})
			}
		}
		xhr.open("get", "./getMyBoardList?userId=" + userId)
		xhr.send()
	}
	/* <div class="col-2">
		<a href="#" class="btn btn-sm btn-primary">팔로우</a>
	</div> */
	const param = '${sessionUser.id}'
	function registerFollow() {
		const xhr = new XMLHttpRequest()
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 400) {
				const response = JSON.parse(xhr.responseText)
				 
				if(!mySessionId) {
					return;
				}
			}
		}
		xhr.open("post", "./followProcess")
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
		xhr.send("send_id=" + param + "&receive_id=" + userId)
	}
	
	window.addEventListener("DOMContentLoaded", function() {
		getSessionId()
		reloadMyBoard()
	})
</script>
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
		.custom-border {
		border: 1px solid rgba(128, 128, 128, 0.5);
  		/* border-radius: 15px; */
		}
		.col-login {
			border-bottom: 1px solid rgba(128, 128, 128, 0.3);
		}
		.gray-line {
	        position: relative;
	    }
	
	    .gray-line::before {
	        content: "";
	        position: absolute;
	        top: 50%;
	        left: 0;
	        transform: translateY(-50%);
	        width: 100%;
	        height: 1px;
	        background-color: rgba(128, 128, 128, 0.5);
	    }
	    .img-size {
    		border-radius: 50%;
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
					        <a class="nav-link active text-dark" href="./facebookMain"><i class="bi bi-house-door fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;홈</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fs-6" href="#"><i class="bi bi-search fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;검색</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fs-6" href="./feedMain"><i class="bi bi-compass fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;피드</a>
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
					        <a class="nav-link text-dark fs-6 fs-6" href="./makeReelsPage"><i class="bi bi-file-plus fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;릴스 만들기</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fs-6 col-feed" href="./myPage">프로필</a>
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
				<div class="row">
					<div class="col-4"></div>
					<div class="col-6">
						<div class="row mt-5 col-login">
							<div class="col-1"></div>
							<div class="col-3 mb-5">
								<c:if test="${map.userDto.profile_img == null}">
									<img class="img-fluid img-size" style="width: 140px; height: 140px;" src="/roaming/resources/img/oirgin.png">
								</c:if>
								<c:if test="${map.userDto.profile_img != null}">
									<img class="img-fluid img-size" style="width: 130px; height: 130px;" src="/uploadFiles/${map.userDto.profile_img}">
								</c:if>
							</div>
							<div class="col">
								<div class="row">
									<div class="col-2 fw-bold fs-5">${map.userDto.user_id}</div>
									<div class="col-2">
										<a class="btn btn-sm btn-primary" onclick="registerFollow()">팔로우</a>
									</div>
									<div class="col-3">
										<a href="#" class="btn btn-sm btn-secondary">메세지 보내기</a>
									</div>
									<div class="col"></div>
								</div>
								<div class="row mt-3">
									<div class="col-2">게시물 ${count}</div>
									<div class="col-2">팔로워 ${follower}</div>
									<div class="col-2">팔로우 ${follow}</div>
									<div class="col"></div>
								</div>
								<div class="row mt-3 fw-bold small">
									<div class="col">${map.userDto.user_name}</div>
								</div>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col"></div>
							<div class="col small text-center"><i class="bi bi-grid-3x3"></i> 게시물</div>
							<div class="col small text-center"><i class="bi bi-bookmark"></i> 릴스</div>
							<div class="col small text-center"><i class="bi bi-camera"></i> 태그됨</div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col-1"></div>
							<div class="col">
									<div class="row" id="getBoardList"></div>
							</div>
							<div class="col-1"></div>
						</div>
					</div>
					<div class="col"></div>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>

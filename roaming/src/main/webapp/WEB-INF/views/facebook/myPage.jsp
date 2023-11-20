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
	
	function getMyProfileInfo() {
		const xhr = new XMLHttpRequest()
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText)
				const map = response.map
				const count = response.count
				
				document.getElementById("getMyProfileInfo").innerHTML = ""
					
				const row1 = document.createElement("div")
				row1.classList.add("row", "mt-5", "col-login")
				
				
				const col1 = document.createElement("div")
	            col1.classList.add("col-1")
	            row1.appendChild(col1)

	            const col2 = document.createElement("div")
	            col2.classList.add("col-3", "mb-5")
	            if(map.userDto.profile_img == null) {
	                const img = document.createElement("img")
	                img.classList.add("img-fluid", "img-size")
	                img.style.width = "140px"
	                img.style.height = "140px"
	                img.src = "/roaming/resources/img/oirgin.png"
	                col2.appendChild(img)
	            }
	            if(map.userDto.profile_img != null) {
	                const img = document.createElement("img")
	                img.classList.add("img-fluid", "img-size")
	                img.style.width = "140px"
	                img.style.height = "140px"
	                img.src = "/uploadFiles/" + map.userDto.profile_img
	                col2.appendChild(img)
	            }
	            row1.appendChild(col2)
	            
	            const col3 = document.createElement("div")
	            col3.classList.add("col")
	            row1.appendChild(col3)

	            const row2 = document.createElement("div")
	            row2.classList.add("row")

	            const col4 = document.createElement("div")
	            col4.classList.add("col-2", "fw-bold", "fs-5")
	            col4.innerText = map.userDto.user_id
	            row2.appendChild(col4)

	            const col5 = document.createElement("div")
	            col5.classList.add("col-3")

	            const link = document.createElement("a")
	            link.classList.add("btn", "btn-dark", "btn-sm")
	            link.href = "./myPageChange"
	            link.innerText = "프로필 편집"
	            col5.appendChild(link)
	            row2.appendChild(col5)

	            const col6 = document.createElement("div")
	            col6.classList.add("col")
	            row2.appendChild(col6)
	            col3.appendChild(row2)

	            const row3 = document.createElement("div")
	            row3.classList.add("row", "mt-3")

	            const col7 = document.createElement("div")
	            col7.classList.add("col-3")
	            col7.innerText = "게시물" + count
	            row3.appendChild(col7)

	            const col8 = document.createElement("div")
	            col8.classList.add("col-3")
	            col8.innerText = "팔로워"
	            row3.appendChild(col8)

	            const col9 = document.createElement("div")
	            col9.classList.add("col")
	            row3.appendChild(col9)
	            col3.appendChild(row3)

	            const row4 = document.createElement("div")
	            row4.classList.add("row", "mt-3", "fw-bold", "small")

	            const col10 = document.createElement("div")
	            col10.classList.add("col")
	            col10.innerText = map.userDto.user_name
	            row4.appendChild(col10)
	            col3.appendChild(row4)
	            row1.appendChild(col3)

	            document.getElementById("getMyProfileInfo").appendChild(row1)
			}
		}
		xhr.open("get", "./getMyPageInfo")
		xhr.send()
	}
			/* <c:forEach var="map" items="${list}" varStatus="status">
			  <c:if test="${status.index % 3 == 0}">
			    <div class="row">
			  </c:if>
			  <div class="col-md-4 mt-3">
			    <img class="img-fluid" src="/uploadFiles/${map.feedImageDto.feed_image}"/>
			  </div>
			  <c:if test="${status.index % 3 == 2 or status.last}">
			    </div>
			  </c:if>
			</c:forEach> */
	function reloadBoard() {
		const xhr = new XMLHttpRequest()
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
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
		xhr.open("get", "./getBoardList")
		xhr.send()
	}
	window.addEventListener("DOMContentLoaded", function() {
		getSessionId()
		reloadBoard()
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
									<div class="col-3"><a href="./myPageChange" class="btn btn-dark btn-sm">프로필 편집</a></div>
									<div class="col"></div>
								</div>
								<div class="row mt-3">
									<div class="col-3">게시물&nbsp;&nbsp;&nbsp;${count}</div>
									<div class="col-3">팔로워</div>
									<div class="col-3">팔로우</div>
									<div class="col-3"></div>
								</div>
								<div class="row mt-3 fw-bold small">
									<div class="col">${map.userDto.user_name}</div>
								</div>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col"></div>
							<div class="col small text-center"><i class="bi bi-grid-3x3"></i> 게시물</div>
							<div class="col small text-center"><i class="bi bi-bookmark"></i> 저장됨</div>
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

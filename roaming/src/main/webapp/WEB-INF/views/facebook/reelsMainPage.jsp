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
	let mySessionId = null
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
	function reloadReelsList() {
		  const xhr = new XMLHttpRequest();
		  xhr.onreadystatechange = function() {
		    if (xhr.readyState === 4 && xhr.status === 200) {
		      const response = JSON.parse(xhr.responseText);
		      const reelsContainer = document.getElementById("reelsForMoon");
		      reelsContainer.innerHTML = "";

		      response.list.forEach(function (map) {
		        const row = document.createElement("div");
		        row.classList.add("row");

		        const col = document.createElement("div");
		        col.classList.add("col");
		        row.appendChild(col);

		        const overlayContainer = document.createElement("div");
		        overlayContainer.classList.add("overlay-container");
		        overlayContainer.style.position = "relative";
		        col.appendChild(overlayContainer);

		        const overlayContent = document.createElement("div");
		        overlayContent.classList.add("overlay-content");
		        overlayContainer.appendChild(overlayContent);

		        const profileLink = document.createElement("a");
		        profileLink.href = "./myPageUser?userId=" + map.userDto.id;
		        overlayContent.appendChild(profileLink);

		        const profileImg = document.createElement("img");
		        profileImg.classList.add("img-fluid", "img-size", "text-end");
		        profileImg.style.width = "50px";
		        profileImg.style.height = "50px";
		        profileImg.src = "/uploadFiles/" + map.userDto.profile_img;
		        profileLink.appendChild(profileImg);

		        const nameLink = document.createElement("a");
		        nameLink.classList.add("fw-bold", "text-start");
		        nameLink.style.textDecoration = "none";
		        nameLink.style.color = "white";
		        nameLink.href = "./myPageUser?userId=" + map.userDto.id;
		        nameLink.innerText = map.userDto.user_name;
		        overlayContent.appendChild(nameLink);

		        const dateDiv = document.createElement("div");
		        dateDiv.classList.add("col-2", "small");
		        dateDiv.innerText = map.datef;
		        overlayContent.appendChild(dateDiv);

		        const contentToggle = document.createElement("button");
		        contentToggle.classList.add(
		          "btn",
		          "btn-link",
		          "text-decoration-none",
		          "collapsed",
		          "text-white",
		          "small"
		        );
		        contentToggle.setAttribute("type", "button");
		        contentToggle.setAttribute("data-bs-toggle", "collapse");
		        contentToggle.setAttribute(
		          "data-bs-target",
		          "#reelsContent-" + map.reelsDto.id
		        );
		        contentToggle.setAttribute("aria-expanded", "false");
		        contentToggle.setAttribute(
		          "aria-controls",
		          "reelsContent-" + map.reelsDto.id
		        );
		        contentToggle.innerText = "더 보기";
		        overlayContent.appendChild(contentToggle);

		        const contentCollapse = document.createElement("div");
		        contentCollapse.classList.add("collapse");
		        contentCollapse.setAttribute("id", "reelsContent-" + map.reelsDto.id);
		        overlayContainer.appendChild(contentCollapse);

		        const content = document.createElement("div");
		        content.innerText = map.reelsDto.reels_content;
		        contentCollapse.appendChild(content);

		        const video = document.createElement("video");
		        video.classList.add("img-fluid");
		        video.style.position = "relative";
		        video.style.zIndex = "-1";
		        video.src = "/uploadFiles/" + map.reelsDto.reels_video;
		        video.controls = false;
		        col.appendChild(video);

		        video.addEventListener("click", function () {
		          if (video.paused) {
		            video.play();
		          } else {
		            video.pause();
		          }
		        });

		        reelsContainer.appendChild(row);
		      });
		    }
		  };
		  xhr.open("get", "./getReelsList");
		  xhr.send();
		}


	window.addEventListener("DOMContentLoaded", function() {
		reloadReelsList()
	});
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
		.img-size {
    		border-radius: 50%;
    	}
    	.overlay-container {
    		position: absolute;
    		transform: translate(0, 90px);
    		top: 0;
    		left: 5;
    		padding: 10px;
    		background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0));
    		color: white;
    	}
    	.name-overlay {
    		font-weight: bold;
    		font-size: 13px;
    		margin-bottom: 5px;
    	}
    	.content-overlay {
    		font-weight: bold;
    		font-size: 13px;
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
					        <a class="nav-link text-dark fs-6" href="./feedMain"><i class="bi bi-compass fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;피드</a>
					      </li>
					      <li class="nav-item">
					        <a class="nav-link text-dark fs-6 col-feed" href="./reelsMainPage"><i class="bi bi-file-earmark-slides-fill fs-4 bold-icon"></i>&nbsp;&nbsp;&nbsp;릴스</a>
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
				<div class="row">
					<div class="col-5"></div>
					<div class="col">
						<div class="row" id="reelsForMoon"></div>
					</div>
					<div class="col"></div>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
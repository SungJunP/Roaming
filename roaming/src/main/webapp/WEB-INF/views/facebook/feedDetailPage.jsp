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
	const feedId = new URLSearchParams(location.search).get("id");
	let mySessionId = null;
	function getSessionId() {
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText)
				if(response.result == "success") {
					mySessionId = response.id;
				}
			}
		}
		xhr.open("get", "../user/getMyId", false);
		xhr.send();
	}
	function refreshTotalLikeCount() {
		const totalLikeCountBox = document.getElementById("totalLikeCount")
		totalLikeCountBox.innerHTML = ""
				
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText)
				totalLikeCountBox.innerText = response.count
			}
		}
		xhr.open("get", "../facebook/getTotalLikeCount?feedId=" + feedId);
		xhr.send();
	}
	function refreshTotalHateCount() {
		const totalHateCountBox = document.getElementById("totalHateCount")
		totalHateCountBox.innerHTML = ""
		
		const xhr = new XMLHttpRequest()
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText)
				totalHateCountBox.innerText = response.counth
			}
		}
		xhr.open("get", "../facebook/getTotalLikeCount?feedId=" + feedId);
		xhr.send();
	}
	function toggleLike() {
		if(mySessionId == null) {
			if(confirm("로그인을 해야 이용 가능..")) {
				location.href="../user/loginPage";
			}
			return
		}
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText)
				refreshTotalLikeCount()
				refreshTotalHateCount()
				refreshMyHeart()	
			}
		}
		xhr.open("get", "../facebook/toggleLike?feed_id=" + feedId)
		xhr.send()
	}
	function toggleHate() {
		if(mySessionId == null) {
			if(confirm("로그인을 해야 이용 가능..")) {
				location.href="../user/loginPage"
			}
			return
		}
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText)
				refreshTotalHateCount()
				refreshTotalLikeCount()
				refreshMyHate()	
			}
		}
		xhr.open("get", "../facebook/toggleHate?feed_id=" + feedId)
		xhr.send()
	}
	function refreshMyHeart() {
		if(mySessionId == null) return;
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				const heartBox = document.getElementById("heartBox")
				const hateBox = document.getElementById("hateBox")
				
				if(response.isLike) {
					heartBox.classList.remove("bi-heart")
					heartBox.classList.add("bi-heart-fill")
					hateBox.classList.remove("bi-heartbreak")
					hateBox.classList.remove("bi-heartbreak-fill")
					hateBox.classList.add("bi-heartbreak")
				} else {
					heartBox.classList.remove("bi-heart-fill")
					heartBox.classList.add("bi-heart")
					hateBox.classList.remove("bi-heartbreak")
					hateBox.classList.remove("bi-heartbreak-fill")
					hateBox.classList.add("bi-heartbreak")
				}
			}
		}
		xhr.open("get", "../facebook/isLiked?feed_id=" + feedId)
		xhr.send()
	}
 	function refreshMyHate() {
		if(mySessionId == null) return;
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				const heartBox = document.getElementById("heartBox")
				const hateBox = document.getElementById("hateBox")

			    if(response.isHate) {
					heartBox.classList.remove("bi-heart")
					heartBox.classList.remove("bi-heart-fill")
					heartBox.classList.add("bi-heart")
					hateBox.classList.remove("bi-heartbreak")
					hateBox.classList.remove("bi-heartbreak-fill")
					hateBox.classList.add("bi-heartbreak-fill")
				} else {
					heartBox.classList.remove("bi-heart-fill")
					heartBox.classList.add("bi-heart")
					hateBox.classList.remove("bi-heartbreak")
					hateBox.classList.remove("bi-heartbreak-fill")
					hateBox.classList.add("bi-heartbreak")
				}	
			}
		}
		xhr.open("get", "../facebook/isHated?feed_id=" + feedId)
		xhr.send()
		
	}
	function showHidePostButton() {
		const commentTextBox = document.getElementById("commentTextBox")
		const postButton = document.getElementById("postButton")
		if(commentTextBox.value.trim() !== "") {
			postButton.style.display = "inline-block"
		} else {
			postButton.style.display = "none"
		}
	}
	function registerComment() {
		if(!mySessionId) {
			return;
		}
		const commentTextBox = document.getElementById("commentTextBox")
		const commentTextValue = commentTextBox.value;
		const commentTextValueBr = commentTextValue.replace(/\n/g, "<br>")
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText)
				commentTextBox.value = ""
				reloadCommentList()
				showHidePostButton()
			}
		}
		xhr.open("post", "../facebook/registerComment")
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
		xhr.send("feed_id=" + feedId + "&feed_comment=" + encodeURIComponent(commentTextValue))
	}
	function reloadCommentList() {
		const xhr = new XMLHttpRequest()
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText)
				document.getElementById("commentListBox").innerHTML = ""
				
				for(data of response.feedCommentDto) {
					const row1 = document.createElement("div")
					row1.classList.add("row")
					row1.classList.add("commentOuter")
					row1.setAttribute("id", data.feedCommentDto.id)

					const colNickname = document.createElement("div")
					colNickname.classList.add("col-3")
					colNickname.classList.add("bg-white")
					colNickname.innerText = data.userDto.user_name
					row1.appendChild(colNickname)
					
					const colCommentBox = document.createElement("div")
					colCommentBox.classList.add("commentBox")
					colCommentBox.classList.add("col")
					colCommentBox.classList.add("bg-white")
					colCommentBox.innerText = data.feedCommentDto.feed_comment
					row1.appendChild(colCommentBox)
					
					
					if(mySessionId != null && data.feedCommentDto.user_comment_id) {
						const colDelete = document.createElement("div")
						colDelete.classList.add("col-2")
						colDelete.innerText = "삭제"
						colDelete.setAttribute("onclick", "deleteComment(" + data.feedCommentDto.id + ")")
						row1.appendChild(colDelete)
						
						const colUpdate = document.createElement("div")
						colUpdate.classList.add("col-2")
						colUpdate.innerText = "수정"
						colUpdate.setAttribute("onclick", "changeInputForUpdateComment(this)")
						row1.appendChild(colUpdate)
					}
					document.getElementById("commentListBox").appendChild(row1)
				}
			}
		}
		xhr.open("get", "../facebook/getCommentList?feedId=" + feedId)
		xhr.send()
	}
	function deleteComment(id) {
		const xhr = new XMLHttpRequest()
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText)
				reloadCommentList()
			}
		}
		xhr.open("get", "../facebook/deleteComment?id=" + id)
		xhr.send()
	}
	function changeInputForUpdateComment(targetElement) {
		
		const commentOuter = targetElement.closest(".commentOuter");
		const commentBox = commentOuter.querySelector(".commentBox")
		const tempValue = commentBox.innerText
		commentBox.innerHTML = ""
		
		const inputTextComment = document.createElement("input")
		inputTextComment.type = "text"
		inputTextComment.classList.add("commentInputBox")
		inputTextComment.value = tempValue
		commentBox.appendChild(inputTextComment)
		
		const inputButtonUpdate = document.createElement("button")
		inputButtonUpdate.innerText = "수정 적용"
		inputButtonUpdate.setAttribute("onclick", "updateComment(this)")
		commentBox.appendChild(inputButtonUpdate)
		
		targetElement.innerText = "수정 취소"
		targetElement.setAttribute("onclick", "cancelUpdate(this)")
		
	}
	function cancelUpdate(targetElement) {
		console.log("---")
	}
	function updateComment(targetElement) {
		console.log("hey: ", targetElement)
		/* const commentOuter = targetElement.closest(".commentOuter"); */
		const commentOuter = targetElement.closest(".commentOuter")
		const id = commentOuter.getAttribute("id")
		const commentText = document.querySelector(".commentInputBox").value
		
		const xhr = new XMLHttpRequest()
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText)
				reloadCommentList()
			}
		}
		xhr.open("post", "./updateComment")
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
		xhr.send("id=" + id + "&feed_comment=" + commentText)
	}
	window.addEventListener("DOMContentLoaded", function() {
		getSessionId();
		refreshTotalLikeCount()
		refreshTotalHateCount()
		refreshMyHeart()
		refreshMyHate()
		reloadCommentList()
		setInterval(reloadCommentList, 30000);
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
		.custom-size {
		 	width: 700px; /* 원하는 가로 크기 */
		}
		.col-word {
			 max-width: 100%;
  			overflow-wrap: break-word;
		}
		.col-photo {
			border-radius: 50%;
		}
		.form-control-plain {
		    border: none;
		    outline: none;
		    box-shadow: none;
		    resize: none;
  			height: 25px !important;
		}
		.no-margin {
		    margin: 0;
		}
		.custom-collapse {
   			transform: translateY(-170%);
   			z-index: 1;
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
				<div class="row">
					<div class="col-5"></div>
					<div class="col">
						<div class="row mt-4">
							<div class="col fw-bold fs-5">상세 피드</div>
						</div>
						<div class="row mt-3">
							<div class="col-3">
								<div class="row">
									<div class="col text-end">
										<a href="./myPageUser?userId=${map.feedDto.user_id}">
										<img class="img-fluid col-photo text-center" style="width: 60px; height: 60px;" src="/uploadFiles/${map.userDto.profile_img}"/>
										</a>
									</div>
									<div class="col">
										<div class="row">
											<div class="col fw-bold fs-5"><a href="./myPageUser?userId=${map.feedDto.user_id}" style="text-decoration: none;" class="text-dark">${map.userDto.user_name}</a></div>
										</div>
										<div class="row">
											<div class="col small" style="opacity: 0.5;">${string}</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-9"></div>
						</div>
						<div class="row mt-2">
							<div class="col">
								<div id="carouselExampleIndicators" class="carousel slide">
								  <div class="carousel-indicators">
								     <c:forEach var="image" items="${mapt}" varStatus="status">
								      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" ${status.first ? 'class="active"' : ''} aria-label="Slide ${status.index + 1}"></button>
								    </c:forEach>
								  </div>
								  <div class="carousel-inner">
								    <c:forEach var="image" items="${mapt}" varStatus="status">
								      <div class="carousel-item ${status.first ? 'active' : ''}">
								        <img src="/uploadFiles/${image.feedImageDto.feed_image}" class="d-block w-100" alt="Slide ${status.index + 1}">
								      </div>
								    </c:forEach>
								  </div>
								  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>
								
							</div>					
						</div>
						<div class="row mt-1">
							<div class="col fs-6 col-word">${map.feedDto.feed_content}</div>
						</div>
						<div class="row">
							<div class="col-1"></div>
							<div class="col">
								<div class="row">
								<div class="col-4">
									<p class="no-margin">
										<button class="btn btn-whtie" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
											좋아요 <span class="badge text-bg-secondary" id="totalLikeCount"></span>싫어요 <span class="badge text-bg-secondary" id="totalHateCount"></span>
										</button>
									</p>
									<div class="collapse custom-collapse" id="collapseExample">
									  <div class="card">
									  	<div style="display: flex;">
									    <i id="heartBox" onclick="toggleLike()" class="bi bi-heart fs-3 text-danger"></i>
									    <i id="hateBox" onclick="toggleHate()" class="bi bi-heartbreak fs-3 text-danger"></i>
									  	</div>
									  </div>
									</div>
								</div>
								<div class="col"></div>
								</div>
							<div class="row">
								<div class="col-10">
									<textarea id="commentTextBox" class="form-control-plain" aria-label="댓글 달기..." placeholder="댓글 달기..."></textarea>
								</div>
								<div class="col d-grid">
									<input onclick="registerComment()" class="btn btn-white btn-sm" type="button" value="댓글 작성">
								</div>
							</div>
							<div class="row mt-3">
								<div id="commentListBox" class="col">
									<div class="row commentOuter">
										<div class="col"></div>
										<div class="col-1 bg-white">닉네임</div>
										<div class="commentBox col bg-white">내용</div>
										<div class="col bg-white">삭제</div>
										<div class="col bg-white">수정</div>
									</div>
								</div>
							</div>
							</div>
							<div class="col-1"></div>
						</div>
						
					</div>
					<div class="col-3"></div>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
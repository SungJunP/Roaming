<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>친구 목록 페이지</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row"><jsp:include page="../common/topNavi.jsp"></jsp:include></div>
		<div class="row mb-5 mt-5">
			<div class="col-2"></div>
			<div class="col">
				<div class="d-flex align-items-center">
					<h1 class="me-3">친구목록</h1>
					<a href="./teamAddPage" class="btn btn-outline-primary"
						role="button">그룹추가</a>
					<div class="ms-2"></div>
					<a href="./friendAddPage" class="btn btn-outline-primary"
						role="button">친구추가</a>
				</div>
			</div>
		</div>
	</div>
	<div class="row content mt-2">
		<div class="col-2"></div>
		<div class="col-4">
			<c:forEach items="${friendGroupList}" var="group">
				<div class="dropdown">
					<div class="mb-2">
						<button class="btn btn-outline-secondary dropdown-toggle"
							type="button" style="width: 200px;" data-bs-toggle="dropdown"
							aria-expanded="false">
							${group.friendGroupDto.group_name}</button>
						&nbsp;
						<c:if test="${group.friendGroupDto.group_name != '기본그룹'}">
							<a href="./updateFriendGroupPage?id=${group.friendGroupDto.id}"
								class="btn btn-outline-primary" role="button">수정</a>
                    &nbsp;
                    <a
								href="./deleteFriendGroupProcess?id=${group.friendGroupDto.id}"
								class="btn btn-outline-danger" role="button">삭제</a>
						</c:if>

						<ul class="dropdown-menu dropdown-menu">
							<c:forEach items="${friendList}" var="friend">
								<c:if
									test="${friend.friendGroupDto.group_name == group.friendGroupDto.group_name}">
									<li>
										<div class="mb-2 d-flex align-items-center"
											style="width: 200px;">
											<span class="me-1 ms-auto">${friend.userDto.user_name}</span>
											<a class="btn btn-outline-primary ms-2 px-2 py-1"
												href="./updateFriendMovePage?id=${friend.friendDto.id}">이동</a> 
											<a class="btn btn-outline-danger ms-2 px-2 py-1" href="./deleteFriendProcess?id=${friend.friendDto.id}">삭제</a>
										</div>
									</li>
									<li><hr class="dropdown-divider"></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="col-2"></div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>

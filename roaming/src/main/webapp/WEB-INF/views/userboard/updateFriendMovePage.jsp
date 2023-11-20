<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>친구 그룹 이동</title>
	<style>
        .title-section {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 100px;
            margin-bottom: 60px;
        }

        .title {
            margin-right: 10px;
        }

        .input-section {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .input-group {
            width: 200px;
            margin-right: 10px;
        }

        .input-group-text {
            border-radius: 0;
        }
    </style>
</head>
<body>
	<form action="./updateFriendMoveProcess" method="post">
	<div class="container-fluid">
		<div class="row"><jsp:include page="../common/topNavi.jsp"></jsp:include>
			<div class="col-2"></div>
			<div class="col-8">
				<div class="title-section">
                    <h2 class="title">친구 그룹 이동</h2>
                </div>
                <div class="input-section">
                    <div class="input-group">
                        <input type="text" name="group_name" class="form-control" maxlength="10">
                   		<input type="hidden" name="id" value="${updateFriendMove.friendDto.id}">
                    </div>
                    <button class="btn btn-outline-primary">이동</button>
                    <a class="btn btn-outline-danger" href='./friendGroupPage'>취소</a>
                </div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
	</form>
</body>
</html>
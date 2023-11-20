<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>makeReels</title>
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
		box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.1);
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
				<div class="col"></div>
				<div class="col">
					<div class="row mt-5 col-box">
				<div class="col">
					<div class="row">
						<div class="col fw-bold fs-4">댓글 작성</div>
					</div>
					<form action="./feedWriteComplete" method="post">
					<div class="row">
						<div class="col">
							<textarea name="feed_comment" class="form-control" placeholder="댓글 작성"></textarea>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col d-grid">
							<input type="hidden" name="id" value="${id}">
							<button class="btn btn-primary btn-block">작성 완료</button>
						</div>
					</div>
					</form>
				</div>
			</div>
				</div>
				<div class="col"></div>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
	<div class="row"></div>
	<div class="row"></div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
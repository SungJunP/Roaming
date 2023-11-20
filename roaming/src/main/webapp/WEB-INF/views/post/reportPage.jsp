<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>신고페이지</h1>
<form action="./reportProcess" method="post">
	신고 게시물 번호 :<input type="text" name="post_id" value="${reportDto.post_id}" readonly><br>
	신고자 번호 :<input type="text" name="user_id" value="${reportDto.user_id}" readonly><br>
	<input type="text" name="title" placeholder="제목을 입력하세요"><br>
	<textarea name="content" rows="" cols="" placeholder="내용을 입력하세요"></textarea><br>
	<input type="submit" value="신고하기">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>참가신청 리스트</h1>
<c:forEach items="${joinConfirmDto}" var="item">
게시물 번호 : ${item.post_id}<br>
가입인사 : ${item.welcome_ment}<br>
유저번호 : ${item.user_id}<br>
등록일 : ${item.reg_date}<br>
<a href="./updateJoinConfirmProcess?id=${item.id}&post_id=${item.post_id}&user_id=${item.user_id}&status=y">수락</a>
<a href="./updateJoinConfirmProcess?id=${item.id}&post_id=${item.post_id}&user_id=${item.user_id}&status=n">거절</a>
</c:forEach>

</body>
</html>
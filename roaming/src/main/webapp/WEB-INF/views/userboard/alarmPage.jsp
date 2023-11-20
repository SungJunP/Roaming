<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <title>알림 페이지</title>
</head>
<body>
<form action="./updateFriendRequestProcess" method="post">
    <div class="container-fluid">
    <div class="row"> <jsp:include page="../common/topNavi.jsp"></jsp:include></div>
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <c:forEach items="${friendRequestList}" var="map">
                        <div class="row" style="margin-top: 100px;">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>${map.sendIdDto.user_name} 님이 친구요청을 신청했습니다</div>
                                        <div>
                                            <a class="btn btn-outline-primary" href="./updateFriendRequestProcess?id=${map.friendRequestDto.id}&user_id=${map.sendIdDto.id}&friend_id=${sessionUser.id}&status=Y">수락</a>

                                            <a class="btn btn-outline-danger" href="./updateFriendRequestProcess?id=${map.friendRequestDto.id}&user_id=${map.sendIdDto.id}&friend_id=${sessionUser.id}&status=N">거절</a> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </c:forEach>
            </div>
            <div class="col-2"></div>
        </div>
    </div>
</form>
</body>
</html>
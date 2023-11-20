<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
 <style>
	 body {
	     padding: 0px;
	     margin: 0px;
	 }
 </style>
<title>Insert title here</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="row">
                    <div class="col">
                    	<jsp:include page="../common/topNavi.jsp"></jsp:include>
                    </div>
                </div>
                
                
                <c:if test="${!empty sessionUser}">
                <div class="row">
                    <div class="col">
                        <a class="btn btn-primary" href="../post/registerPage">작성하기</a>
                    </div>
                </div>
                </c:if>
                
                
                <div class="row mt-5">
				    <c:forEach items="${list }" var="item">
				        <div class="col mt-3">
				            <a href="./postDetailPage?id=${item.postDto.id}">
					            <div class="card" style="width: 18rem; height: 420px;">
					                <img src="/uploadFiles/${item.postImageDto[0].post_image}" class="card-img-top" alt="사진" style="height: 200px;">
					                <div class="card-body">
					                    <h5 class="card-title text-center">${item.postDto.title}</h5>
					                    <p class="card-text text-start" style="max-height: 30px; overflow: hidden; text-overflow: ellipsis;">${item.postDto.content}</p>
					                </div>
					                <ul class="list-group list-group-flush">
					                    <li class="list-group-item"><p style="margin: 0;">여행기간</p>
					                    
					                    <fmt:formatDate value="${item.postDto.day_start}" pattern="yyyy-MM-dd" var="formatStart"/>
					                    <fmt:formatDate value="${item.postDto.day_end}" pattern="yyyy-MM-dd" var="formatEnd"/>
					                    <span>${item.days}일&nbsp|</span><span>&nbsp${formatStart}&nbsp~&nbsp${formatEnd}</span>
					                    </li>
					                    <li class="list-group-item">인원 ${item.count} / ${item.postDto.person_count} </li>
					                </ul>
					            </div>
				            </a>
				        </div>
				    </c:forEach>
				</div>

            </div>
            <div class="col-2"></div>
        </div>

    </div>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
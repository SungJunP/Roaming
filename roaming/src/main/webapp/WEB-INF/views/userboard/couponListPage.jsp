<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>쿠폰 리스트</title>
<style>
        .card-body {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
</style>
</head>
<body>
 <div class="container-fluid">
 	<div class="row">
  <jsp:include page="../common/topNavi.jsp"></jsp:include>
        <div class="row mb-5 mt-5">
            <div class="col-2"></div>
            <div class="col">
             <div class="d-flex align-items-center">
                <h1 class="me-3">쿠폰 리스트</h1>
             </div>
             <div class="col-2"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="row">
                    <c:forEach items="${couponList}" var="map" varStatus="status">
                        <div class="col-3">
                            <form action="./couponListProcess" method="post">
                                <div class="card mb-3" style="width: 18rem;">
                                    <img src="/uploadFiles/${map.couponDto.coupon_image}" class="card-img-top" style="width:250px; height:200px; margin: auto;">
                                    <div class="card-body">
                                        <h5 class="card-title">${map.couponDto.coupon_name}</h5>
                                        <p class="card-text">${map.couponDto.coupon_context}</p>
                                        <p class="card-text">할인율: ${map.couponDto.coupon_discount}%</p>
                                        <p class="card-text">수량: ${map.quantity}</p>
                                        <p class="card-text">~ <fmt:formatDate value="${map.couponDto.coupon_issue_end}" pattern="yy.MM.dd"/></p>
                                        <input type="hidden" name="user_id" value="${sessionUser.id}" />
                                        <input type="hidden" name="coupon_id" value="${map.couponDto.id}" />
                                        <c:choose>
                                        <c:when test="${map.duplicate == 0}"> 
                                        <input type="submit" class="btn btn-outline-primary" value="발급받기" />
                                        </c:when>
                                        <c:otherwise>
                                        <input type="submit" class="btn btn-outline-primary" disabled value="발급받기" />
                                        </c:otherwise>
                                    	</c:choose>	
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-2"></div>
            </div>
        </div>
    </div>
</body>
</html>

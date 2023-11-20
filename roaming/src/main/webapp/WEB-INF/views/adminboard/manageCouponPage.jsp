<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>쿠폰 관리</title>
 <style>
        .pagination {
            justify-content: center;
        }
 </style>
</head>
<body>
	<div class="container-fluid">
	<div class="row"><jsp:include page="../common/topNavi.jsp"></jsp:include>
        <div class="row mb-5 mt-5">
            <div class="col-2"></div>
            <div class="col">
                <div class="d-flex align-items-center">
                    <h1 class="me-3">쿠폰 관리</h1>
                    <a href="./produceCouponPage" class="btn btn-outline-dark me-2 btn-sm" role="button">쿠폰 생성</a>
                </div>
            </div>
            
        </div>
        <div class="row content mt-2">
            <div class="col-2"></div>
                <div class="col-sm-8 text-left"> 
                    <div class="row mb-3">
                        <div class="col-2 fs-3 fw-semibold">
                        쿠폰 현황
                        </div>
                        <div class="col pt-3 ps-0 text-start">
                            현재 사용가능한 쿠폰을 조회합니다
                        </div>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">쿠폰명</th>
                                <th scope="col">쿠폰내용</th>
                                <th scope="col">할인율(%)</th>
                                <th scope="col">수량</th>
                                <th scope="col">배포 기간</th>
                                <th scope="col">사용 기간</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${couponList}" var="map">
                                <tr>
                                    <th scope="row">${map.couponDto.id}</th>
                                    <td>${map.couponDto.coupon_name}</td>
                                    <td>${map.couponDto.coupon_context}</td>
                                    <td>${map.couponDto.coupon_discount}</td>
                                    <td>${map.quantity}</td>
                                    <td><fmt:formatDate value="${map.couponDto.coupon_startdate}" pattern="yy.MM.dd"/> ~ <fmt:formatDate value="${map.couponDto.coupon_enddate }" pattern="yy.MM.dd"/></td>
                                    <td><fmt:formatDate value="${map.couponDto.coupon_issue_start}" pattern="yy.MM.dd"/> ~ <fmt:formatDate value="${map.couponDto.coupon_issue_end }" pattern="yy.MM.dd"/></td>
                                 
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div>
                                               	<a href="./updateCouponPage?id=${map.couponDto.id}" class="btn btn-outline-primary me-2 btn-sm" role="button">수정</a>
                                                <a href="./deleteCouponProcess?id=${map.couponDto.id}" class="btn btn-outline-danger me-2 btn-sm" role="button">삭제</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                             </c:forEach>
                            </tbody>
                        </table>
                        <nav aria-label="...">
                            <ul class="pagination">
                             <c:choose>
                             	<c:when test="${startPage <= 1}">
                             		<li class="page-item disabled">
                                		<a class="page-link" href="./manageCouponPage?page=${startPage-1}">이전</a>
                              		</li>
                             	</c:when>
                             	<c:otherwise>
                             		<li class="page-item">
                                		<a class="page-link" href="./manageCouponPage?page=${startPage-1}">이전</a>
                              		</li>
                             	</c:otherwise>
                             </c:choose>
                             
                              <c:forEach begin="${startPage}" end="${endPage}" var="index">
                              		<c:choose>
                              			<c:when test="${index == currentPage }">
                              				<li class="page-item active"><a class="page-link" href="./manageCouponPage?page=${index}">${index}</a></li>
                              			</c:when>
                              			<c:otherwise>
                              				<li class="page-item"><a class="page-link" href="./manageCouponPage?page=${index}">${index}</a></li>
                              			</c:otherwise>
                              		</c:choose>
                              </c:forEach>
                              <c:choose>
                              	<c:when test="${endPage >= totalPage}">
                              		 <li class="page-item disabled">
		                                <a class="page-link" href="./manageCouponPage?page=${endPage+1}">다음</a>
		                             </li>
                              	</c:when>
                              	<c:otherwise>
                              		 <li class="page-item">
		                                <a class="page-link" href="./manageCouponPage?page=${endPage+1}">다음</a>
		                             </li>
                              	</c:otherwise>
                              </c:choose>
                             
                            </ul>
                          </nav>
                        <div class="row mt-5 mb-3">
                            <div class="col-2 fs-3 fw-semibold">
                            만료된 쿠폰
                        </div>
                        <div class="col pt-3 ps-0 text-start">
                            사용기간 만료, 수량없음, 삭제된 쿠폰을 조회합니다
                        </div>
                        </div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">쿠폰명</th>
                                <th scope="col">쿠폰내용</th>
                                <th scope="col">할인율(%)</th>
                                <th scope="col">수량</th>
                                <th scope="col">배포 기간</th>
                                <th scope="col">사용 기간</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${notExistcouponList}" var="map">
                                <tr>
                                   <th scope="row">${map.couponDto.id}</th>
                                    <td>${map.couponDto.coupon_name}</td>
                                    <td>${map.couponDto.coupon_context}</td>
                                    <td>${map.couponDto.coupon_discount}</td>
                                    <td>${map.quantity}</td>
                                    <td><fmt:formatDate value="${map.couponDto.coupon_startdate}" pattern="yy.MM.dd"/> ~ <fmt:formatDate value="${map.couponDto.coupon_enddate }" pattern="yy.MM.dd"/></td>
                                    <td><fmt:formatDate value="${map.couponDto.coupon_issue_start}" pattern="yy.MM.dd"/> ~ <fmt:formatDate value="${map.couponDto.coupon_issue_end }" pattern="yy.MM.dd"/></td>
                                </tr>
                             </c:forEach>
                            </tbody>
                            </table>
                            <nav aria-label="...">
                                <ul class="pagination">
                                <c:choose>
                                	<c:when test="${startPage2 <= 1}">
                                	 <li class="page-item disabled">
	                                    <a class="page-link" href="./manageCouponPage?pageNum=${startPage2-1}">이전</a>
	                                 </li>
                                	</c:when>
                                	<c:otherwise>
	                                  <li class="page-item">
	                                    <a class="page-link" href="./manageCouponPage?pageNum=${startPage2-1}">이전</a>
	                                  </li>
                                	</c:otherwise>
                                </c:choose>
                                 
                                  <c:forEach begin="${startPage2}" end="${endPage2}" var="index2">
                              	 	<c:choose>
                              			<c:when test="${index2 == currentPage2 }">
                              				<li class="page-item active"><a class="page-link" href="./manageCouponPage?pageNum=${index2}">${index2}</a></li>
                              			</c:when>
                              			<c:otherwise>
                              				<li class="page-item"><a class="page-link" href="./manageCouponPage?pageNum=${index2}">${index2}</a></li>
                              			</c:otherwise>
                              		</c:choose>
                              	  </c:forEach>	
                              	  <c:choose>
                              	  <c:when test="${endPage2 >= totalPage2}">
                              	  	<li class="page-item">
	                                    <a class="page-link" href="./manageCouponPage?pageNum=${endPage2+1}">다음</a>
	                                </li>
                              	  </c:when>
                              	  <c:otherwise>
                              	  	<li class="page-item">
	                                    <a class="page-link" href="./manageCouponPage?pageNum=${endPage2+1}">다음</a>
	                                </li>
                              	  </c:otherwise>
                              	  </c:choose>
                                  
                                </ul>
                              </nav>
                </div>
            <div class="col-2"></div>
            </div>
        </div>
    </div>
</body>
</html>
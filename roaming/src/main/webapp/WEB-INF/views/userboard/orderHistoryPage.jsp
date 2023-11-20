<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
        <div class="row border-bottom mb-5">
            <div class="col">
                <jsp:include page="../common/topNavi.jsp"></jsp:include>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="row">
                    <div class="col fw-semibold fs-2">
                       주문내역 조회
                </div>
            </div>
            <div class="row mt-5 border-bottom pb-3">
                <div class="col fw-semibold fs-4">
                   상품정보
                </div>
             </div>
             <table class="table">
                <thead>
                    <tr>
                        <th scope="col">이미지</th>
                        <th scope="col">상품명</th>
                        <th scope="col">번호</th>
                        <th scope="col">가격</th>
                        <th scope="col">상태</th>
                        <th scope="col">결제일</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                     <c:forEach items="${orderHistoryList}" var="map" >
                        <tr>
                            <th scope="row" style="vertical-align: middle;"><img src="/uploadFiles/${map.itemDto.item_thumbnail}" style="width:50px; height:50px;"></th>
                              <td style="vertical-align: middle;">${map.itemDto.item_name}</td>
                              <td style="vertical-align: middle;">${map.itemBuyDto.id}</td>
                              <td style="vertical-align: middle;">${map.itemDto.item_price}P</td>
                              <td style="vertical-align: middle;">${map.itemBuyDto.progress}</td>
                               <td style="vertical-align: middle;"><fmt:formatDate value="${map.itemBuyDto.reg_date}" pattern="yy.MM.dd"/></td>
                            <td>
							
								    <div class="d-flex align-items-center">
								        <div>
								            <a href="./writeReviewPage?id=${map.itemBuyDto.id}" class="btn btn-outline-primary me-2 btn-sm" role="button">리뷰작성하기</a>
								        </div>
								    </div>
						
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <nav aria-label="...">
                    <ul class="pagination">
                      <li class="page-item disabled">
                        <a class="page-link">이전</a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item active" aria-current="page">
                        <a class="page-link" href="#">2</a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item">
                        <a class="page-link" href="#">다음</a>
                      </li>
                    </ul>
                  </nav>
            
             </div>
             <div class="col-2"></div>
             </div>
    </div>
</body>
</html>
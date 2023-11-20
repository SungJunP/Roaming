<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>상품 상세 페이지</title>
</head>
<body>
	<div class="container-fluid">
	<div class="row"> <jsp:include page="../common/topNavi.jsp"></jsp:include></div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <section class="py-5">
                        <div class="container px-4 px-lg-5 my-5">
                       
                            <div class="row gx-4 gx-lg-5 align-items-center">
                                <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0"src="/uploadFiles/${itemDetail.itemDto.item_thumbnail}" style="width:400px; height:400px;"/></div>
                                <div class="col-md-6">
                                    <div class="small mb-1">${itemDetail.itemCategoryDto.category}</div>
                                    <h1 class="display-5 fw-bolder">${itemDetail.itemDto.item_name}</h1>
                                    <div class="fs-5 mb-5">
                                        <span class="text">${itemDetail.itemDto.item_price}P</span>
                                    </div>
                                    <p class="lead">${itemDetail.itemDto.item_context}</p>
                                    <div class="d-flex">
                                        <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />                                  
                                    </div>
                                    <br>
                                    <div class="payment-info" style="display: flex; align-items: center;">
                                        <div class="payment-info h4" style="margin-right: 10px;">
                                        <h4>총 결제 금액: ${itemDetail.itemDto.item_price}P</h4>
                                        </div>
                                         <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="./itemBuyPage?id=${itemDetail.itemDto.id}">구매하기</a></div>
                                    </div>
                                      </div>
                                </div>
                            </div>
                            
                        </div>
                    </section>
                    <h3>상품 정보</h3>
                    <hr>
	                    <c:forEach items="${itemDetail.itemImageDto}" var="map">
	                    <div style="display: flex; justify-content: center;">
	                        <img src="/uploadFiles/${map.image}">
	                    </div>
	                    </c:forEach>
                    <h3>상품 후기</h3>
                    <hr>
                     


                  
                    <!-- 댓글 출력 -->
                    <c:forEach items="${itemReview}" var="map">
                    <div class="row mt-2">
                        <div class="col-2 d-flex align-items-center" >
                            <div>
                                    <span>${map.user_name}</span>
                                    <span style="display: block;"><fmt:formatDate value="${map.reg_date}" pattern="yy.MM.dd"/></span>
                            </div> 
                        </div>
                    </div>
                    <div class="row">
                        <div class="col ms-3">${map.context}</div>
                        
                    </div>
                     </c:forEach>
                    
            </div>
            <div class="col-2"></div>
            </div>
        </div>
        
</body>
</html>
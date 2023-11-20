<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>상품리스트</title>
</head>
<body>
    <div class="container-fluid">
    <div class="row">
    <jsp:include page="../common/topNavi.jsp"></jsp:include>
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                      <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                      <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                      <div class="carousel-item active" data-bs-interval="10000">
                        <img src="../resources/img/itemlogo1.jpeg" class="d-block w-100" style="width:811px; height:401px; margin: auto;">
                      </div>
                      <div class="carousel-item" data-bs-interval="2000">
                        <img src="../resources/img/itemlogo2.jpeg" class="d-block w-100" style="width:811px; height:401px; margin: auto;">
                      </div>
                      <div class="carousel-item">
                        <img src="../resources/img/itemlogo3.jpeg" class="d-block w-100" style="width:811px; height:401px; margin: auto;">
                      </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </button>
                  </div>
                  <section class="py-5">
                    <div class="container px-4 px-lg-5 mt-5">
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                            <c:forEach items="${itemList}" var="map" >
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="/uploadFiles/${map.itemDto.item_thumbnail}" style="width:245px; height:200px;"/>
                                    <!-- Product details-->
                                     <div class="card-body p-4 d-flex flex-column justify-content-between">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">${map.itemDto.item_name}</h5>
                                            <!-- Product price-->
                                            ${map.itemDto.item_price}P
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="./itemDetailPage?id=${map.itemDto.id}">상품보기</a></div>
                                    </div>
                                </div>
                            </div>
                             </c:forEach>
                        </div>
                    </div>
                  </section>
            </div>
            <div class="col-2"></div>
        </div>
    </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
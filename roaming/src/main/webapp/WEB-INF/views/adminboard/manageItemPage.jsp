<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>상품 관리</title>
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
                    <h1 class="me-3">상품 관리</h1>
                    <a href="./itemRegisterPage" class="btn btn-outline-dark me-2 btn-sm" role="button">상품 등록</a>
                </div>
            </div>
            
        </div>
        <div class="row content mt-2">
            <div class="col-2"></div>
                <div class="col-sm-8 text-left"> 
                    <div class="row mb-3">
                        <div class="col-2 fs-2 fw-semibold">
                        상품 현황
                        </div>
                        <div class="col pt-3 ps-0 text-start">
                            등록된 상품 현황
                        </div>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">썸네일</th>
                                <th scope="col">상품명</th>
                                <th scope="col">카테고리명</th>
                                <th scope="col">수량</th>
                                <th scope="col">가격</th>
                                <th scope="col">등록일</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                               <c:forEach items="${itemList}" var="map" >
                                <tr>
                                    <th scope="row" style="vertical-align: middle;">${map.itemDto.id}</th>
                                    <td><img src="/uploadFiles/${map.itemDto.item_thumbnail}" style="width:50px; height:50px;"></td>
                                    <td style="vertical-align: middle;">${map.itemDto.item_name}</td>
                                    <td style="vertical-align: middle;">${map.itemCategoryDto.category}</td>
                                    <td style="vertical-align: middle;">${map.itemDto.item_count}</td>
                                    <td style="vertical-align: middle;">${map.itemDto.item_price}P</td>
                                    <td style="vertical-align: middle;"><fmt:formatDate value="${map.itemDto.reg_date}" pattern="yy.MM.dd"/></td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div>
                                            <div class="row"></div>
                                            <div class="col mt-2">
                                               	<a href="./updateItemPage?id=${map.itemDto.id}" class="btn btn-outline-primary me-2 btn-sm"  role="button">수정</a>
                                                <a href="./deleteItemProcess?id=${map.itemDto.id}" class="btn btn-outline-danger me-2 btn-sm" role="button">삭제</a>
                                            </div>
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
            	<div class="col-2"></div>
        		</div>
        	</div>
    	</div>
    </div>
</body>
</html>
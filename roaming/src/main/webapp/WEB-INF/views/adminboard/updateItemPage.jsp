<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>상품 수정</title>
</head>
<body>
    <div class="container-fluid">
    <jsp:include page="../common/topNavi.jsp"></jsp:include>
        <div class="row mb-5 mt-5">
            <div class="col-2"></div>
            <div class="col">
            
                <h1 class="me-3">상품 수정</h1>                
            </div>
        </div>
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
            	<form action="./updateItemProcess" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="id" value="${data.itemDto.id}">
				<div class="form-floating mb-3"> 
                    <div class="row mb-3">
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">상품명</label>
                        </div>
                        <div class="col">
                            <input type="text" name="item_name" class="form-control form-control-lg" id="floatingInput" maxlength="10" style="width: 300px;">
                        </div>
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">카테고리</label>
                        </div>
                        <div class="col">
						  <select name="category_id" class="form-control form-control-lg" id="floatingInput" style="width: 300px;">
						    <c:forEach items="${category}" var="category">
						      <option value="${category.id}">
						        ${category.category}
						      </option>
						    </c:forEach>
						  </select>
						</div>
						</div> 
                    <div class="row mb-3">
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">상품내용</label>
                        </div>
                        <div class="col">
                            <input type="text" name="item_context" class="form-control form-control-lg" id="floatingInput" maxlength="10" style="width: 300px;">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">상품수량</label>
                        </div>
                        <div class="col">
                            <input type="text" name="item_count" class="form-control form-control-lg" id="floatingInput" maxlength="10" style="width: 100px;">
                        </div>
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">상품가격</label>
                        </div>
                        <div class="col">
                            <input type="text" name="item_price" class="form-control form-control-lg" id="floatingInput" maxlength="10" style="width: 100px;">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">썸네일</label>
                        </div>
                        <div class="col">
                            <input type="file" name="item_thumbnails"class="form-control form-control-lg" id="floatingInput" maxlength="10" style="width: 300px;">
                        </div>
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">이미지</label>
                        </div>
                        <div class="col">
                            <input type="file" name="images" class="form-control form-control-lg" id="floatingInput" maxlength="10" style="width: 300px;">
                        </div>
                    </div>
                </div>
                <div class="row justify-content-end"> 
                    <div class="col-auto">
                        <div class="mb-3">
                        <button class="btn btn-primary">수정</button>
                         <a class="btn btn-secondary" href='./manageItemPage'>취소</a>
                        </div>
                    </div>
                </div>
            <div class="col-2"></div>
        </form>
        </div>
    	</div>
    </div>
</body>
</html>
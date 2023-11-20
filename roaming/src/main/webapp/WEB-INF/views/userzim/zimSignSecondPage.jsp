<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>zimSignSecondPage</title>
<style>

</style>
</head>
<body>
<jsp:include page="../common/topNavi.jsp"/>

<div class="container">
    <div class="row mt-5">
        <div class="col-2"></div>
        <div class="col-8">
        	<div class="row">
        		<div class="col">
        			<div class="row border-bottom border-success text-center mb-5"><h3>짐 종류 및 수량</h3></div>
					<div class="row">
						<form action="./zimSignSecondProcess" method="post">
				            <div class="row mb-3">
				                <div class="col-6">
				                	<input type = "hidden" name="zim_signup_id" value="${id}">
						            <div class="form-check">
										<input class="form-check-input" type="checkbox" name="zim_category_id" value="1" name="verySmall">
										<label class="form-check-label" for="flexCheckDefault">
									    소형/쇼핑백/레디백
										</label>
									</div>				                	
				                </div>
				                <div class="col-6">
									<select class="form-select" name="zim_amount">
										<option value="0" selected>수량을 입력해주세요</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
									</select>
								</div>
				            </div>
				            <div class="row mb-3">
				                <div class="col-6">
						            <div class="form-check">
										<input class="form-check-input" type="checkbox" name="zim_category_id" value="2" name="Small">
										<label class="form-check-label" for="flexCheckDefault">
									    기내용 캐리어 및 백팩
										</label>
									</div>				                	
				                </div>
				                <div class="col-6">
									<select class="form-select" name="zim_amount">
										<option value="0" selected>수량을 입력해주세요</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
									</select>
								</div>
				            </div>
				            <div class="row mb-3">
				                <div class="col-6">
						            <div class="form-check">
										<input class="form-check-input" type="checkbox" name="zim_category_id" value="3" name="Middle">
										<label class="form-check-label" for="flexCheckDefault">
									    화물용 캐리어
										</label>
									</div>				                	
				                </div>
				                <div class="col-6">
									<select class="form-select" name="zim_amount">
										<option value="0" selected>수량을 입력해주세요</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
									</select>
								</div>
				            </div>
				            <div class="row mb-3">
				                <div class="col-6">
						            <div class="form-check">
										<input class="form-check-input" type="checkbox" name="zim_category_id" value="4" name="Big">
										<label class="form-check-label" for="flexCheckDefault">
									    특대형 캐리어 및 골프백
										</label>
									</div>				                	
				                </div>
				                <div class="col-6">
									<select class="form-select" name="zim_amount">
										<option value="0" selected>수량을 입력해주세요</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
									</select>
								</div>
				            </div>
				            <div class="row mb-3">
				            	<div class="col-6"><a class="btn btn-success" href="./zimSignFirstPage" role="button">이전으로</a></div>
				            	<div class="col-6"><button class="btn btn-success">다음으로</button></div>
				            </div>
				            <div class="row mt-3">
				            	<div class="col"><img src="">카테고리별 제목, 무게 조건, 가격 입력예정</div>
				            </div>
			            </form>					
					</div>
        		</div>
        	</div>
        	<div class="row"></div>
        </div>
        <div class="col-2"></div>
    </div>
</div>

</body>
</html>
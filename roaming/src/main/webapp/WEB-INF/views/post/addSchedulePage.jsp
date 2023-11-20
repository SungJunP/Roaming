<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
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
                
                
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        
                           

                            <!-- 일차 -->
                            <form action="./postDayProcess" method="post">
                          	<c:forEach begin="1" end="${days}" var="i">
                            <div class="row mt-5">
                                <div class="col"><h5>${i}일차</h5></div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="location" class="col-sm-4 col-form-label">위치</label>
                                        <div class="col-sm-8">
                                        	<input type="hidden" name="trip_day" value="${i}">
                                        	<input type="hidden" name="post_id" value="${postDto.id}">
                                            <input type="text" class="form-control" id="location" name="trip_location" placeholder="위치를 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="memo" class="col-sm-4 col-form-label">메모</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="memo" name="trip_memo" placeholder="메모를 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="location" class="col-sm-4 col-form-label">위치</label>
                                        <div class="col-sm-8">
                                        	<input type="hidden" name="trip_day" value="${i}">
                                        	<input type="hidden" name="post_id" value="${postDto.id}">
                                            <input type="text" class="form-control" id="location" name="trip_location" placeholder="위치를 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="memo" class="col-sm-4 col-form-label">메모</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="memo" name="trip_memo" placeholder="메모를 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="location" class="col-sm-4 col-form-label">위치</label>
                                        <div class="col-sm-8">
                                        	<input type="hidden" name="trip_day" value="${i}">
                                        	<input type="hidden" name="post_id" value="${postDto.id}">
                                            <input type="text" class="form-control" id="location" name="trip_location" placeholder="위치를 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="memo" class="col-sm-4 col-form-label">메모</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="memo" name="trip_memo" placeholder="메모를 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            
                            
                            <div class="row mt-5 mb-5">
                                <div class="col text-end">
                                    <input type="submit" class="btn btn-primary" value="추가">
                                </div>
                            </div>
                            </form>
                            <!-- /일차 -->
                            
                            
                            
                        <div class="col-2"></div>
                    </div>
                
            <div class="col-2"></div>
        </div>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
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
                        <form action="./postDayProcess" method="post">
                            <div class="row mt-5">
                                <div class="col text-center"><h3>파티 찾기 수정</h3></div>
                            </div>
                            <div class="row mt-5">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="datepicker" class="col-sm-2 col-form-label">날짜선택</label>
                                        <div class="col-sm-10 d-flex justify-content-center align-items-center">
                                        
	                                        <fmt:formatDate value="${postDto.day_start}" pattern="yyyy-MM-dd" var="day_start"/>
                                            <input name="day_start" type="date" id="datepicker" value="${day_start}" class="form-control" style="width: 270px; margin-right: 70px;">
                                            
                                            <span style="margin: 0 10px;">-</span>
                                            
                                            <fmt:formatDate value="${postDto.day_end}" pattern="yyyy-MM-dd" var="day_end"/>
                                            <input name="day_end" type="date" id="datepicker" value="${day_end}" class="form-control" style="width: 270px; margin-left: 70px;">
                                            <input type="hidden" name="id" value="${postDto.id}">

                                           	
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="mb-1 row">
                                        <label for="imgFile" class="col-sm-2 col-form-label">사진</label>
                                        <div class="col-sm-10">
                                            <input type="file" name="post_image" id="imgFile">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-1">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="title" class="col-sm-2 col-form-label">제목</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="title" name="title" value="${postDto.title}" placeholder="제목을 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="content" class="col-sm-2 col-form-label">내용</label>
                                        <div class="col-sm-10">
                                            <textarea class="form-control" name="content" id="content"  cols="30" rows="10" placeholder="내용을 입력해주세요.">${postDto.content}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="peopleCount" class="col-sm-2 col-form-label">인원수</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="person_count" id="peopleCount" value="${postDto.person_count}" placeholder="인원을 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="tourcost" class="col-sm-2 col-form-label">투어비용</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="pay" id="tourcost" value="${postDto.pay}" placeholder="투어비용을 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 일차 -->
                            <!--버튼 만들어서 쿼리로 order_id 현재값 +1, post_id, (위치,메모 null로 인서트) -->
                          	<c:set var="prevDay" value="" />
							<c:forEach items="${scheduleDto}" var="item">
							    <c:if test="${item.trip_day != prevDay}">
							    
							        <div class="row">
							            <div class="col"><h5>${item.trip_day}일차</h5></div>
							        </div>
							        <c:set var="prevDay" value="${item.trip_day}" />
							    </c:if>
							    <div class="row">
							        <div class="col">
							            <div class="mb-3 row">
							                <label for="location" class="col-sm-4 col-form-label">위치</label>
							                <div class="col-sm-8">
							                    <input type="text" class="form-control" id="location" name="trip_location" placeholder="위치를 입력해주세요." value="${item.trip_location}">
							                </div>
							            </div>
							        </div>
							        <div class="col">
							            <div class="mb-3 row">
							                <label for="memo" class="col-sm-4 col-form-label">메모</label>
							                <div class="col-sm-8">
							                    <input type="text" class="form-control" id="memo" name="trip_memo" placeholder="메모를 입력해주세요." value="${item.trip_memo}">
							                </div>
							            </div>
							        </div>
							    </div>
							    
							</c:forEach>
                            
                            
                            <div class="row mt-5 mb-5">
                                <div class="col text-end">
                                    <input type="submit" class="btn btn-primary" value="수정">
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
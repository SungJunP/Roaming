<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>쿠폰 생성</title>
</head>
<body>
    <div class="container-fluid">
    <div class="row">
    <jsp:include page="../common/topNavi.jsp"></jsp:include>
        <div class="row mb-5 mt-5">
            <div class="col-2"></div>
            <div class="col">
            
                <h1 class="me-3">쿠폰 생성</h1>                
            </div>
        </div>
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
            	<form action="./produceCouponProcess" method="post" enctype="multipart/form-data">
                <div class="form-floating mb-3"> 
                    <div class="row mb-3">
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">쿠폰명</label>
                        </div>
                        <div class="col">
                            <input type="text" name="coupon_name" class="form-control form-control-lg" id="floatingInput" maxlength="10" style="width: 300px;">
                        </div>
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">쿠폰내용</label>
                        </div>
                        <div class="col">
                            <input type="text" name="coupon_context" class="form-control form-control-lg" id="floatingInput" maxlength="10" style="width: 300px;">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">쿠폰수량</label>
                        </div>
                        <div class="col">
                            <input type="text" name="coupon_count" class="form-control form-control-lg" id="floatingInput" maxlength="10" style="width: 100px;">
                        </div>
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">할인율(%)</label>
                        </div>
                        <div class="col">
                            <input type="text" name="coupon_discount" class="form-control form-control-lg" id="floatingInput" maxlength="10" style="width: 100px;">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">배포시작일</label>
                        </div>
                        <div class="col">
                            <input type="date" name="coupon_startdate" class="form-control form-control-lg" id="floatingInputEnd" maxlength="10" style="width: 200px;">
                        </div>
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">배포종료일</label>
                        </div>
                        <div class="col">
                            <input type="date" name="coupon_enddate" class="form-control form-control-lg" id="floatingInputEnd" maxlength="10" style="width: 200px;">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">사용시작일</label>
                        </div>
                        <div class="col">
                            <input type="date" name="coupon_issue_start" class="form-control form-control-lg" id="floatingInputEnd" maxlength="10" style="width: 200px;">
                        </div>
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">사용종료일</label>
                        </div>
                        <div class="col">
                            <input type="date" name="coupon_issue_end" class="form-control form-control-lg" id="floatingInputEnd" maxlength="10" style="width: 200px;">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-auto d-flex align-items-center">
                            <label for="floatingInput" class="form-label fs-5 mb-0">이미지</label>
                        </div>
                        <div class="col">
                            <input type="file" name="image" class="form-control form-control-lg" id="floatingInput" maxlength="10" style="width: 300px;" multiple>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-end"> 
                    <div class="col-auto">
                        <div class="mb-3">
                        <button class="btn btn-outline-primary">생성</button>
                         <a class="btn btn-outline-secondary" href='./manageCouponPage'>취소</a>
                        </div>
                    </div>
                </div>
            <div class="col-2"></div>
        </form>
        </div>
    	</div>
    	</div>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <div class="col-8 text-center">
                <div class="row ">
                    <div class="col"><h3>가입신청서</h3></div>
                </div>
                <div class="row mt-5">
                    <div class="col " style="margin-right: 240px;">
                        <h5>가입인사를 작성해주세요.</h5>
                    </div>
                </div>
                <form action="./joinProcess" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col ">
                            <textarea name="welcome_ment" cols="50" rows="7" placeholder="내용을 입력해주세요."></textarea>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col">
                            <input type="file" name="confirm_image1" style="margin-right: 110px;" multiple accept="image/*">
                            <input type="hidden" name="post_id" value="${postDto.id}">
                            <input type="hidden" name="create_id" value="${postDto.create_id}">
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col">
                            <input class="btn btn-primary" type="submit" value="신청하기" style="margin-left: 270px;">
                            <input class="btn btn-primary ms-2" type="button" value="취소하기" onclick="history.back();">
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-2"></div>
        </div>

    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
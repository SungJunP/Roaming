<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script type="text/javascript">
function previewImage(event) {
    var input = event.target;
    var preview = document.getElementById('preview');
    
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        preview.src = e.target.result;
      }

      reader.readAsDataURL(input.files[0]);
    }
  }
</script>
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
                        <form action="insertProcess" method="post" enctype="multipart/form-data">
                            <div class="row mt-5">
                                <div class="col text-center"><h3>파티 찾기 등록</h3></div>
                            </div>
                            <div class="row mt-5">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="datepicker1" class="col-sm-2 col-form-label">날짜선택</label>
                                        <div class="col-sm-10 d-flex justify-content-center align-items-center">
                                            <input name="day_start" type="date" id="datepicker1" class="form-control" style="width: 270px; margin-right: 70px;">
                                            <span style="margin: 0 10px;">-</span>
                                            <input name="day_end" type="date" class="form-control" style="width: 270px; margin-right: 70px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
              <div class="row">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="imgFile" class="col-sm-2 col-form-label">사진</label>
                                        <div class="col-sm-10">
                                            <input name="post_image" type="file" id="imgFile" onchange="previewImage(event)" multiple accept="image/*">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <img class="form-control" id="preview" src="" alt="미리보기" style="object-fit: cover; width: 100%; height: 500px;">
                                </div>
                            </div>

                            <div class="row mt-4">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="title" class="col-sm-2 col-form-label">제목</label>
                                        <div class="col-sm-10">
                                            <input name="title" type="text" class="form-control" id="title" placeholder="제목을 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="content" class="col-sm-2 col-form-label">내용</label>
                                        <div class="col-sm-10">
                                            <textarea name="content" class="form-control" id="content" cols="30" rows="15" placeholder="내용을 입력해주세요."></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="peopleCount" class="col-sm-2 col-form-label">인원수</label>
                                        <div class="col-sm-10">
                                            <input name="person_count" type="text" class="form-control" id="peopleCount" placeholder="인원을 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="tourcost" class="col-sm-2 col-form-label">투어비용</label>
                                        <div class="col-sm-10">
                                            <input name="pay" type="text" class="form-control" id="tourcost" placeholder="투어비용을 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 일차 -->
                            <!-- <div class="row">
                                <div class="col"><h5>1일차</h5></div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="location" class="col-sm-4 col-form-label">위치</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="location" placeholder="위치를 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="mb-3 row">
                                        <label for="memo" class="col-sm-4 col-form-label">메모</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="memo" placeholder="메모를 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            
                            
                            <!-- /일차 -->
                            <div class="row mt-5 mb-5">
                                <div class="col text-end">
                                    <input type="submit" class="btn btn-primary" value="등록">
                                </div>
                            </div>
                        <div class="col-2"></div>
                    </div>
                </form>
            <div class="col-2"></div>
        </div>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
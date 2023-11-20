<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<style>
    .one_title_border {
        border: 1px solid black;
        height: 100%;
    }

    .two_title_border {
        border: 1px solid black;
        height: 100%;
    }

    .three_title_border {
        border: 1px solid black;
        height: 100%;
    }

    .four_title_border {
        border: 1px solid black;
        height: 100%;
    }

    .one_top_style {
        height: 60px;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        border-bottom: 1px solid black;
    }

    .two_top_style {
        height: 60px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-bottom: 1px solid black;
    }

    .three_top_style {
        height: 60px;
        display: flex;
        border-bottom: 1px solid black;
    }

    .four_top_style {

    }

    .one_colum_style {
        height: 60px;
        display: flex;
        align-items: center;
        justify-content: center;
        display: flex; 
        flex-direction: column;
        border-bottom: 1px solid black;
    }

    .tow_colum_style {
        height: 120px;
        border-bottom: 1px solid black;
    }

    /* 수정된 부분 */
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }

    .container-fluid {
        height: 100%;
        padding: 0;
    }

    .row {
        height: 100%;
        margin: 0;
    }

    .col-1,
    .col-2,
    .col-7 {
        padding: 0;
    }
    
    .overflow-auto {
        overflow: auto;
    }
    /* -------------- */

    /* 반응형 웹 디자인 */
    @media (max-width: 767px) {
        .one_title_border,
        .two_title_border,
        .three_title_border,
        .four_title_border {
            height: auto;
        }
    }
    
</style>
</head>
<body>
    <div class="container-fluid">
        <div class="row" style="height: 100%;">
            <!-- 첫번째 -->
            <div class="col-1 one_title_border">
                <div class="row">
                    <div class="col one_top_style">
                        <span>일정</span>
                    </div>
                

                <!-- for -->
                <div class="row">
                    <div class="col one_colum_style">
                        <div>
                            <span>Day</span><span>1</span>
                        </div>
                        <div>
                            <small>06.11(화요일)</small>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col one_colum_style">
                        <div>
                            <span>Day</span><span>1</span>
                        </div>
                        <div>
                            <small>06.11(화요일)</small>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col one_colum_style">
                        <div>
                            <span>Day</span><span>1</span>
                        </div>
                        <div>
                            <small>06.11(화요일)</small>
                        </div>
                    </div>
                </div>
                <!-- /for -->
             </div>
                
            </div>










            <!-- 두번째 -->
			<div class="col-2">
			    <div class="two_title_border">
			        <div class="row">
			            <div class="col two_top_style">
			                <span>Day 1&nbsp</span>&nbsp|&nbsp<span>06.11(화요일)</span>
			            </div>
			        </div>
			
			        <!-- for -->
			        <div class="row">
			            <div class="col tow_colum_style">
			                <div class="col">
			                    <input class="mt-1" type="button" value="x" style="height: 10px; width: 10px; float: right;">
			                </div>
			                <div class="col">
			                    <span class="text-center" style="font-size: 20px;">노량진컵밥</span>
			                </div>
			                <div class="col m-1">
			                    <div class="col">
			                        <label class="" for="time" style="display: inline-block;">시간</label>
			                        <input class="form-control" type="time" id="time" placeholder="시간" style="display: inline-block; height: 25px; width: 220px;">
			                    </div>
			                </div>
			                <div class="col m-1">
			                    <div class="col">
			                        <label for="memo" style="display: inline-block;">메모</label>
			                        <input class="form-control" type="text" id="memo" placeholder="메모" style="display: inline-block; height: 25px; width: 220px;">
			                    </div>
			                </div>
			            </div>
			        </div>
			        <!-- /for -->
			    </div>
			</div>


            <!-- 세번째 -->
            <div class="col-2 three_title_border">
                <div class="row">
                    <div class="col three_top_style">
                        <div class="row">
                            <div class="col">
                                <form class="d-flex mt-2" role="search">
                                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                    <button class="btn btn-outline-success" type="submit">Search</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 네번째 -->
            <div class="col-7 four_title_border">
                <div id="map" style="width:100%;height:100%;"></div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6bb230f942595875a71c9910b889e653"></script>
                <script>
                    var container = document.getElementById('map');
                    var options = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667),
                        level: 3
                    };
                    var map = new kakao.maps.Map(container, options);
                </script>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>

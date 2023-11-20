<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
 
<!DOCTYPE html>
<html>
<head>
<script>
const postId = new URLSearchParams(location.search).get("id"); 
var dayNumber = null;




function getDayList(){
	const xhr = new XMLHttpRequest();
	
	
	const dayListBox = document.getElementById("dayListBox");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status==200){
			const response = JSON.parse(xhr.responseText);
			for(list of response.dayList){
				const row = document.createElement("div");
				row.classList.add("row");
				dayListBox.appendChild(row);
				
				const col=document.createElement("div");
				col.classList.add("col","fs-2","text-white","fw-semibold","text-center","border-bottom","border-white","pt-3","pb-3");
				col.innerText = list.trip_day +"일차";
				col.id = list.id
				col.classList.add("dayButton");
				col.setAttribute("onclick","getDayNumber("+list.id+")")
				row.appendChild(col);
			}
		}
	}
	xhr.open("get","./getDayList?postId="+postId);
	xhr.send();
}

function getDayNumber(id){


	
	const placeBox = document.getElementById("placeBox");
	placeBox.innerHTML = "";
	const saverow = document.createElement("div");
	saverow.classList.add("row","mb-3");
	placeBox.appendChild(saverow);
	const savecol= document.createElement("div");
	savecol.classList.add("col","d-grid");
	saverow.appendChild(savecol);

	const saveButton = document.createElement("button");
	saveButton.type = "button";
	saveButton.classList.add("btn","btn-warning","fs-5","fw-semibold","text-white");
	saveButton.innerText= "일정 저장";
	saveButton.setAttribute("onclick","saveDay()");
	savecol.appendChild(saveButton);
	
	
	dayNumber = id;
	const dayButton = document.getElementsByClassName("dayButton");
	for(list of dayButton){
		list.classList.remove("unClickDay");
	}
	const target = document.getElementById(id);
	target.classList.add("unClickDay");
	
}

function getPlaceInfo(name,address){
	if(dayNumber == null){
		alert("일차를 선택하세요");
		return;
	}
	const placeBox = document.getElementById("placeBox");
	
	const row1 =document.createElement("div");
	row1.classList.add("row","border-bottom","border-3","pt-1","pb-1");
	placeBox.appendChild(row1);
	
	const col = document.createElement("div");
	col.classList.add("col","text-center");
	row1.appendChild(col);
	
	const row2 = document.createElement("div");
	row2.classList.add("row");
	col.appendChild(row2);
	
	const col2 = document.createElement("div");
	col2.classList.add("col","text-primary","fw-semibold","fs-5","placeName");
	col2.innerText = name;
	row2.appendChild(col2);
	
	const addRow = document.createElement("div");
	addRow.classList.add("row");
	col.appendChild(addRow);
	
	const col3 = document.createElement("div");
	col3.classList.add("col","text-secondary","small","placeAddress");
	col3.innerText = address;
	addRow.appendChild(col3);
	
	const row3 = document.createElement("div");
	row3.classList.add("row","mt-3");
	col.appendChild(row3);
	
	const timeText = document.createElement("div");
	timeText.classList.add("col-3","ps-4","fs-6");
	timeText.innerText = "시간";
	row3.appendChild(timeText);
	
	const timeCol = document.createElement("div");
	timeCol.classList.add("col-7","d-grid");
	const timeInput = document.createElement("input");
	timeInput.classList.add("estimated");
	timeInput.type="time";
	
	timeCol.appendChild(timeInput);
	row3.appendChild(timeCol);
	
	const row4 = document.createElement("div");
	row4.classList.add("row","mt-3");
	col.appendChild(row4);
	
	const memoText= document.createElement("div");
	memoText.classList.add("col-3","ps-4","pt-1","fs-6");
	memoText.innerText= "메모";
	row4.appendChild(memoText);
	
	const memoCol = document.createElement("div");
	memoCol.classList.add("col-7","d-grid");
	row4.appendChild(memoCol);
	
	const memoInput = document.createElement("input");
	memoInput.type="text";
	memoInput.classList.add("memo")
	memoInput.value = "메모를 입력해주세요.";
	memoCol.appendChild(memoInput);
	
	
}

function saveDay(){
	const xhr = new XMLHttpRequest()
	
	const placeNameList = document.getElementsByClassName("placeName");
	const placeAddressList = document.getElementsByClassName("placeAddress");
	const estimatedList = document.getElementsByClassName("estimated");
	const memoList = document.getElementsByClassName("memo");
	
	const placeName =[];
	const placeAddress =[];
	const estimated =[];
	const memo =[];
	
	for (var i = 0; i < placeNameList.length; i++) {
		placeName.push(placeNameList[i].innerText);
	  }	
	for (var i = 0; i < placeAddressList.length; i++) {
		placeAddress.push(placeAddressList[i].innerText);
	  }	
	for (var i = 0; i < estimatedList.length; i++) {
		estimated.push(estimatedList[i].value);
	  }	
	for (var i = 0; i < memoList.length; i++) {
		memo.push(memoList[i].value);
	  }	
	console.log(placeName.join(','))
	console.log(estimated.join(','))
	
	const saveDayButton = document.getElementById(dayNumber);
	const placeBox = document.getElementById("placeBox");
	xhr.onreadystatechange = function(){
		if(xhr.readyState ==4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			getSaveCount();
			dayNumber = null;
			saveDayButton.classList.add("bg-secondary");
			saveDayButton.classList.remove("unClickDay");
			saveDayButton.removeAttribute("onclick");
			placeBox.innerHTML = "";
			const row = document.createElement("div");
			row.classList.add("row");
			placeBox.appendChild(row);
			const col=document.createElement("div");
			col.classList.add("col","bg-secondary","pt-3","pb-3","text-center","text-white","fw-semibold","fs-3");
			col.innerText = "일자를 선택하세요.";
			row.appendChild(col);
			
		}
	}
	xhr.open("get","./savePostSchedule?placeName="+placeName.join(',')+"&placeAddress="+placeAddress.join(',')+"&estimated="+estimated.join(',')+"&memo="+memo.join(',')+"&dayNumber="+dayNumber);
	xhr.send();
}

function getSaveCount(){
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result=="success"){
				alert("일정 계획이 완료되었습니다.");  
				window.location.href = "./postDetailPage?id="+postId; 
			}
			
		}
	}
	xhr.open("get","./getSaveCount?post_id="+postId)
	xhr.send();
}
window.addEventListener("DOMContentLoaded",function(){
	getDayList();
});
</script>
  <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:938px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:350px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
.title{
	font-size:14px;
}

.clickDay{
	background-color: #5ABEFF;
}
.unClickDay{
	background-color: #14148C;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-1 ps-0 clickDay overflow-y-scroll overflow-x-hidden" style="height: 937px;">
			<div class="row">
				<div class="col" id="dayListBox" >
					<div class="row">
						<div class="col fs-2 text-white fw-semibold text-center border-bottom border-white pt-3 pb-3 unClickDay">
							일정
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="col-2 border border-3 overflow-y-scroll overflow-x-hidden" style="height: 937px;" id="placeBox">
			<div class="row">
				<div class="col bg-secondary pt-3 pb-3 text-center text-white fw-semibold fs-3">
					일차를 선택하세요.
				</div>
			</div>

		</div>
		<div class="col map_wrap">
			<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div> 
		                     
		                <form onsubmit="searchPlaces(); return false;">
		                   <div class="row mt-1 mb-1 ms-1">
		                   	<div class="col-9"><input type="text" value="이태원 맛집" id="keyword" class="form-control pt-2 pb-2 fw-semibold fs-5"> </div>
							 <div class="col d-grid">
							 	<button type="submit" class="btn btn-outline-dark fs-5">검색</button>
							 </div>
							</div>
		                </form>
		            </div>
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div>
	</div>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8a1d90f3a65f2e8f2e4e69aac5b93be&libraries=services"></script>

<script>
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var row = document.createElement('div')
        row.classList.add("row"),
    

    
    itemStr = '<div class="pt-3 col markerbg marker_' + (index+1) + '"></div>' +
                '<div class="info row">' +
                '<div class="col fw-semibold title ps-0 text-start">' +
                places.place_name + '</div>' + '<div class="col text-end">' + '<button type="button" class="btn btn-info px-1 ms-3 mb-1 text-white" onclick="getPlaceInfo(\'' + places.place_name + '\', \'' + places.address_name + '\')">추가</button>' + '</div>'
                +'</div>';

    if (places.road_address_name) {
        itemStr += '    <span class="ms-5">' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray ms-5">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span  class="ms-5">' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel ms-5">' + places.phone  + '</span>' +
                '</div>';           

    row.innerHTML = itemStr;
    row.className = 'item';

    return row;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
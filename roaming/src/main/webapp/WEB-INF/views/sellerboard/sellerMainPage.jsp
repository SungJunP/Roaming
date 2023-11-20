<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	const hotelId = new URLSearchParams(location.search).get("id");
	
	function getCurrentWeekSellPrice(){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status==200){
				const response = JSON.parse(xhr.responseText);
				if(response.result == "success"){
				const ctx = document.getElementById('barChart');
				
				const groupNames =[]
				const groupPrices = [];
				var totalPrice = null;
				for (list of response.info) {
					groupNames.push(list.room_group_name);
					groupPrices.push(list.price);
					totalPrice += list.price;
				  }	

				new Chart(ctx,
						{
							type : 'bar',
							data : {
								labels : groupNames,
								datasets : [ {
									label : '판매액/원',
									data : groupPrices,
									borderWidth : 1
								} ]
							},
							options : {
								responsive : false,
								scales : {
									y : {
										beginAtZero : true
									}
								}
							}
						});
				
				const dctx = document.getElementById('doughChart');
				var myDoughnutChart = new Chart(dctx, {
					type : 'doughnut',
					data : {
						labels : groupNames,
						datasets : [ {
							label : '판매액/원',
							data : groupPrices,
							borderWidth : 2
						} ]
					},
					options : {
						responsive : false,
						plugins: {
						      legend: {
						        position: 'top',
						      },
						      title: {
						        display: true,
						        text: '총'+ totalPrice.toLocaleString() +'원',
						        font : 	{size: 18}

						      }
						    }
					}
				});
			}else {
				const dashbox = document.getElementById("dashbox");
				dashbox.innerHTML ="";
				const col = document.createElement("div");
				col.classList.add("col","text-center","fs-1","fw-semibold","text-secondary","pb-5");
				col.innerText = "이번 주 판매정보가 없습니다.";
				dashbox.appendChild(col);
			}
			}
		}
		xhr.open("get","./getCurrentWeekSellPrice?hotel_id="+hotelId);
		xhr.send();
	}
	
	function getRoomPercent(){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				
				const groupNames = [];
				const percents = [];
				for (list of response.info) {
					groupNames.push(list.roomGroupDto.room_group_name);
					percents.push(list.per);
				  }	
				
				const ctx = document.getElementById('horiChart');

				var myBarChart = new Chart(ctx,
						{
							type : 'bar',
							data : {
								labels : groupNames,
								datasets : [ {
									label : '점유율/%',
									data : percents,
									borderWidth : 1
								} ]
							},
							options : {
								responsive : false,
								indexAxis : 'y',
								scales: {
								      x: {
								        min: 0,
								        max: 100,
								      }
								    }
								
							}
						});

			}
		}
		xhr.open("get","./getRoomPercent?hotel_id="+hotelId);
		xhr.send();
	}

	
function getTodayCheckInOut(){
	const xhr = XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status==200){
			const response = JSON.parse(xhr.responseText);
			
		}
	}
	xhr.open("get","./getTodayCheckInOut");
	xhr.send();
}	
	

	window.addEventListener("DOMContentLoaded", function() {
		getCurrentWeekSellPrice();
		getRoomPercent();
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/sellerTopNavi.jsp"></jsp:include>
			</div>
		</div>
		<div class="row">
			<div class="col-2 bg-black text-white" style="height: 100;">
				<div class="row mt-5">
					<div class="col-3 mt-4 ps-4 pt-3">
						<img src="/uploadFiles/${hotelInfo.hotelDto.hotel_img }"
							style="width: 50px; height: 50px; border-radius: 50%;">
					</div>
					<div class="col-9">
						<div class="row">
							<div class="col fw-semibold fs-6 pt-3 ps-3 small text-secondary">
								${hotelInfo.category.category }</div>
							<div class="col text-end small pe-3 fs-6 pt-2">
								<a class="btn btn-dark btn-sm" href="./sellerHotelListPage">숙소변경</a>
							</div>
						</div>
						<div class="row pt-0">
							<div class="col fw-semibold fs-6 pt-2 ps-3">
								${hotelInfo.hotelDto.hotel_name}</div>
						</div>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-1"></div>
					<div class="col text-secondary fw-bold fs-5">숙소/예약관리</div>
				</div>
				<div class="row mt-4">
					<div class="col-1"></div>
					<div class="col fw-semibold pb-0">
						<i class="bi bi-house fs-4 text-info pt-5"></i><span
							class="ps-3 text-white fs-5 pt-0">홈</span>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-1"></div>
					<div class="col fw-semibold pb-0">
						<i class="bi bi-card-list fs-4 text-secondary pt-5"></i><span
							class="ps-3 text-white fs-5 pt-0">예약목록</span>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-1"></div>
					<div class="col fw-semibold pb-0">
						<i class="bi bi-calendar fs-4 text-secondary pt-5"></i><span
							class="ps-3 text-white fs-5 pt-0">타임라인</span>
					</div>
				</div>

				<div class="row mt-4">
					<div class="col-1"></div>
					<div class="col fw-semibold pb-0">
						<i class="bi bi-wallet fs-4 text-secondary pt-5"></i><span
							class="ps-3 text-white fs-5 pt-0">날짜별 요금조정</span>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-1"></div>
					<div class="col fw-semibold pb-0">
						<i class="bi bi-gear fs-4 text-secondary pt-5"></i><span
							class="ps-3 text-white fs-5 pt-0">숙소관리</span>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-1"></div>
					<div class="col fw-semibold pb-0">
						<i class="bi bi-graph-up-arrow fs-4 text-secondary pt-5"></i><span
							class="ps-3 text-white fs-5 pt-0">대시보드</span>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-1"></div>
					<div class="col text-secondary fw-bold fs-5">홈페이지 관리</div>
				</div>
				<div class="row mt-4">
					<div class="col-1"></div>
					<div class="col fw-semibold pb-0">
						<i class="bi bi-signpost fs-4 text-secondary pt-5"></i><span
							class="ps-3 text-white fs-5 pt-0">도메인 연결</span>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-1"></div>
					<div class="col fw-semibold pb-0">
						<i class="bi bi-clipboard fs-4 text-secondary pt-5"></i><span
							class="ps-3 text-white fs-5 pt-0">리뷰 관리</span>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-1"></div>
					<div class="col fw-semibold pb-0">
						<i class="bi bi-question-circle fs-4 text-secondary pt-5"></i><span
							class="ps-3 text-white fs-5 pt-0">문의/요청</span>
					</div>
				</div>
			</div>
			<div class="col bg-secondary bg-opacity-10">
				<div class="row mt-4"></div>
				<div class="row ms-3 border-bottom pb-3">
					<div class="col fw-bold fs-3">
						<i class="bi bi-house pe-4"></i>홈
					</div>
				</div>
				<div class="row mt-3">
					<!-- 날짜, 숫자정보 -->
					<div class="col">
						<div class="card">
							<div class="card-body">
								<div class="row mt-1">
									<div class="col fs-3 fw-semibold">통계</div>
								</div>
								<div class="row mt-5" id="dashbox">
									<div class="col-4">
										<div class="row">
											<div class="col">
												<canvas id="barChart" width="400" height="300"></canvas>
											</div>
										</div>
										<div class="row">
											<div class="col-9 small fw-semibold  text-center pt-3 ps-5">이번 주 객실별
												판매 그래프</div>
										</div>
									</div>
									<div class="col-4">
										<div class="row">
											<div class="col">
												<canvas id="horiChart" width="400" height="300"></canvas>
											</div>
										</div>
										<div class="row">
											<div class="col-9 small fw-semibold text-center pt-3 ps-5">객실
												점유율</div>
										</div>
									</div>
									<div class="col-4">
										<div class="row">
											<div class="col">
												<canvas id="doughChart" width=450 " height="300"></canvas>
											</div>
										</div>
										<div class="row">
											<div class="col-9 small  fw-semibold text-center pt-3 ms-5">이번 주 총/객실별
												판매액</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-4">
						<div class="card">
							<div class="card-body">
								<div class="row mt-2">
									<div class="col fs-5 fw-semibold">오늘 입실</div>
								</div>
								<div class="row mt-3 bg-secondary bg-opacity-25 pb-3 pt-3">
									<div class="col text-center fs-6 fw-bold">예약자</div>
									<div class="col text-center fs-6 fw-bold">연락처</div>
									<div class="col text-center fs-6 fw-bold ">객실명</div>
									<div class="col text-center fs-6 fw-bold ">객실인원</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">황준하</div>
									<div class="col text-center fs-6 fw-semibold">01041515022</div>
									<div class="col text-center  fw-semibold small">스탠다드 더블</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">2인</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">박성준</div>
									<div class="col text-center fs-6 fw-semibold">01051525022</div>
									<div class="col text-center  fw-semibold small">디럭스 더블</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">2인</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">권동휘</div>
									<div class="col text-center fs-6 fw-semibold">01065365022</div>
									<div class="col text-center  fw-semibold small">디럭스 온돌</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">4인</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">김영수</div>
									<div class="col text-center fs-6 fw-semibold">01059255732</div>
									<div class="col text-center  fw-semibold small">디럭스 킹</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">4인</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">안득균</div>
									<div class="col text-center fs-6 fw-semibold">01089131332</div>
									<div class="col text-center  fw-semibold small">디럭스 더블</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">2인</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">안득균</div>
									<div class="col text-center fs-6 fw-semibold">01089131332</div>
									<div class="col text-center fw-semibold small ">디럭스 더블</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">2인</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">안득균</div>
									<div class="col text-center fs-6 fw-semibold">01089131332</div>
									<div class="col text-center fw-semibold small ">디럭스 더블</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">2인</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="card">
							<div class="card-body">
								<div class="row mt-2">
									<div class="col fs-5 fw-semibold">오늘 퇴실</div>
								</div>
								<div class="row mt-3 bg-secondary bg-opacity-25 pb-3 pt-3">
									<div class="col text-center fs-6 fw-bold">예약자</div>
									<div class="col text-center fs-6 fw-bold">연락처</div>
									<div class="col text-center fs-6 fw-bold ">객실명</div>
									<div class="col text-center fs-6 fw-bold ">객실인원</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">황준하</div>
									<div class="col text-center fs-6 fw-semibold">01041515022</div>
									<div class="col text-center  fw-semibold small">스탠다드 더블</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">2인</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">박성준</div>
									<div class="col text-center fs-6 fw-semibold">01051525022</div>
									<div class="col text-center  fw-semibold small">디럭스 더블</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">2인</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">권동휘</div>
									<div class="col text-center fs-6 fw-semibold">01065365022</div>
									<div class="col text-center  fw-semibold small">디럭스 온돌</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">4인</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">김영수</div>
									<div class="col text-center fs-6 fw-semibold">01059255732</div>
									<div class="col text-center  fw-semibold small">디럭스 킹</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">4인</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">안득균</div>
									<div class="col text-center fs-6 fw-semibold">01089131332</div>
									<div class="col text-center  fw-semibold small">디럭스 더블</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">2인</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">안득균</div>
									<div class="col text-center fs-6 fw-semibold">01089131332</div>
									<div class="col text-center  fw-semibold small">디럭스 더블</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">2인</div>
								</div>
								<div class="row mt-2  pb-3 pt-3 border-bottom">
									<div class="col text-center fs-6 fw-semibold">안득균</div>
									<div class="col text-center fs-6 fw-semibold">01089131332</div>
									<div class="col text-center  fw-semibold small">디럭스 더블</div>
									<div class="col text-center fs-6 fw-semibold text-secondary">2인</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="card">
							  <div class="card-body">
							    <div class="row mb-2">
							    	<div class="col fs-5 fw-semibold">공지사항</div>
							    	<div class="col fs-5 fw-semibold text-end"><button type="button" class="btn btn-light fs-4 pt-0 mt-0">+</button></div>
							    </div>
							    <div class="row mt-2  pb-3 pt-3 border-bottom">
							    	<div class="col text-center fs-6 fw-semibold text-start">파트너 숙소 등록시 유의사항</div>
							    	<div class="col-4 text-center fs-6 fw-semibold text-end">2023.06.30(금)</div>
							    </div>
							    <div class="row mt-2  pb-3 pt-3 border-bottom">
							    	<div class="col text-center fs-6 fw-semibold text-start">파트너 숙소 등록시 유의사항</div>
							    	<div class="col-4 text-center fs-6 fw-semibold text-end">2023.06.30(금)</div>
							    </div>
							    <div class="row mt-2  pb-3 pt-3 border-bottom">
							    	<div class="col text-center fs-6 fw-semibold text-start">파트너 숙소 등록시 유의사항</div>
							    	<div class="col-4 text-center fs-6 fw-semibold text-end">2023.06.30(금)</div>
							    </div>
							    <div class="row mt-2  pb-3 pt-3 border-bottom">
							    	<div class="col text-center fs-6 fw-semibold text-start">파트너 숙소 등록시 유의사항</div>
							    	<div class="col-4 text-center fs-6 fw-semibold text-end">2023.06.30(금)</div>
							    </div>
							    <div class="row mt-2  pb-3 pt-3 border-bottom">
							    	<div class="col text-center fs-6 fw-semibold text-start">결제시스템 안내</div>
							    	<div class="col-4 text-center fs-6 fw-semibold text-end">2023.06.28(수)</div>
							    </div>
								 <div class="row mt-2  pb-3 pt-3 border-bottom">
							    	<div class="col text-center fs-6 fw-semibold text-start">결제시스템 안내</div>
							    	<div class="col-4 text-center fs-6 fw-semibold text-end">2023.06.28(수)</div>
							    </div>
							     <div class="row mt-2  pb-3 pt-3 border-bottom">
							    	<div class="col text-center fs-6 fw-semibold text-start">결제시스템 안내</div>
							    	<div class="col-4 text-center fs-6 fw-semibold text-end">2023.06.28(수)</div>
							    </div>
							     <div class="row mt-2  pb-3 pt-3 border-bottom">
							    	<div class="col text-center fs-6 fw-semibold text-start">결제시스템 안내</div>
							    	<div class="col-4 text-center fs-6 fw-semibold text-end">2023.06.28(수)</div>
							    </div>
							  </div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>
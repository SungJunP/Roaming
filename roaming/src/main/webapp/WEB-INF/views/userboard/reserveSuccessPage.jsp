<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script>

const pg_token = new URLSearchParams(location.search).get("pg_token");

function kakaoApprove(){
	const xhr = new XMLHttpRequest();
	console.log("dasdsadsadsa");
	const cid = "TC0ONETIME";
	const tid = '${kakaoDto.tid}';
	const partner_order_id = ${kakaoDto.partner_order_id};
	const partner_user_id = ${kakaoDto.partner_user_id};
	
	const priceBox =document.getElementById("priceBox");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			const coupon= response.item_code;
			const price = response.amount.total
			priceBox.innerText = price.toLocaleString() +" 원";
			insertReserve(coupon,price,tid);
			
		}
	}
	xhr.open("post","https://kapi.kakao.com/v1/payment/approve");
	xhr.setRequestHeader("Authorization","KakaoAK 90fac6acb3ba81cf44b6673ca5a2ec06");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=utf-8");
	xhr.send("cid="+cid+"&tid="+tid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&pg_token="+pg_token);

}
 
function insertReserve(mycoupon_id,final_price,tid){
	const xhr = new XMLHttpRequest();
	
	const room_group_id = ${kakaoDto.partner_order_id};
	const user_id = ${kakaoDto.partner_user_id};
	const startDate = '${kakaoDto.startDate}';
	const endDate = '${kakaoDto.endDate}';
	const getOption = ${kakaoDto.option_id}
	const option_id = [];
	for (list of getOption) {
		option_id.push(list);
	}
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState ==4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
		}
	}
	xhr.open("get","./insertReserve?room_group_id="+room_group_id+"&user_id="+user_id+"&final_price="+final_price+"&mycoupon_id="+mycoupon_id+"&startDate="+startDate+"&endDate="+endDate+"&tid="+tid+"&option_id="+option_id);
	xhr.send();
}

function closePopupAndNavigate() {
	  window.opener.navigateToOtherPage();
	  window.close(); 
}

window.addEventListener("DOMContentLoaded",function(){
	kakaoApprove();
});
</script>
</head>
<body>
<div class="container-fluid">
	<div class="row mt-5 mb-5">
	</div>
	<div class="row mt-5">
		<div class="col text-center fs-1 fw-semibold">
			결제가 완료되었습니다.
		</div>
	</div>
	<div class="row mt-5">
		<div class="col-2"></div>
		<div class="col">
			<div class="row mt-5 border-bottom pb-3">
				<div class="col fw-semibold fs-5">
					결제정보
				</div>
			</div>
			<div class="row mt-3 border-bottom pb-3"><!--추옵 전 금액 알려줌 -->
				<div class="col text-secondary fs-6"> 
					 결제 금액
				</div>
				<div class="col fw-semibold fs-5" id="priceBox">
					
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-4"></div>
				<div class="col-2 d-grid">
					<button type="button" class="btn btn-outline-dark" onclick="closePopupAndNavigate()">창닫기</button>
				</div>
				<div class="col-4"></div>
			</div>
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		</div>
		<div class="col-2"></div>
	</div>
	
	
	
	
</div>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
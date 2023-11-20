<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function sellerRegister(){
		const modal = bootstrap.Modal.getOrCreateInstance("#regiModal");
		
		modal.show();
	}
	function registerSuccess(){
		const modal = bootstrap.Modal.getOrCreateInstance("#registerSuccess");
		
		modal.show();
	}
	function sellerRegisterProcess(){
		const xhr = new XMLHttpRequest();
		const modal = bootstrap.Modal.getOrCreateInstance("#regiModal");

		const seller_id = document.getElementById("regId");
		const seller_pw = document.getElementById("regPw");
		const seller_name = document.getElementById("regName");
		const email = document.getElementById("regEmail");
		const phone = document.getElementById("regPhone");
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				modal.hide();
				registerSuccess();
							
			}
		}
		//post방식
		xhr.open("post","./sellerRegisterProcess");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("seller_id="+seller_id.value+"&seller_pw="+seller_pw.value+"&seller_name="+seller_name.value+"&email="+email.value+"&phone="+phone.value);	
	}
</script>

</head>
<body>
<div class="container-fluid">
	<div class="row mb-5">
		<div class="col-2"></div>

		<div class="col-2"></div>
	</div>
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<div class="row mt-5 mb-5 text-center">
				<div class="col">
					<h1>숙소 판매자 페이지</h1>
				</div>
			</div>
			<div class="row">
			<form action="./sellerLoginProcess" method="post">
				<div class="col-2"></div>
				<div class="col">
					<div class="row custom-border">
					<div class="col-3"></div>
					<div class="col">
						<div class="row">
							<div class="col">
								<img class="img-fluid" src="/facebook/resources/img/logo01.jpeg">
							</div>
						</div>
						<div class="row mt-1">
							<div class="col form-floating">
								<input type="text" name="seller_id" class="form-control" id="floatingInput" placeholder="아이디">
								<label for="floatingInput">아이디 또는 전화번호</label>
							</div>
						</div>
						<div class="row mt-1">
							<div class="form-floating">
								<input type="password" name="seller_pw" class="form-control" id="floatingPassword" placeholder="비밀번호">
								<label for="floatingPassword">비밀번호</label>
							</div>
						</div>
						<div class="row mt-1">
							<div class="col d-grid">
								<button class="btn btn-primary btn-block">로그인</button>
							</div>
						</div>
						<div class="row mt-1">
							<div class="col gray-line"></div>
							<div class="col-2 text-center">or</div>
							<div class="col gray-line"></div>
						</div>
						<div class="row">
							<div class="col">
								<div class="btn btn-primary" onclick="sellerRegister()">회원가입</div>
							</div>
						</div>
						<div class="row"></div>
					</div>
					<div class="col-3"></div>
				</div>
				</div>
				<div class="col-2"></div>
				</form>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
</div>


<!-- 회원가입 -->
<div class="modal fade" id="regiModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">회원가입</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<div class="row mt-1">
			<div class="col form-floating">
				<input type="text" class="form-control" placeholder="아이디" id="regId">
				<label for="floatingInput">아이디</label>
			</div>
		</div>
		<div class="row mt-1">
			<div class="form-floating">
				<input type="password" class="form-control" placeholder="비밀번호" id="regPw">
				<label for="floatingPassword">비밀번호</label>
			</div>
		</div>
		<div class="row mt-1">
			<div class="col form-floating">
				<input type="text" class="form-control" placeholder="이름"  id="regName">
				<label for="floatingInput">판매자명</label>
			</div>
		</div>
		<div class="row mt-1">
			<div class="col form-floating">
				<input type="text" class="form-control" placeholder="이메일"  id="regEmail">
				<label for="floatingInput">이메일</label>
			</div>
		</div>
		<div class="row mt-1">
			<div class="col form-floating">
				<input type="text" class="form-control" placeholder="전화번호"  id="regPhone">
				<label for="floatingInput">전화번호</label>
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="sellerRegisterProcess()" >가입하기</button>
      </div>
    </div>
  </div>
</div>

<!-- 가입완료 모달 -->
<div class="modal fade" id="registerSuccess" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">가입 완료!</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	
		회원가입이 완료되었습니다!

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
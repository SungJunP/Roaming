<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>loginPage</title>
<style>
	.custom-border {
		border: 1px solid rgba(128, 128, 128, 0.5);
  		/* border-radius: 15px; */
	}
	.col-login {
		border-bottom: 1px solid gray;
	}
	.gray-line {
        position: relative;
    }

    .gray-line::before {
        content: "";
        position: absolute;
        top: 50%;
        left: 0;
        transform: translateY(-50%);
        width: 100%;
        height: 1px;
        background-color: rgba(128, 128, 128, 0.5);
    }
</style>
</head>
<body>
	<div class="container">
		<div class="row mt-5">
			<div class="col">
				<img class="img-fluid" src="/roaming/resources/img/whitebg.png">
			</div>
		</div>
		<div class="row mt-5">
			<div class="col"></div>
			<div class="col-3">
				<div class="row custom-border">
					<div class="col-1"></div>
					<div class="col">
						<form action="./userRegisterProcess" method="post">
						<div class="row">
							<div class="col mt-5">
								<img class="img-fluid" src="/roaming/resources/img/logo222.png">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col small text-center" style="opacity: 0.5;">친구들의 사진과 영상을 보려면 가입하세요.</div>
						</div>
						<div class="row mt-3">
							<div class="col-2"></div>
							<div class="col-2 float-end">
								<img class="img-fluid" src="/roaming/resources/img/kakao.png">
							</div>
							<div class="col fs-6 text-start">카카오로 로그인하기</div>
						</div>
						<div class="row mt-2">
							<div class="col gray-line"></div>
							<div class="col-2 text-center">or</div>
							<div class="col gray-line"></div>
						</div>
						<div class="row mt-1">
							<div class="col mt-4">
								<input class="form-control" name="user_id" type="text" placeholder="아이디" aria-label="아이디">
							</div>
						</div>
						<div class="row mt-1">
							<div class="col">
								<input type="password" name="user_pw" class="form-control" placeholder="비밀번호">
							</div>
						</div>
						<div class="row mt-1">
							<div class="col">
								<input class="form-control" name="user_name" type="text" placeholder="이름" aria-label="이름">
							</div>
						</div>
						<div class="row mt-1">
							<div class="col-3">
								<h6><span class="badge bg-secondary">성별</span></h6>
							</div>
							<div class="col-3 form-check">
								<input class="form-check-input" type="radio" name="gender" value="M" checked>
								<label class="form-check-label" for="M">남자</label>
							</div>
							<div class="col-4 form-check justify-content-end">
								<input class="form-check-input" type="radio" name="gender" value="F" checked>
								<label class="form-check-label" for="F">여자</label>
							</div>
							<div class="col-2"></div>
						</div>
						<div class="row mt-1">
							<div class="col">
								<input class="form-control" name="phone_number" type="text" placeholder="전화번호" aria-label="전화번호">
							</div>
						</div>
						<div class="row mt-1">
							<div class="col">
								<input class="form-control" name="email" type="text" placeholder="이메일" aria-label="이메일">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col small text-center" style="opacity: 0.5; font-size: smaller;">저희 서비스를 이용하는 사람이 회원님의 연락처 정보를 Roaming에 업로드 했을 수도 있습니다.</div>
						</div>
						<div class="row mt-3">
							<div class="col d-grid">
							    <button class="btn btn-success btn-block btn-sm" style="background-color: LimeGreen; opacity: 0.8; border: none;">회원가입</button>
							</div>
						</div>
						<div class="row mt-3"></div>
					</form>
					</div>
					<div class="col-1"></div>
				</div>
				<div class="row custom-border mt-2">
				<div class="row mt-4"></div>
					<div class="col-3"></div>
					<div class="col text-start small">
						계정이 있으신가요?<a href="./loginPage" style="text-decoration: none;"> 로그인</a>
					</div>
					<div class="row mt-4"></div>
				</div>
			</div>
			<div class="col"></div>
		</div>
		<div class="row mt-5"></div>
		<div class="row mt-5"></div>
		<div class="row mt-5">
			<div class="col-2"></div>
			<div class="col mt-5">
				<footer class="footer">
            		<img class="img-fluid" src="/roaming/resources/img/footer.png">
   				</footer>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
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
						<form action="../user/loginProcess" method="post">
						<div class="row">
							<div class="col mt-5">
								<img class="img-fluid" src="/roaming/resources/img/logo222.png">
							</div>
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
						<div class="row mt-3">
							<div class="col d-grid">
							    <button class="btn btn-success btn-block btn-sm" style="background-color: LimeGreen; opacity: 0.8; border: none;">로그인</button>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col gray-line"></div>
							<div class="col-2 text-center">or</div>
							<div class="col gray-line"></div>
						</div>
						<div class="row mt-3">
							<div class="col-2"></div>
							<div class="col-2 float-end">
								<img class="img-fluid" src="/roaming/resources/img/kakao.png">
							</div>
							<div class="col fs-6 text-start">카카오로 로그인하기</div>
						</div>
						<div class="row mt-3">
							<a href="#" style="text-decoration: none;">
							<div class="col small text-center">비밀번호를 잊으셨나요?</div>
							</a>
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
						계정이 없으신가요?<a href="../user/userRegisterPage" style="text-decoration: none;"> 가입하기</a>
					</div>
					<div class="row mt-4"></div>
				</div>
			</div>
			<div class="col"></div>
		</div>
		<div class="row mt-3"></div>
		<div class="row mt-5"></div>
		<div class="row mt-5"></div>
		<div class="row mt-5"></div>
		<div class="row mt-5"></div>
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
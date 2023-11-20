<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"><title>adminLoginPage</title>
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
            <img class="img-fluid" src="">
         </div>
      </div>
      <div class="row mt-5">
         <div class="col"></div>
         <div class="col-3">
            <div class="row bg-success text-white">
               <div class="col text-center">
                  <h3>관리자 로그인</h3>
               </div>
            </div>
            <div class="row custom-border">
               <div class="col-1"></div>
               <div class="col">
                  <form action="./adminLoginProcess" method="post">
                  
                  <div class="row">
                     <div class="col">
                     <img class="img-fluid" src="../resources/img/logo.png">
                     </div>
                  </div>
                  <div class="row mt-1">
                     <div class="col form-floating">
                        <input type="text" name="admin_id" class="form-control" id="floatingInput" placeholder="아이디">
                        <label for="floatingInput">아이디</label>
                     </div>
                  </div>
                  <div class="row mt-1">
                     <div class="form-floating">
                        <input type="password" name="admin_pw" class="form-control" id="floatingPassword" placeholder="비밀번호">
                        <label for="floatingPassword">비밀번호</label>
                     </div>
                  </div>
                  <div class="row mt-1">
                     <div class="col d-grid">
                        <button class="btn btn btn-success btn-block">로그인</button>
                     </div>
                  </div>
                  <div class="row mt-1">
                     <div class="col gray-line"></div>
                     <div class="col-2 text-center">or</div>
                     <div class="col gray-line"></div>
                  </div>
                  <div class="row mt-1">
                     <div class="col d-grid">
                        <a href="./adminRegisterPage" class="btn btn-success btn-block" role="button">회원가입</a>
                     </div>
                  </div>
                  
                  <div class="row"><a href="../user/loginPage">유저 로그인</a></div>
               </form>
               </div>
               <div class="col-1"></div>
            </div>
            <div class="row"></div>
         </div>
         <div class="col"></div>
      </div>
      <div class="row"></div>
      <div class="row"></div>
      <div class="row"></div>
   </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>
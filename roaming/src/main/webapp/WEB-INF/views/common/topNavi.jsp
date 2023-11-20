<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 <div class="container-fluid">
 	<div class="row">
 		<div class="col-2"></div>
 		<div class="col-8">
                <nav class="navbar navbar-expand-lg bg-white">
                    <div class="container-fluid">
                        <a class="navbar-brand img-fluid d-flex align-items-center" href="../userboard/mainPage">
                             <img src="../resources/img/logo.png"
                                style="display: block; width: 181px; height: 31px; background-position: center 15px; background-size: 114px 30px;">
                        </a>
                      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                      </button>
                    
                      <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                          <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../facebook/facebookMain">
                                <div style="margin-right: 5px;">
                                  <img src="../resources/img/insta.png" alt="Feed Image" style="width: 20px; height: 20px;"> 릴스
                                </div>
                              </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../userboard/hotelPage">
                                <div style="margin-right: 5px;">
                                  <img src="../resources/img/hotel.png" alt="Feed Image" style="width: 20px; height: 20px;"> 숙소예약
                                </div>
                              </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../post/postListPage">
                                <div style="margin-right: 5px;">
                                  <img src="../resources/img/together.png" alt="Feed Image" style="width: 20px; height: 20px;"> 동행
                                </div>
                              </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../usercsboard/qaBoardPage">
                                <div style="margin-right: 5px;">
                                  <img src="../resources/img/qa.png" alt="Feed Image" style="width: 20px; height: 20px;"> 고객센터
                                </div>
                              </a>
                          </li>
                          <c:if test="${!empty sessionAdmin}">
                           <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../admincsboard/adminQaBoardProgressPage">
                                <div style="margin-right: 5px;">
                                  <img src="../resources/img/qa.png" alt="Feed Image" style="width: 20px; height: 20px;"> 고객센터
                                </div>
                              </a>
                          </li>
                          </c:if>
                        </ul>
                        <c:if test="${!empty sessionUser}">
                                    ${sessionUser.user_name}님
                        </c:if>
                        <c:if test="${empty sessionUser}">
                        </c:if>
                         <c:if test="${!empty sessionAdmin}">
                                    ${sessionAdmin.admin_id}님
                        </c:if>
                        <c:if test="${empty sessionAdmin}">
                        </c:if>
                        <c:choose>
                        <c:when test="${!empty sessionUser}">
                                    <a href="../user/logoutProcess" class="btn btn-outline-secondary" role="button" style="color: gray; border-color: transparent; background-color: transparent;">로그아웃</a>
                                     <a href="../userboard/myPage" class="btn btn-outline-secondary" role="button" style="color: gray; border-color: transparent; background-color: transparent;">마이 페이지</a>
                                     <a href="../userboard/alarmPage" class="btn btn-outline-secondary" role="button" style="color: gray; border-color: transparent; background-color: transparent;">알림</a>
                                     <a href="../userboard/friendGroupPage" class="btn btn-outline-secondary" role="button" style="color: gray; border-color: transparent; background-color: transparent;">친구</a>
                        </c:when>
                        <c:when test="${!empty sessionAdmin}">
                                    <a href="../adminboard/manageCouponPage" class="btn btn-outline-secondary" role="button" style="color: gray; border-color: transparent; background-color: transparent;">쿠폰관리</a>
                        			<a href="../adminboard/manageItemPage" class="btn btn-outline-secondary" role="button" style="color: gray; border-color: transparent; background-color: transparent;">상품관리</a>
                        			<a href="../admin/adminLogoutProcess" class="btn btn-outline-secondary" role="button" style="color: gray; border-color: transparent; background-color: transparent;">로그아웃</a>
                        </c:when>
                        <c:otherwise>
                        <a href="../admin/adminLoginPage" class="btn btn-outline-secondary" role="button" style="color: gray; border-color: transparent; background-color: transparent;">관리자 로그인</a>
                       	<a href="../user/loginPage" class="btn btn-outline-secondary" role="button" style="color: gray; border-color: transparent; background-color: transparent;">로그인</a>
                        <a href="../user/userRegisterPage" class="btn btn-outline-primary" role="button">회원가입</a>
                        </c:otherwise>
                        </c:choose>

                      </div>
                    </div>
                  </nav> 
                  </div>
                  <div class="col-2"></div>
            </div>
         </div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 <div class="container-fluid">
 	<div class="row">
 		<div class="col">
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

                         <c:if test="${!empty sessionSeller}">
                                    ${sessionSeller.seller_name}님
                        </c:if>

                        <c:choose>
                        <c:when test="${!empty sessionAdmin}">
                        			<a href="../admin/adminLogoutProcess" class="btn btn-outline-secondary" role="button" style="color: gray; border-color: transparent; background-color: transparent;">로그아웃</a>
                        </c:when>
                        </c:choose>

                      </div>
                    </div>
                  </nav> 
                  </div>
            </div>
         </div>

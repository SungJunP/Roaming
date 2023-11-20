<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>readQaBoardPage</title>
</head>
<body>
<jsp:include page="../common/topNavi.jsp"/>
	<div class="container">
		<div class="row mb-1">
			<div class="col-2"></div>
			<div class="col-8">
					<div class="row">
					<h3>문의</h3>
					</div>
					
					<div class="row">
						<table class="table table-bordered">
							<tr>
								<td class="table-active text-center">글번호</td>
								<td>${qaContent.qaBoard.id }</td>
							</tr>
							<tr>
								<td class="table-active text-center">구분</td>
								<td>
									${qaContent.category.qa_category_name }
								</td>
							</tr>
							<tr>
								<td class="table-active text-center">작성일</td>
								<td>
								<fmt:formatDate value="${qaContent.qaBoard.qa_reg_date}" pattern="yyyy-MM-dd HH:mm"/>
								</td>
							</tr>
							<tr>
								<td class="table-active text-center">제목</td>
								<td>${qaContent.qaBoard.qa_title }</td>
							</tr>
							<tr>
								<td class="table-active text-center">작성자</td>
								<td>${qaContent.user.user_name }</td>
							</tr>
							<tr>
								<td  class="table-active text-center" style="height : 120px; width : 150px;">
									내용
								</td>
								<td style="height : 120px; width : 450px;">
									<c:forEach items="${qaContent.images}" var="img">
											<img src="/uploadFiles/${img.image_link}" class="img-fluid"><br>
									</c:forEach>
									
									<c:if test="${qaContent.qaBoard.qa_content != null}">
										${qaContent.qaBoard.qa_content }
									</c:if>
								</td>
							</tr>
							
						</table>
					</div>
					
					<div class="row">
						<c:choose>
							<c:when test="${qaContent.qaBoard.qa_comment_content == null}">
							</c:when>
							<c:when test="${empty sessionUser}">
								<div class="col d-flex justify-content-center">
									<button class="btn btn-outline-dark" onclick="alert('로그인하세요.');">
										<i class="bi bi-hand-thumbs-up">${qaContent.qaBoard.qa_recommend_count }</i>
									</button>
								</div>
							</c:when>
							<c:when test="${qaRecommend != null}">
								<div class="col d-flex justify-content-center">
									<a class="btn btn-dark disabled" href="./increaseRecommendProcess?id=${qaContent.qaBoard.id}" role="button">
										<i class="bi bi-hand-thumbs-up">${qaContent.qaBoard.qa_recommend_count }</i>
									</a>
								</div>
							</c:when>
							<c:when test="${qaRecommend == null}">
								<div class="col d-flex justify-content-center">
									<a class="btn btn-dark " href="./increaseRecommendProcess?id=${qaContent.qaBoard.id}" role="button">
										<i class="bi bi-hand-thumbs-up">${qaContent.qaBoard.qa_recommend_count }</i>
									</a>
								</div>
							</c:when>
						</c:choose>
					</div>
					
					<div class="row d-flex flex-row-reverse">
						<c:if test="${sessionUser.id == qaContent.qaBoard.user_id}">
							<c:if test="${qaContent.qaBoard.qa_comment_content == null}">
							<div class="col-1">
								<a class="btn btn-secondary btn-sm form-control" href="./updateQaBoardPage?id=${qaContent.qaBoard.id }" role="button">수정</a>
							</div>
							</c:if>
							<div class="col-1">
								<a class="btn btn-secondary btn-sm form-control" href="./deleteQaBoardProcess?id=${qaContent.qaBoard.id }" role="button">삭제</a>	
							</div>
						</c:if>
						<c:if test="${!empty sessionUser}">
							<div class="col-1">
								<a class="btn btn-secondary btn-sm form-control" href="./qaBoardPage" role="button">목록</a>
							</div>
						</c:if>
						<c:if test="${!empty sessionAdmin && empty sessionUser}">
							<div class="col-2">
								<a class="btn btn-success btn-sm form-control" href="../admincsboard/writeCommentPage?id=${qaContent.qaBoard.id }" role="button">답변쓰기</a>
							</div>
							<div class="col-1">
								<a class="btn btn-success btn-sm form-control" href="../admincsboard/adminQaBoardProgressPage" role="button">목록</a>
							</div>
						</c:if>
					</div>
					
					<div class="row mt-3">
					<h3>답변</h3>
					</div>
					<c:choose>
						<c:when test="${qaContent.qaBoard.qa_comment_content != null}">
							<div class="row">
								<table class="table table-bordered">
								
									<tr>					
										<td class="table-active text-center">구분</td>
										<td>
											${qaContent.category.qa_category_name }
										</td>
									</tr>
									<tr>					
										<td class="table-active text-center">답변일</td>
										<td>
											<fmt:formatDate value="${qaContent.qaBoard.qa_comment_reg_date }" pattern="yyyy-MM-dd HH:mm"/>
										</td>
									</tr>
									<tr>
										<td class="table-active text-center">답변자</td>
										<td>${qaContent.admin.admin_id}</td>
									</tr>
									<tr>
										<td class="table-active text-center" style="height : 150px; width : 150px;">
											내용
										</td>
										<td style="height : 200px; width : 450px;">
											${qaContent.qaBoard.qa_comment_content }
										</td>
									</tr>
								</table>
							</div>
						</c:when>
						<c:otherwise>
						<div class="row" style="border-top: 1px solid black; border-bottom : 1px solid gray; height :100px;">
							<div class="col"></div>
							<div class="col text-center align-self-center fw-light fs-5">답변처리중입니다.</div>
							<div class="col"></div>			
						</div>
						</c:otherwise>
					</c:choose>
				</div>
			<div class="col-2"></div>
		</div>
	</div>
</body>
</html>
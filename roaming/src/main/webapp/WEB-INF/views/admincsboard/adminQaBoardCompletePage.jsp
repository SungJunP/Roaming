<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

<title>adminQaBoardPage</title>
</head>
<body>
<jsp:include page="../common/topNavi.jsp"></jsp:include>

<div class="container">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<div class="row bg-success text-white">
				<div class="col text-center">
					<h3>Q&A 게시판</h3>
				</div>
			</div>
			<div class="row">
				<div class="col" style="height:500px;">
					<div class="row text-center d-flex justify-content-center">
						<div class="col-6 list-group list-group-flush">
						  <a href="./adminQaBoardProgressPage" class="list-group-item list-group-item-action"><h3>답변처리중</h3></a>
						</div>
						<div class="col-6 list-group list-group-flush">
						  <a href="./adminQaBoardCompletePage" class="list-group-item list-group-item-action"><h3>답변완료</h3></a>
						</div>
					</div>
						
					<div class="row">
						<div class="col">
							<table class="table table-striped table-sm">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">구분</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${qaCompleteList}" var="qaCompleteList">
										<c:if test="${qaCompleteList.qaComplete.qa_comment_content != null}">
											<tr>
												<th scope="row">${qaCompleteList.qaComplete.id }</th>
												<td>${qaCompleteList.category.qa_category_name}</td>
												<td>
						                            <a class="link-dark link-offset-2 link-underline link-underline-opacity-0 link-opacity-25-hover text-truncate" href="../usercsboard/readQaBoardPage?id=${qaCompleteList.qaComplete.id}">
						                               ${qaCompleteList.qaComplete.qa_title}
						                               <c:if test="${qaCompleteList.isRecent < 2}"><span style="font-size : 11px; color:red;">N</span></c:if>
						                               <c:if test="${qaCompleteList.qaComplete.qa_comment_content != null}"><span style="font-size : 11px">[답변완료]</span></c:if>
						                            </a>
												</td>
												<td>${qaCompleteList.user.user_name}</td>
												<td><fmt:formatDate value="${qaCompleteList.qaComplete.qa_reg_date}" pattern="yyyy-MM-dd"/></td>
												<td>${qaCompleteList.qaComplete.qa_read_count}</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				<div class="row">
					<div class="col"></div>
					<div class="col-6">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<c:choose>
									<c:when test="${startPage <=1}">
										<li class="page-item disabled"><a class="page-link" href="./adminQaBoardCompletePage?page=${startPage-1}">이전</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="./adminQaBoardCompletePage?page=${startPage-1}">이전</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:forEach begin="${startPage }" end="${endPage }" var="index">
									<c:choose>
										<c:when test="${index == currentPage}">
											<li class="page-item active"><a class="page-link" href="./adminQaBoardCompletePage?page=${index }">${index }</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="./adminQaBoardCompletePage?page=${index }">${index }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:choose>
									<c:when test="${endPage >= totalPage}">
										<li class="page-item disabled"><a class="page-link" href="./adminQaBoardCompletePage?page=${endPage+1}">다음</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="./adminQaBoardCompletePage?page=${endPage+1}">다음</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</div>
					<div class="col"></div>
				</div>
				</div>
			</div>
			</div>
		<div class="col-2"></div>
	</div>
</div>

</body>
</html>
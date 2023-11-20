<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"><title>qa_board</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="../common/topNavi.jsp"/>
	<div class="container">
		<div class="row mt-5">
			<div class="col-2">
				<div class = "row">
					<div class = "col mx-4 p-4 border border-black">
						<div class = "row border-bottom border-success">
							<h4>고객센터</h4>
						</div>
						<div class = "row mt-3">
							<ul class="nav flex-column">
								<li class="nav-item">
									<a class="nav-link link-dark link-offset-2 link-underline link-underline-opacity-50 link-opacity-25-hover" href="./noticePage">공지사항</a>
								</li>
								<li class="nav-item">
									<a class="nav-link link-dark link-offset-2 link-underline link-underline-opacity-50 link-opacity-25-hover" href="./faqPage">자주하는 질문</a>
								</li>
								<li class="nav-item">
									<a class="nav-link active link-dark link-offset-2 link-underline link-underline-opacity-50 link-opacity-25-hover" href="./qaBoardPage">묻고 답하기</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-8">
				
				<div class="row border-bottom border-black border-2">
					<div class="col text-center">
						<h3>공지사항</h3>
					</div>
				</div>
				
				<div class="row h5 pb-2 mt-3 border-bottom border-success">
				  공지사항
				</div>
				
				<div class="row">
					<div class="col">
						<table class="table table-striped ">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">구분</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
									<th scope="col">조회수</th>
									<th scope="col">추천수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${qaList}" var="qaList">
								<tr>
									<th scope="row">${qaList.qaBoard.id }</th>
									<td>${qaList.category.qa_category_name}</td>
										<c:choose>
											<c:when test="${qaList.qaBoard.qa_secret == 'N' || sessionUser.id == qaList.user.id}">
												<td>
													<a class="link-dark link-offset-2 link-underline link-underline-opacity-0 link-opacity-25-hover" href="./readQaBoardPage?id=${qaList.qaBoard.id}">
													${qaList.qaBoard.qa_title}
														<c:if test="${qaList.isRecent < 2}"><span style="font-size : 11px; color:red;">N</span></c:if>
														<c:if test="${qaList.qaBoard.qa_comment_content != null}"><span style="font-size : 11px">[답변완료]</span></c:if>
													</a>
												</td>
											</c:when>
											<c:otherwise>
												<td>
													<i class="bi bi-lock-fill"></i>
													${qaList.qaBoard.qa_title}
														<c:if test="${qaList.isRecent < 2}"><span style="font-size : 11px; color:red;">N</span></c:if>
														<c:if test="${qaList.qaBoard.qa_comment_content != null}"><span style="font-size : 11px">[답변완료]</span></c:if>
												</td>
											</c:otherwise>
										</c:choose>
									<td>${qaList.user.user_name}</td>
									<td><fmt:formatDate value="${qaList.qaBoard.qa_reg_date}" pattern="yyyy-MM-dd"/></td>
									<td>${qaList.qaBoard.qa_read_count}</td>
									<td>${qaList.qaBoard.qa_recommend_count}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				<div class="row "><!-- 버튼 -->
					<div class="col-2"></div>
					<div class="col-8 text-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<c:choose>
									<c:when test="${startPage <= 1}">
										<li class="page-item disabled"><a class="page-link" href="./qaBoardPage?page=${startPage-1}${searchQueryString}">이전</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="./qaBoardPage?page=${startPage-1}${searchQueryString}">이전</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:forEach begin="${startPage}" end="${endPage}" var="index">
									<c:choose>
										<c:when test="${index == currentPage}">
											<li class="page-item active"><a class="page-link" href="./qaBoardPage?page=${index}${searchQueryString}">${index}</a></li>								
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="./qaBoardPage?page=${index}${searchQueryString}">${index}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:choose>
									<c:when test="${endPage >= totalPage }">
										<li class="page-item disabled"><a class="page-link" href="./qaBoardPage?page=${endPage+1}${searchQueryString}">다음</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="./qaBoardPage?page=${endPage+1}${searchQueryString}">다음</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</div>
					<div class="col-2">
						<div>
							<c:if test="${!empty sessionUser}">
								<a href="./writeQaBoardPage" class="btn btn-secondary form-control" role="button" >글쓰기</a>
							</c:if>
						</div>
					</div>
				</div>
				
				<form action="./qaBoardPage" method="get">
				<div class="row">
					<div class="col-2"></div>
						<div class="col-2">
							<select name="searchType" class="form-select">
								<option value="qa_title">제목</option>
								<option value="qa_content">내용</option>
								<option value="user_name">글쓴이</option>
							</select>
						</div>
					<div class="col-4">
						<input type="text" name="searchWord" class="form-control" placeholder="검색할 내용을 입력하세요">
					</div>
						<div class="col-1">
						    <button class="btn btn-success">
						      	<i class="bi bi-search"></i>
						    </button>
						</div>
					<div class="col-3"></div>
				</div>
				</form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>writeCommentPage</title>
</head>
<body>
<jsp:include page="../common/topNavi.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
					<div class="row mb-1">
					<h3>문의</h3>
					</div>
					<div class="row">
						<table class="table table-bordered">
							<tr>
								<td class="table-active">글번호</td>
								<td>${qaContent.qaBoard.id }</td>
							</tr>
							<tr>
							<td class="table-active">작성일</td>
							<td>
							<fmt:formatDate value="${qaContent.qaBoard.qa_reg_date}" pattern="yyyy-MM-dd"/>
							</td>
							</tr>
							<tr>
								<td class="table-active"><label for="qa_title">제목</label></td>
								<td>${qaContent.qaBoard.qa_title }</td>
							</tr>
							<tr>
								<td class="table-active">작성자</td>
								<td>${qaContent.user.user_name }</td>
							</tr>
							
							<tr>
								<td class="table-active"><label for="qa_category_id">구분</label></td>
								<td>
									${qaContent.category.qa_category_name }
								</td>
							</tr>
							<tr>
								<td class="table-active" style="height : 120px; width : 150px;">
									<label for="qa_content">내용</label>
								</td>
								<td style="height : 120px; width : 450px;">
									<c:forEach items="${qaContent.images}" var="image">
										<img src="/uploadImageFiles/${image.image_link}" class="img-fluid"><br>
									</c:forEach>
									
									<c:if test="${qaContent.qaBoard.qa_content != null}">
										${qaContent.qaBoard.qa_content }
									</c:if>
								</td>
							</tr>
						</table>
					</div>
					<div class="row mt-3">
					<h3>답변</h3>
					</div>
					<form action="./writeCommentProcess" method="post">
					<div class="row">
						<table class="table table-bordered">
						
							<tr>					
								<td class="table-active"><label for="qa_category_id">구분</label></td>
								<td>
									${qaContent.category.qa_category_name }
								</td>
							</tr>
							<tr>
								<td class="table-active">답변자</td>
								<td>${sessionAdmin.admin_id}</td>
							</tr>
							<tr>
								<td class="table-active" style="height : 150px; width : 150px;">
									<label for="qa_content">내용</label>
								</td>
								<td style="height : 200px; width : 450px;">
									<input type="hidden" name="id" value="${qaContent.qaBoard.id }">
									<textarea class="form-control" placeholder="답변내용을 입력해주세요" name="qa_comment_content" style="height : 100%;"></textarea>
								</td>
							</tr>
						
						</table>
					</div>
					<div class="row d-flex flex-row-reverse">
						<div class="col-2">
							<button class="btn btn-success btn-sm form-control">답변하기</button>
						</div>
					</div>
					</form>
				</div>
				
			<div class="col-2"></div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>writeQaBoardPage</title>
</head>
<body>
<jsp:include page="../common/topNavi.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<form action="./writeQaBoardProcess" method="post" enctype="multipart/form-data">
					<div class="row">
						<table class="table table-bordered">
							<tr>
								<td><label for="qa_title">제목</label></td>
								<td><input type="text" class="form-control" placeholder="제목" id="qa_title" name="qa_title"></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td>
									${sessionUser.user_name}
									<input type="hidden" name="user_id" value="${sessionUser.id }">
								</td>
							</tr>
							<tr>
								<td>비밀글여부</td>
								<td>
									<label for="qa_secret"><input type="radio" id="qa_secret" name="qa_secret"  value="N" checked/>공개</label>
									<label for="qa_secret"><input type="radio" id="qa_secret" name="qa_secret"  value="Y"/>비공개</label>
								</td>
							</tr>
							<tr>
								<td><label for="qa_category_id">분류</label></td>
								<td>
									<select id="qa_category_id" name="qa_category_id">
										<c:forEach items="${category}" var="category">
											<option value="${category.id }" >${category.qa_category_name }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<label for="qa_content">내용</label>
								</td>
								<td>
									<textarea class="form-control" placeholder="문의내용을 입력해주세요" id="qa_content" name="qa_content" style="height: 100px"></textarea>
								</td>
							</tr>
							<tr>
								<td><label for="image_link">첨부이미지</label></td>
								<td>
									<input type="file" name="image_link" id="image_link" multiple accept="image/*" class="form-control">
								</td>
							</tr>
						</table>
					</div>
					
					<div class="row">
						<div class="col">
							<a class="btn btn-secondary form-control" href="./qaBoardPage" role="button">취소</a>
						</div>
						<div class="col">
								<button class="btn btn-secondary form-control">글쓰기</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
</body>
</html>
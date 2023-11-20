<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script>
const postId = new URLSearchParams(location.search).get("id");
let commentId = null;

	function xml() {
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200) {
			const response = JSON.parse(xhr.responseText);
		}
	}
		
		xhr.open("get", "./getPostCommentList?id=" + postId);
		xhr.send();
		
		xhr.open("post", "");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
		xhr.send();
}



let mySessionId = null;

function getSession() {
   const xhr = new XMLHttpRequest();
   xhr.onreadystatechange = function () {
      if(xhr.readyState == 4 && xhr.status == 200) {
         const response = JSON.parse(xhr.responseText);
      if(response.result == "success") {
         mySessionId = response.id;
      }         
   }
}

xhr.open("get", "./getMyId");
xhr.send();      
}



		/* function partyStatus() {
			const xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				const data = response.data.joinConfirmDto;
				if(data.status == "y") {
					// 동행방 참가버튼
				}else if(data.status == "r") {
					// 가입승낙중 버튼
				}else if()
				
				
				
				
			}
		}
			
			xhr.open("get", "./getPostJoinStatus?post_id=" + postId);
			xhr.send();
	} */
		
		
		/* <div id="partyButtonRow" class="row">
        <div class="col">
            <div class="card" style="width: auto;">
                <ul class="list-group list-group-flush">
                   <c:if test="${!empty sessionUser}">
                   		<li class="list-group-item "><a class="btn btn-primary d-grid" href="./postJoinPage?id=${postDto.id}">동행참가</a></li>
                   </c:if>
                   <c:if test="${empty sessionUser}">
             			<li class="list-group-item "><a class="btn btn-primary d-grid" href="../user/loginPage">동행참가</a></li>                                   
                   </c:if>
                </ul>
              </div>
        </div>
    </div> */

function comment() {
	if(!mySessionId) {
	      alert("로그인 해주세요");
	      commentBox.value = "";
	      return;
	   }
	let commentBox = document.getElementById("commentBox");
	let commentBoxValue = commentBox.value;
   const xhr = new XMLHttpRequest();   
   xhr.onreadystatechange = function () {
      if(xhr.readyState == 4 && xhr.status == 200) {
         const response = JSON.parse(xhr.responseText);
         
           if(response.result == "success"){
              commentBox.value = "";
              commentTotalCount();
              readCommentList();
           }
           
      }
   }

   xhr.open("post", "./insertPostComment");
   xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
   xhr.send("post_id=" + postId + "&post_comment=" + commentBoxValue);
}



function toggleReplyField(commentId) {
    const replyField = document.getElementById("commentInsert" + commentId);
    const replyLink = document.getElementById("replyLink" + commentId);
    console.log("commentId : ", commentId);
    console.log("replyField : ", replyField);
    
    
    if (replyField.style.display == "none") {
       replyField.style.display = "block";
       replyLink.innerText = "취소";
    } else {
       replyField.style.display = "none";
       replyLink.innerText = "답글쓰기";
    }
}

function submitReply() {
   if(!mySessionId) {
      alert("로그인 해주세요");
      commentBox.value = "";
      return;
   }
   const replyInputBox = document.getElementById("replyInput" + commentId);
    const replyValue = replyInputBox.value;
    console.log("submit commentId : " + commentId);
    console.log("submit value : " + replyValue);
   const xhr = new XMLHttpRequest();
   xhr.onreadystatechange = function () {
      if(xhr.readyState == 4 && xhr.status == 200) {
         const response = JSON.parse(xhr.responseText);
         replyInputBox.value = "";
         commentTotalCount();
      
   }
}

   xhr.open("post", "./insertRePostComment");
   xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
   xhr.send("comment_id=" + commentId + "&re_comment=" + replyValue); 
}


/* 대대댓글 */

   function toggleReReplyField() {
    const replyReField = document.getElementById("reCommentInsert");
    const replyReLink = document.getElementById("replyReLink");
    
    if (replyReField.style.display === "none") {
        replyReField.style.display = "block";
        replyReLink.innerText = "취소";
    } else {
        replyReField.style.display = "none";
        replyReLink.innerText = "답글쓰기";
        
    }
}

	function submitReReply(comment_id, re_user_id) {
	   if(!mySessionId) {
	      alert("로그인 해주세요");
	      commentBox.value = "";
	      return;
	   }
	   const replyReInputBox = document.getElementById("replyReInput");
	   const replyReValue = replyReInputBox.value;
	   const xhr = new XMLHttpRequest();
	   xhr.onreadystatechange = function () {
	      if(xhr.readyState == 4 && xhr.status == 200) {
	         const response = JSON.parse(xhr.responseText);
	         replyReInputBox.value = "";
	         commentTotalCount();
	   }
	}

   xhr.open("post", "./insertReRePostComment");
   xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
   xhr.send("comment_id=" + comment_id + "&re_user_id=" + re_user_id + "&re_comment=" + replyReValue);
}
  
	function commentTotalCount() {
	   const xhr = new XMLHttpRequest();
	   xhr.onreadystatechange = function () {
	      if(xhr.readyState == 4 && xhr.status == 200) {
	         const response = JSON.parse(xhr.responseText);
		     const total = response.comment_total
		     const commentCountBox = document.getElementById("commentCountBox"); 
		     commentCountBox.innerText = "댓글 " + total;
		     
		   }
		}
		
		xhr.open("get", "./commentTotalCount?postId=" + postId);
		xhr.send();
	}

	/* 게시판 좋아요 */
	function clickLike() {
		if(!mySessionId) {
			alert("로그인 해주세요");
		      return;
		   }
		   const xhr = new XMLHttpRequest();
		   xhr.onreadystatechange = function () {
		      if(xhr.readyState == 4 && xhr.status == 200) {
		         const response = JSON.parse(xhr.responseText);
		         checkLike();
		         likeTotalCount();
			   }
			}
			
			xhr.open("get", "./likeClick?post_id=" + postId);
			xhr.send();
		}

	function checkLike() {
		
		   const xhr = new XMLHttpRequest();
		   xhr.onreadystatechange = function () {
		      if(xhr.readyState == 4 && xhr.status == 200) {
		         const response = JSON.parse(xhr.responseText);
			     const likeIconBox = document.getElementById("likeIconBox"); 
		         if(response.liked >= 1) {
		        	 likeIconBox.classList.remove("bi-heart");
		        	 likeIconBox.classList.add("bi-heart-fill");
		         }else {
		        	 likeIconBox.classList.remove("bi-heart-fill");
		        	 likeIconBox.classList.add("bi-heart");
		         }
		         likeTotalCount();
			   }
			}
			
			xhr.open("get", "./myCheckLike?post_id=" + postId);
			xhr.send();
		}

	function likeTotalCount() {
		   const xhr = new XMLHttpRequest();
		   xhr.onreadystatechange = function () {
		      if(xhr.readyState == 4 && xhr.status == 200) {
		         const response = JSON.parse(xhr.responseText);
			     const likeTotalCountBox = document.getElementById("likeTotalCountBox");
			     likeTotalCountBox.innerText = "좋아요 " + response.totalCount;
			   }
			}
			
			xhr.open("get", "./likedTotalCount?postId=" + postId);
			xhr.send();
		}
	
	
	/* 댓글 좋아요 */
	function clickCommentLike(commentId) {
		if(!mySessionId) {
			alert("로그인 해주세요");
		      return;
		   }
		   const xhr = new XMLHttpRequest();
		   xhr.onreadystatechange = function () {
		      if(xhr.readyState == 4 && xhr.status == 200) {
		         const response = JSON.parse(xhr.responseText);
		         checkCommentLike();
		         commentLikeTotalCount();
			   }
			}
			
			xhr.open("get", "./commentLikeClick?comment_id=" + commentId);
			xhr.send();
		}

	function checkCommentLike() {
			
			
			const commentlikeIconBox = document.getElementById("commentlikeIconBox");
			
			
			
		   const xhr = new XMLHttpRequest();
		   xhr.onreadystatechange = function () {
		      if(xhr.readyState == 4 && xhr.status == 200) {
		         const response = JSON.parse(xhr.responseText);
		         
		         if(response.liked >= 1) {
		        	 commentlikeIconBox.classList.remove("bi-heart");
		        	 commentlikeIconBox.classList.add("bi-heart-fill");
		         }else {
		        	 commentlikeIconBox.classList.remove("bi-heart-fill");
		        	 commentlikeIconBox.classList.add("bi-heart");
		         }
		         commentLikeTotalCount();
			   }
			}
		    
			xhr.open("get", "./commentMyCheckLike?comment_id=" + commentId);
			xhr.send();
		}
	
		 function commentLikeTotalCount() {
		   const xhr = new XMLHttpRequest();
		   xhr.onreadystatechange = function () {
		      if(xhr.readyState == 4 && xhr.status == 200) {
		         const response = JSON.parse(xhr.responseText);
			     const commentLikeTotalCountBox = document.getElementById("commentLikeTotalCountBox");
			     commentLikeTotalCountBox.innerText = "좋아요 " + response.totalCount;
			   }
			}
			xhr.open("get", "./commentLikedTotalCount?commentId=" + commentId);
			xhr.send();
		}
	
		 
	/* 댓글 출력 */
	
	function readCommentList() {
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200) {
			const response = JSON.parse(xhr.responseText);
			
			const commentContainer = document.getElementById("commentContainer"); 
			
			commentContainer.innerHTML = "";
			
			
			response.commentList.forEach(function(item){
				comment_id = item.commentDto.id;
				
				console.log("id : " + item.commentDto.id)
				const col99 = document.createElement("div");
				col99.classList.add("col");
				const row77 = document.createElement("div");
				row77.classList.add("row");
				const col1 = document.createElement("div");
				col1.classList.add("col-11", "d-flex");
				
				const img1 = document.createElement("img");
				img1.src = "/uploadFiles/" + item.commentUserDto.profile_img;
				img1.classList.add("img-fluid", "rounded-circle", "p-3");
				img1.style.height = "80px";
				img1.style.width = "80px";
				col1.appendChild(img1);
				
				
				const div1 = document.createElement("div");
				
				const p1 =  document.createElement("p");
				p1.classList.add("m-0", "pt-3");
				p1.innerText = item.commentUserDto.user_name;
				const p2 =  document.createElement("p");
				p2.style.wordBreak = "break-all";
				p2.innerText = item.commentDto.post_comment;
				
				div1.appendChild(p1);
				div1.appendChild(p2);
				col1.appendChild(div1);
				row77.appendChild(col1);
				col99.appendChild(row77);
				const col2 = document.createElement("div");
				col2.classList.add("col-1");
				
				const i1 = document.createElement("i");
				i1.classList.add("float-end", "bi", "bi-three-dots-vertical");
				col2.appendChild(i1);
				
				commentContainer.appendChild(col1);
				commentContainer.appendChild(col2);
				
				
				const row99 = document.createElement("div");
				row99.classList.add("row");
				const col3 = document.createElement("div");
				col3.classList.add("col");
				
				const div2 = document.createElement("div");
				div2.classList.add("row");
				
				const col4 = document.createElement("div");
				col4.classList.add("col", "ms-3");
				
				const small1 = document.createElement("small");
				small1.classList.add("ms-5");
				small1.style.color = "gray";
				small1.innerText = item.commentDto.reg_date;
				
				const small2 = document.createElement("small");
				small2.classList.add("ms-2");
				small2.style.color = "gray";
				small2.id = "commentLikeTotalCountBox";
				small2.innerText = "좋아요 " + item.comment_total;
				
				const small3 = document.createElement("small");
				small3.classList.add("ms-2");
				small3.id = "replyLink";
				small3.style.color = "gray";
				small3.innerText = "답글쓰기";
				small3.onclick = () => {
					toggleReplyField(item.commentDto.id);	
				}
				
				const i2 = document.createElement("i");
				i2.id = "commentlikeIconBox";
				i2.classList.add("bi", "bi-heart", "text-danger", "float-end");
				i2.onclick = () => {
					clickCommentLike(item.commentDto.id);
				}
				
				col4.appendChild(small1);
				col4.appendChild(small2);
				col4.appendChild(small3);
				col4.appendChild(i2);
				div2.appendChild(col4);
				col3.appendChild(div2);
				row99.appendChild(col3)
				
				const row88 = document.createElement("div");
				row88.classList.add("row");
				const col5 = document.createElement("div");
				col5.classList.add("col", "p-0");
				const hr1 = document.createElement("hr");
				hr1.classList.add("m-0", "mt-2");
				
				col5.appendChild(hr1);
				row88.appendChild(col5);

				col99.appendChild(row77);
				col99.appendChild(row99);
				col99.appendChild(row88);
				
				commentContainer.appendChild(col99);
			});
			
			
		}
	}
		
		xhr.open("get", "./getPostCommentList?id=" + postId);
		xhr.send();
}
	
	

			

window.addEventListener("DOMContentLoaded", function(){
   getSession();
   commentTotalCount();
   checkLike();
   likeTotalCount();
   readCommentList();
   checkCommentLike();
   commentLikeTotalCount();
   
   
   
   
});


</script>
<style>
    li {
       list-style-type: none;
    }
    
    a {
         color: black;
    
    }
    
    .spanStyle p {
       display: block;
    }
    
  
    
</style>
<title>Insert title here</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="row">
                    <div class="col">
                       <jsp:include page="../common/topNavi.jsp"></jsp:include>
                    </div>
                </div>
                
                
                
                
                <!-- 게시글 foreach -->
                
                <div class="row">
                    <div class="col mt-3 mb-3 ">
                    <c:forEach items="${postImageDto}" var="item">
                        <img src="/uploadFiles/${item.post_image}" alt="사진" style="width:100%; height: 400px;"/>
                    </c:forEach>
                    </div>
                </div>
                <div class="row">
                    <div class="col-9 border rounded">
                        <div class="row">
                            <div class="col">
                                <h4>${postDto.title}</h4>
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col"><h3>모임일정</h3></div>
                        </div>
                        
                        
                        <div class="row mt-3">
                            <div class="col">
                                <div class="row">
                                    <h4>1일차</h4>
                                </div>
                                
                                <!-- 위치, 메모 추가 -->
                                <div class="row">
                                    <div class="col">
                                        <div class="mb-3 row">
                                            <label class="col-sm-2 col-form-label">위치</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" value="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="mb-3 row">
                                            <label class="col-sm-2 col-form-label">메모</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" value="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              

                              
                               
                                        
                            </div>
                        </div>
                        
                        <div class="row mt-4">
                            <div class="col">
                                <strong>${postDto.content}</strong>
                            </div>
                        </div>
                        
                        
                        <c:if test="${postDto.create_id == sessionUser.id}">
                        <div class="row mt-2">
                            <div class="col">
                                <a href="./addSchedulePage?id=${postDto.id}" class="btn btn-primary">일정추가</a>
                                <a href="./correctionPage?id=${postDto.id}" class="btn btn-primary">수정</a>
                                <a href="./postAddSchedultPage?id=${postDto.id}" class="btn btn-primary">Map</a>
                                <a href="./textPlan?id=${postDto.id}" class="btn btn-primary">New일정추가</a>
                                <a href="./testPost?id=${postDto.id}" class="btn btn-primary">테스트지도API</a>
                            </div>
                        </div>
                        </c:if>
                        
                        
                        
                        <div class="row mt-4">
                            <div class="col">
                               <fmt:formatDate value="${postDto.reg_date}" pattern="yyyy.MM.dd HH:mm" var="date"/>
                               <span>${date}</span>
                                <span class="ms-2 me-2">|</span>
                                <span>조회수 ${postDto.hit}</span>
                                <span class="ms-2 me-2">|</span>
                                <c:if test="${!empty sessionUser}">
                                <span><a href="./reportPage?post_id=${postDto.id}">신고하기</a></span>
                                </c:if>
                                <c:if test="${empty sessionUser}">
                                <span><a href="../user/loginPage">신고하기</a></span>
                                </c:if>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        <div class="row mt-2">
                        	<div class="col">
                        		<i onclick="clickLike();" id="likeIconBox" class="bi bi-heart text-danger"></i>
                        		<span id="likeTotalCountBox">좋아요 5</span>
                        		<i class="ms-3 bi bi-chat-dots"></i>
                        		<span id="commentCountBox">댓글 3</span>
                        	</div>
                        </div>
                        
                        
                        
                        
                        
                        <!-- 댓글 달기 -->                        
                        
                        <div class="row mt-3"> 
                            <div class="col">
                            	<div class="row">
                            		<div class="col-10">
		                                <input id="commentBox" class="form-control" type="text" placeholder="댓글을 입력해주세요.">
		                            </div>
		                            <div class="col-2">
		                                <input type="button" class="btn btn-primary" onclick="comment()" value="게시">
		                            </div>
                            	</div>
                            	<div class="row">
                            		<div class="col p-0">
                            			<hr class="m-0 mt-3">
                            		</div>
                            	</div>
                            </div>
                        </div>
                        


                       <!-- 댓글 출력 -->
                        <%-- <c:forEach items="${commentList}" var="item"> --%>
                        
                       <div id="commentContainer" class="row mt-1">
                  <%--  <div class="col-11 d-flex ">
                          <img src="/uploadFiles/${item.commentUserDto.profile_img}" class="img-fluid rounded-circle p-3" alt="..." style="height: 80px; width: 80px;">
                          <div>
                              <p class="m-0 pt-3">${item.commentUserDto.user_name}</p>
                              <p style="word-break: break-all;">${item.commentDto.post_comment}</p>
                          </div>
                      </div>
                      <div class="col-1">
                      		<i class="float-end bi bi-three-dots-vertical"></i>
                      </div> --%>
                  </div>

						<div id="reCommentContainer" class="row mt-1"></div>                        
                        <%-- <div id="commentContainer2" class="row">
                            <div class="col">
                            	<div class="row">
                            		<div class="col ms-3">
		                            	<fmt:formatDate value="${item.commentDto.reg_date}" var="reg_date" pattern="yyyy.MM.dd HH:mm"/>
		                               <small class="ms-5 " style="color: gray;">${reg_date}</small>
		                               <small class="ms-2 " style="color: gray;" id="commentLikeTotalCountBox_${item.commentDto.id}">좋아요 3</small>
		                               <small class="ms-2" onclick="toggleReplyField(${item.commentDto.id})" id="replyLink_${item.commentDto.id}" style="color: gray;">답글쓰기</small>
		                               <i onclick="clickCommentLike(${item.commentDto.id});" id="commentlikeIconBox_${item.commentDto.id}" class="bi bi-heart text-danger float-end"></i>
		                               <input id="commentId" type="hidden" value="${item.commentDto.id}">
		                            </div>
                            	</div>
                            	<div class="row">
                            		<div class="col p-0">
                            			<hr class="m-0 mt-2">
                            		</div>
                            	</div>
                            </div>
                        </div> --%>
                        
                       <%--  <!-- 대댓글 insert -->
                        <div class="row">
                           <div class="col-2">
                           </div>
                           <div class="col">
                        <div id="commentInsert_${item.commentDto.id}" style="display: none;">
                            <textarea class="form-control" rows="5" cols="70" id="replyInput_${item.commentDto.id}" placeholder="답글을 입력하세요"></textarea>
                            <button class="btn btn-primary mt-2 float-end" onclick="submitReply(${item.commentDto.id})">전송</button>
                        </div>                              
                           </div>
                        </div>
                        
                  		<!-- /댓글 출력 -->                        
                       
                        <!-- 대댓글 출력-->
                        <c:forEach items="${item.reCommentList}" var="reItem">
                        
                    <div class="col">
                        <div class="row">
                           <div class="col-2"></div>
                            <div class="col d-flex ">
                                  <img src="/uploadFiles/${reItem.reCommentUserDto.profile_img}" class="img-fluid rounded-circle p-3" alt="..." style="height: 80px; width: 80px; ">
                                <div>
                                	<p class="m-0 pt-3">${reItem.reCommentUserDto.user_name}</p>
                                		<c:choose>
                                			<c:when test="${!empty reItem.frontUserDto.user_name}">
                                				<b>${reItem.frontUserDto.user_name}&nbsp</b><p style="word-break: break-all; display: inline;">${reItem.reCommentDto.re_comment}</p>
                                			</c:when>
                                			<c:when test="${reItem.frontUserDto.user_name == reItem.reCommentUserDto.user_name}">
                                				<p style="word-break: break-all;">${reItem.reCommentDto.re_comment}</p>
                                			</c:when>
                                			<c:otherwise>
                                				<p style="word-break: break-all;">${reItem.reCommentDto.re_comment}</p>
                                			</c:otherwise>
                                		</c:choose>
                                </div> 
                            </div>
                        </div>
                        
                        
                        
                        <div class="row">
                            <div class="col">
                            	<div class="row">
                            		<div class="col-2">
		                            </div>
		                            <div class="col ms-3">
		                            <fmt:formatDate value="${reItem.reCommentDto.reg_date}" var="re_reg_date" pattern="yyyy.MM.dd HH:mm"/>
		                               <small class="ms-5 mb-1" style="color: gray;">${re_reg_date}</small>
		                               <small class="ms-3" onclick="toggleReReplyField(${reItem.reCommentDto.id})" id="replyReLink_${reItem.reCommentDto.id}" style="color: gray;">답글쓰기</small>
		                            </div>
                            	</div>
                            	<div class="row">
                            		<div class="col p-0">
                            			<hr class="m-0 mt-2">
                            		</div>
                            	</div>
                            </div>
                        </div>
                    </div>    
                        
                        <!-- 대대댓글 insert -->
                        <div class="row">
                           <div class="col-2">
                           </div>
                           <div class="col">
                        <div id="reCommentInsert_${reItem.reCommentDto.id}" style="display: none;">
                            <textarea class="form-control" rows="5" cols="70" id="replyReInput_${reItem.reCommentDto.id}" placeholder="답글을 입력하세요"></textarea>
                            <button class="btn btn-primary mt-2 float-end" onclick="submitReReply(${item.commentDto.id}, ${reItem.reCommentUserDto.id})">전송</button>
                        </div>                              
                           </div>
                        </div>
                        </c:forEach>
                     </c:forEach> --%>
                        <!-- /댓글 출력 -->


                    </div>
                    <div class="col-3">
                        <div class="row">
                            <div class="col">
                                <div class="card mb-3" style="max-width: 540px; height: 105px;">
                                    <div class="row">
                                        <div class="col-4 d-flex align-items-center justify-content-center">
                                            <img src="/uploadFiles/${userDto.profile_img}" class="img-fluid rounded-circle p-3 mt-2" alt="프로필" style="height: 90px; width: 90px; ">
                                            
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row- mt-4">
                                                <div class="col">${userDto.user_id}</div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col">
                                                    <span>${userDto.gender}</span>
                                                    <span class="ms-2">|</span>
                                                    <span class="ms-2">${userDto.user_name}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-2"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div id="partyButtonRow" class="row">
                            <div class="col">
                                <div class="card" style="width: auto;">
                                    <ul class="list-group list-group-flush">
                                       <c:if test="${!empty sessionUser}">
                                       		<li class="list-group-item "><a class="btn btn-primary d-grid" href="./postJoinPage?id=${postDto.id}">동행참가</a></li>
                                       </c:if>
                                       <c:if test="${empty sessionUser}">
                                 			<li class="list-group-item "><a class="btn btn-primary d-grid" href="../user/loginPage">동행참가</a></li>                                   
                                       </c:if>
                                    </ul>
                                  </div>
                            </div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col">
                                <div class="card" style="width: auto;">
                                    <ul class="list-group list-group-flush">
                                      <li class="list-group-item ">함께하는 동행 (<span>${count} / ${postDto.person_count}</span>)</li>
                                      
                                      <!-- 동행 foreach-->
                                      <c:forEach items="${list}" var="item">
                                      <li class="list-group-item ">
                                        <div class="row mb-1">
                                            <div class="col-3 d-flex align-items-center justify-content-center" >
                                                <img src="/uploadFiles/${item.userDto.profile_img}" class="img-fluid rounded-circle" alt="..." style="height: 50px; width: 50px;">
                                            </div>
                                            <div class="col-9">
                                                <div class="row d-flex align-items-center justify-content-center" style="height: 100%;">
                                                    <div class="col-5">
                                                        <span>${item.userDto.user_id}</span>
                                                        
                                                    </div>
                                                    <div class="col-3">
                                                        <span>${item.userDto.gender}</span>
                                                        
                                                    </div>
                                                    <div class="col-4">
                                                        <span>${item.userDto.user_name}</span>
                                                    </div>
                                                </div>  
                                            </div>
                                        </div>
                                      </li>
                                      </c:forEach>
                                      
                                    

                                    </ul>
                                  </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-2"></div>
        </div>


    </div>
    

<!-- 삭제 -->
<div class="row mt-5">
	<div class="col-1">
		<a href=""></a>
		<img>
	</div>
</div><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
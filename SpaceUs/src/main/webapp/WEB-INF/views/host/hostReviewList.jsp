<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- 한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/hostpageMenu.jsp" />
<link href="https://cdn.materialdesignicons.com/5.5.55/css/materialdesignicons.min.css" rel="stylesheet">
<style>	
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 30%;
  width: auto;
  padding: 30px;
  color: white; !important;
  font-weight: bold;
  font-size: 30px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

.next {margin-right: 16px; right: 0; border-radius: 3px 0 0 3px;}
.prev:hover, .next:hover {opacity: 0.3;}
.fa-share-square, .fa-heart {color:black; font-size:25px; margin-right:10px;}
.fab {margin-right:5px;}
a:hover {opacity: 0.3; color:black;}

.fade1 {	
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}
@-webkit-keyframes fade1 {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade1 {
  from {opacity: .4} 
  to {opacity: 1}
}

@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
/* 리뷰 */
.btn-group-toggle{
	height: 30px;
    position: absolute;
    right: 85px;
}
.reviewLabel{
	font-size: 11px;
}
.modifyDiv{
	display: none;
}
</style>

        <div class="page-wrapper">
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor ml-5">호스트 센터</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center mr-5">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">호스트 센터</a></li>
                                <li class="breadcrumb-item active">공간 리뷰</li>
                            </ol>
                        </div>
                    </div>
                </div>
               
		        <!-- 리뷰 -->
		        
		        <div id="reviewPage" class="ml-5 mr-5">
                  <div class="card p-5">
                      <div class="card-body">
                       <div class="row"> 
                       <div class="col-md-10">
                           <h5 class="card-title">공간 리뷰</h5>
                           <h6 class="card-subtitle">이용자들의 리뷰입니다</h6>
                       </div>
                          <div class="col-md-2">
                          <c:choose>
							<c:when test="${ comment == 'no' }">
                              <select class="custom-select b-0" id="selectId">
                                  <option value="1">전체 리뷰</option>
                                  <option value="2" selected>답변을 기다리는 리뷰</option>
                              </select>
                             </c:when>
                             <c:otherwise>
                              <select class="custom-select b-0" id="selectId">
                                  <option value="1">전체 리뷰</option>
                                  <option value="2">답변을 기다리는 리뷰</option>
                              </select>
                             </c:otherwise>
                           </c:choose>
		                      <form action="${pageContext.request.contextPath}/host/selectReviewComment.do" id="selectCommentFrm">
		                          <input type="hidden" name="spaceNo" value="${ spaceNo }" />
		                      </form>
		                      <form action="${pageContext.request.contextPath}/host/reviewList.do" id="totalCommentFrm"></form>
                           </div> 
                      </div>
                       <div >
				   		<div class="row">
				   		<p class="head"></p>
				   			<%-- <p class="head ml-4">${ reviewTotal }개의 리뷰</p> --%>
				   			
				   		</div>
						 <c:forEach items="${review}" var="review" varStatus="vs">
						 <c:choose>
							<c:when test="${ review.image != null }">
				   			<div class="review d-flex mb-4 pb-3" style="border-bottom: .5px solid #efefef ">
						   		<div class="desc" style="width: 100%;">
						   			<p>
						   				<span class="text-left">${ review.nickName }</span>
						   				<span class="text-right"><fmt:formatDate value="${review.enrollDate}" pattern="yyyy-MM-dd"/></span>
						   				<span>
						   					<c:forEach begin="1" end="${ review.starRating }">
							   					<i class="ion-ios-star"></i>
						   					</c:forEach>
					   					</span>
						   			</p>
					   				<sec:authorize access="hasAnyRole('USER','HOST','ADMIN')">
				   					<sec:authentication property="principal.username" var="loginMember"/>
				   					<c:if test="${loginMember != null && loginMember eq space.memberEmail }">
				   						<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
					   				</c:if>
					   				</sec:authorize>
						   			<div class="reviewToggle">
							   			<div class="row reviewDetailBtn" style="cursor: pointer;">
								   			<div style="background-image: url(${pageContext.request.contextPath}/resources/upload/review/${review.image}); background-size: cover; width:180px; height: 150px;margin-left: 10px;"></div>
								   			<p style="position: absolute; margin:10px 85px 0 215px; overflow: hidden; text-overflow: ellipsis; width:60%; -webkit-box-orient: vertical;-webkit-line-clamp: 3;display: -webkit-box;">${ review.content }</p>
											<p style="margin:105px 0 0 25px; font-weight: 600;" class="detailBtn">더보기</p>
							   			</div>
							   			<div class="reviewSimpleBtn" style="cursor: pointer; display:none; height: 100%">
							   				<div class="reviewSimple">
									   			<p >${ review.content }</p>
												<p style="font-weight: 600;" class="simpleBtn">접기</p>
									   			<div style="background-image: url(${pageContext.request.contextPath}/resources/upload/review/${review.image});  width: 500px;height: 350px;background-size: cover; margin-bottom:30px;"></div>
							   				</div>
							   				<!-- 댓글 -->
							   				<div class="commentBox" style="background-color: #fafafa;  cursor:default; border: 1px solid #edeceb; padding-bottom: 30px; ">
					                         <div class="pl-5 pr-5 pt-4 commentBox">
					                         	<p class="commentBox"><i class="fa fa-comment mr-1 commentBox"></i>댓글</p>
												<c:choose>
													<c:when test="${ review.reviewComment != null }">
														<div class="modifyFrm">
															<p class="commentBox">${ review.reviewComment }</p>
															<button type="button" class="btn btn-secondary commentBox modifyBtn" style="margin-left: 95%;">수정</button>
														</div>
														<div class="row commentBox modifyDiv" style="height: 110px;">
															<input type="hidden" name="reviewNo" value="${ review.reviewNo }" />
								                         	<textarea class="ml-2 mr-1 mt-1 commentBox content" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px; width:90%">${ review.reviewComment }</textarea>
								                           	<button type="button" class="btn mt-1 commentBox insertComment" style="margin-bottom: 70px;height: 80px; border: 1px solid #dddddd;width: 70px;">수정</button>
							                         	</div>
													</c:when>
													<c:otherwise>
														<div class="row commentBox" style="height: 110px; ">
															<input type="hidden" name="reviewNo" value="${ review.reviewNo }" />
								                         	<textarea class="col ml-2 mr-1 mt-1 commentBox content" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px;"></textarea>
								                           	<button type="button" class="btn mt-1 commentBox insertComment"  style="margin-bottom: 70px;height: 80px; border: 1px solid #dddddd;width: 70px;">등록</button>
							                         	</div>
													</c:otherwise>
												</c:choose>
				                         		</div>
					                           </div>
							   				<!-- 댓글 끝 -->
							   			</div>
							   			
						   			</div>
						   		</div>
						   	</div>
							</c:when>
							<c:otherwise>
				   			<div class="review nullImg mb-4 pb-3" style="border-bottom: .5px solid #efefef ">
						   		<div class="desc nullImg" style="width: 100%;">
						   			<p>
						   				<span class="text-left">${ review.nickName }</span>
						   				<span class="text-right"><fmt:formatDate value="${review.enrollDate}" pattern="yyyy-MM-dd"/></span>
						   				<span>
						   					<c:forEach begin="1" end="${ review.starRating }">
							   					<i class="ion-ios-star"></i>
						   					</c:forEach>
					   					</span>
						   			</p>
				   					<sec:authorize access="hasAnyRole('USER','HOST','ADMIN')">
				   					<sec:authentication property="principal.username" var="loginMember"/>
				   					<c:if test="${loginMember != null && loginMember eq space.memberEmail }">
				   					<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
				   					</c:if>
				   					</sec:authorize>
						   			<div class="reviewToggle">
						   			<div class="row reviewDetailBtn" style="cursor: pointer;">
						   				<p style="position: absolute; margin:0 85px 0 15px; overflow: hidden; text-overflow: ellipsis; width:80%; -webkit-box-orient: vertical;-webkit-line-clamp: 3;display: -webkit-box;">${ review.content }</p>
										<p style="margin: 75px 0 0 15px; font-weight: 600;" class="detailBtn">더보기</p>
						   			</div>
						   			
						   			<div class="reviewSimpleBtn" style="cursor: pointer; display:none; height: 100%">
						   				<div class="reviewSimple">
							   				<p>${ review.content }</p>
											<p style="font-weight: 600;" class="simpleBtn">접기</p>
										</div>
										<!-- 댓글 -->
						   				<div class="commentBox" style="background-color: #fafafa;  cursor:default; border: 1px solid #edeceb; padding-bottom: 30px; ">
				                         <div class="pl-5 pr-5 pt-4 commentBox">
				                         	<p class="commentBox"><i class="fa fa-comment mr-1 commentBox"></i>댓글</p>
											<c:choose>
												<c:when test="${ review.reviewComment != null }">
													<div class="modifyFrm">
														<p class="commentBox">${ review.reviewComment }</p>
														<button type="button" class="btn btn-secondary commentBox modifyBtn" style="margin-left: 95%;">수정</button>
													</div>
													<div class="row commentBox modifyDiv" style="height: 110px; ">
														<input type="hidden" name="reviewNo" value="${ review.reviewNo }" />
							                         	<textarea class="ml-2 mr-1 mt-1 commentBox content" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px; width:90%">${ review.reviewComment }</textarea>
							                           	<button type="button" class="btn mt-1 commentBox insertComment" style="margin-bottom: 70px;height: 80px; border: 1px solid #dddddd;width: 70px;">수정</button>
						                         	</div>
												</c:when>
												<c:otherwise>
													<div class="row commentBox" style="height: 110px; ">
														<input type="hidden" name="reviewNo" value="${ review.reviewNo }" />
							                         	<textarea class="col ml-2 mr-1 mt-1 commentBox content" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px;"></textarea>
							                           	<button type="button" class="btn mt-1 commentBox insertComment" style="margin-bottom: 70px;height: 80px; border: 1px solid #dddddd;width: 70px;">등록</button>
						                         	</div>
												</c:otherwise>
											</c:choose>
			                         		</div>
				                           </div>
						   				<!-- 댓글 끝 -->
						   			</div>
						   			</div>
						   		</div>
						   	</div>
							</c:otherwise>
							</c:choose>
						 </c:forEach>	
						 <nav aria-label="Page navigation" style="display:inline text-align: center; margin-left: 45%; margin-top:50px;">
							<ul class="pagination" style="border:0; margin-right:10px;"> ${pageBar}</ul>
						</nav>
				   		</div>
                    </div>
                </div>
            </div>  
		<!-- 리뷰 끝 -->
    </div>
</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/jquery/jquery-3.2.1.min.js"></script>
<!-- Bootstrap popper Core JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/popper/popper.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/js/perfect-scrollbar.jquery.min.js"></script>
<!--Wave Effects -->
<script src="${ pageContext.request.contextPath }/resources/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${ pageContext.request.contextPath }/resources/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/js/custom.min.js"></script>
<!-- ============================================================== -->
<!-- This page plugins -->
<!-- ============================================================== -->
<!--morris JavaScript -->
<script>
/* 리뷰 디테일 호버 */
$(document).ready(function (){
	$(".reviewDetailBtn").mouseenter(function(){
		$(this).children(".detailBtn").css('text-decoration', 'underline');
	});
	$(".reviewDetailBtn").mouseleave(function(){
		$(".detailBtn").css('text-decoration', 'none');
	});
});
$(document).ready(function (){
	$(".reviewSimpleBtn").children(".reviewSimple").mouseenter(function(){
		$(this).children(".simpleBtn").css('text-decoration', 'underline');
	});
	$(".reviewSimpleBtn").children(".reviewSimple").mouseleave(function(){
		$(".simpleBtn").css('text-decoration', 'none');
	});
});
/* 리뷰 디테일 */
$(".reviewToggle").click(function(e){
	if($(e.target).hasClass("commentBox")) return;
	$(this).children(".reviewDetailBtn").toggle();
	$(this).children(".reviewSimpleBtn").toggle();
});
/*리뷰 댓글 등록*/
$(".insertComment").click(function(){
	let reviewNo = $(this).siblings('input').val();
	let content = $(this).siblings('.content').val();
	$.ajax({
		url : "${ pageContext.request.contextPath }/host/updateReviewComment.do",
		data : {
			reviewNo : reviewNo,
			content : content
		},
		dataType : "json",
		success : function(data){
			alert("댓글이 등록되었습니다!");
			location.reload();
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	}); 
	
});
//리뷰 수정
$(".modifyBtn").click(function(){
	$(this).parent(".modifyFrm").hide();
	$(this).parent("div").siblings(".modifyDiv").show();
});
//리뷰 모아보기
$("#selectId").change(function(){
	let option = $("#selectId").val();
	if(option == 1) $("#totalCommentFrm").submit();
	else $("#selectCommentFrm").submit();
}); 
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%-- 한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/hostpageMenu.jsp" />
<style>
.badge{
	font-size: 1em;
	margin: 20px;
	color: #a6e4d2;
}

 .spec{
	text-align: right;
	margin-right:20px;
} 
.card{
	border: none;
}

.qna-filter-container{
 	text-align: right;
 	width:99%;
 	margin-top: 10px;
}
p#qna-content > a{
   color: #343a40;
}
.btn-group-toggle{
	height: 30px;
    position: absolute;
    right: 85px;
}
/* .qSimpleBtn:hover{
   color: none;
   text-decoration: underline;
}

.qDetailBtn:hover{
	text-decoration: underline;
} */
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
                                <li class="breadcrumb-item active">최근 질문글</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- 공간 최근 게시물 -->
                <div class="ml-5 mr-5">
                       <div class="card-body-wrapper">
	                    <div class="card p-5">
                        <div id="qna-wrapper" class="row"> 
                         <div class="col-md-11">
                           
	                       <div class="col-md-10">
	                           <h5 class="card-title">최근 질문글</h5>
	                           <h6 class="card-subtitle">공간 페이지에 올라온 질문글을 확인하세요</h6>
	                         
	                       </div>
                    	     <div class="qna-filter-container">
								  <button id="show-unreplied" class="btn btn-secondary btn-sm" type="button" style="background-color:#00c89e;" onclick="unreplied();" value="${member.memberEmail}">
								  <i id="check-unreplied"></i>
								    ${member.nickName }님의 답변을 기다리는 질문
								  </button>
								  
                    		 </div>
                          <!-- 질문글 시작 -->
                          <div class="qna-container">
                          <hr />
                          <c:choose>
				          <c:when test="${ not empty list }">
                         <%-- <c:if test="${ not empty list }"> --%>
						<c:forEach items="${ list }" var="qna" varStatus="vs">
                          <div class="card" style="margin:20px 25px 20px 4px;">
				          <div class="col-md-12 d-flex">
				          	<div class="blog-entry justify-content-end">
				              <div class="text">
				                <span class="badge badge-secondary">${qna.name }</span>
				              <%--   <a href="blog-single.html" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/image_4.jpg');"> </a> --%>
				                  <div class="spec" style="letter-spacing:1px; font-size:13px;"><fmt:formatDate value="${ qna.date }" pattern="yyyy-MM-dd"/>
				                  <c:choose>
				                  <c:when test="${ qna.status == false }">
				                  <a class="meta-chat"><span class="fa fa-unlock" style="color:#FFC107;"></span>공개</a>
				                  </c:when>
				                  <c:otherwise>
				                  <a class="meta-chat"><span class="fa fa-lock" style="color:#20c997;"></span>비공개</a>
				                  </c:otherwise>
				                  </c:choose>
				                  </div>
								<div class="meta mb-3">
				                 
				                </div>
				                	              
				               
				                	<div class="qnaToggle">
							   			<div class="row qDetailBtn" style="cursor: pointer;">
							   				
							   				<p class="pl-5 pr-5" id="qna-content">
							                <c:set var="str" value="${qna.content }"/>
							                ${ fn:substring(str, 0, 40) }</p>
									   			<%-- <p style="position: absolute; margin:10px 85px 0 215px; overflow: hidden; 
									   			text-overflow: ellipsis; width:60%; -webkit-box-orient: vertical;-webkit-line-clamp: 3;
									   			display: -webkit-box;">${ qna.content }</p>  --%>
											<p style="margin:20px 30px; font-weight: 600;" class="detailBtn"><i class="fa fa-caret-down"></i>더보기</p>
							   			</div>
							   			<div class="qSimpleBtn" style="cursor: pointer; display:none; height: 100%">
							   				<div class="pl-5 pr-5 qSimple">
									   			<p >${ qna.content }</p>
												<p style="font-weight: 600;" class="simpleBtn"><i class="fa fa-caret-up"></i>접기</p>
									   			
							   				</div>
							   				<!-- 답변 -->
							   				<div class="commentBox" style="background-color: #fafafa;  cursor:default; border: 1px solid #edeceb; padding-bottom: 30px; margin-left:30px;">
					                         <div class="pl-5 pr-5 pt-4 commentBox">
					                         	<p class="commentBox"><i class="fa fa-comment mr-1 commentBox"></i>답변</p>
												<c:choose>
													<c:when test="${ qna.answer != null }">
														<div class="modifyFrm">
															<p class="pl-5 pr-5 commentBox">${ qna.answer }</p>
															<button type="button" class="btn btn-secondary commentBox modifyBtn" style="margin-left: 95%;">수정</button>
														</div>
														<div class="row commentBox modifyDiv" style="height: 110px;">
															<input type="hidden" name="reviewNo" value="${ qna.qnaNo }" />
								                         	<textarea class="ml-2 mr-1 mt-1 commentBox answer" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px; width:85%">${ qna.answer }</textarea>
								                           	<button type="button" class="btn mt-1 commentBox updateAnswer" style="margin-bottom: 70px;height: 80px; border: 1px solid #dddddd;width: 60px;">등록</button>
							                         	</div>
													</c:when>
													<c:otherwise>
														<div class="row commentBox" style="height: 110px; ">
															<input type="hidden" name="reviewNo" value="${ qna.qnaNo }" />
								                         	<textarea class="col ml-2 mr-1 mt-1 commentBox answer" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px;"></textarea>
								                           	<button type="button" class="btn mt-1 commentBox updateAnswer" style="margin-bottom: 70px;height: 80px; border: 1px solid #dddddd;width: 60px;">등록</button>
							                         	</div>
													</c:otherwise>
												</c:choose>
				                         		</div>
					                           </div>
							   				<!-- 답변 끝 -->
							   			</div>
							   			</div>
						   			</div>

				              </div>
				            </div>
				          </div>
				          <hr />
				        <!-- 질문글 끝 -->
				        </c:forEach>
                    	</c:when>
                    	<c:otherwise>
                    		<div style="text-align: center; width: 90%; padding:20px;">
									<span class="icon-folder" style="letter-spacing:1px;"> 등록된 질문글이 없습니다.</span>
								</div>
                    	</c:otherwise>
                    	</c:choose>
				         </div>
				        </div>
	                   </div>
	               </div>
	           </div>
           </div>
      </div>
    </div>
</div>
</div>
</div>

<!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  <script src="${pageContext.request.contextPath }/resources/js/aos.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/assets/node_modules/raphael/raphael-min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/morrisjs/morris.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/jquery-sparkline/jquery.sparkline.min.js"></script>
<!--c3 JavaScript -->

<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/d3/d3.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/c3-master/c3.min.js"></script>
<!-- Chart JS -->
  <script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/scrollax.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

<script>
/* 리뷰 디테일 호버 */
$(document).ready(function (){
	$(".qDetailBtn").mouseenter(function(){
		$(this).children(".qDetailBtn").css('text-decoration', 'underline');
	});
	$(".qDetailBtn").mouseleave(function(){
		$(".qDetailBtn").css('text-decoration', 'none');
	});
});
$(document).ready(function (){
	$(".qSimpleBtn").children(".qSimple").mouseenter(function(){
		$(this).children(".qSimpleBtn").css('text-decoration', 'underline');
	});
	$(".qSimpleBtn").children(".qSimple").mouseleave(function(){
		$(".qSimpleBtn").css('text-decoration', 'none');
	});
});
/* 질문글 디테일 */
$(".qnaToggle").click(function(e){
	if($(e.target).hasClass("commentBox")) return;
	$(this).children(".qDetailBtn").toggle();
	$(this).children(".qSimpleBtn").toggle();
});
/*질문글 답변 등록*/
$(".updateAnswer").click(function(){
	let qnaNo = $(this).siblings('input').val();
	let answer = $(this).siblings('.answer').val();
	$.ajax({
		url : "${pageContext.request.contextPath }/qna/updateAnswer.do",
		type : "POST",
		data : {
			qnaNo : qnaNo,
			answer : answer
		},
		dataType : "json",
		success : function(data){
			swal("댓글이 등록되었습니다!")
			.then((value) => {
				location.reload();
			});
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	}); 
	
});
//답변 수정
$(".modifyBtn").click(function(){
	$(this).parent(".modifyFrm").hide();
	$(this).parent("div").siblings(".modifyDiv").show();
});

//미답변 질문 ajax 요청
function unreplied(){
	location.href='${pageContext.request.contextPath}/host/unreplied.do';
};
</script>
</body>
</html>
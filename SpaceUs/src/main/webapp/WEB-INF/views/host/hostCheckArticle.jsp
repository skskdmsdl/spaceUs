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
.qna-filter-container{
 	text-align: right;
 	width:99%;
 	margin-top: 10px;
}
p#qna-content > a{
   color: #343a40;
}
p#qna-content > a:hover{
   color: none;
   text-decoration: underline;
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
	                           <h5 class="card-title">공간 리뷰</h5>
	                           <h6 class="card-subtitle">이용자들의 리뷰입니다</h6>
	                       </div>
                    	     <div class="qna-filter-container">
								  <button id="show-unreplied" class="btn btn-secondary btn-sm" type="button" onclick="unreplied();" value="${member.memberEmail}">
								  <i id="check-unreplied"></i>
								    ${member.nickName }님의 답변을 기다리는 질문
								  </button>
                    		 </div>
                          <!-- 질문글 시작 -->
                          <div class="qna-container">
                          <c:choose>
				          <c:when test="${ not empty list }">
                         <%-- <c:if test="${ not empty list }"> --%>
						<c:forEach items="${ list }" var="qna" varStatus="vs">
				          <div class="col-md-10 d-flex">
				          	<div class="blog-entry justify-content-end">
				              <div class="text">
				                <h3 class="badge badge-secondary"><a href="${pageContext.request.contextPath}/space/spacedetail.do?=${qna.spaceNo}">${qna.name }</a></h3>
				              <%--   <a href="blog-single.html" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/image_4.jpg');"> </a> --%>
					              
				                <p id="qna-content"><a href="${pageContext.request.contextPath}/space/qna.do?no=${qna.qnaNo}">
				                <c:set var="str" value="${qna.content }"/>
				                ${ fn:substring(str, 0, 100) }</a></p>
				                	<div class="qnaToggle">
							   			<div class="row reviewDetailBtn" style="cursor: pointer;">
								   			<%-- <p style="position: absolute; margin:10px 85px 0 215px; overflow: hidden; text-overflow: ellipsis; width:60%; -webkit-box-orient: vertical;-webkit-line-clamp: 3;display: -webkit-box;">${ qna.content }</p> --%>
											<p style="margin:105px 0 0 25px; font-weight: 600;" class="detailBtn">더보기</p>
							   			</div>
							   			<div class="reviewSimpleBtn" style="cursor: pointer; display:none; height: 100%">
							   				<div class="reviewSimple">
									   			<p >${ qna.content }</p>
												<p style="font-weight: 600;" class="simpleBtn">접기</p>
									   			
							   				</div>
							   				<!-- 답변 -->
							   				<div class="commentBox" style="background-color: #fafafa;  cursor:default; border: 1px solid #edeceb; padding-bottom: 30px; ">
					                         <div class="pl-5 pr-5 pt-4 commentBox">
					                         	<p class="commentBox"><i class="fa fa-comment mr-1 commentBox"></i>답변</p>
												<c:choose>
													<c:when test="${ qna.answer != null }">
														<div class="modifyFrm">
															<p class="commentBox">${ qna.answer }</p>
															<button type="button" class="btn btn-secondary commentBox modifyBtn" style="margin-left: 95%;">수정</button>
														</div>
														<div class="row commentBox modifyDiv" style="height: 110px;">
															<input type="hidden" name="reviewNo" value="${ qna.qnaNo }" />
								                         	<textarea class="ml-2 mr-1 mt-1 commentBox content" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px; width:90%">${ qna.answer }</textarea>
								                           	<button type="button" class="btn mt-1 commentBox insertAnswer" style="margin-bottom: 70px;height: 80px; border: 1px solid #dddddd;width: 70px;">수정</button>
							                         	</div>
													</c:when>
													<c:otherwise>
														<div class="row commentBox" style="height: 110px; ">
															<input type="hidden" name="reviewNo" value="${ qna.qnaNo }" />
								                         	<textarea class="col ml-2 mr-1 mt-1 commentBox content" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px;"></textarea>
								                           	<button type="button" class="btn mt-1 commentBox insertAnswer" style="margin-bottom: 70px;height: 80px; border: 1px solid #dddddd;width: 70px;">등록</button>
							                         	</div>
													</c:otherwise>
												</c:choose>
				                         		</div>
					                           </div>
							   				<!-- 답변 끝 -->
							   			</div>
							   			
						   			</div>
				                <div class="meta mb-3">
				                 
				                  <div style="letter-spacing:1px;"><fmt:formatDate value="${ qna.date }" pattern="yyyy년 MM월 dd일"/></div>
				                  <div>
				                  <c:choose>
				                  <c:when test="${ qna.status == false }">
				                  <a class="meta-chat"><span class="fa fa-unlock"></span>공개</a>
				                  </c:when>
				                  <c:otherwise>
				                  <a class="meta-chat"><span class="fa fa-lock"></span>비공개</a>
				                  </c:otherwise>
				                  </c:choose>
				                  </div>
				                </div>

				              </div>
				            </div>
				          </div>
				        <!-- 질문글 끝 -->
				        </c:forEach>
                    	</c:when>
                    	<c:otherwise>
                    		<div style="text-align: center; width: 90%; padding:20px;">
									<span class="icon-folder" style="letter-spacing:1px;">등록된 질문글이 없습니다.</span>
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
/* 질문글 디테일 */
$(".qnaToggle").click(function(e){
	if($(e.target).hasClass("commentBox")) return;
	$(this).children(".reviewDetailBtn").toggle();
	$(this).children(".reviewSimpleBtn").toggle();
});
/*질문글 답변 등록*/
$(".insertAnswer").click(function(){
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
function unreplied(){
	var hostId = $("#show-unreplied").val();
	
	console.log(hostId);
	
    $.ajax({
        type: "GET",
		url : "${pageContext.request.contextPath}/host/unreplied.do",
		data :  {
			hostId : hostId
		},
		dataType: "json",
		success: function(data){
			 //console.log(data);
			 console.log($("#check-unreplied").attr('class'));
			 
			 if($("#check-unreplied").attr('class')=="fa fa-check") {
				 //button 안의 i class 속성
				//눌려진 상태라면 추가된 class 속성을 제거한다.
				//css변경
					$("#check-unreplied").removeClass("fa fa-check");
					$("#show-unreplied").css('background-color','#6c757d');
					location.href="${pageContext.request.contextPath}/host/hostCheckArticle.do";
					
			 }else{
				 	$("div.qna-container").empty();
					 //미답변 질문글 버튼이 눌려진 상태가 아닌 경우 class 속성 추가
					 //css변경 
					 $("#check-unreplied").addClass("fa fa-check");
					 $("#show-unreplied").css('background-color','#20c997');
			 
				 $.each(data, function(i, item){
				 
					 var html="";
	
						 
					 if(data!=null){
						
						 var date = new Date(item.date);
						 /**
						  *  yyyy년 MM 월 dd일 포맷으로 반환
						  */
						 function getFormatDate(date){
						     var year = date.getFullYear();              //yyyy
						     var month = (1 + date.getMonth());          //M
						     month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
						     var day = date.getDate();                   //d
						     day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
							 //var hh = date.getHours();
							 //hh = hh>=10 ? hh : '0' + hh;
							 //var mm = date.getMinutes();	
								
						     return ' '+year + '년 ' + month + '월 ' + day + '일 ';       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
						 }
						 
						 html += "<div class=\"qna-container_\">";
				         html += "<div class=\"col-md-10 d-flex\">"; 
			          	 html +="<div class=\"blog-entry justify-content-end\">";
			          	 html +="<div class=\"text\">"; 
			          	 html +="<h3 class=\"badge badge-secondary\"><a href=\"${pageContext.request.contextPath}/space/spacedetail.do?"+item.spaceNo;
					     html +="\">"+item.name+"</a></h3>";
					     html +="<p id=\"qna-content\"><a href=\"${pageContext.request.contextPath}/space/qna.do?no="+item.qnaNo+"\">";
					     html += (item.content).substring(0,100);
				         html +="</a></p>";
					     html +="<div class=\"meta mb-3\">";
					     //html +="<div class=\"badge badge-secondary\">";
					     //html +=""+item.name+"</div>";
					     html +="<div> "+getFormatDate(date)+"</div>";
					     html +="<div>";
							
						if(item.status==false){
		             		    html+="<a class=\"meta-chat\"><span class=\"fa fa-unlock\"></span>공개</a></div>";
							}else{
							    html+="<a class=\"meta-chat\"><span class=\"fa fa-lock\"></span>비공개</a></div>";}
				    
	                html += "</div></div></div></div></div>";
					 } else {
						//html += "<div class=\"qna-container_\">";
						 //html+= "답변을 기다리는 질문글이 없습니다.";
						//html += "<div style='text-align: center; width: 90%; padding:20px;'><span class='icon-folder' style='letter-spacing:1px;'>답변을 기다리는 질문글이 없습니다.</span></div>";										
						//html += "</div>";
						
						 }
					console.log(html);
		            $(".qna-container").append(html);                    
				 });
					 				
				 }

			 
			},
		error: function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
			}
     });
};
</script>
</body>
</html>
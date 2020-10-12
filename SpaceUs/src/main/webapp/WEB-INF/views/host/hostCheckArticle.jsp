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
                                <li class="breadcrumb-item active">공간 정보</li>
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
                           
                             <ul class="nav nav-tabs">
                             	<li class="nav-item"><a class="nav-link active" href="#">최근 질문 게시글</a></li>
                             	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/host/hostCheckReview.do">최근 리뷰 게시글</a></li>
                             </ul>
	                    
	                  
                    	     <div class="qna-filter-container">
								  <button id="show-unreplied" class="btn btn-secondary btn-sm" type="button" onclick="unreplied();" value="${member.nickName}">
								  <i id="check-unreplied"></i>
								    ${member.nickName }님의 답변을 기다리는 질문
								  </button>
                    		 </div>
                          <!-- 질문글 시작 -->
                          <div class="qna-container">
                         <c:if test="${ not empty list }">
						<c:forEach items="${ list }" var="qna" varStatus="vs">
				          <div class="col-md-10 d-flex">
				          	<div class="blog-entry justify-content-end">
				              <div class="text">
				                <h3 class="heading"><a href="${pageContext.request.contextPath}/space/qna.do?no=${qna.qnaNo}">${ qna.qnaNo }</a></h3>
				              <%--   <a href="blog-single.html" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/image_4.jpg');"> </a> --%>
					              
				                <p id="qna-content"><a href="${pageContext.request.contextPath}/space/qna.do?no=${qna.qnaNo}">
				                <c:set var="str" value="${qna.content }"/>
				                ${ fn:substring(str, 0, 100) }</a></p>
				                <div class="meta mb-3">
				                  <div class="badge badge-secondary">${ qna.name }</div>
				                  <div style="letter-spacing:1px;"><fmt:formatDate value="${ qna.date }" pattern="yyyy년 MM월 dd일 hh:mm"/></div>
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
                    	</c:if> 
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
			 console.log(data);
			 console.log($("#check-unreplied").attr('class'));
			 
			 if($("#check-unreplied").attr('class')=="fa fa-check") {
				//눌려진 상태라면 추가된 class 속성을 제거한다.
				//css변경
					$("#check-unreplied").removeClass("fa fa-check");
					$("#show-unreplied").css('background-color','#6c757d');
					location.href="${pageContext.request.contextPath}/host/hostCheckArticle.do";
					
			 }else{
				 $("div.qna-container").empty();
			 
				 $.each(data, function(i, item){
				 
					 var html="";
	
					 //미답변 질문글 버튼이 눌려진 상태가 아닌 경우 class 속성 추가
					 //css변경 
					 $("#check-unreplied").addClass("fa fa-check");
					 $("#show-unreplied").css('background-color','#20c997');
						 
					 if(data!=null){
						 var date = new Date(item.date);
						 /**
						  *  yyyy년 MM 월 dd일 hh:mm 포맷으로 반환
						  */
						 function getFormatDate(date){
						     var year = date.getFullYear();              //yyyy
						     var month = (1 + date.getMonth());          //M
						     month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
						     var day = date.getDate();                   //d
						     day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
							 var hh = date.getHours();
							 hh = hh>=10 ? hh : '0' + hh;
							 var mm = date.getMinutes();	
								
						     return ' '+year + '년 ' + month + '월 ' + day + '일 ' + hh + ':' + mm;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
						 }
						 
						 html += "<div class=\"qna-container_\">";
				         html += "<div class=\"col-md-10 d-flex\">"; 
			          	 html +="<div class=\"blog-entry justify-content-end\">";
			          	 html +="<div class=\"text\">"; 
			          	 html +="<h3 class=\"heading\"><a href=\"${pageContext.request.contextPath}/space/qna.do?no="+item.qnaNo;
					     html +="\">"+item.qnaNo+"</a></h3>";
					     html +="<p id=\"qna-content\"><a href=\"${pageContext.request.contextPath}/space/qna.do?no="+item.qnaNo+"\">";
					     html += (item.content).substring(0,100);
				         html +="</a></p>";
					     html +="<div class=\"meta mb-3\">";
					     html +="<div class=\"badge badge-secondary\">";
					     html +=""+item.name+"</div>";
					     html +="<div> "+getFormatDate(date)+"</div>";
					     html +="<div>";
							
						if(item.status==false){
		             		    html+="<a class=\"meta-chat\"><span class=\"fa fa-unlock\"></span>공개</a></div>";
							}else{
							    html+="<a class=\"meta-chat\"><span class=\"fa fa-lock\"></span>비공개</a></div>";}
				    
	                html += "</div></div></div></div></div>";
					 } else {
						html += "답변을 기다리는 최근 질문이 없습니다.";										
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
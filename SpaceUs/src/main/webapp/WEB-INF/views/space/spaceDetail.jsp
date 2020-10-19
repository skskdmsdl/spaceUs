<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="https://cdn.materialdesignicons.com/5.5.55/css/materialdesignicons.min.css" rel="stylesheet">
<link
	href="https://cdn.materialdesignicons.com/5.5.55/css/materialdesignicons.min.css"
	rel="stylesheet">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f812560fa3200866e643713203eb962f&libraries=services"></script>
<style>
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 30%;
	width: auto;
	padding: 30px;
	color: white; ! important;
	font-weight: bold;
	font-size: 30px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
}
.next {
	margin-right: 16px;
	right: 0;
	border-radius: 3px 0 0 3px;
}
.prev:hover, .next:hover {opacity: 0.3;}
.popover-body img {width: 30px;	margin-right: 10px;}
.popover-body img:hover {cursor: pointer;}
.fa-share-square, .fa-heart {
	color: #333;
	font-size: 25px;
	cursor:pointer;
}
.fa-eye{color: #333; margin-right:3px;}
.fab {margin-right: 5px;}
a:hover {opacity: 0.3; color: black;}
.fade1 {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}
@
-webkit-keyframes fade1 {
	from {opacity: .4}
to {opacity: 1}
}
@
keyframes fade1 {
	from {opacity: .4}
to {opacity: 1}
}
@media only screen and (max-width: 300px) {
	.prev, .next, .text {font-size: 11px}
}
/* 리뷰 */
.btn-group-toggle {
	height: 30px;
	position: absolute;
	right: 85px;
}
.reviewLabel {font-size: 11px;}


</style>
<script>

var url = $(location).attr('href');

$(function(){

	/* $(".cs-map").removeAttr("style"); */
	$("#url-input").attr('value', url);
	
    $("[data-toggle=popover]").popover({
        html : true,
        content: function() {
          var content = $(this).attr("data-popover-content");
          return $(content).children(".popover-body").html();
        },
        title: function() {
          var title = $(this).attr("data-popover-content");
          return $(title).children(".popover-heading").html();
        }
    });

    $("#heart-a").click(function(){

		var $heart = $("#heart-a");
    	if($heart.html().indexOf("far fa-heart") != -1 ) {
    		$heart.html("<i class='fas fa-heart' style='color:#ffc107; margin:2px;'></i>");
	   		 $.ajax({
			        type: "POST",
					url : "${pageContext.request.contextPath}/space/heart.do",
					//dataType: "JSON",
					data :   {
						spaceNo : "${space.spaceNo}",
						email : "${loginMember.principal.memberEmail}"},
					//contentType:"application/json;charset=UTF-8"
					success: function(data){
						console.log(data);
						readLikeCnt();
					},
					error: function(xhr, status, err){
						console.log("위시 추가 실패", xhr, status, err);
						}
					
			});
    	}
    	else {
    		//$heart.html("<i class='far fa-heart'></i>");
    		 $.ajax({
			        type: "POST",
					url : "${pageContext.request.contextPath}/space/cancelHeart.do",
					data :  {
						spaceNo : "${space.spaceNo}",
						email : "${loginMember.principal.memberEmail}"},
						//contentType:"application/json;charset=UTF-8"
					success: function(data){
						readLikeCnt();
						$heart.html("<i class='far fa-heart'></i>");
					},
					error: function(xhr, status, err){
						console.log("위시 삭제 실패", xhr, status, err);
						}
    	   			});	
    		}
	});
    
    readLikeCnt(); // 처음 시작했을 때 실행되도록 해당 함수 호출
});

	// 공간 좋아요 갯수 읽어오고 이전에 위시리스트에 추가했는지 검사
    function readLikeCnt() {
		$.ajax({
			url: "${pageContext.request.contextPath}/space/readLikeCnt.do",
            type: "GET",
            data: {
                spaceNo: "${space.spaceNo}",
                email: "${loginMember.principal.memberEmail}"
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
            	$(".like-count").html(data.cnt);
            	if(data.status=='liked'){
						//멤버 이메일로 좋아요 검색 후 이미 좋아요한 경우 
						$("#heart-a").html("<i class='fas fa-heart' style='color:#ffc107; margin:2px;'></i>");		       			
						console.log(data.status);
                	}
            },
			error: function(xhr, status, err){
				console.log("좋아요수 읽어오기 실패", xhr, status, err);
				}
		});
    };

    
function urlcopy(){
	var tempElem = document.createElement('textarea');

	tempElem.value = url;  
	document.body.appendChild(tempElem);
	tempElem.select();
	document.execCommand("copy");
	document.body.removeChild(tempElem);

	alert("url 복사완료!");
}

//트위터 공유
function twitterShare() {
	window.open("https://twitter.com/intent/tweet"
			+"?via=SpaceUs"
			+"&text="+encodeURIComponent( "SpaceUs :: ${ space.spaceName }\n" )
			+"&url="+encodeURIComponent(window.location.href)
			, "_blank"
			, 'width=600,height=400,resizable=yes,scrollbars=yes'
	);
}


//네이버 공유
function naverShare() {
	var url = encodeURI(encodeURIComponent(window.location.href));
    var title = encodeURI("${ space.spaceName }");
    var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + title;

    window.open(shareURL, "_blank", 'width=600,height=400,resizable=yes,scrollbars=yes');
 }

</script>

<section class="ftco-section ftco-property-details">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="property-details">
					<c:if test="${ not empty space.attachList}">
						<c:forEach items="${ space.attachList }" var="attach">
								<div class="mySlides fade1">
									<div class="img"
										style="background-image: url(${pageContext.request.contextPath }/resources/upload/space/${attach.rname });"></div>
								</div>
						</c:forEach>
					</c:if>
<%-- 					<div class="mySlides fade1">
						<div class="img"
							style="background-image: url(${pageContext.request.contextPath }/resources/images/work-1.jpg);"></div>
					</div>
					<div class="mySlides fade1">
						<div class="img"
							style="background-image: url(${pageContext.request.contextPath }/resources/images/work-2.jpg);"></div>
					</div> --%>
					<i class="prev fas fa-chevron-left fa-2x" onclick="plusSlides(-1)"></i>
					<i class="next fas fa-chevron-right fa-2x" onclick="plusSlides(1)"></i>
					<div class="text text-center">
						<div style="text-align: right; padding-right: 5px">
							<i class="fa fa-eye fa-2x" style="color: black;font-size: x-large;"></i>
							<c:if test="${ empty space.views }">
								<span class="mr-2">0</span>
							</c:if>
							<c:if test="${ not empty space.views }">
								<span class="mr-2">${ space.views }</span>
							</c:if>
							<c:choose>
							<c:when test="${ loginMember.principal.memberEmail != null }">
							<a href=javascript:; id="heart-a"><i id="addLike" class="far fa-heart" style="margin:2px;"></i></a>
							<span class="like-count"></span>
							</c:when>
							<c:otherwise>
							<i id="likeLogin" class="far fa-heart" style="margin:2px;"></i>
							<span class="like-count"></span>
							</c:otherwise>
							</c:choose>
							&emsp; <%-- <a href="javascript:;" id="kakao-link-btn"> <img
								src="${pageContext.request.contextPath }/resources/images/icons/kakao-icon.png"
								width="30px" />
							</a> --%>
							<!-- 공유하기 팝오버 시작-->
							<!--  <a href=javascript:; data-toggle="popover" data-trigger="focus"
								data-placement="bottom" tabindex="0" title="공유하기"
								data-html="true" data-popover-content="#a1"> <i
								class="far fa-share-square"></i>
							</a> -->
							<i class="far fa-share-square"></i>
							<div class="d-none" id="a1" style="padding:5px; font-size: 16px; border:1px solid #efefef; right: 140px;top: 420px;position: absolute; z-index: 10;background-color: white; width:250px; text-align: center; border-radius: 5px;" >
								<p style="border-bottom:1px solid #efefef; padding:5px;">공유하기</p>
								<div class="popover-body">
									<img src="${pageContext.request.contextPath }/resources/images/icons/kakao-icon.png" id="kakao-link-btn"/> 
									<img src="${pageContext.request.contextPath }/resources/images/icons/twitter-icon.png" onclick="twitterShare();" />
									<img src="${pageContext.request.contextPath }/resources/images/icons/naver-icon.jpg" onclick="naverShare();" />
									<input class="input-group-text w-100 mt-4 mb-2" type="text" id="url-input">
									<button class="btn btn-primary w-100" id="url-btn" onclick="urlcopy();">URL 복사</button>
								</div>
							</div>
							<!-- 공유하기 팝오버 끝-->
							<!-- 예약버튼 -->
							<input type="hidden" name="memberId" id="memberId" value="${loginMember.principal.memberEmail}" />
							<input type="submit" onclick="rvSubmit();" value="예약하기"
								class="btn py-3 px-5 btn-primary font-bold" style="font-size:16px;margin-left: 70px"> 
							<form id="reserveFrm">
								<input type="hidden" name="spaceNo" value="${ space.spaceNo }" />
							</form>
						</div>
						<span class="subheading"> ${ cateName} </span>
						<h2>${ space.spaceName }</h2>
						<br /> <span class="subheading">
							<div class="tagcloud">
								<c:forEach items="${ tag }" var="tag">
									<a href="#" class="tag-cloud-link">${ tag.tag }</a>
								</c:forEach>
							</div>
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 세부카테고리 시작 -->
		<div class="row">
			<div class="col-md-12 pills">
				<div class="bd-example bd-example-tabs">
					<div class="d-flex justify-content-center">
						<ul class="nav nav-pills mb-3" id="detail-tab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="detail-description-tab" data-toggle="pill"
								href="#detail-description" role="tab"
								aria-controls="detail-description" aria-expanded="true">공간설명</a>
							</li>
<!-- 							<li class="nav-item"><a class="nav-link active"
								id="detail-description-tab" data-toggle="pill"
								href="#detail-description" role="tab"
								aria-controls="detail-description" aria-expanded="true">공간설명</a>
							</li> -->
							<li class="nav-item"><a class="nav-link" id="detail-qna-tab"
								data-toggle="pill" href="#detail-qna" role="tab"
								aria-controls="detail-qna" aria-expanded="true">Q&A</a></li>
							<li class="nav-item"><a class="nav-link"
								id="detail-review-tab" data-toggle="pill" href="#detail-review"
								role="tab" aria-controls="detail-review" aria-expanded="true">리뷰</a>
							</li>

						</ul>
					</div>
					<!-- 세부카테고리 끝-->

					<div class="tab-content" id="detail-tabContent">
						<!-- contact 시작 -->
						<div class="tab-pane fade show active" id="detail-description" role="tabpanel"
							aria-labelledby="detail-manufacturer-tab" style="padding-top: 50px;">
							<div class="row pb-5" style="border-bottom: 1px solid #ddd;">
								<c:forEach items="${optionList}" var="info" varStatus="vs">
								<div class="col-md-4">
									<ul class="features">
										<li class="check"><span class="ion-ios-checkmark"></span>${ info.optionName }</li>
									</ul>
								</div>
								</c:forEach>
							</div>	
							<!-- 공간설명 시작-->
							<div class="col-11" style="margin-bottom:70px; padding-left:80px;">
								<p style="font-size: 16px; min-height:300px; padding-top: 50px; line-height: 30px;">
									${ space.content } <br /> </p>
							</div>
							<!-- 공간위치 -->	
							<div class="row" style="margin-left: 5em;">
								<div id="kakaomap" style="width:450px;height:400px; "></div>
								<div class="contact-info" style="padding-left: 70px;">
									<div class="ci-item">
										<div class="ci-icon">
											<i class="fa fa-map-marker"></i>
										</div>
										<div class="ci-text">
											<h5>주소</h5>
											<p>${ space.address }</p>
										</div>
									</div>
									<div class="ci-item">
										<div class="ci-icon">
											<i class="fa fa-mobile"></i>
										</div>
										<div class="ci-text">
											<h5>문의전화</h5>
											<ul>
												<li>${ space.spacePhone }</li>
											</ul>
										</div>
									</div>
									<div class="ci-item">
										<div class="ci-icon">
											<i class="fa fa-headphones"></i>
										</div>
										<div class="ci-text">
											<h5>이메일주소</h5>
											<p>${space.memberEmail }</p>
										</div>
									</div>
									
										
								</div>
							</div>
						</div>
						<!-- contact 끝 -->
<input type="hidden" id="spaceCon" value="${ space.content }" />
<input type="hidden" id="spaceAddr" value="${ space.address }" />
<input type="hidden" id="spaceTitle" value="${ space.spaceName }" />
						
						

<div class="tab-pane fade" id="detail-qna" role="tabpanel" aria-labelledby="detail-qna-tab">
     <div class="row mt-5">
   		<div class="col-md-10" style="margin: 0 auto;">
   			<h3 class="head fa fa-pencil"> ${qnaTotal }개의 질문글</h3>
   				
			 	<!-- 질문글 등록 모달창 -->
				<sec:authorize access="hasAnyRole('USER','HOST')"> 
				
				<!-- 질문글쓰기 버튼 -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#qnaModal" data-whatever="@fat" style="float: right; margin-right: 70px; letter-spacing:1px; font-weight:bold; font-size:1em;">질문글 작성</button>
								
				<div class="modal fade" id="qnaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title  fa fa-pencil" id="exampleModalLabel" style="letter-spacing:1px; font-weight:bold;">질문글 작성</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      	<form id="ask-question">
				      
				          <div class="form-group">
				            <label for="recipient-name" class="col-form-label">글쓴이</label>
				            <input type="text" class="form-control" name ="name" id="qna-name" value="${loginMember.principal.nickName }" placeholder="${loginMember.principal.nickName }" readonly>
				           
				          </div>
				          <div class="form-group">
				            <label for="message-text" class="col-form-label">내용</label>
				            <textarea class="form-control" id="message-text" name="content" style="height: 400px;" ></textarea>
				          </div>
				            <div class="form-group">
				            <label for="qna-status" >비밀글</label>
				            <input type="checkbox" name = "status" class="form-control" style="width: 27px; height: 24px;" id="qna-status" value="false" onClick="onCheck();">
				          </div>
		   				 	<input type="hidden" name = "email" value="${loginMember.principal.memberEmail }" />
		   				 	<input type="hidden" name = "spaceNo" value="${ space.spaceNo }" />
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin-right:10px; letter-spacing: 2px;">닫기</button>
		   			  <input class="btn btn-primary" value = "전송" type="submit" onclick="ask();" 
		   					style="float:right; margin-right:10px; letter-spacing: 2px; ">
				        
				      </div>
				    </div>
				  </div>
				</div>
				</sec:authorize>
				<!-- 질문글 등록 모달창 끝-->
				
<!-- 				<div id="dialog">
					<p>질문글을 삭제하시겠습니까?</p>
				</div> -->
				
				<!-- 답변 모달창-->
				<sec:authorize access="hasRole('HOST')">
				<div class="modal fade" id="answerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title  fa fa-pencil" id="exampleModalLabel" style="letter-spacing:1px; font-weight:bold;">답변 작성</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      	<form id="answerFrm" action="${pageContext.request.contextPath }/qna/sendAnswer.do">
				      
				          <div class="form-group">
				            <label for="recipient-name" class="col-form-label">호스트</label>
				            <input type="text" class="form-control" value="${loginMember.principal.nickName }" placeholder="${loginMember.principal.nickName }" readonly>
				           
				          </div>
				          <div class="form-group">
				            <label for="answer-content" class="col-form-label">내용</label>
				            <textarea class="form-control" id="answer-content" name="answer" style="height: 400px;" ></textarea>
				          </div>
				           	<input type="hidden" name = "qnaNo" id="qnaNo" />
		   				 	<input type="hidden" name = "spaceNo" value="${ space.spaceNo }" /> 
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin-right:10px; letter-spacing: 2px;">닫기</button>
		   			  <input class="btn btn-primary" value = "전송" type="submit" onclick="sendAnswer();" 
		   					style="float:right; margin-right:10px; letter-spacing: 2px; ">
				        
				      </div>
				    </div>
				  </div>
				</div>
				</sec:authorize>
				<!-- 질문글 답변 모달창 끝 -->
					<!-- 질문글 수정 모달창 -->			
				 <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title  fa fa-pencil" id="exampleModalLabel" style="letter-spacing:1px; font-weight:bold;">질문글 수정</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      	<form id="modifyFrm">
				      
				          <div class="form-group">
				            <label for="recipient-name" class="col-form-label">글쓴이</label>
				            <input type="text" class="form-control" name ="name" id="modify-name" value="${loginMember.principal.nickName }" placeholder="${loginMember.principal.nickName }" readonly>
				           
				          </div>
				          <div class="form-group">
				            <label for="message-text" class="col-form-label">내용</label>
				            <textarea class="form-control" id="modify-text" name="content" style="height: 400px;" ></textarea>
				          </div>
				            <div class="form-group">
				            <label for="qna-status" >비밀글</label>
				            <input type="checkbox" name = "status" class="form-control" style="width: 27px; height: 24px;" id="modify-status" value="false" onClick="modifyCheck();">
				          </div>
		   				 	<input type="hidden" name = "qnaNo" id="modifyNo" value="" />
		   				 	<input type="hidden" name = "spaceNo" value="${ space.spaceNo }" />
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin-right:10px; letter-spacing: 2px;">닫기</button>
		   			  <input class="btn btn-primary" value = "전송" type="submit" onclick="modifyBtn();" 
		   					style="float:right; margin-right:10px; letter-spacing: 2px; ">
				        
				      </div>
				    </div>
				  </div>
				</div>	 
				<!-- 질문글 삭제 Modal -->
				<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <h5 class="modal-title" id="deleteModalLabel">질문글 삭제</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true"></span>
				        </button>
				      </div>
				      
				    <!-- _csrf 인증 토큰 발행 -->
				    <form:form 
				    	action="${pageContext.request.contextPath }/qna/deleteQuestion.do" 
				    	method="POST">
				      <div class="modal-body">
				      	<span>질문글을 삭제하시겠습니까?</span>
				        <input type="hidden" class="form-control" 
				        				name="spaceNo" value="${space.spaceNo }" />
				        <br />
						 <input type="hidden" id="deleteNo" class="form-control" 
				        				name="qnaNo" />        
				      </div>
				      
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-outline-success deleteQ">삭제</button>
				        <button type="button" class="btn btn-outline-success" data-dismiss="modal">취소</button>
				      </div>
				    </form:form>
				    </div>
				  </div>
				</div>
				
		 	<!-- 질문글 시작 -->
		 	<c:if test="${ not empty qlist }">
			<c:forEach items="${ qlist }" var="qna" varStatus="vs">
			<div class="review d-flex">
		   		<div class="desc" style=" padding:5px;">
		   			<h4>
		   			<span class="text-left badge" style="font-size: 20px;">Q.</span>
		   			</h4>
		   			<h4>
		   				<span class="text-left badge mb-3" style="padding-left:20px;">${ qna.name}</span>
		   				<span class="text-right pr-2"><fmt:formatDate value="${ qna.date}" pattern="yyyy-MM-dd"/></span>
		   			</h4>
		   			<c:choose>
		   				<c:when test="${qna.status eq false}">
			   			 			<!-- <div style="margin-right:15px;"> -->
   											<div style="margin-right:15px;">
						   			   		 <p style="padding:0 20px; text-align:justify;">${qna.content }</p>
						   			    	</div>
   										<!-- 질문 작성자일 때 수정삭제 가능 -->
			   			 				<sec:authorize access="hasAnyRole('HOST', 'USER')">
   										<sec:authentication property="principal.username" var="loginMember"/>
   											<c:if test="${loginMember != null && loginMember eq qna.email }">
   												
   											
   												<button type="button" class="btn btn-secondary modify" data-toggle="modal" data-target="#modifyModal" data-whatever="@fat" 
						   						style="float: right; margin-right: 10px; margin-bottom:7px; letter-spacing:1px; color:#a6e4d2; font-weight:bold; font-size:13px;" onclick="popModify();" 
						   							value="${qna.qnaNo }">수정</button>
						   						
   												<button type="button" class="btn btn-secondary"
						   						style="float: right; margin-right: 10px; margin-bottom:7px; letter-spacing:1px; color:#a6e4d2; font-weight:bold; font-size:13px;" onclick="deleteBtn('${qna.qnaNo }');" 
						   							value="${qna.qnaNo }">삭제</button>
						   							
   											
   											</c:if>
   										 </sec:authorize> 
					   			    <!-- </div> -->
		   			 	</c:when>
		   			 	
		   			 	<c:otherwise>
		   			 		<p style="padding-left:20px; text-align:justify; color: #a1beb6;"><i class="fa fa-lock">비공개</i></p>
		   			 		
		   			 		<!-- 비공개 질문은 호스트와 질문 작성자, 관리자가 조회 가능 -->
		   			 		<sec:authorize access="hasAnyRole('HOST', 'USER')">
   							<sec:authentication property="principal.username" var="loginMember"/>
   								
								<c:if test="${loginMember != null && loginMember eq qna.email && loginMember ne space.memberEmail }">
										<div style="margin-right:15px;">
					   			   		 <p style="padding:0 20px; text-align:justify;">${qna.content }</p>
					   			    	</div>
 												<button type="button" class="btn btn-secondary modify" data-toggle="modal" data-target="#modifyModal" data-whatever="@fat" 
				   						style="float: right; margin-right: 10px; margin-bottom:7px; letter-spacing:1px; color:#a6e4d2; font-weight:bold; font-size:13px;" onclick="popModify();" 
				   							value="${qna.qnaNo }">수정</button>
 												<button type="button" class="btn btn-secondary" 
				   						style="float: right; margin-right: 10px; margin-bottom:7px; letter-spacing:1px; color:#a6e4d2; font-weight:bold; font-size:13px;" onclick="deleteBtn('${qna.qnaNo }');" 
				   							value="${qna.qnaNo }">삭제</button>
 												
								</c:if>
   								<c:if test="${loginMember != null && loginMember eq space.memberEmail }">
			   			 			<div style="margin-right:15px;">
					   			   		 <p style="padding:0 20px; text-align:justify;">${qna.content }</p>
					   			    </div>
			   			 			
			   			 		</c:if>
		   			 		</sec:authorize>
		   			 		<sec:authorize access="hasRole('ADMIN')">
			   			 			<div style="margin-right:15px;">
					   			   		 <p style="padding:0 20px; text-align:justify;">${qna.content }</p>
					   			    </div>
		   			 		</sec:authorize>
		   			 	</c:otherwise>
		   			</c:choose>
		   			
		   			<!-- 호스트 권한을 갖고 있고 해당 공간의 호스트의 메일과 로그인 유저의 메일이 동일하면 답변하기 버튼 생성 -->
	   				<sec:authorize access="hasRole('HOST')">
   					<sec:authentication property="principal.username" var="loginMember"/>
   					<c:if test="${loginMember != null && loginMember eq space.memberEmail && qna.answer == null}">
   						
	 					<h4 style="text-align: center;">
		   					
		   					<button type="button" class="btn btn-primary answerbtn" data-toggle="modal" data-target="#answerModal" data-whatever="@fat" 
					   						style="margin-right: 70px; margin-bottom:7px; letter-spacing:1px; font-weight:bold; font-size:13px;" onclick="selectQnaNo('${qna.qnaNo}');">답변하기</button>
					   					
	  						   						
	   					</h4> 
   					</c:if>
   					</sec:authorize>
   					
		   		</div>
		   		
		   	</div> 
		   	
		
		   		<!-- 답변 내용이 있고 공개질문글일때의 답변 출력-->
				<c:if test="${ qna.answer != null && qna.status eq false }">
				
	   			<div class="review d-flex" style="padding:0 10px 20px 10px; margin-left:30px;">
			   		<div class="desc" style="background-color:#f4f4f4;  padding:15px; border-radius:10px;">
			   			<h4>
			   				<span class="text-left" style="font-color: #a1beb6; font-size:13px;">
							   				<i class="mdi mdi-subdirectory-arrow-right"></i><b>A.</b> 
							   						호스트님의 답글</span>
			   			</h4>
			   			<p style="padding-left:15px">${ qna.answer}</p>
			   		</div>
			   	</div>
			   	
			   	</c:if>
			   	<!-- 답변내용이 있고 비공개질문글일때 -->
			   	<c:if test="${ qna.answer != null && qna.status eq true }">
			   		<!-- 관리자이거나 -->
			   		<sec:authorize access="hasRole('ADMIN')">
				   		<div class="review d-flex" style="padding:0 10px 20px 10px; margin-left:30px;">
					   		<div class="desc" style="background-color:#f4f4f4; padding:15px; border-radius:10px;">
					   			<h4>
					   				<span class="text-left" style="color: #a1beb6; font-size:13px;">
							   				<i class="mdi mdi-subdirectory-arrow-right"></i><b>A.</b> 
							   						호스트님의 답글</span>
					   			</h4>
					   			<p style="padding-left:15px">${ qna.answer}</p>
					   		</div>
				   		</div>
			   		</sec:authorize>
			   		<!-- 유저인 경우 -->
			   		<sec:authorize access="hasRole('USER')">
		   			<sec:authentication property="principal.username" var="loginMember"/>
		   			<!-- 로그인사용자가 글작성자일때 -->
		   			<c:if test="${loginMember != null && loginMember eq qna.email }">
		   				<div class="review d-flex" style="padding:0 10px 20px 10px; margin-left:30px;">
					   		<div class="desc" style="background-color:#f4f4f4; padding:15px; border-radius:10px;">
					   			<h4>
					   				<span class="text-left" style="color: #a1beb6; font-size:13px;">
							   				<i class="mdi mdi-subdirectory-arrow-right" ></i><b>A.</b> 
							   						호스트님의 답글</span>
					   			</h4>
					   			<p style="padding-left:15px">${ qna.answer}</p>
					   		</div>
				   		</div>
		   			</c:if>
		   			</sec:authorize>
		   			<sec:authorize access="hasRole('HOST')">
			   		<!-- 호스트일 때 -->
   					<sec:authentication property="principal.username" var="loginMember"/>
   						
		   					<c:if test="${loginMember != null && loginMember eq space.memberEmail }">
		   					<div class="review d-flex" style="padding:0 10px 20px 10px; margin-left:30px;">
						   		<div class="desc" style="background-color:#f4f4f4; padding:15px; border-radius:10px;">
						   			<h4>
							   				<span class="text-left" style="color: #a1beb6; font-size:13px;">
							   				<i class="mdi mdi-subdirectory-arrow-right"></i><b>A.</b> 
							   						호스트님의 답글</span>
							   				
							   			</h4>
							   		<p style="padding-left:15px">${ qna.answer}</p>
				   					<h4 style="text-align: right;">
						   				<!-- <span style="width: 80px; height: 24.8px; margin: 3px;"> -->
						   					<button type="button" class="btn btn-secondary answerbtn" data-toggle="modal" data-target="#answerModal" data-whatever="@fat" 
						   						style="float: right; margin-right: 10px; margin-bottom:7px; letter-spacing:1px; color:#a6e4d2; font-weight:bold; font-size:13px;" onclick="selectQnaNo('${qna.qnaNo }');" 
						   							value="${qna.qnaNo }">답변 수정</button>
						   					
				   						<!-- </span> -->   						
					   				</h4>
					   			</div>
					   		</div>
			   				</c:if>
			   		<!-- 다른 공간의 호스트인데 비공개 글 작성자인경우 -->
			   				<c:if test="${loginMember != null && loginMember eq qna.email && loginMember ne space.memberEmail }">
			   				<div class="review d-flex" style="padding:0 10px 20px 10px; margin-left:30px;">
					   		<div class="desc" style="background-color:#dfe8e6; padding:15px; border-radius:10px;">
					   			<h4>
					   				<span class="text-left" style="color:#a1beb6; font-size:13px;">
							   				<i class="mdi mdi-subdirectory-arrow-right"></i><b>A.</b> 
							   						호스트님의 답글</span>
					   			</h4>
					   			<p style="padding-left:15px">${ qna.answer}</p>
					   		</div>
				   			</div>
			   				</c:if>
		   				
			   		</sec:authorize>
			   	</c:if>
			 	
			</c:forEach>
		   	</c:if>
		   	<c:if test="${qnaTotal > qnaPaging+5 }">
		   		<button type="button" class="btn btn-primary col-3 font-bold" style="margin-left: 33%;" name="qnaPaging" value="${ qnaPaging+5 }">더보기</button> 
   			</c:if>
   		</div>
		   	
<%-- 			<nav aria-label="Page navigation" style="display:inline text-align: center; margin-left: 45%; margin-top:50px;">
			<ul class="pagination" style="border:0; margin-right:10px;"> ${qPageBar}</ul>
			</nav> --%>
   		</div>
   		</div>
<!-- qna끝 -->

						<!-- 리뷰 시작-->
						<div class="tab-pane fade" id="detail-review" role="tabpanel"
							aria-labelledby="detail-review-tab">
							<div class="row">
								<div class="col-md-7">
									<div class="row">
										<h3 class="head ml-4">${ reviewTotal }개의리뷰</h3>
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<label class="btn btn-secondary active reviewLabel">
												<a id="option1"><input type="radio" name="options"
													autocomplete="off" checked>포토리뷰 OFF</a>
											</label> <label class="btn btn-secondary reviewLabel"> <a
												id="option2"><input type="radio" name="options"
													autocomplete="off">포토리뷰 ON</a>
											</label>
										</div>
									</div>
									<c:forEach items="${review}" var="review" varStatus="vs">
										<c:choose>
											<c:when test="${ review.image != null }">
												<div class="review d-flex">
													<div class="desc">
														<h4>
															<span class="text-left">${ review.nickName }</span> <span
																class="text-right"><fmt:formatDate
																	value="${review.enrollDate}" pattern="yyyy-MM-dd" /></span>
														</h4>
														<p class="star">
															<span> <c:forEach begin="1"
																	end="${ review.starRating }">
																	<i class="ion-ios-star"></i>
																</c:forEach>
															</span>
															<sec:authorize access="hasAnyRole('USER','HOST','ADMIN')">
																<sec:authentication property="principal.username"
																	var="loginMember" />
																<c:if
																	test="${loginMember != null && loginMember eq space.memberEmail }">
																	<span class="text-right"><a href="#"
																		class="reply"><i class="icon-reply"></i></a></span>
																</c:if>
															</sec:authorize>
														</p>
														<div class="reviewToggle">
															<div class="row reviewDetailBtn" style="cursor: pointer;">
																<div
																	style="background-image: url(${pageContext.request.contextPath}/resources/upload/review/${review.image}); background-size: cover; width:110px; height: 100px;margin-left: 10px;"></div>
																<p
																	style="position: absolute; margin: 0 85px 0 135px; overflow: hidden; text-overflow: ellipsis; width: 60%; -webkit-box-orient: vertical; -webkit-line-clamp: 3; display: -webkit-box;">${ review.content }</p>
																<p style="margin: 75px 0 0 15px; font-weight: 600;"
																	class="detailBtn">더보기</p>
															</div>
															<div class="reviewSimpleBtn"
																style="cursor: pointer; display: none; height: 100%">
																<p>${ review.content }</p>
																<p style="font-weight: 600;" class="simpleBtn">접기</p>
																<div style="background-image: url(${pageContext.request.contextPath}/resources/upload/review/${review.image});  width: 500px;height: 350px;background-size: cover;"></div>
										                         <c:if test="${ not empty review.reviewComment }">
										                         	<div class="mt-4" style="background-color: #fafafa; width: 500px; cursor:default; border: 1px solid #edeceb; padding-bottom: 30px; ">
											                         <div class="pl-5 pr-5 pt-4 ">
											                         	<p><i class="fa fa-comment mr-1"></i>호스트 답글</p>
											                         	<p>${ review.reviewComment }</p>
											                         </div>
										                         	</div>
										                         </c:if>
															</div>
														</div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="review nullImg">
													<div class="desc nullImg">
														<h4>
															<span class="text-left">${ review.nickName }</span> <span
																class="text-right"><fmt:formatDate
																	value="${review.enrollDate}" pattern="yyyy-MM-dd" /></span>
														</h4>
														<p class="star">
															<span> <c:forEach begin="1"
																	end="${ review.starRating }">
																	<i class="ion-ios-star"></i>
																</c:forEach>
															</span>
															<sec:authorize access="hasAnyRole('USER','HOST','ADMIN')">
																<sec:authentication property="principal.username"
																	var="loginMember" />
																<c:if
																	test="${loginMember != null && loginMember eq space.memberEmail }">
																	<span class="text-right"><a href="#"
																		class="reply"><i class="icon-reply"></i></a></span>
																</c:if>
															</sec:authorize>
														</p>
														<div class="reviewToggle">
															<div class="row reviewDetailBtn" style="cursor: pointer;">
																<p
																	style="position: absolute; margin: 0 85px 0 15px; overflow: hidden; text-overflow: ellipsis; width: 80%; -webkit-box-orient: vertical; -webkit-line-clamp: 3; display: -webkit-box;">${ review.content }</p>
																<p style="margin: 75px 0 0 15px; font-weight: 600;"
																	class="detailBtn">더보기</p>
															</div>

															<div class="reviewSimpleBtn"
																style="cursor: pointer; display: none; height: 100%">
																<p>${ review.content }</p>
																<p style="font-weight: 600;" class="simpleBtn">접기</p>
																<c:if test="${ not empty review.reviewComment }">
										                         	<div class="mt-4" style="background-color: #fafafa; width: 500px; cursor:default; border: 1px solid #edeceb; padding-bottom: 30px; ">
											                         <div class="pl-5 pr-5 pt-4 ">
											                         	<p><i class="fa fa-comment mr-1"></i>댓글</p>
											                         	<p>${ review.reviewComment }</p>
											                         </div>
										                         	</div>
										                         </c:if>
															</div>
														</div>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<nav aria-label="Page navigation"
										style="display: inline text-align: center; margin-left: 45%; margin-top: 50px;">
										<ul class="pagination" style="border: 0; margin-right: 10px;">
										<c:if test="${reviewTotal > reviewPaging+5 }">
											<button type="button" class="btn btn-primary col-3 font-bold" style="left: -35px;" name="reviewPaging" value="${ reviewPaging+5 }" >더보기</button>
										</c:if>
										<%-- <button type="button" class="btn btn-primary col-3 font-bold"  name="reviewPaging"  value="${ reviewPaging+5 }" >더보기</button> --%>
											<%-- ${pageBar} --%>
										</ul>
									</nav>
								</div>

								<div class="col-md-5">
									<div class="rating-wrap">
										<h3 class="head">별점 순</h3>
										<div class="wrap">
											<p class="star">
												<fmt:parseNumber var="star5"
													value="${  star.sumStar == 0? 0 :star.star5/star.sumStar*100 }" integerOnly="true" />
												<fmt:parseNumber var="star4"
													value="${ star.sumStar == 0? 0 :star.star4/star.sumStar*100 }" integerOnly="true" />
												<fmt:parseNumber var="star3"
													value="${ star.sumStar == 0? 0 :star.star3/star.sumStar*100 }" integerOnly="true" />
												<fmt:parseNumber var="star2"
													value="${ star.sumStar == 0? 0 :star.star2/star.sumStar*100 }" integerOnly="true" />
												<fmt:parseNumber var="star1"
													value="${ star.sumStar == 0? 0 :star.star1/star.sumStar*100 }" integerOnly="true" />
												<span> <i class="ion-ios-star"></i> <i
													class="ion-ios-star"></i> <i class="ion-ios-star"></i> <i
													class="ion-ios-star"></i> <i class="ion-ios-star"></i> (${ star.sumStar == 0? 0 :star5 }%)
												</span> <span>${ star.sumStar == 0? 0 :star.star5 } Reviews</span>
											</p>
											<p class="star">
												<span> <i class="ion-ios-star"></i> <i
													class="ion-ios-star"></i> <i class="ion-ios-star"></i> <i
													class="ion-ios-star"></i> (${ star.sumStar == 0? 0 :star4 }%)
												</span> <span>${ star.sumStar == 0? 0 :star.star4 } Reviews</span>
											</p>
											<p class="star">
												<span> <i class="ion-ios-star"></i> <i
													class="ion-ios-star"></i> <i class="ion-ios-star"></i> (${ star.sumStar == 0? 0 :star3 }%)
												</span> <span>${ star.sumStar == 0? 0 :star.star3 } Reviews</span>
											</p>
											<p class="star">
												<span> <i class="ion-ios-star"></i> <i
													class="ion-ios-star"></i> (${ star.sumStar == 0? 0 :star2 }%)
												</span> <span>${ star.sumStar == 0? 0 :star.star2 } Reviews</span>
											</p>
											<p class="star">
												<span> <i class="ion-ios-star"></i> (${ star.sumStar == 0? 0 :star1 }%)
												</span> <span>${ star.sumStar == 0? 0 :star.star1 } Reviews</span> 
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 리뷰 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 추천시스템 시작 -->
<div class="container" style="border-top: 1px solid rgba(0, 0, 0, 0.1)">
	<div class="row justify-content-center">
		<div class="col-md-12 mt-5 heading-section text-center ftco-animate mb-5">
			<span class="subheading">카테고리 추천</span>
			<h2 class="mb-2">다른 ${ cateName }(은/는) 어떠신가요?</h2>
		</div>
	</div>
	
	<div class="row">
	<c:if test="${ not empty spcList }">
	<c:forEach items="${ spcList }" var="space" varStatus="vs">
    	  <div class="col-md-4">
    		<div class="property-wrap ftco-animate">
    			<c:choose>
					<c:when test="${ space.renamedFilename !=null }">
					<!-- 이미지파일이 있을때 -->
				   		<a href="${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo=${space.spaceNo}" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/upload/space/${space.renamedFilename});"></a> 
							<!-- 	<i class="prev fas fa-chevron-left fa-2x" onclick="plusSlides(-1)"></i>
								<i class="next fas fa-chevron-right fa-2x" onclick="plusSlides(1)"></i> -->
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo=${space.spaceNo}" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/upload/space/spcuslogo.png);"></a>
					</c:otherwise>
				</c:choose>
    			<div class="text">
    				<p class="price"><span class="space-price" style="color: #007bff;">
    				<fmt:formatNumber value="${space.hourlyPrice }" type="number"/><small>원/시간</small></span></p>
    				<ul class="property_list">
    					<li><i class="icon-star"></i>
    						<c:if test="${space.starAvg != 0 }">
		    					<fmt:formatNumber value="${space.starAvg}" pattern="0.0" type="number"/>
	    					</c:if>
	    					<c:if test="${space.starAvg == 0 }">0</c:if></li>
    					<li><span class="icon-heart"></span>${space.likeCnt }</li>
    					<li><span class="icon-comments"></span>${space.reviewCnt }</li>
    				</ul>
    				<h3><a href="${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo=${space.spaceNo}">${space.spaceName }</a></h3>
    				<small><span class="icon-my_location">${space.address }</span></small>
    			<!-- 	<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
    				 <span class="icon-heart"></span> 
    				</a> -->
    			</div>
    		</div>
    	</div>
	</c:forEach>
	</c:if>
	</div>
</div>
<input type="hidden" id="bool" value="${ bool }" />

<!-- 추천시스템 끝 -->
      

<script>

	var mapContainer = document.getElementById('kakaomap'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch($("#spaceAddr").val().substr(9), function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	        });

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    }});    

</script>
<!-- 카카오톡 공유 -->
<script type='text/javascript'>
    Kakao.init('d6ea51fdfee1be1e548d05a904a861bc');
    	 Kakao.Link.createDefaultButton({
    	      container: '#kakao-link-btn',
    	      objectType: 'location',
    	      address: '${ space.address }',
    	      addressTitle: '${ space.spaceName }',
    	      content: {
    	        title: '${ space.spaceName }',
    	        description: $('#spaceCon').val(),
    	        imageUrl: 'https://moplqfgeemqv2103108.cdn.ntruss.com/service/158321359_3969307adb111d972a661a99fd3629af.jpg?type=m&w=900&h=900&autorotate=true&quality=90',
    	        link: {
    	          mobileWebUrl: 'https://www.spacecloud.kr/',
    	          webUrl: 'https://www.spacecloud.kr/'
    	        }
    	      },
    	      social: {
    	        likeCount: 286,
    	        commentCount: 45,
    	        sharedCount: 845
    	      },
    	      buttons: [
    	        {
    	          title: '웹으로 보기',
    	          link: {
    	            mobileWebUrl: 'https://www.spacecloud.kr/',
    	            webUrl: 'https://www.spacecloud.kr/'
    	          	}
    	        }]
    	    });


</script>
<script>$(function () { memberId();});</script>
<script>
/* 추천공간 이미지 슬라이드 */
/* $(".owl-carousel ref").owlCarousel({ 
		items:1, 
		loop:false,
		center:true
})
 */
$(".fa-share-square").click(function(){
	if($("#a1").hasClass('d-none'))
		$("#a1").removeClass('d-none');
	else
		$("#a1").addClass('d-none');
	
})
function selectQnaNo(no){
	console.log(no);
	$("#qnaNo").val(no);
		
}

function popModify(){
	/* document.getElementById("modify-text").val = "${qna.content}"; */
	document.getElementById("modifyNo").value = $(".modify").val();
	
}

function modifyBtn(){
	
	$("#modifyFrm").attr("action",
	"${ pageContext.request.contextPath}/qna/modifyQuestion.do")
			.attr("method", "POST")
			.submit();
}

function deleteBtn(no){
	$("#deleteNo").val(no);
	/* alert(no); */
	$('#deleteModal').modal();
	
}


function sendAnswer(){
	
	if($("#answer-content").val !=""){
		$("#answerFrm").attr("action",
				"${ pageContext.request.contextPath}/qna/sendAnswer.do")
		.attr("method", "POST")
		.submit();
	} else{
		alert("답변 내용을 입력하세요.");
		}
}

function modifyCheck(){

	if($("#modify-status").is(':checked')){
		//비밀글 설정 체크시 이벤트
		 document.getElementById("modify-status").value = 'true';
	} else{document.getElementById("modify-status").value = 'false'; }
}

function onCheck(){

	if($("#qna-status").is(':checked')){
		//비밀글 설정 체크시 이벤트
		 document.getElementById("qna-status").value = 'true';
	} else{document.getElementById("qna-status").value = 'false'; }
}


function ask(){	
	if($("#message-text").val() != ""){
		$("#ask-question").attr("action", 
		"${ pageContext.request.contextPath}/qna/insertQna.do")
		.attr("method", "POST")
		.submit();
	} else{
		alert("질문 내용을 입력하세요.");
		}
}

//예약하기
function rvSubmit(){
	alert($("#spaceAddr").val().substr(9));
   	if($("#memberId").val()){
		$("#reserveFrm").attr("action", "${ pageContext.request.contextPath }/space/reserveSpace.do")
		.submit();
   	}
   	else{
      	alert("로그인 후 이용할 수 있습니다.");
      	location.href="${pageContext.request.contextPath }/member/memberLoginForm.do";
	}
	
};


/* 이미지 슬라이드 시작 */
let b = document.querySelector('button');
setTimeout(()=>b.focus(), 100);
setTimeout(()=>b.blur(), 1000);

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = $(".mySlides");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  slides[slideIndex-1].style.display = "block";  
}
/* 이미지 슬라이드 끝 */

/* 포토리뷰 */
$("#option1").on("click", function(){
	$(".nullImg").removeClass("hide");
});
$("#option2").on("click", function(){
	$(".nullImg").addClass("hide");
});
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
	$(".reviewSimpleBtn").mouseenter(function(){
		$(this).children(".simpleBtn").css('text-decoration', 'underline');
	});
	$(".reviewSimpleBtn").mouseleave(function(){
		$(".simpleBtn").css('text-decoration', 'none');
	});
});
/* 리뷰 디테일 */
$(".reviewToggle").on('click', function(){
	$(this).children(".reviewDetailBtn").toggle('hide');
	$(this).children(".reviewSimpleBtn").toggle('show');
	
});

$(function () { 

	if($("#bool").val() == 1){
		$("#detail-description-tab").removeClass('active');
		$("#detail-review-tab").addClass('active');
		$("#detail-description").removeClass('active');
		$("#detail-description").removeClass('show');
		$("#detail-review").addClass('active');
		$("#detail-review").addClass('show');
	} 
	if("${reviewPaging}" > 0){
		$("#detail-description-tab").removeClass('active');
		$("#detail-review-tab").addClass('active');
		$("#detail-description").removeClass('active');
		$("#detail-description").removeClass('show');
		$("#detail-review").addClass('active');
		$("#detail-review").addClass('show');
		window.scrollTo(200, "${width}");
	} 
	if("${reviewPaging}" > 9){
		window.scrollTo(200, "${width}");
	} 
	
	if("${qnaPaging}" > 0){
		$("#detail-description-tab").removeClass('active');
		$("#detail-qna-tab").addClass('active');
		$("#detail-description").removeClass('active');
		$("#detail-description").removeClass('show');
		$("#detail-qna").addClass('active');
		$("#detail-qna").addClass('show');
		window.scrollTo(200, "${width}");
	} 
	if("${qnaPaging}" > 9){
		window.scrollTo(200, "${width}");
	} 
});

//페이징
$("[name=qnaPaging]").click(function(){
		var position = $(window).scrollTop(); 
		location.href="${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo="+"${space.spaceNo}"+"&qnaPaging="+$(this).val()+"&width="+position;
});
$("[name=reviewPaging]").click(function(){
		var position = $(window).scrollTop(); 
		location.href="${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo="+"${space.spaceNo}"+"&reviewPaging="+$(this).val()+"&width="+position;
});
//맨위로
/* $(".arrowUp").click(function(){
	window.scrollTo(200, 0);
}); */
//로그인 후 이용 처리
$("#likeLogin").click(function(){
	alert("로그인 후 이용할 수 있습니다.");
  	location.href="${pageContext.request.contextPath }/member/memberLoginForm.do";
});

</script>

<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
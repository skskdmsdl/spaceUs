<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	color: black;
	font-size: 25px;
	margin-right: 10px;
}
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
					dataType: "JSON",
					data :   {
						spaceNo : "${space.spaceNo}",
						email : "${loginMember.principal.memberEmail}"},
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
    		$heart.html("<i class='far fa-heart'></i>");
    		 $.ajax({
			        type: "POST",
					url : "${pageContext.request.contextPath}/space/cancelHeart.do",
					data :  {
						spaceNo : "${space.spaceNo}",
						email : "${loginMember.principal.memberEmail}"},
					success: function(data){
						readLikeCnt();
					},
					error: function(xhr, status, err){
						console.log("위시 삭제 실패", xhr, status, err);
						}
    	   			});	
    		}
	});
	// 공간 좋아요 갯수
    function readLikeCnt() {
		$.ajax({
			url: "${pageContext.request.contextPath}/space/readLikeCnt.do",
            type: "GET",
            data: {
                no: "${space.spaceNo}"
            },
            dataType: "json",
            success: function (count) {
            	$(".like-count").html(count);
            },
			error: function(xhr, status, err){
				console.log("좋아요수 읽어오기 실패", xhr, status, err);
				}
		});
    };
    
    readLikeCnt(); // 처음 시작했을 때 실행되도록 해당 함수 호출
});


    
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
					<div class="mySlides fade1">
						<div class="img"
							style="background-image: url(${pageContext.request.contextPath }/resources/images/work-1.jpg);"></div>
					</div>
					<div class="mySlides fade1">
						<div class="img"
							style="background-image: url(${pageContext.request.contextPath }/resources/images/work-2.jpg);"></div>
					</div>
					<i class="prev fas fa-chevron-left fa-2x" onclick="plusSlides(-1)"></i>
					<i class="next fas fa-chevron-right fa-2x" onclick="plusSlides(1)"></i>
					<div class="text text-center">
						<div style="text-align: right; padding-right: 5px">
							
							<c:choose>
							<c:when test="${ loginMember.principal.memberEmail != null }">
							<a href=javascript:; id="heart-a"><i id="addLike" class="far fa-heart" style="margin:2px;"></i></a>
							<span class="like-count"></span>
							</c:when>
							<c:otherwise>
							<i id="addLike" class="far fa-heart" style="margin:2px;"></i>
							<span class="like-count"></span>
							</c:otherwise>
							</c:choose>
							&emsp; <a href="javascript:;" id="kakao-link-btn"> <img
								src="${pageContext.request.contextPath }/resources/images/icons/kakao-icon.png"
								width="30px" />
							</a>
							<!-- 공유하기 팝오버 시작-->
							<a href=javascript:; data-toggle="popover" data-trigger="focus"
								data-placement="bottom" tabindex="0" title="공유하기"
								data-html="true" data-popover-content="#a1"> <i
								class="far fa-share-square"></i>
							</a>
							<div class="d-none" id="a1">
								<div class="popover-body">
									<%-- <img src="${pageContext.request.contextPath }/resources/images/icons/kakao-icon.png" onclick="kakaoShare();"/> --%>
									<img src="${pageContext.request.contextPath }/resources/images/icons/twitter-icon.png" onclick="twitterShare();" />
									<img src="${pageContext.request.contextPath }/resources/images/icons/naver-icon.jpg" onclick="naverShare();" />
									<input class="input-group-text w-100 mt-2 mb-2" type="text" id="url-input">
									<button class="btn btn-primary w-100" id="url-btn" onclick="urlcopy();">URL 복사</button>
								</div>
							</div>
							<!-- 공유하기 팝오버 끝-->
							<!-- 예약버튼 -->
							<input type="submit" onclick="rvSubmit();" value="예약하기"
								class="btn py-3 px-5 btn-primary" style="margin-left: 70px"> 
							<form id="reserveFrm">
								<input type="hidden" name="memberId" id="memberId" value="${loginMember.principal.memberEmail}" />
								<input type="hidden" name="spaceNo" value="${ space.spaceNo }" />
							</form>
						</div>
						<span class="subheading">카페</span>
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
							<div class="row">
								<c:forEach items="${optionList}" var="info" varStatus="vs">
								<div class="col-md-4">
									<ul class="features">
										<li class="check"><span class="ion-ios-checkmark"></span>${ info.optionName }</li>
									</ul>
								</div>
								</c:forEach>
							</div>	
							<!-- 공간설명 시작-->
							<div>
								<p style="font-size: 18px; min-height:300px; padding-top: 50px;">
									${ space.content } <br /> </p>
							</div>
							<!-- 공간위치 -->	
							<div class="row" style="margin-left: 5em;">
								<div id="kakaomap" style="width:500px;height:400px; "></div>
								<div class="contact-info" style="padding-left: 100px;">
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
											<p>Support.aler@gmail.com</p>
										</div>
									</div>
									
										
								</div>
							</div>
						</div>
						<!-- contact 끝 -->

						
						

<div class="tab-pane fade" id="detail-qna" role="tabpanel" aria-labelledby="detail-qna-tab">
     <div class="row">
   		<div class="col-md-10">
   			<h3 class="head fa fa-pencil">${qnaTotal }개의 질문글</h3>
   				
			 	<!-- 질문글 등록 모달창 -->
				<sec:authorize access="hasAnyRole('USER','HOST','ADMIN')"> 
				<!-- 질문글쓰기 버튼 -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#qnaModal" data-whatever="@fat" style="float: right; margin: 10px; letter-spacing:1px; font-weight:bold; font-size:1em;">질문글 작성</button>
								
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
				            <input type="checkbox" name = "status" class="form-control" style="width: 27px; height: 24px;" id="qna-status" value="false">
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
				
		 	<!-- 질문글 시작 -->
		 	<c:if test="${ not empty qlist }">
			<c:forEach items="${ qlist }" var="qna" varStatus="vs">
			<div class="review d-flex">
		   		<div class="desc" style="background-color:#f8f9fa; padding:5px;">
		   			<h4>
		   			<span class="text-left badge">Q.</span>
		   			</h4>
		   			<h4>
		   				<span class="text-left badge">${ qna.name}</span>
		   				<span class="text-right"><fmt:formatDate value="${ qna.date}" pattern="yyyy-MM-dd"/></span>
		   			</h4>
		   			<c:choose>
		   				<c:when test="${qna.status eq false}">
			   			    <p style="padding-left:20px; text-align:justify;">${qna.content }</p>
		   			 	</c:when>
		   			 	<c:otherwise>
		   			 		<p style="padding-left:20px; text-align:justify;"><i class="fa fa-lock">비공개</i></p>
		   			 		
		   			 		<!-- 비공개 질문은 호스트와 질문 작성자, 관리자가 조회 가능 -->
		   			 		<sec:authorize access="hasAnyRole('HOST', 'USER')">
   							<sec:authentication property="principal.username" var="loginMember"/>
	   							<c:if test="${loginMember != null && loginMember eq space.memberEmail || loginMember eq qna.email }">
			   			 			<p style="padding-left:20px; text-align:justify;">${qna.content }</p>
			   			 			
			   			 		</c:if>
		   			 		</sec:authorize>
		   			 		<sec:authorize access="hasRole('ADMIN')">
		   			 			<p style="padding-left:20px; text-align:justify;">${qna.content }</p>
		   			 		</sec:authorize>
		   			 	</c:otherwise>
		   			</c:choose>
		   			
		   			<!-- 호스트 권한을 갖고 있고 해당 공간의 호스트의 메일과 로그인 유저의 메일이 동일하면 답변하기 버튼 생성 -->
	   				<sec:authorize access="hasRole('HOST')">
   					<sec:authentication property="principal.username" var="loginMember"/>
   					<c:if test="${loginMember != null && loginMember eq space.memberEmail }">
	 					<h4 style="text-align: center;">
		   					<span style="background: #F0F0F0; padding: 4px 10px; width: 100px; height: 24.8px; margin: 3px;">
		   						<button class="fa fa-mail-reply" style="color:#20c997; border: none;" onclick="answer();">답변하기</button>
	  						</span>   						
	   					</h4>
   					</c:if>
   					</sec:authorize>
   					
		   		</div>
		   		
		   	</div> 
		   	
		   	<c:choose>
				<c:when test="${ qna.answer != null && qna.status eq false }">
				
	   			<div class="review d-flex" style="padding: 10px;">
			   		<div class="desc" style="background-color:#dfe8e6; padding:5px">
			   			<h4>
			   				<span class="text-left"><i class="mdi mdi-subdirectory-arrow-right"></i>A. 호스트님의 답글</span>
			   			</h4>
			   			<p style="padding-left:15px">${ qna.answer}</p>
			   		</div>
			   	</div>
			   	
			   	</c:when>
			   	<c:otherwise>
				   	<sec:authorize access="hasRole('HOST')">
	   					<sec:authentication property="principal.username" var="loginMember"/>
	   					<c:if test="${loginMember != null && loginMember eq space.memberEmail }">
	   					<div class="review d-flex" style="padding: 10px 10px;">
					   		<div class="desc" style="background-color:#dfe8e6; padding:5px">
			   					<h4 style="text-align: right;">
					   				<span style="background: #F0F0F0; padding: 4px 10px; width: 80px; height: 24.8px; margin: 3px;">
					   					<button type="button" class="fa fa-send" style="color:#20c997; border: none;" onclick="sendAnswer();">전송</button>
			   						</span>   						
				   				</h4>
				   				<form id="answerFrm" action="${pageContext.request.contextPath }/qna/insertAnswer.do">
				   					<input type="hidden" name="qnaNo" value="${qna.qnaNo}"/>
				   					<textarea id="answer-content" name="answer" rows="4" cols="70"></textarea>
				   				</form>
				   			</div>
				   		</div>
		   				</c:if>
		   			</sec:authorize>
			   	</c:otherwise>
			</c:choose>   	
			</c:forEach>
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
																<div
																	style="background-image: url(${pageContext.request.contextPath}/resources/upload/review/${review.image});  width: 500px;height: 350px;background-size: cover;"></div>
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
											${pageBar}
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
		   				<div class="">
			    			<c:if test="${not empty space.attachList}">
				    			<c:forEach items="${space.attachList}" var="attach" varStatus="vs">
				    			 <img class="img" src="${pageContext.request.contextPath }
										/resources/upload/space/${space.rname }" alt="" /> 
<%-- 				    	 			<div class="img"
										style="background-image: url(${pageContext.request.contextPath }
										/resources/upload/space/${space.rname };"></div>  --%>
									
								</c:forEach>
			    			</c:if>
						</div>  
					<!-- 	<i class="prev fas fa-chevron-left fa-2x" onclick="plusSlides(-1)"></i>
						<i class="next fas fa-chevron-right fa-2x" onclick="plusSlides(1)"></i> -->
    			<div class="text">
    				<p class="price"><span class="space-price" style="color: #007bff;">
    				<fmt:formatNumber value="${space.hourlyPrice }" type="number"/><small>원/시간</small></span></p>
    				<ul class="property_list">
    					<li><span class="icon-star"></span>${space.starAvg }</li>
    					<li><span class="icon-heart"></span>${space.likeCnt }</li>
    					<li><span class="icon-eye"></span>${space.views }</li>
    				</ul>
    				<h3><a href="${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo=${space.spaceNo}">${space.spaceName }</a></h3>
    				<small><span class="icon-my_location">${space.address }</span></small>
    				<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
    				<span class="icon-heart"></span>
    				</a>
    			</div>
    		</div>
    	</div>
	</c:forEach>
	</c:if>
	</div>
</div>

<!-- 추천시스템 끝 -->

<script>
<!-- 지도 -->
var mapContainer = document.getElementById('kakaomap'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${ space.address }', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });


    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});  



</script>
<!-- 카카오톡 공유 -->
<script type='text/javascript'>
    Kakao.init('455b391796eaae1861145a078007af70');

    	 Kakao.Link.createDefaultButton({
    	      container: '#kakao-link-btn',
    	      objectType: 'location',
    	      address: '${ space.address }',
    	      addressTitle: '${ space.spaceName }',
    	      content: {
    	        title: '${ space.spaceName }',
    	        description: '${ space.content }',
    	        imageUrl: 'http://mud-kage.kakao.co.kr/dn/bSbH9w/btqgegaEDfW/vD9KKV0hEintg6bZT4v4WK/kakaolink40_original.png',
    	        link: {
    	          mobileWebUrl: 'https://developers.kakao.com',
    	          webUrl: 'https://developers.kakao.com'
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
    	            mobileWebUrl: 'https://developers.kakao.com',
    	            webUrl: 'https://developers.kakao.com'
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
function answer(){
	alert(${qna.qnaNo});
	
}

function sendAnswer(){
	if($("#answer-content").val !=null){
		$("#answerFrm").attr("action",
				"${ pageContext.request.contextPath}/qna/updateAnswer.do")
		.attr("method", "POST")
		.submit();
	} else{
		alert("답변 내용을 입력하세요.");
		}
}

function ask(){
	$("#ask-question").attr("action", 
	"${ pageContext.request.contextPath}/qna/insertQna.do")
	.attr("method", "POST")
	.submit();
}

//예약하기
function rvSubmit(){
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

	var bool = ${true};
	//console.log(bool);
	
	if(${true}==1){
	$("#detail-description-tab").removeClass('active');
	$("#detail-review-tab").addClass('active');
	$("#detail-description").removeClass('active');
	$("#detail-description").removeClass('show');
	$("#detail-review").addClass('active');
	$("#detail-review").addClass('show');
	}
});


</script>
<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
</style>
<script>
var url = $(location).attr('href');
	
$(function(){
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
    	if($heart.html().indexOf("far fa-heart") != -1) {
    		$heart.html("<i class='fas fa-heart'></i>");
    	}
    	else {
    		$heart.html("<i class='far fa-heart'></i>");
    	}
    });
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

</script>
<section class="ftco-section ftco-property-details">
      <div class="container">
      	<div class="row justify-content-center">
      		<div class="col-md-12">
      			<div class="property-details">
      			<div class="mySlides fade1">
      				<div class="img" style="background-image: url(${pageContext.request.contextPath }/resources/images/work-1.jpg);"></div>
      			</div>
      			<div class="mySlides fade1">
      				<div class="img" style="background-image: url(${pageContext.request.contextPath }/resources/images/work-2.jpg);"></div>
      			</div>
      			<i class="prev fas fa-chevron-left fa-2x" onclick="plusSlides(-1)"></i>
      			<i class="next fas fa-chevron-right fa-2x" onclick="plusSlides(1)"></i>
      				<div class="text text-center">
      				<div style="text-align:right; padding-right:5px">
					    <a href=javascript:; id="heart-a"><i class="far fa-heart"></i></a>
					    &emsp;
      				<!-- 공유하기 팝오버 시작-->
					       <a href=javascript:; data-toggle="popover" data-trigger="focus" data-placement="bottom"
					          tabindex="0" title="공유하기" data-html="true" data-popover-content="#a1" >
					       <i class="far fa-share-square"></i>
					       </a>
					       
					       <div class="d-none" id="a1">
							  <div class="popover-body">
							  <i class="fab fa-korvue fa-2x" style="color:#fae100"></i>
							  <i class="fab fa-twitter-square fa-2x" style="color:#2aa9e0"></i>
							  <i class="fab fa-facebook-square fa-2x" style="color:#3b5998"></i>
							    <input class="input-group-text w-100 mt-2 mb-2" type="text" id="url-input">
							    <button class="btn btn-primary w-100" id="url-btn" onclick="urlcopy();">URL 복사</button>
							  </div>
						  </div>
      				<!-- 공유하기 팝오버 끝-->
      				<!-- 예약버튼 -->
					    <input type="submit" onclick="rvSubmit();" value="예약하기" class="btn py-3 px-5 btn-primary" style="margin-left: 70px">
					    <form id="reserveFrm">
	   						<input type="hidden" name="spaceNo" value="${ space.spaceNo }" />
	   						<input type="hidden" name="spaceName" value="${ space.spaceName }" />
      					</form>
      				</div>
      					<span class="subheading">카페</span>
      					<h2>${ space.spaceName }
      					</h2>
      					<br />
      					<span class="subheading">
			              <div class="tagcloud">
			              <c:forEach items="${ tag }" var="tag">
			                <a href="#" class="tag-cloud-link">#${ tag.tag }</a>
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

				    <li class="nav-item">
				      <a class="nav-link" id="detail-manufacturer-tab" data-toggle="pill"
				      	 href="#detail-manufacturer" role="tab" aria-controls="detail-manufacturer"
				      	 aria-expanded="true">공간설명</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link active" id="detail-description-tab" data-toggle="pill"
				      	 href="#detail-description" role="tab" aria-controls="detail-description"
				      	 aria-expanded="true">공간옵션</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" id="detail-contact-tab" data-toggle="pill"
				      	 href="#detail-contact" role="tab" aria-controls="detail-contact"
				      	 aria-expanded="true">Contact</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" id="detail-qna-tab" data-toggle="pill"
				      	 href="#detail-qna" role="tab" aria-controls="detail-qna"
				      	 aria-expanded="true">Q&A</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" id="detail-review-tab" data-toggle="pill"
				      	 href="#detail-review" role="tab" aria-controls="detail-review"
				      	 aria-expanded="true">리뷰</a>
				    </li>
				   
				  </ul>
				</div>
     	<!-- 세부카테고리 끝-->
     	
<div class="tab-content" id="detail-tabContent">
 <!-- 공간설명 시작-->
   <div class="tab-pane fade" id="detail-manufacturer" role="tabpanel" aria-labelledby="detail-manufacturer-tab">
    <p style="font-size: 18px">
    	${ space.content }
    	1,2층으로 나뉘어져 있으며 <br/>
    	대관시 2층의 엔틱, 빈티지 분위기의 유니크한 인테리어를 이용하여 각종 행사/ 전시/ 스튜디어 대관/ 쇼핑몰 대관등을 진행하고 있습니다.
    </p>
    <p style="font-size: 18px">
    	2층 단독 화장실도 있기 때문에 장소를 이용하기에 방해 없이 장소를 즐기 실 수 있습니다🎁
    </p>
   </div>
 <!-- 공간설명 끝-->
 
<!-- 공간옵션시작 -->
   <div class="tab-pane fade show active" id="detail-description" role="tabpanel" aria-labelledby="detail-description-tab">
   	<div class="row">
   		<div class="col-md-4">
   			<ul class="features">
   				<li class="check"><span class="ion-ios-checkmark"></span>주류반입가능</li>
   				<li class="check"><span class="ion-ios-checkmark"></span>WIFI</li>
   				<li class="check"><span class="ion-ios-checkmark"></span>블루투스 스피커</li>
   			</ul>
   		</div>
   		<div class="col-md-4">
   			<ul class="features">
   				<li class="check"><span class="ion-ios-checkmark"></span>화장실</li>
   				<li class="check"><span class="ion-ios-checkmark"></span>유료주차장</li>
   				<li class="check"><span class="ion-ios-checkmark"></span>엔틱분위기</li>
   			</ul>
   		</div>
   		<div class="col-md-4">
   			<ul class="features">
   				<li class="check"><span class="ion-ios-checkmark"></span>빈티지분위기</li>
   				<li class="check"><span class="ion-ios-checkmark"></span>왕의자</li>
   				<li class="check"><span class="ion-ios-checkmark"></span>애완견동반가능</li>
   			</ul>
   		</div>
   	</div>
   </div>
<!-- 공간옵션 끝-->

<!-- contact 시작 -->
 <div class="tab-pane fade" id="detail-contact" role="tabpanel" aria-labelledby="detail-manufacturer-tab">
 <div class="row" style="margin-left: 5em;">
      <div class="contact-info">
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
    <div class="cs-map">
       <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d735515.5813275519!2d-80.41163541934742!3d43.93644386501528!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x882a55bbf3de23d7%3A0x3ada5af229b47375!2sMono%2C%20ON%2C%20Canada!5e0!3m2!1sen!2sbd!4v1583262687289!5m2!1sen!2sbd"
           height="300" style="border:0;" allowfullscreen=""></iframe>
	</div>
 </div>
</div>
<!-- contact 끝 -->

<!-- qna시작 -->

<div class="tab-pane fade" id="detail-qna" role="tabpanel" aria-labelledby="detail-qna-tab">
     <div class="row">
   		<div class="col-md-10">
   			<h3 class="head">5개의 Q&A</h3>
					   			
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#qnaModal" data-whatever="@fat">문의하기</button>
				
				<div class="modal fade" id="qnaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				       <sec:authorize access="hasAnyRole('USER','HOST','ADMIN')"> 
				        <h5 class="modal-title" id="exampleModalLabel" style="letter-spacing:2px;">문의하기</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				        </sec:authorize> 
				      </div>
				      <div class="modal-body">
						<form id="ask-question">
				      
				          <div class="form-group">
				            <label for="recipient-name" class="col-form-label">글쓴이</label>
				            <input type="text" class="form-control" name ="qna-name" id="name" value="${loginMember.principal.nickName }" placeholder="${loginMember.principal.nickName }" readonly>
				           
				          </div>
				          <div class="form-group">
				            <label for="message-text" class="col-form-label">내용</label>
				            <textarea class="form-control" id="message-text" name="content"></textarea>
				          </div>
				          <div class="form-group">
				            <label for="qna-password" class="col-form-label">비밀번호</label>
				            <input type="password" class="form-control" id="qna-password" name="password">
				          </div>
				            <div class="form-group">
				            <label for="qna-status" >공개여부</label>
				            <input type="radio" name = "status" class="form-control" style="width: 200px;" id="qna-status" value="checked ? false:true">
				          </div>
		   				 	<input type="hidden" name = "email" value="${loginMember.principal.memberEmail }" />
		   				 	
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		   			  <input class="primary-btn" value = "전송" type="submit" onclick="ask();" 
		   					style="float:right; margin-right:10px; letter-spacing: 2px;" 
		   					name="spaceNo"
		   					value="${ space.spaceNo }">
				        
				      </div>
				    </div>
				  </div>
				</div>
				   			<div class="review d-flex">
   				
		   		<div class="desc">
		   			<h4>
		   				<span class="text-left">질문자 닉네임</span>
		   				<span class="text-right">14 March 2018</span>
		   			</h4>
		   			<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
		   		</div>
		   
		   	</div>
   			<div class="review d-flex" style="padding: 15px;">
		   		<div class="desc" style="background-color:#f7f7f7; padding:5px">
		   			<h4>
		   				<span class="text-left"><i class="mdi mdi-subdirectory-arrow-right"></i>&nbsp;방 이름</span>
		   				<span class="text-right">14 March 2018</span>
		   			</h4>
		   			<p style="padding-left:15px">답변내용답변내용답변내용답변내용답변내용답변내용</p>
		   		</div>
		   	</div>
		   	<div class="review d-flex">
		   		<div class="desc">
		   			<h4>
		   				<span class="text-left">Jacob Webb</span>
		   				<span class="text-right">14 March 2018</span>
		   			</h4>
		   			<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
		   		</div>
		   	</div>
		   	<div class="review d-flex">
		   		<div class="desc">
		   			<h4>
		   				<span class="text-left">Jacob Webb</span>
		   				<span class="text-right">14 March 2018</span>
		   			</h4>
		   			<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
		   		</div>
		   	</div>
   		</div>
   		</div>
   		</div>
<!-- qna끝 -->

<!-- 리뷰 시작-->
   <div class="tab-pane fade" id="detail-review" role="tabpanel" aria-labelledby="detail-review-tab">
     <div class="row">
   		<div class="col-md-7">
   		<div class="row">
   			<h3 class="head ml-4">${ reviewTotal }개의 리뷰</h3>
   			<div class="btn-group btn-group-toggle" data-toggle="buttons">
			  <label class="btn btn-secondary active reviewLabel" >
			    <a id="option1"><input type="radio" name="options" autocomplete="off" checked>포토리뷰 OFF</a>
			  </label>
			  <label class="btn btn-secondary reviewLabel">
			    <a id="option2"><input type="radio" name="options" autocomplete="off">포토리뷰 ON</a>
			  </label>
			</div>
   		</div>
		 <c:forEach items="${review}" var="review" varStatus="vs">
		 <c:choose>
			<c:when test="${ review.image != null }">
   			<div class="review d-flex">
		   		<div class="desc">
		   			<h4>
		   				<span class="text-left">${ review.nickName }</span>
		   				<span class="text-right"><fmt:formatDate value="${review.enrollDate}" pattern="yyyy-MM-dd"/></span>
		   			</h4>
		   			<p class="star">
		   				<span>
		   					<c:forEach begin="1" end="${ review.starRating }">
			   					<i class="ion-ios-star"></i>
		   					</c:forEach>
	   					</span>
	   					<sec:authorize access="hasAnyRole('USER','HOST','ADMIN')">
	   					<sec:authentication property="principal.username" var="loginMember"/>
	   					<c:if test="${loginMember != null && loginMember eq space.memberEmail }">
	   						<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
		   				</c:if>
		   				</sec:authorize>
		   			</p>
		   			<div class="reviewToggle">
			   			<div class="row reviewDetailBtn" style="cursor: pointer;">
				   			<div style="background-image: url(${pageContext.request.contextPath}/resources/upload/review/${review.image}); background-size: cover; width:110px; height: 100px;margin-left: 10px;"></div>
				   			<p style="position: absolute; margin:0 85px 0 135px; overflow: hidden; text-overflow: ellipsis; width:60%; -webkit-box-orient: vertical;-webkit-line-clamp: 3;display: -webkit-box;">${ review.content }</p>
							<p style="margin: 75px 0 0 15px; font-weight: 600;" class="detailBtn">더보기</p>
			   			</div>
			   			<div class="reviewSimpleBtn" style="cursor: pointer; display:none; height: 100%">
				   			<p>${ review.content }</p>
							<p style="font-weight: 600;" class="simpleBtn">접기</p>
				   			<div style="background-image: url(${pageContext.request.contextPath}/resources/upload/review/${review.image});  width: 500px;height: 350px;background-size: cover;"></div>
			   			</div>
		   			</div>
		   		</div>
		   	</div>
			</c:when>
			<c:otherwise>
   			<div class="review nullImg">
		   		<div class="desc nullImg">
		   			<h4>
		   				<span class="text-left">${ review.nickName }</span>
		   				<span class="text-right"><fmt:formatDate value="${review.enrollDate}" pattern="yyyy-MM-dd"/></span>
		   			</h4>
		   			<p class="star">
		   				<span>
		   					<c:forEach begin="1" end="${ review.starRating }">
			   					<i class="ion-ios-star"></i>
		   					</c:forEach>
	   					</span>
	   					<sec:authorize access="hasAnyRole('USER','HOST','ADMIN')">
	   					<sec:authentication property="principal.username" var="loginMember"/>
	   					<c:if test="${loginMember != null && loginMember eq space.memberEmail }">
	   					<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
	   					</c:if>
	   					</sec:authorize>
		   			</p>
		   			<div class="reviewToggle">
		   			<div class="row reviewDetailBtn" style="cursor: pointer;">
		   				<p style="position: absolute; margin:0 85px 0 15px; overflow: hidden; text-overflow: ellipsis; width:80%; -webkit-box-orient: vertical;-webkit-line-clamp: 3;display: -webkit-box;">${ review.content }</p>
						<p style="margin: 75px 0 0 15px; font-weight: 600;" class="detailBtn">더보기</p>
		   			</div>
		   			
		   			<div class="reviewSimpleBtn" style="cursor: pointer; display:none; height: 100%">
		   				<p>${ review.content }</p>
						<p style="font-weight: 600;" class="simpleBtn">접기</p>
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
   		
   		<div class="col-md-5">
   			<div class="rating-wrap">
	   			<h3 class="head">별점 순</h3>
	   			<div class="wrap">
		   			<p class="star">
			   			<fmt:parseNumber var="star5" value="${ star.star5/star.sumStar*100 }" integerOnly="true" />
			   			<fmt:parseNumber var="star4" value="${ star.star4/star.sumStar*100 }" integerOnly="true" />
			   			<fmt:parseNumber var="star3" value="${ star.star3/star.sumStar*100 }" integerOnly="true" />
			   			<fmt:parseNumber var="star2" value="${ star.star2/star.sumStar*100 }" integerOnly="true" />
			   			<fmt:parseNumber var="star1" value="${ star.star1/star.sumStar*100 }" integerOnly="true" />
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					(${ star5 }%)
	   					</span>
	   					<span>${ star.star5 } Reviews</span>
		   			</p>
		   			<p class="star">
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					(${ star4 }%)
	   					</span>
	   					<span>${ star.star4 } Reviews</span>
		   			</p>
		   			<p class="star">
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					(${ star3 }%)
	   					</span>
	   					<span>${ star.star3 } Reviews</span>
		   			</p>
		   			<p class="star">
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					(${ star2 }%)
	   					</span>
	   					<span>${ star.star2 } Reviews</span>
		   			</p>
		   			<p class="star">
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					(${ star1 }%)
	   					</span>
	   					<span>${ star.star1 } Reviews</span>
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
        <h2 class="mb-2">다른 카페(은/는) 어떠신가요?</h2>
      </div>
    </div>
    <div class="row">
    	<div class="col-md-4">
    		<div class="property-wrap ftco-animate">
    			<a href="" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/images/work-1.jpg);"></a>
    			<div class="text">
    				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
    				<ul class="property_list">
    					<li><span class="flaticon-bed"></span>3</li>
    					<li><span class="flaticon-bathtub"></span>2</li>
    					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
    				</ul>
    				<h3><a href="${pageContext.request.contextPath }/space/spaceDetail.do">The Blue Sky Home</a></h3>
    				<span class="location">Oakland</span>
    				<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
    					<span class="ion-ios-link"></span>
    				</a>
    			</div>
    		</div>
    	</div>
    	<div class="col-md-4">
    		<div class="property-wrap ftco-animate">
    			<a href="#" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/images/work-2.jpg);"></a>
    			<div class="text">
    				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
    				<ul class="property_list">
    					<li><span class="flaticon-bed"></span>3</li>
    					<li><span class="flaticon-bathtub"></span>2</li>
    					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
    				</ul>
    				<h3><a href="#">The Blue Sky Home</a></h3>
    				<span class="location">Oakland</span>
    				<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
    					<span class="ion-ios-link"></span>
    				</a>
    			</div>
    		</div>
    	</div>
    	<div class="col-md-4">
    		<div class="property-wrap ftco-animate">
    			<a href="#" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/images/work-3.jpg);"></a>
    			<div class="text">
    				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
    				<ul class="property_list">
    					<li><span class="flaticon-bed"></span>3</li>
    					<li><span class="flaticon-bathtub"></span>2</li>
    					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
    				</ul>
    				<h3><a href="#">The Blue Sky Home</a></h3>
    				<span class="location">Oakland</span>
    				<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
    					<span class="ion-ios-link"></span>
    				</a>
    			</div>
    		</div>
    	</div>
    </div>
	</div>

    <!-- 추천시스템 끝 -->
<script>
function ask(){
	$("#ask-question").attr("action", 
	"${ pageContext.request.contextPath}/qna/insertQna.do")
	.attr("method", "POST")
	.submit();
}

/* 예약버튼 */
function rvSubmit() {
	$("#reserveFrm").attr("action", "${ pageContext.request.contextPath }/space/reserveSpace.do")
					.submit();
}


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
</script>
<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
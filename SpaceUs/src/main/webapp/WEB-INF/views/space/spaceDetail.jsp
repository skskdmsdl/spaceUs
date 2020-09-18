<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="https://codepen.io/shshaw/pen/QmZYMG.js"></script>
<link href="https://cdn.materialdesignicons.com/5.5.55/css/materialdesignicons.min.css" rel="stylesheet">

<style>
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 30%;
  width: auto;
  padding: 30px;
  color: white;
  font-weight: bold;
  font-size: 30px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

.next {margin-right: 16px}
.prev, .next {color:white !important;}
.next {right: 0; border-radius: 3px 0 0 3px;}
.prev:hover, .next:hover {opacity: 0.3;}
.far, .fas {color:black; font-size:25px;}
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
		if($("#heart-a").html() == '<i class="far fa-heart"></i>') {
			$("#heart-a").html("<i class='fas fa-heart'></i>");
		}
		else if($("#heart-a").html() == '<i class="fas fa-heart"></i>') {
			$("#heart-a").html("<i class='far fa-heart'></i>");
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
	   						<input type="hidden" name="" />
      					</form>
      				</div>
      					<span class="subheading">카페</span>
      					<h2>The Blue Sky Home
      					</h2>
      					<br />
      					<span class="subheading">
			              <div class="tagcloud">
			                <a href="#" class="tag-cloud-link">#감성적인</a>
			                <a href="#" class="tag-cloud-link">#바다가 보이는</a>
			                <a href="#" class="tag-cloud-link">#조용한</a>
			                <a href="#" class="tag-cloud-link">#힐링</a>
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
    <p>공간설명 1</p>
    <p>공간설명 2</p>
   </div>
 <!-- 공간설명 끝-->
 
<!-- 공간옵션시작 -->
   <div class="tab-pane fade show active" id="detail-description" role="tabpanel" aria-labelledby="detail-description-tab">
   	<div class="row">
   		<div class="col-md-4">
   			<ul class="features">
   				<li class="check"><span class="ion-ios-checkmark"></span>Lot Area: 1,250 SQ FT</li>
   				<li class="check"><span class="ion-ios-checkmark"></span>Bed Rooms: 4</li>
   				<li class="check"><span class="ion-ios-checkmark"></span>Bath Rooms: 4</li>
   			</ul>
   		</div>
   		<div class="col-md-4">
   			<ul class="features">
   				<li class="check"><span class="ion-ios-checkmark"></span>Floor Area: 1,300 SQ FT</li>
   				<li class="check"><span class="ion-ios-checkmark"></span>Year Build:: 2019</li>
   				<li class="check"><span class="ion-ios-checkmark"></span>Water</li>
   			</ul>
   		</div>
   		<div class="col-md-4">
   			<ul class="features">
   				<li class="check"><span class="ion-ios-checkmark"></span>Floor Area: 1,300 SQ FT</li>
   				<li class="check"><span class="ion-ios-checkmark"></span>Year Build:: 2019</li>
   				<li class="check"><span class="ion-ios-checkmark"></span>Water</li>
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
                  <p>경기도 파주시 금바위로</p>
              </div>
          </div>
          <div class="ci-item">
              <div class="ci-icon">
                  <i class="fa fa-mobile"></i>
              </div>
              <div class="ci-text">
                  <h5>문의전화</h5>
                  <ul>
                      <li>125-711-811</li>
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
   			<h3 class="head">23개의 리뷰</h3>
   			<div class="review d-flex">
		   		<div class="desc">
		   			<h4>
		   				<span class="text-left">Jacob Webb</span>
		   				<span class="text-right">14 March 2018</span>
		   			</h4>
		   			<p class="star">
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
	   					</span>
	   					<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
		   			</p>
		   			<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
		   		</div>
		   	</div>
		   	<div class="review d-flex">
		   		<div class="desc">
		   			<h4>
		   				<span class="text-left">Jacob Webb</span>
		   				<span class="text-right">14 March 2018</span>
		   			</h4>
		   			<p class="star">
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
	   					</span>
	   					<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
		   			</p>
		   			<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
		   		</div>
		   	</div>
		   	<div class="review d-flex">
		   		<div class="desc">
		   			<h4>
		   				<span class="text-left">Jacob Webb</span>
		   				<span class="text-right">14 March 2018</span>
		   			</h4>
		   			<p class="star">
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
	   					</span>
	   					<span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
		   			</p>
		   			<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
		   		</div>
		   	</div>
   		</div>
   		<div class="col-md-5">
   			<div class="rating-wrap">
	   			<h3 class="head">별점 순</h3>
	   			<div class="wrap">
		   			<p class="star">
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					(98%)
	   					</span>
	   					<span>20 Reviews</span>
		   			</p>
		   			<p class="star">
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					(85%)
	   					</span>
	   					<span>10 Reviews</span>
		   			</p>
		   			<p class="star">
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					(70%)
	   					</span>
	   					<span>5 Reviews</span>
		   			</p>
		   			<p class="star">
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					<i class="ion-ios-star"></i>
		   					(10%)
	   					</span>
	   					<span>0 Reviews</span>
		   			</p>
		   			<p class="star">
		   				<span>
		   					<i class="ion-ios-star"></i>
		   					(0%)
	   					</span>
	   					<span>0 Reviews</span>
		   			</p>
		   		</div>
	   		</div>
	   		<br />
   			<div class="rating-wrap">
	   			<h3 class="head">포토리뷰</h3>
	   			<div class="wrap">
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
      <div class="col-md-12 heading-section text-center ftco-animate mb-5">
      	<span class="subheading">카테고리 추천</span>
        <h2 class="mb-2">카페를 찾고 계신가요?</h2>
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
</section>
    <!-- 추천시스템 끝 -->
<script>
/* 예약버튼 */
function rvSubmit() {
/* 	$("#reserveFrm").attr("action", "${ pageContext.request.contextPath }/space/reserve?no=" + no) */
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

</script>
<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
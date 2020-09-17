<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="https://codepen.io/shshaw/pen/QmZYMG.js"></script>

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

.next {
margin-right: 16px
}
.prev, .next {
color:white !important;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  opacity: 0.3;
}

.far, .fas {
	color:black;
	font-size:25px;
}

a:hover {
  opacity: 0.3;
  color:black;
}


/* Fading animation */
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

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>
<script>
$(function(){
    $('[data-toggle="popover"]').popover();   
    
	$("#heart-a").click(function(){
		if($("#heart-a").html() == '<i class="far fa-heart"></i>') {
			$("#heart-a").html("<i class='fas fa-heart'></i>");
		}
		else if($("#heart-a").html() == '<i class="fas fa-heart"></i>') {
			$("#heart-a").html("<i class='far fa-heart'></i>");
		}
	});
});
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
					          title="공유하기" data-html="true"
					       data-content='카카오톡, 트위터, 페이스북 공유<hr /><input type="text"/><button>url복사</button>'>
					       <i class="far fa-share-square"></i>
					       </a>
      				<!-- 공유하기 팝오버 끝-->
					    <input type="submit" value="예약하기" class="btn py-3 px-5 btn-primary" style="margin-left: 70px">
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
      	<div class="row">
      		<div class="col-md-12 pills">
						<div class="bd-example bd-example-tabs">
							<div class="d-flex justify-content-center">
							  <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

							    <li class="nav-item">
							      <a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill"
							      	 href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer"
							      	 aria-expanded="true">공간설명</a>
							    </li>
							    <li class="nav-item">
							      <a class="nav-link active" id="pills-description-tab" data-toggle="pill"
							      	 href="#pills-description" role="tab" aria-controls="pills-description"
							      	 aria-expanded="true">공간옵션</a>
							    </li>
							    <li class="nav-item">
							      <a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill"
							      	 href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer"
							      	 aria-expanded="true">호스트정보</a>
							    </li>
							    <li class="nav-item">
							      <a class="nav-link" id="pills-review-tab" data-toggle="pill"
							      	 href="#pills-review" role="tab" aria-controls="pills-review"
							      	 aria-expanded="true">리뷰</a>
							    </li>
							   
							  </ul>
							</div>

						  <div class="tab-content" id="pills-tabContent">
						    <div class="tab-pane fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab">
						    	<div class="row">
						    		<div class="col-md-4">
						    			<ul class="features">
						    				<li class="check"><span class="ion-ios-checkmark"></span>Lot Area: 1,250 SQ FT</li>
						    				<li class="check"><span class="ion-ios-checkmark"></span>Bed Rooms: 4</li>
						    				<li class="check"><span class="ion-ios-checkmark"></span>Bath Rooms: 4</li>
						    				<li class="check"><span class="ion-ios-checkmark"></span>Luggage</li>
						    				<li class="check"><span class="ion-ios-checkmark"></span>Garage: 2</li>
						    			</ul>
						    		</div>
						    		<div class="col-md-4">
						    			<ul class="features">
						    				<li class="check"><span class="ion-ios-checkmark"></span>Floor Area: 1,300 SQ FT</li>
						    				<li class="check"><span class="ion-ios-checkmark"></span>Year Build:: 2019</li>
						    				<li class="check"><span class="ion-ios-checkmark"></span>Water</li>
						    				<li class="check"><span class="ion-ios-checkmark"></span>Stories: 2</li>
						    				<li class="check"><span class="ion-ios-checkmark"></span>Roofing: New</li>
						    			</ul>
						    		</div>
						    		<div class="col-md-4">
						    			<ul class="features">
						    				<li class="check"><span class="ion-ios-checkmark"></span>Floor Area: 1,300 SQ FT</li>
						    				<li class="check"><span class="ion-ios-checkmark"></span>Year Build:: 2019</li>
						    				<li class="check"><span class="ion-ios-checkmark"></span>Water</li>
						    				<li class="check"><span class="ion-ios-checkmark"></span>Stories: 2</li>
						    				<li class="check"><span class="ion-ios-checkmark"></span>Roofing: New</li>
						    			</ul>
						    		</div>
						    	</div>
						    </div>

						    <div class="tab-pane fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-manufacturer-tab">
						      <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
									<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
						    </div>
						    
						    <div class="tab-pane fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
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
							   		</div>
							   	</div>
						    </div>
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


</script>
<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	  integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	  crossorigin="anonymous">
<style>
h1 {
font-family: 'NEXON Lv1 Gothic OTF';
}

@import url(https://fonts.googleapis.com/css?family=Lato:100,300,400,700);
@import url(https://raw.github.com/FortAwesome/Font-Awesome/master/docs/assets/css/font-awesome.min.css);

#wrap {
  /* margin: 50px 78px; */
  top: 2em;
  display: inline-block;
  position: relative;
  height: 60px;
  flaot: left;
  padding: 0;
  position: relative;
}


input[type="text"] {
  height: 40px;
  font-size: 20px;
  display: inline-block;
  font-family: "NEXON Lv1 Gothic OTF";
  font-weight: 100;
  border: none;
  outline: none;
  color: black;
  padding: 3px;
  padding-right: 60px;
  padding-left: 60px;
  width: 0px;
  position: absolute;
  top: 0;
  right: 0;
  background: none;
  z-index: 3;
  transition: .4s cubic-bezier(0.5, 0.795, 0.5, 0.50);
  cursor: pointer;
}

#search_keyword {
	color: black;
}

#search_keyword:focus:hover {
  border-bottom: 1px solid black;
}

input[type="text"]:focus {
  width: 400px;
  z-index: 1;
  border-bottom: 1px solid black;
  cursor: text;
  left: -180px;
  top: 55px;
  text-align: center;
}

#search_submit:hover {
  opacity: 0.8;
}
.space-price{
  color: #007bff;
}

</style>
<!-- 컨텐츠 시작 -->
<!-- FAQ검색 시작 -->
<div class="hero-wrap ftco-degree-bg"
	 style="background-image: url('${pageContext.request.contextPath }/resources/images/bg_3.jpg');
	 		height: 600px;"
	 data-stellar-background-ratio="0.5">
	<div class="overlay">
	</div>
  	<div class="container">
    	<div class="row no-gutters slider-text justify-content-center align-items-center">
      		<div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
      			<div class="text text-center mx-auto" style="margin-bottom:25%;">
          			<h1 class="mb-4">FAQs</h1>
          			<p></p>
     					<div style="margin-top:-20px">
     						<div id="wrap">
							  <form id="searchFrm" action="" autocomplete="on">
							  <input id="search_keyword" name="search_keyword" type="text" placeholder="검색어를 입력해주세요.">
							  <i class="fas fa-search fa-2x" id="search_submit" type="submit" style="color:#00C89E"></i>
							  </form>
							</div>
         				</div>
       			</div>
     		</div>
   		</div>
	  	<div class="mouse">
			<a href="#" class="mouse-icon">
				<div class="mouse-wheel"><span class="ion-ios-arrow-round-down"></span></div>
			</a>
		</div>
	</div>
</div>
<!-- FAQ검색 끝 -->
<div class="w-75 mx-auto mt-5 mb-5">
<!-- 사용법 목록 시작 -->
    <section class="ftco-no-pt mb-5">
      <div class="container">
        <div class="row justify-content-center mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">목록으로 사용법을 찾아보세요</span>
            <h2>사용법 목록</h2>
          </div>
        </div>

        <div class="row d-flex">
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <div class="block-20 img" 
                	 style="background-image: url('${pageContext.request.contextPath }/resources/images/icons/icon1.PNG');">
	              </div>
                <h3 class="heading text-center">회원</h3>
                <p class="text-center">회원등록, 회원탈퇴, 회원정보 수정 방법을<br>알 수 있습니다.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <div class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/icons/icon2.PNG');">
	              </div>
                <h3 class="heading text-center">예약</h3>
                <p class="text-center">예약 방법, 예약 변경, 예약 취소 방법을<br>알 수 있습니다.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <div class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/icons/icon3.PNG');">
	              </div>
                <h3 class="heading text-center">공간 등록</h3>
                <p class="text-center">공간등록 방법, 호스트 계정에 대해<br>알 수 있습니다.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <div class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/icons/icon4.PNG');">
	              </div>
                <h3 class="heading text-center">리뷰</h3>
                <p class="text-center">리뷰등록, 리뷰수정, 리뷰삭제 방법에 대해<br>알 수 있습니다.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>	
<!-- 사용법 목록 끝-->
<!-- FAQ목차 시작 -->
<!-- nav 탭 -->
<section class="ftco-section goto-here">
<ul class="nav nav-tabs" id="myTab" role="tablist">
	<li class="nav-item" role="presentation">
		<a class="nav-link active" id="member-tab" data-toggle="tab" href="#member" role="tab" aria-controls="member" aria-selected="true">회원</a>
	</li>
	<li class="nav-item" role="presentation">
		<a class="nav-link" id="reserve-tab" data-toggle="tab" href="#reserve" role="tab" aria-controls="reserve" aria-selected="false">예약</a>
	</li>
	<li class="nav-item" role="presentation">
		<a class="nav-link" id="space-tab" data-toggle="tab" href="#space" role="tab" aria-controls="space" aria-selected="false">공간등록</a>
	</li>
	<li class="nav-item" role="presentation">
		<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">리뷰</a>
	</li>
</ul>
</section>
<!-- 탭 내용 -->
<div class="tab-content" id="myTabContent">
  <!-- 1.회원 -->
  <div class="tab-pane fade show active" id="member" role="tabpanel" aria-labelledby="member-tab">
	<div class="accordion w-auto mb-5" id="accordionMember">
	  <div class="card">
	    <div class="card-header" id="headingOne">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	          	회원가입은 어떻게 하나요?
	        </button>
	      </h2>
	    </div>
	    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionMember">
	      <div class="card-body">
	        	홈페이지 첫화면 오른쪽 상단에 회원가입을 누르시면 가입 페이지로 넘어갑니다.<br>
	        	양식에 맞춰 작성해주세요. 인증이 완료 되시면 회원가입에 성공하실겁니다.
	      </div>
	    </div>
	  </div>

	  <div class="card">
	    <div class="card-header" id="headingTwo">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	          	회원탈퇴를 하고 싶습니다.
	        </button>
	      </h2>
	    </div>
	    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionMember">
	      <div class="card-body">
	        	로그인을 하신 후 마이페이지에 회원탈퇴 버튼을 통해 탈퇴하실 수 있습니다.<br>
	        	개인정보는 탈퇴와 동시에 삭제됨을 알려드립니다.<br>
	        	탈퇴는 신중히 진행해주세요.
	      </div>
	    </div>
	  </div>

	  <div class="card">
	    <div class="card-header" id="headingThree">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
	        	닉네임을 바꾸고 싶은데 어떻게 하나요?
	        </button>
	      </h2>
	    </div>
	    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionMember">
	      <div class="card-body">
	        	로그인을 하신 후 마이페이지를 통해 닉네임을 수정하실 수 있습니다.<br>
	        	동일한 방법으로 닉네임뿐 아니라 개인정보 수정도 가능합니다.
	      </div>
	    </div>
	  </div>
	</div>
  </div>
  <!-- 2.예약 -->
  <div class="tab-pane fade" id="reserve" role="tabpanel" aria-labelledby="reserve-tab">
  	<div class="accordion w-auto mb-5" id="accordionReserve">
	  <div class="card">
	    <div class="card-header" id="headingOne1">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
	          	예약은 어떻게 하나요?
	        </button>
	      </h2>
	    </div>
	    <div id="collapseOne1" class="collapse show" aria-labelledby="headingOne1" data-parent="#accordionReserve">
	      <div class="card-body">
	        	원하는 공간을 선택하세요!<br>
	        	원하는 시간을 선택하세요!<br>
	        	결제를 완료하시면 예약이 완료됩니다.
	      </div>
	    </div>
	  </div>

	  <div class="card">
	    <div class="card-header" id="headingTwo2">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2">
	          	결제는 어떻게 되나요?
	        </button>
	      </h2>
	    </div>
	    <div id="collapseTwo2" class="collapse" aria-labelledby="headingTwo2" data-parent="#accordionReserve">
	      <div class="card-body">
	        	결제는 카카오페이와 신용카드 두가지를 제공하고 있습니다.<br>
	        	예약하기를 진행하시면 결제가 진행됩니다.
	      </div>
	    </div>
	  </div>

	  <div class="card">
	    <div class="card-header" id="headingThree3">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree3" aria-expanded="false" aria-controls="collapseThree3">
	        	예약을 취소하고 싶어요
	        </button>
	      </h2>
	    </div>
	    <div id="collapseThree3" class="collapse" aria-labelledby="headingThree3" data-parent="#accordionReserve">
	      <div class="card-body">
	        	로그인 후 마이페이지 > 예약내역에 가셔서 취소하실 수 있습니다.<br>
	        	예약은 하루 또는 이틀 전까지만 취소가 가능합니다.
	      </div>
	    </div>
	  </div>
	</div>
  </div>
  <!-- 3.공간등록 -->
  <div class="tab-pane fade" id="space" role="tabpanel" aria-labelledby="space-tab">
    <div class="accordion w-auto mb-5" id="accordionSpace">
	  <div class="card">
	    <div class="card-header" id="headingOne11">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne11" aria-expanded="true" aria-controls="collapseOne11">
	          	공간을 등록하고 싶어요
	        </button>
	      </h2>
	    </div>
	    <div id="collapseOne11" class="collapse show" aria-labelledby="headingOne11" data-parent="#accordionSpace">
	      <div class="card-body">
	        	우선 회원가입을 해주세요<br>
	        	회원가입후 공간등록하기를 진행해주시면<br>
	        	관리자가 확인후 승인해드립니다.
	      </div>
	    </div>
	  </div>
	</div>
  </div>
  <!-- 4.리뷰 -->
  <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
    <div class="accordion w-auto mb-5" id="accordionReview">
	  <div class="card">
	    <div class="card-header" id="headingOne111">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne111" aria-expanded="true" aria-controls="collapseOne111">
	          	리뷰 작성을 어떻게 하나요?
	        </button>
	      </h2>
	    </div>
	    <div id="collapseOne111" class="collapse show" aria-labelledby="headingOne111" data-parent="#accordionReview">
	      <div class="card-body">
	        	리뷰는 예약 후 사용이 완료된 고객만 작성가능합니다.<br>
	        	별점과 사진 첨부가 가능합니다.<br>
	        	리뷰를 작성해서 다른 사용자에게 도움을 주세요.
	      </div>
	    </div>
	  </div>

	  <div class="card">
	    <div class="card-header" id="headingTwo222">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo222" aria-expanded="false" aria-controls="collapseTwo222">
	          	리뷰 댓글을 못쓰나요?
	        </button>
	      </h2>
	    </div>
	    <div id="collapseTwo222" class="collapse" aria-labelledby="headingTwo222" data-parent="#accordionReview">
	      <div class="card-body">
	        	리뷰댓글은 해당 공간의 호스트만 작성가능합니다.<br>
	        	배달어플에 사장님이 리뷰에 댓글다는 것을 생각하면 쉽게 이해되실 겁니다.
	      </div>
	    </div>
	  </div>
	</div>
  </div>
</div>


</div>
<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
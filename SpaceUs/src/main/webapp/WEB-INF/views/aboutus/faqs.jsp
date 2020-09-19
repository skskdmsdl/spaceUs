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


<!-- 사용자작성 css -->
<style>
h1 {
font-family: 'NEXON Lv1 Gothic OTF';
}
@import url(https://fonts.googleapis.com/css?family=Lato:100,300,400,700);
@import url(https://raw.github.com/FortAwesome/Font-Awesome/master/docs/assets/css/font-awesome.min.css);
#wrap {
  margin: 50px 78px;
  display: inline-block;
  position: relative;
  height: 60px;
  float: right;
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
</style>
<!-- 컨텐츠 시작 -->
<!-- FAQ검색 시작 -->
<div class="hero-wrap ftco-degree-bg"
	 style="background-image: url('${pageContext.request.contextPath }/resources/images/bg_3.jpg');
	 		height: 600px"
	 data-stellar-background-ratio="0.5">
	<div class="overlay">
	</div>
  	<div class="container">
    	<div class="row no-gutters slider-text justify-content-center align-items-center">
      		<div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
      			<div class="text text-center mx-auto" style="margin-bottom:25%;">
          			<h1 class="mb-4">FAQs</h1>
          			<p></p>
     					<div class="col-lg-10 align-items-end" style="margin-top:-20px">
     						<div id="wrap">
							  <form id="searchFrm" action="" autocomplete="on">
							  <input id="search_keyword" name="search_keyword" type="text" placeholder="검색어를 입력해주세요. ex)예약하는 방법 ">
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
                <a href="blog-single.html" class="block-20 im" style="background-image: url('${pageContext.request.contextPath }/resources/images/icon1.PNG');">
	              </a>
                <h3 class="heading text-center"><a href="#">회원</a></h3>
                <p class="text-center">회원등록, 회원탈퇴, 회원정보 수정 방법을<br>알 수 있습니다.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <a href="blog-single.html" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/icon2.PNG');">
	              </a>
                <h3 class="heading text-center"><a href="#">예약</a></h3>
                <p class="text-center">예약 방법, 예약 변경, 예약 취소 방법을<br>알 수 있습니다.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <a href="blog-single.html" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/icon3.PNG');">
	              </a>
                <h3 class="heading text-center"><a href="#">공간 등록</a></h3>
                <p class="text-center">공간등록 방법, 호스트 계정에 대해<br>알 수 있습니다.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <a href="blog-single.html" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/icon4.PNG');">
	              </a>
                <h3 class="heading text-center"><a href="#">리뷰</a></h3>
                <p class="text-center">리뷰등록, 리뷰수정, 리뷰삭제 방법에 대해<br>알 수 있습니다.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>	
<!-- 사용법 목록 끝-->
<!-- FAQ목차 시작 -->
	<div class="accordion w-auto mb-5" id="accordionExample">
	  <div class="card">
	    <div class="card-header" id="headingOne">
	      <h2 class="mb-0">
	        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	          	회원가입은 어떻게 하나요?
	        </button>
	      </h2>
	    </div>
	    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
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
	    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
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
	    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
	      <div class="card-body">
	        	로그인을 하신 후 마이페이지를 통해 닉네임을 수정하실 수 있습니다.<br>
	        	동일한 방법으로 닉네임뿐 아니라 개인정보 수정도 가능합니다.
	      </div>
	    </div>
	  </div>
	</div>

</div>
<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
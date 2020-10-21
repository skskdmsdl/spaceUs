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

<!-- test -->
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
.main_title_2 span {
    width: 120px;
    height: 2px;
    background-color: #e1e1e1;
    display: block;
    margin: auto;
}

.main_title_2 span em {
    width: 60px;
    height: 2px;
    background-color: #00C89E;
    display: block;
    margin: auto;
</style>
<!-- 컨텐츠 시작 -->
<!-- 헤더시작 -->
<div class="hero-wrap ftco-degree-bg"
	 style="background-image: url('${pageContext.request.contextPath }/resources/images/bg_3.jpg');
	 		height: 400px"
	 data-stellar-background-ratio="0.5">
	<div class="overlay">
	</div>
  	<div class="container">
    	<div class="row no-gutters slider-text justify-content-center align-items-center">
      		<div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
      			<div class="text text-center mx-auto" style="margin-bottom:50%;">
          			<h1 class="mb-4">About SpaceUs</h1>
          			<p></p>
       			</div>
     		</div>
   		</div>
	</div>
</div>
<!-- 헤더 끝 -->
<!-- spaceus 소개 시작 -->
<div class="w-75 mx-auto mt-5 mb-5">
    <section class="ftco-no-pt mb-5">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
          	<div class="text">
                <a href="${pageContext.request.contextPath }/" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/icons/icon1.PNG');">
	              </a>
                <h3 class="heading text-center"><a href="#">1000명 이상의 고객</a></h3>
                <p class="text-center">많은 고객분들이 저희 SpaceUs의 <br>공간예약 서비스를 이용하고 있습니다.</p>
              </div>
            </div>
            </div>
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <a href="${pageContext.request.contextPath }/exhibition/exhibition.do" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/icons/icon3.PNG');">
	              </a>
                <h3 class="heading text-center"><a href="#">500개 이상의 숙소</a></h3>
                <p class="text-center">500개 이상의 공간 정보를 가지고 있습니다.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <a class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/icons/icon2.PNG');">
	              </a>
                <h3 class="heading text-center"><a href="#">공간 등록</a></h3>
                <p class="text-center">높은 보안의 결제 시스템을 이용하여<br>안전한 결제 시스템을 제공하고 있습니다.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <a class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/icons/icon4.PNG');">
	              </a>
                <h3 class="heading text-center"><a href="#">편리한 채팅상담</a></h3>
                <p class="text-center">문의 사항은 채팅 상담을 이용하여<br>빠르게 문의사항을 해결 할 수 있습니다.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    </div>
<!-- spaceus 소개 끝-->
<!-- spaceus 이야기 시작 -->

<section class="ftco-section ftco-no-pb">
	<div class="container">
        <div class="row justify-content-center mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
          <div class="main_title_2">
			<span><em></em></span>
			<br />
            	<h2>SpaceUs 이야기</h2>
			</div>
          </div>
        </div>
		<div class="row no-gutters">
			<div class="col-md-6 p-md-5 img img-2 d-flex justify-content-center align-items-center"
				 style="background-image: url(${pageContext.request.contextPath }/resources/images/spaceustheme.jpeg);">
			</div>
				<div class="col-md-6 wrap-about py-md-5 ftco-animate">
	         <div class="heading-section p-md-5">
	           <p><strong><font size="3em" color="#00C89E">TMI(Too Much Idea)는</font></strong> '가성비와 취향을 동시에 잡자'라는 목표로 공간공유 서비스 SpaceUs를 기획했습니다. 부담스러운 부동산 비용, 그로 인해 점점 더 팍팍해지는 물가. 하지만 SpaceUs는 남다름을 추구하는 우리 세대들의 섬세한 취향과 비용절감이라는 두마리 토끼를 잡을 공간이 될 것이라 믿어 의심치 않습니다.</p>
	           <p><strong><font size="2.5em">2020년 9월 2일 첫 기획 미팅으로부터 10월 23일까지,</font></strong> 프로젝트 구현을 위해 천 개가 넘는 커밋과 180여 시간의 회의를 하며 쉼없이 달리는 동안 저희는 많은 아이디어를 나누고 많이 웃었습니다. SpaceUs를 만들면서 쏟은 노력과 즐거운 시간들이 여러분에게도 전해졌으면 좋겠습니다.</p>
	         </div>
				</div>
		</div>
	</div>
</section>
<!-- spaceus 이야기 끝 -->
<!-- 팀소개 시작 -->
<section class="ftco-section testimony-section">
      <div class="container">
             <div class="row justify-content-center mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
          <div class="main_title_2">
			<span><em></em></span>
			<br />
            	<h2>TMI 팀 소개</h2>
			</div>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(${pageContext.request.contextPath }/resources/images/memberj.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">조은이</p>
		                    <span class="position">팀장</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(${pageContext.request.contextPath }/resources/images/memberl.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">이은호</p>
		                    
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(${pageContext.request.contextPath }/resources/images/members.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">김승연</p>
		                    
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="text">
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(${pageContext.request.contextPath }/resources/images/membery.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">김양희</p>
		                    
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
<!-- 팀소개 끝-->


<!-- 컨텐츠 끝 -->
<script>$(function () { memberId();});</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
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
          			<h1 class="mb-4">Contact</h1>
          			<p></p>
       			</div>
     		</div>
   		</div>
	</div>
</div>
<!-- 헤더 끝 -->
<section class="ftco-section contact-section">
    <div class="container">
      <div class="row d-flex mb-5 contact-info justify-content-center" style="padding-top:0px">
      	<div class="col-md-8">
      		<div class="row mb-5">
          <div class="col-md-4 text-center py-4">
          	<div class="icon">
          		<span class="icon-map-o"></span>
          	</div>
            <p><span>주소</span>서울시 강남구 테헤란로 10길 9</p>
          </div>
          <div class="col-md-4 text-center border-height py-4">
          	<div class="icon">
          		<span class="icon-mobile-phone"></span>
          	</div>
            <p><span>연락처</span> <a href="tel://1234567920">+ 1235 2355 98</a></p>
          </div>
          <div class="col-md-4 text-center py-4">
          	<div class="icon">
          		<span class="icon-envelope-o"></span>
          	</div>
            <p><span>Email</span> <a href="mailto:info@yoursite.com">spaceus@spaceus.com</a></p>
          </div>
        </div>
        </div>
      </div>
    </div>
  </section>
  <!-- 지도 -->
      <div class="row justify-content-center" style="margin-top: -100px;">
      	<div class="col-md-7">
      		<div id="map" class="bg-white"></div>
      	</div>
      </div>
<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
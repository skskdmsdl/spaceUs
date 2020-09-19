<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>Space Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 4 admin, bootstrap 4, css3 dashboard, bootstrap 4 dashboard, AdminWrap lite admin bootstrap 4 dashboard, frontend, responsive bootstrap 4 admin template, Elegant admin lite design, Elegant admin lite dashboard bootstrap 4 dashboard template">
    <meta name="description" content="Elegant Admin Lite Free Version is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    

    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.request.contextPath }/assets/images/favicon.png">
    <!-- This page CSS -->
    <!-- chartist CSS -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/assets/node_modules/morrisjs/morris.css">
    <!--c3 plugins CSS -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/assets/node_modules/c3-master/c3.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/dist/css/style.css">
    <!-- Dashboard 1 Page CSS -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/dist/css/pages/dashboard1.css">
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="canonical" href="https://www.wrappixel.com/templates/elegant-admin-lite/" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css">

    <!-- icons -->
    <script src="https://kit.fontawesome.com/b74a25ff1b.js" crossorigin="anonymous"></script>

    <!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
   <script src="${pageContext.request.contextPath }/resources/js/aos.js"></script>  
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    
  <!-- loader -->
  <%-- <script src="${pageContext.request.contextPath }/resources/https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath }/resources/js/google-map.js"></script> --%>

  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
  
  
   <script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
  </head>
  
  <body>
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="${pageContext.request.contextPath }">Space Us</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span>
	      </button>
	      <sec:authorize access="isAnonymous()">
		      <div class="collapse navbar-collapse" id="ftco-nav">
		        <ul class="navbar-nav ml-auto">
		          <li class="nav-item"><a href="${pageContext.request.contextPath }/space/insertSpace.do" class="nav-link">공간 등록하기</a></li>
		          <li class="nav-item"><a href="${pageContext.request.contextPath }/member/memberLoginForm.do" class="nav-link">로그인</a></li>
		          <li class="nav-item"><a href="${pageContext.request.contextPath }/member/memberEnrollForm.do" class="nav-link">회원가입</a></li>
		        </ul>
		      </div>
	      </sec:authorize>
	      <sec:authorize access="isAuthenticated()">
	        <div class="collapse navbar-collapse" id="ftco-nav"  data-toggle="modal" data-target="#exampleModal">
	        	<div class="navbar-nav ml-auto" style="cursor: pointer !important;">
	        		<div>반갑습니다. &nbsp;</div>
	        		<div>
	        			<sec:authentication property="principal.username"/> 님!
	        		</div>
	        		&nbsp;
	        		<div class="user_profile_icon" data-subscribe-type="PRO" 
	        		     style="background: #22B47B; border-radius: 90%; width: 40px;  height: 40px;">
	        			<img src="https://resource.miricanvas.com/image/common/profile_argo.svg">
	        		</div>
	        	</div>
		      </div>
		  </sec:authorize>

	     
	  </nav>
    <!-- END nav -->
    
    <!-- Modal -->
     <sec:authorize access="isAuthenticated()">
	<div class="fade modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-auto" role="document">
	    <div class="modal-content"  style="border-radius: 1.3em; left:36rem; top:3rem; width:55%; ">
	      <div class="modal-header" style="background: #30D795; border-radius: 1.3em;">
	        <h5 class="modal-title" id="exampleModalLabel">
	        	<div>
		        	<img src="https://resource.miricanvas.com/image/common/profile_argo.svg" style="background: #22B47B; border-right: 0; border-radius: 90%; width: 40px;  height: 40px;">
	        		<sec:authentication property="principal.username"/>@naver.com
	        	</div>
	        </h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<div class="col-sm-10 mb-2">
	    	    <a href="${pageContext.request.contextPath }/member/memberProfile.do">
	    	    	<i class="fas fa-user-alt"></i>
	    	    	마이프로필
	    	    </a>
	      	</div>
	      	<div class="col-sm-10 mb-2">
		        <a href="#">
		        	<i class="fas fa-history"></i>
		        	예약관리
		        </a>
	      	 </div>
	      	 <div class="col-sm-10 mb-2">
		        <a href="${pageContext.request.contextPath }/member/memberProfile.do">
		        	<i class="fas fa-heart"></i> &nbsp;
		        	위시리스트
		        </a>
	      	 </div>
	      </div>
	      <div class="modal-footer">
	      	 <form:form action="${ pageContext.request.contextPath }/member/memberLogout.do">
	      	 	 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">로그아웃</button>
	      	 </form:form>
	      </div>
	    </div>
	  </div>
	</div>
	</sec:authorize>
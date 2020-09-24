<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- 한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8" />

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

<div class="skin-default-dark fixed-layout">
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- 마이페이지 헤더 -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header">
                    <a style="color:black" class="navbar-brand" href="${pageContext.request.contextPath }">SpaceUs</a>
                </div>
                <div class="navbar-collapse">
                    
                   <!-- <ul class="navbar-nav my-lg-0">
                       <li class="nav-item dropdown">
                           <a id="logout" class="m-r-30">로그아웃</a>
                       </li>
                   </ul> -->
               </div>
            </nav>
        </header>
        
        <!-- 왼쪽 목록들 -->
        <aside class="left-sidebar">
            <div class="d-flex no-block nav-text-box align-items-center">
                <span>마이페이지</span>
                <a class="waves-effect waves-dark ml-auto hidden-sm-down" href="javascript:void(0)"><i class="ti-menu"></i></a>
                <a class="nav-toggler waves-effect waves-dark ml-auto hidden-sm-up" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
            </div>
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
              <nav class="sidebar-nav">
                  <ul id="sidebarnav">
                      <sec:authorize access="hasAnyRole('USER', 'HOST')">
                      <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/memberProfile.do"><i class="fa fa-user"></i><span class="hide-menu">내 정보 관리</span></a></li>
                      <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/wishList.do"><i class="fa fa-user"></i><span class="hide-menu">좋아요 리스트</span></a></li>
                      <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/usageHistory.do"><i class="fa fa-table"></i><span class="hide-menu"></span>내 이용 내역</a></li>
						<li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/reviewList.do"><i class="fa fa-user"></i><span class="hide-menu">내가 쓴 글 리스트</span></a></li>
                      <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/couponList.do"><i class="fa fa-heart"></i><span class="hide-menu"></span>내 쿠폰함</a></li>
                      <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/stampEvent.do"><i class="fa fa-gift"></i><span class="hide-menu"></span>출석체크</a></li>
                      </sec:authorize>
                  </ul>
              </nav>
          <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
  </aside>
  <!-- 목록 끝 -->

        <div class="page-wrapper">
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor ml-5">마이페이지</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center mr-5">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">마이페이지</a></li>
                                <li class="breadcrumb-item active">출석이벤트</li>
                            </ol>
                        </div>
                    </div>
                </div>
                
                <!-- 출석이벤트 달력 -->
                <div id="calendar">
				    <div id="calendar_header">
				    	<i class="icon-chevron-left"></i>          
					    <h1></h1>
					    <i class="icon-chevron-right"></i>         
				    </div>
				    <div id="calendar_weekdays"></div>
				    <div id="calendar_content"></div>
			    </div>
                <!-- 달력끝 -->
    </div>
</div>
</div>
</div>


<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/jquery/jquery-3.2.1.min.js"></script>
<!-- Bootstrap popper Core JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/popper/popper.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/js/perfect-scrollbar.jquery.min.js"></script>
<!--Wave Effects -->
<script src="${ pageContext.request.contextPath }/resources/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${ pageContext.request.contextPath }/resources/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/js/custom.min.js"></script>
<!-- ============================================================== -->
<!-- This page plugins -->
<!-- ============================================================== -->
<!--morris JavaScript -->

<script>
<!-- 출석이벤트  -->
$(function(){function c(){p();var e=h();var r=0;var u=false;l.empty();while(!u){if(s[r]==e[0].weekday){u=true}else{l.append('<div class="blank"></div>');r++}}for(var c=0;c<42-r;c++){if(c>=e.length){l.append('<div class="blank"></div>')}else{var v=e[c].day;var m=g(new Date(t,n-1,v))?'<div class="today">':"<div>";l.append(m+""+v+"</div>")}}var y=o[n-1];a.css("background-color",y).find("h1").text(i[n-1]+" "+t);f.find("div").css("color",y);l.find(".today").css("background-color",y);d()}function h(){var e=[];for(var r=1;r<v(t,n)+1;r++){e.push({day:r,weekday:s[m(t,n,r)]})}return e}function p(){f.empty();for(var e=0;e<7;e++){f.append("<div>"+s[e].substring(0,3)+"</div>")}}function d(){var t;var n=$("#calendar").css("width",e+"px");n.find(t="#calendar_weekdays, #calendar_content").css("width",e+"px").find("div").css({width:e/7+"px",height:e/7+"px","line-height":e/7+"px"});n.find("#calendar_header").css({height:e*(1/7)+"px"}).find('i[class^="icon-chevron"]').css("line-height",e*(1/7)+"px")}function v(e,t){return(new Date(e,t,0)).getDate()}function m(e,t,n){return(new Date(e,t-1,n)).getDay()}function g(e){return y(new Date)==y(e)}function y(e){return e.getFullYear()+"/"+(e.getMonth()+1)+"/"+e.getDate()}function b(){var e=new Date;t=e.getFullYear();n=e.getMonth()+1}var e=480;var t=2013;var n=9;var r=[];var i=["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"];var s=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];var o=["#16a085","#1abc9c","#c0392b","#27ae60","#FF6860","#f39c12","#f1c40f","#e67e22","#2ecc71","#e74c3c","#d35400","#2c3e50"];var u=$("#calendar");var a=u.find("#calendar_header");var f=u.find("#calendar_weekdays");var l=u.find("#calendar_content");b();c();a.find('i[class^="icon-chevron"]').on("click",function(){var e=$(this);var r=function(e){n=e=="next"?n+1:n-1;if(n<1){n=12;t--}else if(n>12){n=1;t++}c()};if(e.attr("class").indexOf("left")!=-1){r("previous")}else{r("next")}})})
</script>
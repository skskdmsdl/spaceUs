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
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">님이 작성한 이용후기</p>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- 마이페이지 헤더 -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header">
                    <a style="color:black" class="navbar-brand" href="${pageContext.request.contextPath }">Space Us</a>
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
                    	<li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/memberProfile.do"><i class="fa fa-user"></i><span class="hide-menu">나의 정보</span></a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/wishList.do"><i class="fa fa-heart"></i><span class="hide-menu"></span>위시리스트</a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/couponList.do"><i class="fa fa-gift"></i><span class="hide-menu"></span>쿠폰함</a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/usageHistory.do"><i class="fa fa-table"></i><span class="hide-menu"></span>사용내역</a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/reviewList.do"><i class="fa fa-comments"></i><span class="hide-menu"></span>리뷰</a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/stampEvent.do"><i class="fa fa-stamp"></i><span class="hide-menu"></span>출석이벤트</a></li>
                        <div class="text-center m-t-30">
                            <a href="https://wrappixel.com/templates/elegant-admin/" class="btn waves-effect waves-light btn-success hidden-md-down"> Upgrade to Pro</a>
                        </div>
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
                                <li class="breadcrumb-item active">리뷰</li>
                            </ol>
                        </div>
                    </div>
                </div>
               
		        <!-- 리뷰 -->
		        <div id="reviewPage" class="ml-5 mr-5">
                  <div class="card p-5">
                      <div class="card-body">
                       <div class="row"> 
                       <div class="col-md-10">
                           <h5 class="card-title">공간 리뷰</h5>
                           <h6 class="card-subtitle">이용한 공간의 리뷰를 작성해주세요</h6>
                       </div>
                          <div class="col-md-2">
                              <select class="custom-select b-0 ">
                                  <option value="1" >전체 리뷰</option>
                                  <option value="2">작성 가능한 리뷰</option>
                                  <option value="3">내가 작성한 리뷰</option>
                              </select>
                           </div> 
                      </div>
                       <div class="steamline m-t-40">
                           <div class="sl-item">
                            <div class="row">
                             <div class="usageReviewImg mb-5 ml-5 mr-5 mt-3" >
		    			<img class="img-circle" src="${ pageContext.request.contextPath }/resources/images/image_6.jpg" alt="..."> 
                                 </div>
                                   <div class="mt-2 col-md p-20">
                                       <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
                                   	<div class="row"> 
                                        <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
                                        <div class="col-md-9">
                                            <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-success">리뷰등록</a> 
                                            <a href="javascript:void(0)" class="btn btn-rounded btn-outline-secondary">리뷰수정</a> 
                                        </div>
                                       </div>
                                   </div>
                                   </div>
                                  </div>
                                  <div class="sl-item">
                                <div class="row">
                                <div class="usageReviewImg mb-5 ml-5 mr-5 mt-3" >
		    						<img class="img-circle" src="${ pageContext.request.contextPath }/resources/images/image_7.jpg" alt="..."> 
                                 </div>
                                   <div class="mt-2 col-md p-20">
                                       <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
                                   	<div class="row"> 
                                        <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
                                        <div class="col-md-9">
                                            <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-success">리뷰등록</a> 
                                            <a href="javascript:void(0)" class="btn btn-rounded btn-outline-secondary">리뷰수정</a> 
                                        </div>
                                       </div>
                                   </div>
                                   </div>
                                  </div>
                                  <div class="sl-item">
                                <div class="row">
                                 <div class="usageReviewImg mb-5 ml-5 mr-5 mt-3" >
			    					<img class="img-circle" src="${ pageContext.request.contextPath }/resources/images/image_8.jpg" alt="..."> 
                                  </div>
                                    <div class="mt-2 col-md p-20">
                                        <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
                                    	<div class="row"> 
                                         <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
                                         <div class="col-md-9">
                                             <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-success">리뷰등록</a> 
                                             <a href="javascript:void(0)" class="btn btn-rounded btn-outline-secondary">리뷰수정</a> 
                                         </div>
                                        </div>
                                    </div>
                                  </div>
                                  </div>
                                  <div class="sl-item">
                               <div class="row">
                                <div class="usageReviewImg mb-5 ml-5 mr-5 mt-3" >
		    						<img class="img-circle" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg" alt="..."> 
                                 </div>
                                   <div class="mt-2 col-md p-20">
                                       <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
                                   	<div class="row"> 
                                        <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
                                        <div class="col-md-9">
                                            <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-success">리뷰등록</a> 
                                            <a href="javascript:void(0)" class="btn btn-rounded btn-outline-secondary">리뷰수정</a> 
                                        </div>
                                       </div>
                                   </div>
                                 </div>
                                  </div>
                                  <div class="sl-item">
                               <div class="row">
                                 <div class="usageReviewImg mb-5 ml-5 mr-5 mt-3" >
			    					<img class="img-circle" src="${ pageContext.request.contextPath }/resources/images/image_2.jpg" alt="..."> 
                                  </div>
                                  <div class="mt-2 col-md p-20">
                                      <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
                                  	<div class="row"> 
                                       <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
                                       <div class="col-md-9">
                                           <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-success">리뷰등록</a> 
                                           <a href="javascript:void(0)" class="btn btn-rounded btn-outline-secondary">리뷰수정</a> 
                                       </div>
                                      </div>
                                  </div>
                               </div>
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

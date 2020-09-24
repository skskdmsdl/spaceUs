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
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/memberProfile.do"><i class="fa fa-user"></i><span class="hide-menu">회원정보</span></a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/wishList.do"><i class="fa fa-heart"></i><span class="hide-menu">위시리스트</span></a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/usageHistory.do"><i class="fa fa-table"></i><span class="hide-menu"></span>나의 예약내역</a></li>
  						<li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/reviewList.do"><i class="fa fa-book"></i><span class="hide-menu">내가 쓴 글 리스트</span></a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/couponList.do"><i class="fa fa-gift"></i><span class="hide-menu"></span>쿠폰함</a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/stampEvent.do"><i class="fa fa-stamp"></i><span class="hide-menu"></span>출석체크</a></li>
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
                                <li class="breadcrumb-item active">위시리스트</li>
                            </ol>
                        </div>
                    </div>
                </div>

                <!-- 위시리스트 -->  
                <div id="wishListPage" class="ml-5 mr-5">
	                <div class="card p-4">
		                <div class="card-body">
		                <div class="col-md-10">
                            <h5 class="card-title">위시리스트</h5>
                            <h6 class="card-subtitle">위시리스트를 확인하세요</h6>
                        </div>
                        <div class="row">
						<div class="col-md-3">
						    <div class="thumbnail block-20" >
						    <img class="block-20" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg" alt="..."> 
						</div>
					     <div class="caption">
					        <h4>카페두드림 Do dream</h4>
					        <p style="width:250px;">분당 서현역 24시간 스터디카페 Do:Dream (1인 또는 소그룹 전용 스터디룸 1~3인실 / 2~5인실 보유)</p>
					        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
					     </div>
						  </div>
						  <div class="col-md-3">
						    <div class="thumbnail block-20" >
						    <img class="block-20" src="${ pageContext.request.contextPath }/resources/images/image_2.jpg" alt="..."> 
						</div>
					     <div class="caption">
					        <h4>카페두드림 Do dream</h4>
					        <p>분당 서현역 24시간 스터디카페 Do:Dream (1인 또는 소그룹 전용 스터디룸 1~3인실 / 2~5인실 보유)</p>
					        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
					     </div>
						  </div>
						  <div class="col-md-3">
						    <div class="thumbnail block-20" >
						    <img class="block-20" src="${ pageContext.request.contextPath }/resources/images/image_3.jpg" alt="..."> 
						</div>
					     <div class="caption">
					        <h4>카페두드림 Do dream</h4>
					        <p>분당 서현역 24시간 스터디카페 Do:Dream (1인 또는 소그룹 전용 스터디룸 1~3인실 / 2~5인실 보유)</p>
					        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
					     </div>
						  </div>
						  <div class="col-md-3">
						    <div class="thumbnail block-20" >
						    	<img class="block-20" src="${ pageContext.request.contextPath }/resources/images/image_4.jpg" alt="..."> 
							</div>
					     <div class="caption">
					        <h4>카페두드림 Do dream</h4>
					        <p>분당 서현역 24시간 스터디카페 Do:Dream (1인 또는 소그룹 전용 스터디룸 1~3인실 / 2~5인실 보유)</p>
					        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
					     </div>
						  </div>
						  <div class="col-md-3">
						    <div class="thumbnail block-20" >
							    <img class="block-20" src="${ pageContext.request.contextPath }/resources/images/image_5.jpg" alt="..."> 
							</div>
					     <div class="caption">
					        <h4>카페두드림 Do dream</h4>
					        <p>분당 서현역 24시간 스터디카페 Do:Dream (1인 또는 소그룹 전용 스터디룸 1~3인실 / 2~5인실 보유)</p>
					        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
					     </div>
						  </div>
						  <div class="col-md-3">
						    <div class="thumbnail block-20" >
							    <img class="block-20" src="${ pageContext.request.contextPath }/resources/images/image_6.jpg" alt="..."> 
							</div>
					     <div class="caption">
					        <h4>카페두드림 Do dream</h4>
					        <p>분당 서현역 24시간 스터디카페 Do:Dream (1인 또는 소그룹 전용 스터디룸 1~3인실 / 2~5인실 보유)</p>
					        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
					     </div>
						  </div>
						  <div class="col-md-3">
						    <div class="thumbnail block-20" >
							    <img class="block-20" src="${ pageContext.request.contextPath }/resources/images/image_7.jpg" alt="..."> 
							</div>
					     <div class="caption">
					        <h4>카페두드림 Do dream</h4>
					        <p>분당 서현역 24시간 스터디카페 Do:Dream (1인 또는 소그룹 전용 스터디룸 1~3인실 / 2~5인실 보유)</p>
					        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
					     </div>
						  </div>
						  <div class="col-md-3">
						    <div class="thumbnail block-20" >
							    <img class="block-20" src="${ pageContext.request.contextPath }/resources/images/image_8.jpg" alt="..."> 
							</div>
					     <div class="caption">
					        <h4>카페두드림 Do dream</h4>
					        <p>분당 서현역 24시간 스터디카페 Do:Dream (1인 또는 소그룹 전용 스터디룸 1~3인실 / 2~5인실 보유)</p>
					        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
					     </div>
						  </div>
						</div>
						</div>
					</div>
				</div>
                <!-- 위시리스트 끝 -->
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

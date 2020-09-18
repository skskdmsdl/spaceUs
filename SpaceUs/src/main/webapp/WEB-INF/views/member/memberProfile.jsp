<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8" />

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>


<div class="skin-default-dark fixed-layout">
 <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">Elegant admin</p>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a style="color:black" class="navbar-brand" href="${pageContext.request.contextPath }">Space Us</a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    
                    <ul class="navbar-nav my-lg-0">
                        <li class="nav-item dropdown">
                            <a id="logout">로그아웃</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
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
                        <li> <a class="waves-effect waves-dark" href="pages-profile.html" aria-expanded="false"><i class="fa fa-user"></i><span class="hide-menu">프로필 관리</span></a></li>
                        <li> <a class="waves-effect waves-dark" href="table-basic.html" aria-expanded="false"><i class="fa fa-heart"></i><span class="hide-menu"></span>위시리스트</a></li>
                        <li> <a class="waves-effect waves-dark" href="icon-fontawesome.html" aria-expanded="false"><i class="fa fa-gift"></i><span class="hide-menu"></span>쿠폰함</a></li>
                        <li> <a class="waves-effect waves-dark" href="map-google.html" aria-expanded="false"><i class="fa fa-table"></i><span class="hide-menu"></span>사용내역</a></li>
                        <li> <a class="waves-effect waves-dark" href="pages-blank.html" aria-expanded="false"><i class="fa fa-comments"></i><span class="hide-menu"></span>리뷰</a></li>
                        <li> <a class="waves-effect waves-dark" href="pages-blank.html" aria-expanded="false"><i class="fa fa-stamp"></i><span class="hide-menu"></span>출석이벤트</a></li>
                        <div class="text-center m-t-30">
                            <a href="https://wrappixel.com/templates/elegant-admin/" class="btn waves-effect waves-light btn-success hidden-md-down"> Upgrade to Pro</a>
                        </div>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor">프로필관리</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">마이페이지</a></li>
                                <li class="breadcrumb-item active">프로필관리</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Yearly Sales -->
                <!-- ============================================================== -->
                <div class="col-md">
                    <div class="card oh">
                        <div class="card-body">
                            <div class="d-flex m-b-30 align-items-center no-block">
                                <h5 class="card-title ">Yearly Sales</h5>
                                <div class="ml-auto">
                                    <ul class="list-inline font-12">
                                        <li><i class="fa fa-circle text-info"></i> Iphone</li>
                                        <li><i class="fa fa-circle text-primary"></i> Ipad</li>
                                    </ul>
                                </div>
                            </div>
                            <div id="morris-area-chart" style="height: 350px;"></div>
                        </div>
                        <div class="card-body bg-light">
                            <div class="row text-center m-b-20">
                                <div class="col-lg-4 col-md-4 m-t-20">
                                    <h2 class="m-b-0 font-light">6000</h2><span class="text-muted">Total sale</span>
                                </div>
                                <div class="col-lg-4 col-md-4 m-t-20">
                                    <h2 class="m-b-0 font-light">4000</h2><span class="text-muted">Iphone</span>
                                </div>
                                <div class="col-lg-4 col-md-4 m-t-20">
                                    <h2 class="m-b-0 font-light">2000</h2><span class="text-muted">Ipad</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                  
                <!-- 위시리스트 -->  
                <div class="col-md">
	                <div class="card p-4">
		                <div class="card-body">
		                <div class="col-md-10">
                            <h5 class="card-title">위시리스트</h5>
                            <h6 class="card-subtitle">위시리스트를 확인하세요</h6>
                        </div>
		                
						  <div class="col-sm-6 col-md-4">
						    <div class="thumbnail">
						      <img class="block-20" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg" alt="...">
						      <div class="caption">
						        <h3>카페두드림 Do dream</h3>
						        <p>분당 서현역 24시간 스터디카페 Do:Dream (1인 또는 소그룹 전용 스터디룸 1~3인실 / 2~5인실 보유)</p>
						        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
						      </div>
						    </div>
						  </div>
						</div>
					</div>
				</div>
                
                
                <!-- 위시리스트 끝 -->
                    
                <!-- 이용내역 -->
                 <div class="col-md">
                        <div class="card p-5">
                            <div class="card-body">
                             <div class="row"> 
	                            <div class="col-md-10">
	                                <h5 class="card-title">사용 내역</h5>
	                                <h6 class="card-subtitle">사용 공간 내역을 확인하세요</h6>
	                            </div>
                                <div class="col-md-2">
                                    <select class="custom-select b-0 ">
                                        <option value="1" >전체 공간</option>
                                        <option value="2">사용 전</option>
                                        <option value="3">사용 완료</option>
                                    </select>
                                 </div> 
                            </div>
                                <div class="steamline m-t-40">
                                    
                                    <div class="sl-item">
	                                    <div class="row">
	                                        <div class="col-2 m-b-20 m-l-30"> <img class="img-circle" alt="user" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg"> </div>
	                                        <div class="sl-right m-10">
	                                            <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
	                                        	<div class="row"> 
		                                            <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
		                                            <div class="col-md-9">
		                                                <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-success">예약확인</a> 
		                                                <a href="javascript:void(0)" class="btn btn-rounded btn-outline-danger">예약취소</a> 
		                                            </div>
	                                            </div>
	                                        </div>
	                                        </div>
                                        </div>
                                        
                                        <div class="sl-item">
	                                    <div class="row">
	                                        <div class="col-2 m-b-20 m-l-30"> <img class="img-circle" alt="user" src="${ pageContext.request.contextPath }/resources/images/image_2.jpg"> </div>
	                                        <div class="sl-right m-10">
	                                            <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
	                                        	<div class="row"> 
		                                            <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
		                                            <div class="col-md-9">
		                                                <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-secondary">이용완료</a> 
		                                            </div>
	                                            </div>
	                                        </div>
	                                        </div>
                                        </div><div class="sl-item">
	                                    <div class="row">
	                                        <div class="col-2 m-b-20 m-l-30"> <img class="img-circle" alt="user" src="${ pageContext.request.contextPath }/resources/images/image_3.jpg"> </div>
	                                        <div class="sl-right m-10">
	                                            <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
	                                        	<div class="row"> 
		                                            <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
		                                            <div class="col-md-9">
		                                                <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-secondary">이용완료</a> 
		                                            </div>
	                                            </div>
	                                        </div>
	                                        </div>
                                        </div><div class="sl-item">
	                                    <div class="row">
	                                        <div class="col-2 m-b-20 m-l-30"> <img class="img-circle" alt="user" src="${ pageContext.request.contextPath }/resources/images/image_4.jpg"> </div>
	                                        <div class="sl-right m-10">
	                                            <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
	                                        	<div class="row"> 
		                                            <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
		                                            <div class="col-md-9">
		                                                <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-secondary">이용완료</a> 
		                                            </div>
	                                            </div>
	                                        </div>
	                                        </div>
                                        </div><div class="sl-item">
	                                    <div class="row">
	                                        <div class="col-2 m-b-20 m-l-30"> <img class="img-circle" alt="user" src="${ pageContext.request.contextPath }/resources/images/image_5.jpg"> </div>
	                                        <div class="sl-right m-10">
	                                            <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
	                                        	<div class="row"> 
		                                            <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
		                                            <div class="col-md-9">
		                                                <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-secondary">예약확인</a> 
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
              	<!-- 이용내역 끝 -->
              
                <!-- 리뷰 -->
                <div class="col-md">
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
	                                        <div class="col-2 m-b-20 m-l-30"> <img class="img-circle" alt="user" src="${ pageContext.request.contextPath }/resources/images/image_6.jpg"> </div>
	                                        <div class="sl-right m-10">
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
	                                        <div class="col-2 m-b-20 m-l-30"> <img class="img-circle" alt="user" src="${ pageContext.request.contextPath }/resources/images/image_7.jpg"> </div>
	                                        <div class="sl-right m-10">
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
                                        </div><div class="sl-item">
	                                    <div class="row">
	                                        <div class="col-2 m-b-20 m-l-30"> <img class="img-circle" alt="user" src="${ pageContext.request.contextPath }/resources/images/image_8.jpg"> </div>
	                                        <div class="sl-right m-10">
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
                                        </div><div class="sl-item">
	                                    <div class="row">
	                                        <div class="col-2 m-b-20 m-l-30"> <img class="img-circle" alt="user" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg"> </div>
	                                        <div class="sl-right m-10">
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
                                        </div><div class="sl-item">
	                                    <div class="row">
	                                        <div class="col-2 m-b-20 m-l-30"> <img class="img-circle" alt="user" src="${ pageContext.request.contextPath }/resources/images/image_2.jpg"> </div>
	                                        <div class="sl-right m-10">
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
                    </div>
					<!-- 리뷰 끝 -->
               
               
               
               
               
               
               
               
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <div>
                                        <h5 class="card-title">Sales Overview</h5>
                                        <h6 class="card-subtitle">Check the monthly sales </h6>
                                    </div>
                                    <div class="ml-auto">
                                        <select class="custom-select b-0">
                                            <option>January</option>
                                            <option value="1">February</option>
                                            <option value="2" selected="">March</option>
                                            <option value="3">April</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th class="text-center">#</th>
                                            <th>NAME</th>
                                            <th>DATE</th>
                                            <th>PRICE</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-center">1</td>
                                            <td class="txt-oflo">Elite admin</td>
                                            <td class="txt-oflo">April 18, 2017</td>
                                            <td><span class="text-success">$24</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">2</td>
                                            <td class="txt-oflo">Real Homes WP Theme</td>
                                            <td class="txt-oflo">April 19, 2017</td>
                                            <td><span class="text-info">$1250</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">3</td>
                                            <td class="txt-oflo">Ample Admin</td>
                                            <td class="txt-oflo">April 19, 2017</td>
                                            <td><span class="text-info">$1250</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">4</td>
                                            <td class="txt-oflo">Medical Pro WP Theme</td>
                                            <td class="txt-oflo">April 20, 2017</td>
                                            <td><span class="text-danger">-$24</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">5</td>
                                            <td class="txt-oflo">Hosting press html</td>
                                            <td class="txt-oflo">April 21, 2017</td>
                                            <td><span class="text-success">$24</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">6</td>
                                            <td class="txt-oflo">Digital Agency PSD</td>
                                            <td class="txt-oflo">April 23, 2017</td>
                                            <td><span class="text-danger">-$14</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">7</td>
                                            <td class="txt-oflo">Helping Hands WP Theme</td>
                                            <td class="txt-oflo">April 22, 2017</td>
                                            <td><span class="text-success">$64</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">8</td>
                                            <td class="txt-oflo">Helping Hands WP Theme</td>
                                            <td class="txt-oflo">April 22, 2017</td>
                                            <td><span class="text-success">$64</span></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">9</td>
                                            <td class="txt-oflo">Ample Admin</td>
                                            <td class="txt-oflo">April 19, 2017</td>
                                            <td><span class="text-info">$1250</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- To do chat and message -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Feeds</h4>
                            </div>
                            <ul class="feeds p-b-20">
                                <li>
                                    <div class="bg-info"><i class="fa fa-bell-o"></i></div> You have 4 pending tasks. <span class="text-muted">Just Now</span></li>
                                <li>
                                    <div class="bg-success"><i class="ti-server"></i></div> Server #1 overloaded.<span class="text-muted">2 Hours ago</span></li>
                                <li>
                                    <div class="bg-warning"><i class="ti-shopping-cart"></i></div> New order received.<span class="text-muted">31 May</span></li>
                                <li>
                                    <div class="bg-danger"><i class="ti-user"></i></div> New user registered.<span class="text-muted">30 May</span></li>
                                <li>
                                    <div class="bg-dark"><i class="fa fa-bell-o"></i></div> New Version just arrived. <span class="text-muted">27 May</span></li>
                                <li>
                                    <div class="bg-info"><i class="fa fa-bell-o"></i></div> You have 4 pending tasks. <span class="text-muted">Just Now</span></li>
                                <li>
                                    <div class="bg-danger"><i class="ti-user"></i></div> New user registered.<span class="text-muted">30 May</span></li>
                                <li>
                                    <div class="bg-dark"><i class="fa fa-bell-o"></i></div> New Version just arrived. <span class="text-muted">27 May</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Messages (5 New)</h5>
                                <div class="message-box">
                                    <div class="message-widget message-scroll">
                                        <!-- Message -->
                                        <a href="javascript:void(0)">
                                            <div class="user-img"> <img src="${ pageContext.request.contextPath }/resources/assets/images/users/1.jpg" alt="user" class="img-circle"> <span class="profile-status online pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Pavan kumar</h5> <span class="mail-desc">Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been.</span> <span class="time">9:30 AM</span> </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="javascript:void(0)">
                                            <div class="user-img"> <img src="${ pageContext.request.contextPath }/resources/assets/images/users/2.jpg" alt="user" class="img-circle"> <span class="profile-status busy pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Sonu Nigam</h5> <span class="mail-desc">I've sung a song! See you at</span> <span class="time">9:10 AM</span> </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="javascript:void(0)">
                                            <div class="user-img"> <span class="round">A</span> <span class="profile-status away pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Arijit Sinh</h5> <span class="mail-desc">Simply dummy text of the printing and typesetting industry.</span> <span class="time">9:08 AM</span> </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="javascript:void(0)">
                                            <div class="user-img"> <img src="${ pageContext.request.contextPath }/resources/assets/images/users/4.jpg" alt="user" class="img-circle"> <span class="profile-status offline pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Pavan kumar</h5> <span class="mail-desc">Just see the my admin!</span> <span class="time">9:02 AM</span> </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="javascript:void(0)">
                                            <div class="user-img"> <img src="${ pageContext.request.contextPath }/resources/assets/images/users/1.jpg" alt="user" class="img-circle"> <span class="profile-status online pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Pavan kumar</h5> <span class="mail-desc">Welcome to the Elite Admin</span> <span class="time">9:30 AM</span> </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="javascript:void(0)">
                                            <div class="user-img"> <img src="${ pageContext.request.contextPath }/resources/assets/images/users/2.jpg" alt="user" class="img-circle"> <span class="profile-status busy pull-right"></span> </div>
                                            <div class="mail-contnet">
                                                <h5>Sonu Nigam</h5> <span class="mail-desc">I've sung a song! See you at</span> <span class="time">9:10 AM</span> </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
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
    </div>
</div>




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
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/raphael/raphael-min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/morrisjs/morris.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/jquery-sparkline/jquery.sparkline.min.js"></script>
<!--c3 JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/d3/d3.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/c3-master/c3.min.js"></script>
<!-- Chart JS -->
<script src="${ pageContext.request.contextPath }/resources/js/dashboard1.js"></script>

<script>
<!-- 출석이벤트  -->
$(function(){function c(){p();var e=h();var r=0;var u=false;l.empty();while(!u){if(s[r]==e[0].weekday){u=true}else{l.append('<div class="blank"></div>');r++}}for(var c=0;c<42-r;c++){if(c>=e.length){l.append('<div class="blank"></div>')}else{var v=e[c].day;var m=g(new Date(t,n-1,v))?'<div class="today">':"<div>";l.append(m+""+v+"</div>")}}var y=o[n-1];a.css("background-color",y).find("h1").text(i[n-1]+" "+t);f.find("div").css("color",y);l.find(".today").css("background-color",y);d()}function h(){var e=[];for(var r=1;r<v(t,n)+1;r++){e.push({day:r,weekday:s[m(t,n,r)]})}return e}function p(){f.empty();for(var e=0;e<7;e++){f.append("<div>"+s[e].substring(0,3)+"</div>")}}function d(){var t;var n=$("#calendar").css("width",e+"px");n.find(t="#calendar_weekdays, #calendar_content").css("width",e+"px").find("div").css({width:e/7+"px",height:e/7+"px","line-height":e/7+"px"});n.find("#calendar_header").css({height:e*(1/7)+"px"}).find('i[class^="icon-chevron"]').css("line-height",e*(1/7)+"px")}function v(e,t){return(new Date(e,t,0)).getDate()}function m(e,t,n){return(new Date(e,t-1,n)).getDay()}function g(e){return y(new Date)==y(e)}function y(e){return e.getFullYear()+"/"+(e.getMonth()+1)+"/"+e.getDate()}function b(){var e=new Date;t=e.getFullYear();n=e.getMonth()+1}var e=480;var t=2013;var n=9;var r=[];var i=["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"];var s=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];var o=["#16a085","#1abc9c","#c0392b","#27ae60","#FF6860","#f39c12","#f1c40f","#e67e22","#2ecc71","#e74c3c","#d35400","#2c3e50"];var u=$("#calendar");var a=u.find("#calendar_header");var f=u.find("#calendar_weekdays");var l=u.find("#calendar_content");b();c();a.find('i[class^="icon-chevron"]').on("click",function(){var e=$(this);var r=function(e){n=e=="next"?n+1:n-1;if(n<1){n=12;t--}else if(n>12){n=1;t++}c()};if(e.attr("class").indexOf("left")!=-1){r("previous")}else{r("next")}})})
		
</script>

<!-- 호스트 정산내역 그래프 활용 ?
<div class="col-lg-8">
    <div class="card oh">
        <div class="card-body">
            <div class="d-flex m-b-30 align-items-center no-block">
                <h5 class="card-title ">Yearly Sales</h5>
                <div class="ml-auto">
                    <ul class="list-inline font-12">
                        <li><i class="fa fa-circle text-info"></i> Iphone</li>
                        <li><i class="fa fa-circle text-primary"></i> Ipad</li>
                    </ul>
                </div>
            </div>
            <div id="morris-area-chart" style="height: 350px;"></div>
        </div>
        <div class="card-body bg-light">
            <div class="row text-center m-b-20">
                <div class="col-lg-4 col-md-4 m-t-20">
                    <h2 class="m-b-0 font-light">6000</h2><span class="text-muted">Total sale</span>
                </div>
                <div class="col-lg-4 col-md-4 m-t-20">
                    <h2 class="m-b-0 font-light">4000</h2><span class="text-muted">Iphone</span>
                </div>
                <div class="col-lg-4 col-md-4 m-t-20">
                    <h2 class="m-b-0 font-light">2000</h2><span class="text-muted">Ipad</span>
                </div>
            </div>
        </div>
    </div>
</div> -->
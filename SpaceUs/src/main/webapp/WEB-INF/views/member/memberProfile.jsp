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
        <!-- 마이페이지 헤더 -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header">
                    <a style="color:black" class="navbar-brand" href="${pageContext.request.contextPath }">Space Us</a>
                </div>
                <div class="navbar-collapse">
                    
                   <ul class="navbar-nav my-lg-0">
                       <li class="nav-item dropdown">
                           <a id="logout">로그아웃</a>
                       </li>
                   </ul>
               </div>
            </nav>
        </header>
        
        <!-- 목록들 -->
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
                        <li> <a class="waves-effect waves-dark" id="profileEditBtn" aria-expanded="false"><i class="fa fa-user"></i><span class="hide-menu"  >프로필 관리</span></a></li>
                        <li> <a class="waves-effect waves-dark" id="wishListBtn" aria-expanded="false"><i class="fa fa-heart"></i><span class="hide-menu"></span>위시리스트</a></li>
                        <li> <a class="waves-effect waves-dark" id="couponListBtn" aria-expanded="false"><i class="fa fa-gift"></i><span class="hide-menu"></span>쿠폰함</a></li>
                        <li> <a class="waves-effect waves-dark" id="usageHistoryListBtn" aria-expanded="false"><i class="fa fa-table"></i><span class="hide-menu"></span>사용내역</a></li>
                        <li> <a class="waves-effect waves-dark" id="reviewListBtn" aria-expanded="false"><i class="fa fa-comments"></i><span class="hide-menu"></span>리뷰</a></li>
                        <li> <a class="waves-effect waves-dark" id="stampEventBtn" aria-expanded="false"><i class="fa fa-stamp"></i><span class="hide-menu"></span>출석이벤트</a></li>
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
                        <h4 class="text-themecolor">마이페이지</h4>
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
                <div id="profileEditPage" class="col-md">
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
                <div id="wishListPage" class="col-md">
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
                
                <!-- 쿠폰함 -->
                 <div id="couponPage" class="col-md">
	                <div class="card p-4">
		                <div class="card-body">
			                <div class="col-md-10">
	                            <h5 class="card-title">쿠폰함</h5>
	                            <h6 class="card-subtitle mb-5">쿠폰함을 확인하세요</h6>
	                        </div>
	                        <div class="row">
								<div class="col-md">
				    				<img class="couponImg" src="${ pageContext.request.contextPath }/resources/images/welCoupon.png" alt="..."> 
	                               	 <span id="couponDday" class="label label-danger">D-8</span>
	                               	 <p id="couponEnd">2020.10.23 까지</p>
	                               </div>
								<div class="col-md">
				    				<img class="couponImg" src="${ pageContext.request.contextPath }/resources/images/hbdCoupon.png" alt="..."> 
                                	 <span id="couponDday2" class="label label-warning">D-38</span>
                                	 <p id="couponEnd2">2020.10.23 까지</p>
                                </div>
							</div>
						</div>
					</div>
                <!-- 쿠폰함 끝 -->
                    
                <!-- 이용내역 -->
                 <div id="usageHistoryPage" class="col-md">
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
	                                    <div class="mb-5 ml-5 mr-5 mt-3" >
						    				<img class="usageHistoryImg" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg" alt="..."> 
	                                     </div>
	                                        <div class="mt-2 col-md p-20">
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
	                                    <div class="mb-5 ml-5 mr-5 mt-3" >
						    				<img class="usageHistoryImg" src="${ pageContext.request.contextPath }/resources/images/image_2.jpg" alt="..."> 
	                                     </div>
	                                        <div class="mt-2 col-md p-20">
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
	                                    <div class="mb-5 ml-5 mr-5 mt-3" >
						    				<img class="usageHistoryImg" src="${ pageContext.request.contextPath }/resources/images/image_3.jpg" alt="..."> 
	                                     </div>
	                                        <div class="mt-2 col-md p-20">
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
	                                    <div class="mb-5 ml-5 mr-5 mt-3" >
						    				<img class="usageHistoryImg" src="${ pageContext.request.contextPath }/resources/images/image_4.jpg" alt="..."> 
	                                     </div>
	                                        <div class="mt-2 col-md p-20">
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
		                                    <div class="mb-5 ml-5 mr-5 mt-3" >
							    				<img class="usageHistoryImg" src="${ pageContext.request.contextPath }/resources/images/image_5.jpg" alt="..."> 
		                                     </div>
		                                        <div class="mt-2 col-md p-20">
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
              	<!-- 이용내역 끝 -->
              
                <!-- 리뷰 -->
                <div id="reviewPage" class="col-md">
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
	    <!-- 출석이벤트 끝 -->
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
<!-- 마이페이지 목록 클릭이벤트 -->
$(function() {
		$("#profileEditPage").show();
		$("#wishListPage, #couponPage, #usageHistoryPage, #reviewPage, #calendar").hide();
	$("#profileEditBtn").click(function(){
		$("#profileEditPage").show();
		$("#wishListPage, #couponPage, #usageHistoryPage, #reviewPage, #calendar").hide();
	});
	$("#wishListBtn").click(function(){
		$("#wishListPage").show();
		$("#profileEditPage, #couponPage, #usageHistoryPage, #reviewPage, #calendar").hide();
	});
	$("#couponListBtn").click(function(){
		$("#couponPage").show();
		$("#profileEditPage, #wishListPage, #usageHistoryPage, #reviewPage, #calendar").hide();
	});
	$("#usageHistoryListBtn").click(function(){
		$("#usageHistoryPage").show();
		$("#profileEditPage, #couponPage, #wishListPage, #reviewPage, #calendar").hide();
	});
	$("#reviewListBtn").click(function(){
		$("#reviewPage").show();
		$("#profileEditPage, #couponPage, #usageHistoryPage, #wishListPage, #calendar").hide();
	});
	$("#stampEventBtn").click(function(){
		$("#calendar").show();
		$("#profileEditPage, #couponPage, #usageHistoryPage, #reviewPage, #wishListPage").hide();
	});
	
}); 
/*  profileEditBtn.onclick(function() {
	wishListPage.style.display ='none';
		profileEditPage.style.display ='block';

	}); */  
	


</script>
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
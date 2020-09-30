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
<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp" />


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
                                <li class="breadcrumb-item active">쿠폰함</li>
                            </ol>
                        </div>
                    </div>
                </div>
                
                <!-- 쿠폰함 -->
                 <div id="couponPage" class="ml-5 mr-5">
	                <div class="card p-4">
		                <div class="card-body">
			                <div class="row"> 
	                            <div class="col-md-10">
	                                <h5 class="card-title">쿠폰함</h5>
	                                <h6 class="card-subtitle mb-5">쿠폰을 확인하세요</h6>
	                            </div>
	                            <!-- 이 부분 지울때 위에 row도 div도 지우기 -->
                               <div class="col-md-2">
                                   <select class="custom-select b-0 ">
                                       <option value="1">전체 쿠폰</option>
                                       <option value="2">사용가능한 쿠폰</option>
                                       <option value="3">사용 완료</option>
                                   </select>
                                </div> 
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
				</div>
                <!-- 쿠폰함 끝 -->
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

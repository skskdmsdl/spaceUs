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
                                <li class="breadcrumb-item active">위시리스트</li>
                            </ol>
                        </div>
                    </div>
                </div>
				 <!-- 채팅 -->
				 <div id="talkjs-container" style="background-color: rgba(0,0,0,0);margin-left: 300px; height: 500px; position: fixed; z-index: 10;box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px; display:none;">
				    <i>Loading chat...</i>
				</div> 
				 <sec:authorize access="hasAnyRole('ADMIN')">
				<div>
					<button id="chatBtn">🧑</button>
				</div>
				</sec:authorize>
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

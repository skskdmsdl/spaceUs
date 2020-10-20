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

<style>
.spaceOne:hover{
	background: #e9f2f1;
	border-radius: 10px; 
}
</style>


<div class="skin-default-dark fixed-layout">
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">쪼매만 기다리쇼..<p>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- 마이페이지 헤더 -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <div class="navbar-header">
                    <a style="color:black" class="navbar-brand" href="${pageContext.request.contextPath }">Space Us</a>
                </div>
                <div class="navbar-collapse">
                    <a href="#">Management</a>
               </div>
            </nav>
        </header>
        
        <!-- 왼쪽 목록들 -->
        <aside class="left-sidebar">
            <div class="d-flex no-block nav-text-box align-items-center">
                <span>Management</span>
                <a class="waves-effect waves-light ml-auto hidden-sm-down" href="javascript:void(0)"><i class="ti-menu"></i></a>
                <a class="nav-toggler waves-effect waves-light ml-auto hidden-sm-up" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
            </div>
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li> <a class="waves-effect" id="memberManageBtn" aria-expanded="false" href="${pageContext.request.contextPath }/admin/memberManage.do"><i class="fa fa-user"></i><span class="hide-menu">회원 관리</span></a></li>
                        <li> <a class="waves-effect " id="spaceApprovalBtn" aria-expanded="false" href="${pageContext.request.contextPath }/admin/spaceManage.do"><i class="fa fa-home"></i><span class="hide-menu">공간승인</span></a></li>
                        <li> <a class="waves-effect " id="blackListBtn" aria-expanded="false" href="${pageContext.request.contextPath }/admin/blackListManage.do"><i class="fa fa-ban"></i><span class="hide-menu">블랙리스트 관리</span></a></li>
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
                        <h4 class="text-themecolor ml-5">SpaceUs 관리</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center mr-5">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">관리</a></li>
                                <li class="breadcrumb-item active">공간 관리</li>
                            </ol>
                        </div>
                    </div>
                </div>
                

                <!-- 공간 승인 시작 -->  
                <div id="spaceApprovalPage" class="ml-5 mr-5">
	                <div class="card p-4">
		                <div class="card-body">
			                <div class="col-md-10">
	                            <h3 class="card-title">공간 승인</h3>
	                        </div>
	                        
	                        <div class="row">
		                        <c:forEach items="${spaceList}" var="space">
									<div class="col-md-3 spaceOne" style="padding: 20px; margin:70px;">
										<div class="spaceTwo">
											<div class="thumbnail block-20" style="margin:0 auto;" >
												<c:if test="${not empty space.renamedFilename}">
												    <img class="block-20" src="${ pageContext.request.contextPath}/resources/upload/space/${space.renamedFilename}" alt="..."> 
												</c:if>
												<c:if test="${empty space.renamedFilename}">
													<img class="block-20" src="${ pageContext.request.contextPath}/resources/upload/space/noimage.gif" alt="...">
												</c:if>
											</div> 
									     	<div class="caption" style="text-align: center;">
									        	<h4 style="margin: 10px 0;">${space.spaceName}</h4>
									        	<h6 style="margin: 10px 0;"><strong>등록 요청일</strong>: ${space.registrationDate}</h6>
									        	<h6 style="margin: 10px 0;"><strong>유저 이메일</strong>: ${space.memberEmail}</h6>
									        	<!-- <h6 style="margin: 10px 0;">
									        		<a href="#" class="btn btn-primary" role="button">승인</a> 
									        		<a href="#" class="btn btn-default" role="button">승인거절</a>
									        	</h6> -->
									     	</div>
								     	</div>	
										<input type="hidden" name="spaceNo" value="${space.spaceNo}" />
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
                <!-- 공간승인 끝-->
    </div>
</div>
</div>
</div>

<script type="text/javascript">
	$(".spaceTwo").click(function(){
		var spaceNo = $(this).siblings("[name=spaceNo]").val();
		//alert(spaceNo);
		
		location.href="${pageContext.request.contextPath}/admin/confirmSpaceFrm.do?spaceNo="+spaceNo;
	});
</script>

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

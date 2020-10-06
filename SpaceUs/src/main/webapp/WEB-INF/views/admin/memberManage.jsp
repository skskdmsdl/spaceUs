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
.btn, .search-btn {
	display: inline-block;
	width: 100px;
	height: 33px;
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	user-select: none;
	border: 1px solid transparent;
	padding: 0.46875rem 1rem;
	font-size: 15px;
	line-height: 1.5;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
/*검색*/
div#search-container {
	margin: 0 auto;
	padding: 3px;
	background-color: rgba(0, 188, 212, 0.3);
	width: 100%;
}

div#search-userId {
	display: inline-block;
}

div#search-userName {
	display: none;
}
</style>
<script>
	$(function() {
		$("#searchType").change(function() {
			$("#search-userId, #search-userName").hide();
			$("#search-" + $(this).val()).css("display", "inline-block");
		});
	});
</script>



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
                        <li> <a class="waves-effect " id="blackListBtn" aria-expanded="false" href="${pageContext.request.contextPath }/admin/blackListManage.do"><i class="fa fa-home"></i><span class="hide-menu">블랙리스트 관리</span></a></li>
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
                                <li class="breadcrumb-item active">회원 관리</li>
                            </ol>
                        </div>
                    </div>
                </div>
                
                <!-- 회원관리 -->
                <div id="memberManagePage" class="ml-5 mr-5">
                    <div class="card p-5">
                       <div class="card-body">
		                    <!-- 입력창  시작-->
		                    <div class="search-container" style="display: inline-block;">
								<select id="searchType">
									<option value="userId">ID</option>
									<option value="userName">NAME</option>
								</select>
								<div id="search-userId">
									<form <%-- action="<%=request.getContextPath()%>/admin/userFinder" --%>>
										<input type="hidden" class="textbox" name="searchType"
											value="userId"> 
										<input type="text" class="textbox"
											name="searchKeyword" size="25" placeholder="검색할 아이디를 입력하세요"
					                	   		<%-- value="<%="userId".equals(searchType) ? searchKeyword : ""%>" --%> />
										<button type="submit" class="search-btn button">검색</button>
									</form>
								</div>
								<div id="search-userName">
									<form <%-- action="<%=request.getContextPath()%>/admin/userFinder" --%>>
										<input type="hidden" class="textbox" name="searchType"
											value="userName"> 
										<input type="search" class="textbox"
											name="searchKeyword" size="25" placeholder="검색할 이름을 입력하세요."
											<%-- value="<%="userName".equals(searchType) ? searchKeyword : ""%>" --%> />
										<button type="submit" class="search-btn">검색</button>
									</form>
								</div>
							</div>
		                    <!-- 입력창 끝 -->
		             
		                    
		                    <div class="btn-div" style="display: inline-block; float: right;">
								<form action="<%=request.getContextPath()%>/admin/userFinder">
									<input type="hidden" name="searchType" value="userRole" />
									<button type="submit" class="btn btn-primary" name="searchKeyword" value="T">전체 보기</button>
									<button type="submit" class="btn btn-primary" name="searchKeyword" value="U">일반 맴버</button>
									<button type="submit" class="btn btn-primary" name="searchKeyword" value="P">호스트</button>
								</form>
							</div>
		                    <br />
		                    <br />
		                    
		                    
		                    <!-- 회원관리 시작 -->
							<table class="table table-stripped table-bordered ">
							  <thead>
							    <tr>
							      <th scope="col">NO</th>
							      <th scope="col">이메일</th>
							      <th scope="col">닉네임</th>
							      <th scope="col">전화번호</th>
							      <th scope="col">가입일자</th>							      
							      <th scope="col">권한</th>
							    </tr>
							  </thead>
							  <tbody>
							  	<c:forEach items="${memberList}" var="member" varStatus="vs">
								    <tr>
								      <td>${vs.count}</td>
								      <td>${member.memberEmail}</td>
								      <td>${member.nickname}</td>
								      <td>${member.memberPhone}</td>
								      <td>${member.memberRegDate}</td>
								      <td>${member.authority}</td>
								    </tr>			
							  	</c:forEach>
							  </tbody>
							</table>
	                   </div>
	               </div>
	           </div>
              <!-- 회원관리 끝 -->
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
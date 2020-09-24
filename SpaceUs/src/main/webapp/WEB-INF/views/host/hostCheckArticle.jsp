<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>



<div class="skin-default-dark fixed-layout">
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
                <span> 호스트 센터</span>
                <a class="waves-effect waves-dark ml-auto hidden-sm-down" href="javascript:void(0)"><i class="ti-menu"></i></a>
                <a class="nav-toggler waves-effect waves-dark ml-auto hidden-sm-up" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
            </div>
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                       <sec:authorize access="hasRole('HOST')"> 
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/host/spaceInfo.do"><i class="fa fa-user"></i><span class="hide-menu">공간 정보</span></a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/host/hostReservation.do"><i class="fa fa-heart"></i><span class="hide-menu"></span>공간 예약 현황</a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/host/hostCheckArticle.do"><i class="fa fa-gift"></i><span class="hide-menu"></span>공간 리뷰 & QnA</a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/host/settlementDetails.do"><i class="fa fa-table"></i><span class="hide-menu"></span>정산 내역</a></li>
                     
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
                        <h4 class="text-themecolor ml-5">호스트 센터</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center mr-5">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">호스트 센터</a></li>
                                <li class="breadcrumb-item active">공간 정보</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- 회원정보 -->
                <div id="profileEditPage" class="ml-5 mr-5">
                    <div class="card p-5">
                       <div class="card-body">
                        <div class="row"> 
                         <div class="col-md-10">
                             <h5 class="card-title">공간 최근 게시물</h5>
                             <h6 class="card-subtitle mb-5">공간에 올라온 새 질문글과 리뷰를 확인하세요</h6>
                         </div>
	                    </div>
	                    <section id="article-header" class="sticky-top" style="height: auto;">
	                    	<div class="" style="position: relative;" data-sticky-enabled="false">
	                    		<div class="qna-filter-container">
	                    			<dl class="" role="button">
	                    				<dt class="filter-select-header">게시글 수</dt>
	                    				<i class="fa-long-arrow-down"></i>
	                    				<dd class="">20개</dd>
	                    				
	                    			</dl>
	                    		 </div>
	                          </div>
	                    	</div>
	                    </section>
						 <table class="col-11">
							<tr>
								<th class="align-baseline">닉네임</th>
								<th><input type="text" class="col-8 input-group-text mb-4 mr-5 pull-right" value="<sec:authentication property="principal.username"/>" required /></th>
							</tr>
						    <tr>
						      <td class="align-baseline">이메일 계정</td>
						      <td><input type="email" class="col-8 input-group-text mb-4 mr-5 pull-right" value="honggd@naver.com" required /></td>
							</tr>
						    <tr>
						      <td class="align-baseline">생일</td>
						      <td><input type="date" class="col-8 input-group-text mb-4 mr-5 pull-right" value="2020-08-08" /></td>
							</tr>
						    <tr>
						      <td class="align-baseline">핸드폰</td>
						      <td><input type="tel" class="col-8 input-group-text mb-4 mr-5 pull-right" maxlength="11" value="01012341234" required /></td>
							</tr>
						</table >
						  <div class="mt-5" style="border-top: 1px solid #bbbbbb" ></div>
						  <h6 class="card-subtitle mt-3 mb-5">비밀번호를 입력해주세요.</h6>
						  <table class="col-11">
							<tr>
						      <td class="align-baseline">새 비밀번호</td>
						      <td><input type="password" class="col-8 input-group-text ml-auto mb-4 mr-5" value="" /></td>
							</tr>
						    <tr>
						      <td class="align-baseline">새 비밀번호 확인</td>
						      <td><input type="password" class="col-8 input-group-text ml-auto mb-5 mr-5"value="" required /></td>
							</tr>
						</table>
						<div class="mt-5 pull-right mr-5">
					      <input type="submit" class="btn btn-outline-success btn-lg p-3 pl-4 pr-4" value="회원 수정">&nbsp;
					      <input type="reset" class="btn btn-outline-secondary mr-5 btn-lg p-3 pl-4 pr-4" value="변경사항 없음">
						</div>
	                   </div>
	               </div>
	           </div>
                <!-- 회원정보 끝 -->
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


<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	
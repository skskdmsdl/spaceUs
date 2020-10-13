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
<style>
.content{
	background-color: #f8f9fa; 
	color:#343a40;
	padding: 2px;
	width: 70%;
	text-align: center;
}

.content:hover{
	text-decoration: underline;
}

.space-detail>span{
	font-size:20px;
	color:#20c997;
}

.space_list > li{
	list-style:none;
	display: inline;
	color:#ffc107;
	letter-spacing: 1px;
	padding: 1.5px;
}


.space_list > li:hover{
	text-decoration: none;
/* 	list-style:none;
	display: inline;
	
	letter-spacing: 1px;
	padding: 1.5px; */
}

.space_list > li>.icon-won{
	color: #a6e4d2;
	letter-spacing: 1.5px;
	font-weight: bold;
	font-size:13px;
}



</style>

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
                        	<c:choose>
				         	 <c:when test="${ not empty wlist }">
                        	<c:forEach items="${ wlist }" var="wish" varStatus="vs">
							<div class="col-md-3">
							    <div class="thumbnail block-20" >
							    <img class="block-20" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg" alt="..."> 
							</div>
						     <div class="caption">
						     	<a href="${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo=${wish.spaceNo}">
						     	<div class="space-detail">
							        <span class="badge badge-light">${ wish.spaceName}</span>
							        <ul class="space_list">
							        <li><i class="icon-won badge badge-secondary"><fmt:formatNumber value="${wish.hourlyPrice }" type="number"/><small>원/시간</small></i><li>
				    					<li><span class="icon-star"></span>${wish.starAvg }</li>
				    					<li><span class="icon-heart"></span>${wish.likeCnt }</li>
				    					<%-- <li><span class="icon-eye"></span>${space.views }</li> --%>
	    							</ul>
						        </div>
						        <div class="content">
						        	<p class="content" style="width:250px;">${ wish.content}</p>
						        </div>
						        </a>
						        <form name="deleteFrm" 
									  action="${pageContext.request.contextPath}/member/deleteWish.do" 
									  method="post" >
						       
						        <input type="hidden" name="spaceNo" value="${wish.spaceNo }"/>
						        <input type="hidden" name="email" value="${wish.email }"/>
						        
						        <p><button class="delete btn btn-secondary" type="submit">위시리스트 삭제</button></p>
						        </form>
						     </div>
							  </div>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<div style="text-align: center; width: 90%; padding:20px;">
									<span class="icon-folder" style="letter-spacing:1px;">조회된 위시리스트가 없습니다.</span>
								</div>
							</c:otherwise>
							</c:choose>	
						  </div>
						</div>
						</div>
					</div>
				</div>
                <!-- 위시리스트 끝 -->
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

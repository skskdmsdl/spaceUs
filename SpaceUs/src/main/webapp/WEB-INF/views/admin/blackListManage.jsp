<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://kit.fontawesome.com/b74a25ff1b.js" crossorigin="anonymous"></script>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<style>
body {
    color: #566787;
    background: #f5f5f5;
    font-family: 'Varela Round', sans-serif;
    font-size: 13px;
}

.table-responsive {
    margin: 30px 0;
}

.table-wrapper {
    min-width: 1000px;
    background: #fff;
    padding: 20px 25px;
    border-radius: 3px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
    padding-bottom: 15px;
    background: #dfe2e4;
    color: #fff;
    padding: 16px 30px;
    margin: -20px -25px 10px;
    border-radius: 3px 3px 0 0;
}

.table-title h2 {
    margin: 5px 0 0;
    font-size: 24px;
}

.table-title .btn {
    color: #566787;
    float: right;
    font-size: 13px;
    background: #fff;
    border: none;
    min-width: 50px;
    border-radius: 2px;
    border: none;
    outline: none !important;
    margin-left: 10px;
}

.table-title .btn:hover,
.table-title .btn:focus {
    color: #566787;
    background: #f2f2f2;
}

.table-title .btn i {
    float: left;
    font-size: 21px;
    margin-right: 5px;
}

.table-title .btn span {
    float: left;
    margin-top: 2px;
}

table.table tr th,
table.table tr td {
    border-color: #e9e9e9;
    padding: 12px 15px;
    vertical-align: middle;
}

table.table tr th:first-child {
    width: 60px;
}

table.table tr th:last-child {
    width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
    background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
    background: #f5f5f5;
}

table.table th i {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
}

table.table td:last-child i {
    opacity: 0.9;
    font-size: 22px;
    margin: 0 5px;
}

table.table td a {
    font-weight: bold;
    color: #566787;
    display: inline-block;
    text-decoration: none;
}

table.table td a:hover {
    color: #2196F3;
}

table.table td a.settings {
    color: #2196F3;
}

table.table td a.delete {
    color: #F44336;
}

table.table td i {
    font-size: 19px;
}

table.table .avatar {
    border-radius: 50%;
    vertical-align: middle;
    margin-right: 10px;
}

.status {
    font-size: 30px;
    margin: 2px 2px 0 0;
    display: inline-block;
    vertical-align: middle;
    line-height: 10px;
}

.text-success {
    color: #10c469;
}

.text-info {
    color: #62c9e8;
}

.text-warning {
    color: #FFC107;
}

.text-danger {
    color: #ff5b5b;
}

.pagination {
    float: right;
    margin: 0 0 5px;
}

.pagination li a {
    border: none;
    font-size: 13px;
    min-width: 30px;
    min-height: 30px;
    color: #999;
    margin: 0 2px;
    line-height: 30px;
    border-radius: 2px !important;
    text-align: center;
    padding: 0 6px;
}

.pagination li a:hover {
    color: #666;
}

.pagination li.active a,
.pagination li.active a.page-link {
    background: #03A9F4;
}

.pagination li.active a:hover {
    background: #0397d6;
}

.pagination li.disabled i {
    color: #ccc;
}

.pagination li i {
    font-size: 16px;
    padding-top: 6px
}

.hint-text {
    float: left;
    margin-top: 10px;
    font-size: 13px;
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
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
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
	                <li> <a class="waves-effect " id="blackListBtn" aria-expanded="false" href="${pageContext.request.contextPath }/admin/blackListManage.do"><i class="fa fa-ban"></i><span class="hide-menu">블랙리스트 관리</span></a></li>
	            </ul>
	        </nav>
	        <!-- End Sidebar navigation -->
	    </div>
	    <!-- End Sidebar scroll-->
	</aside>
	<!-- 왼쪽 목록 끝 -->
	 
    <div class="page-wrapper">
       <div class="container-fluid">
          <div class="row page-titles">
             <div class="col-md-5 align-self-center">
                 <h4 class="text-themecolor ml-5">BlackList 관리</h4>
             </div>
             <div class="col-md-7 align-self-center text-right">
                 <div class="d-flex justify-content-end align-items-center mr-5">
                     <ol class="breadcrumb">
                         <li class="breadcrumb-item"><a href="javascript:void(0)">관리</a></li>
                         <li class="breadcrumb-item active">블랙리스트 관리</li>
                     </ol>
                 </div>
             </div>
          </div>
          
          <!-- memberManageList시작 -->
            <div class="container-xl ml-5 mr-5">
            
            	<!-- 소모임 테이블  시작-->
		        <div class="table-responsive card p-5" style="border-radius: 10px">
		            <div class="table-wrapper card-body">
		                <div class="table-title" style="border-radius: 10px;">
		                    <div class="row" style="display: flex; justify-content: space-between;">
		                    	<div>
					        		<h4>소모임 게시물</h4>
					        	</div>           
		                    </div>
		                </div>
		                <table class="table table-striped table-hover">
		                    <thead>
		                        <tr>
		                            <th>NO</th>
		                            <th>게시물 작성자</th>
		                            <th>게시물 타이틀</th>
		                            <th>사유</th>
		                            <th>게시물 상태</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    	<c:forEach items="${groupList}" var="group" varStatus="vs">
		                    		<tr>
				                   		<td>${vs.count}</td>
				                   		<td>${group.memberEmail}</td>
				                   		<td>
				                   			<c:choose>
				                   				<c:when test="${fn:contains(gbList,group.reportBoardNo)}">
						                   			<a href="${pageContext.request.contextPath}/community/group/groupDetail/${group.reportBoardNo}.do">
						                   				${group.title}
						                   			</a>
				                   				</c:when>
				                   				<c:otherwise>
				                   					${group.title}
				                   				</c:otherwise>
				                   			</c:choose>
				                   		</td>
				                   		<td>
											 <button type="button" name="reportBoardNo" value="${group.reportBoardNo}"
													class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
											  사유
											</button> 	
				                   		</td>
				                   		<td>
				                   			<c:choose>
					                   			<c:when test="${fn:contains(gbList,group.reportBoardNo)}">
						                   			<span class="status text-success">&bull;</span> 게시물이 존재합니다
					                   			</c:when>
					                   			<c:otherwise>
						                   			<span class="status text-warning">&bull;</span> 게시물이 삭제되었습니다
					                   			</c:otherwise>
				                   			</c:choose>
				                   		</td>
		                    		</tr>
		                    	</c:forEach>
		                    </tbody>
		                </table>
		                
		                
		            </div>
		        </div>
		        <!-- 소모임 테이블 끝 -->
		         
		        <!-- 구인구직 테이블 시작 -->
		        <div class="table-responsive card p-5" style="border-radius: 10px">
		            <div class="table-wrapper card-body">
		                <div class="table-title" style="border-radius: 10px;">
		                	 <div class="row" style="display: flex; justify-content: space-between;">
		                    	<div>
					        		<h4>구인구직 게시물</h4>
					        	</div>           
		                     </div>
		                </div>
		                <table class="table table-striped table-hover">
		                    <thead>
		                        <tr>
		                            <th>NO</th>
		                            <th>게시물 작성자</th>
		                            <th>게시물 타이틀</th>
		                            <th>사유</th>
		                            <th>게시물 상태</th>
		                        </tr>
		                    </thead>
		                    <tbody>
								<c:forEach items="${recruitList}" var="recruit" varStatus="vs">
									<c:if test="${not empty recruit}">
			                    		<tr>
					                   		<td>${vs.count}</td>
					                   		<td>${recruit.memberEmail}</td>
					                   		<td>
					                   			<c:choose>
					                   				<c:when test="${fn:contains(rList,recruit.reportBoardNo)}">
							                   			<a href="${pageContext.request.contextPath}/community/recruit/recruitDetail.do?no=${recruit.reportBoardNo}">
							                   				${recruit.title}
							                   			</a>
					                   				</c:when>
					                   				<c:otherwise>
					                   					${recruit.title}
					                   				</c:otherwise>
					                   			</c:choose>
					                   		</td>
					                   		<td>
												 <button type="button" name="reportBoardNo" value="${recruit.reportBoardNo}"
														class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
												  사유
												</button> 	
					                   		</td>
					                   		<td>
					                   			<c:choose>
						                   			<c:when test="${fn:contains(rList,recruit.reportBoardNo)}">
							                   			<span class="status text-success">&bull;</span> 게시물이 존재합니다
						                   			</c:when>
						                   			<c:otherwise>
							                   			<span class="status text-warning">&bull;</span> 게시물이 삭제되었습니다
						                   			</c:otherwise>
					                   			</c:choose>
					                   		</td>
			                    		</tr>
		                    		</c:if>
		                    		<c:if test="${empty recruit}">
		                    			<tr>
		                    				<td>입력된 행이 존재하지 않습니다</td>
		                    			</tr>
		                    		</c:if>
		                    	</c:forEach>
		                    </tbody>
		                </table>        
		            </div>
		        </div>
		        <!-- 구인구직 테이블 끝 -->
		        
		    </div>
          <!-- memberManageList끝-->
       </div>
    </div>
	 
	 <!-- 어드민 memberManage1 본문 끝-->
	 </div>
 </div>

<script type="text/javascript">
$("[name=reportBoardNo]").click(function(){
	var boardNo = $(this).val();

	$.ajax({
		url: "${pageContext.request.contextPath}/admin/reasonList.do?boardNo="+boardNo,
		dataType: "json",
		method: "GET",
		success: function(data){
			console.log(data);
			var str = "";
			for(var i in data){
				str=data[i].reportReason;
			};
				alert(str);
			/* displayResultModal(data); */
		},
		error: function(x,s,e){
			alert('실패');
			console.log("처리실패",x,s,e);
		} 
	});
});
</script>

<!-- Modal -->
 
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
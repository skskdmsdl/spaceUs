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
<style>
.qna-filter-container{
 	text-align: right;
 	width:99%;
 	margin-top: 10px;
}

</style>


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
                         <div class="col-md-11">
                            <!--  <h5 class="card-title">공간 최근 게시물</h5> -->
                             <ul class="nav nav-tabs">
                             	<li class="nav-item"><a class="nav-link active" href="#">최근 질문 게시글</a></li>
                             	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/host/hostCheckReview.do">최근 리뷰 게시글</a></li>
                             </ul>
	                    
	                    <div class="">
                    	     <div class="qna-filter-container">
								  <button id="show-unreplied" class="btn btn-secondary btn-sm" type="button" onclick="unreplied();" value="${loginMember.principal.memberEmail }">
								  <i id="check-unreplied" class=""></i>
								    ${loginMember.principal.nickName }님의 답변을 기다리는 질문
								  </button>
                    		 </div>
                          <!-- 질문글 시작 -->
				          <div class="col-md-11 d-flex ftco-animate">
				          	<div class="blog-entry justify-content-end">
				              <div class="text">
				                <h3 class="heading"><a href="#">질문제목제목제목</a></h3>
				                <%-- <a href="blog-single.html" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/image_4.jpg');"> --%>
					              </a>
				                <p id="qna-content">질문내용내용내용질문내용내용내용질문내용내용내용질문내용내용내용질문내용내용내용</p>
				                <div class="meta mb-3">
				                  <div><a href="#">깡</a></div>
				                  <div><a href="#">July. 24, 2019</a></div>
				                  <div><a href="#" class="meta-chat"><span class="fa fa-lock"></span> 비공개</a></div>
				                </div>
				              </div>
				            </div>
				          </div>
				        <!-- 질문글 끝 -->
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
function unreplied(){
	var hostId = $("#show-unreplied").val();
	
	console.log(hostId);
	
    $.ajax({
        type: "GET",
		url : "${pageContext.request.contextPath}/host/unreplied.do",
		data :  {
			hostId : hostId
		},
		dataType: "json",
		success: function(data){
			 console.log(data)
			 $("#check-unreplied").addClass("fa fa-check");
			 $("#show-unreplied").css('background-color','#20c997');
			 $.each(data, function (i, item) {
                 $('p#qna-content').append(item.content + '<br>');
             })
			},
		error: function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
			}
     });
};
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	

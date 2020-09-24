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
*{margin:0; padding:0;}
.star{
  display:inline-block;
  width: 30px;height: 30px;
  cursor: pointer;
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0; 
  background-size: 100%; 
}
.star.on{
  background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
}
</style>

<div class="skin-default-dark fixed-layout">
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
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
                <span>마이페이지</span>
                <a class="waves-effect waves-dark ml-auto hidden-sm-down" href="javascript:void(0)"><i class="ti-menu"></i></a>
                <a class="nav-toggler waves-effect waves-dark ml-auto hidden-sm-up" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
            </div>
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <sec:authorize access="hasAnyRole('USER', 'HOST')">
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/memberProfile.do"><i class="fa fa-user"></i><span class="hide-menu">내 정보 관리</span></a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/wishList.do"><i class="fa fa-user"></i><span class="hide-menu">좋아요 리스트</span></a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/usageHistory.do"><i class="fa fa-table"></i><span class="hide-menu"></span>내 이용 내역</a></li>
  						<li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/reviewList.do"><i class="fa fa-user"></i><span class="hide-menu">내가 쓴 글 리스트</span></a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/couponList.do"><i class="fa fa-heart"></i><span class="hide-menu"></span>내 쿠폰함</a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/stampEvent.do"><i class="fa fa-gift"></i><span class="hide-menu"></span>출석체크</a></li>
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
                        <h4 class="text-themecolor ml-5">마이페이지</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center mr-5">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">마이페이지</a></li>
                                <li class="breadcrumb-item active">리뷰</li>
                            </ol>
                        </div>
                    </div>
                </div>
               
		        <!-- 리뷰 -->
		        <div id="reviewPage" class="ml-5 mr-5">
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
				                         <div class="pl-5 pr-5" style="height: 150px;">
				                         	<div class="row pl-3 align-items-xl-center">
				                         		<p class="m-1" style="font-size: 15px;">별점 &nbsp;&nbsp;:</p>
				                         		<div class="star-box">
												  <span class="star mt-2"></span>
												  <span class="star "></span>
												  <span class="star "></span>
												 <span class="star "></span>
												 <span class="star "></span>
												</div>
												<div>
												</div>
												<form name="boardFrm" 
													  action="${pageContext.request.contextPath}/review/테스트.do" 
													  method="post" 
													  onsubmit="return boardValidate();"
													  enctype="multipart/form-data"
													  style="position: absolute;right: 53px;">
													  <div class="input-group mb-3" style="padding:0px;">
													  <div class="custom-file">
													    <input type="file" class="custom-file-input" name="upFile" id="upFile1" >
													    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
													  </div>
													</div>
												<!-- <div class="m-1" style="position: absolute;right: 60px;">+ 사진</div> -->
												</form>
				                         	</div>
				                         		 <textarea class="col-lg-11" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px;"></textarea>
				                           		<button type="button" class="btn" style="margin-bottom: 70px;height: 80px; border: 1px solid #dddddd;width: 70px;">등록</button>
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
$(".star").on('click',function(){
	   var idx = $(this).index();
	   $(".star").removeClass("on");
	     for(var i=0; i<=idx; i++){
	        $(".star").eq(i).addClass("on");
	   }
	 });
//사진 첨부
$(function(){
	$("[name=upFile]").on("change", function(){
		//input:file 내부에 저장된 file객체 가져오기
		var file = $(this).prop("files")[0];
		var $label = $(this).next('.custom-file-label');
		
		//label에 쓰기
		if(file == undefined)
			$label.html("파일을 선택하세요.");
		else 
			$label.html(file.name);
		
	});
});
</script>
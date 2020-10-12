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
                                <li class="breadcrumb-item active">사용 내역</li>
                            </ol>
                        </div>
                    </div>
                </div>
                    
                <!-- 이용내역 -->
                 <div id="usageHistoryPage" class="ml-5 mr-5">
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
                               		<c:forEach items="${spaceList}" var="info" varStatus="vs">
										<div class="sl-item">
		                                     <div class="row">
		                                    	<div class="mb-5 ml-5 mr-5 mt-3" >
							    					<img class="usageHistoryImg" src="${pageContext.request.contextPath }/resources/upload/space/${info.rname}" alt="..."> 
		                                     	</div>
		                                        <div class="mt-2 col-md p-20">
		                                            <div><a href="#">${ info.spaceName }</a> <span class="sl-date">${ revList[vs.index].revDate }</span></div>
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
									</c:forEach>
                               		<%-- <div class="sl-item">
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
                                   </div> --%>
                               
                                </div>
                            </div>
                        </div>
                    </div>
              	<!-- 이용내역 끝 -->
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
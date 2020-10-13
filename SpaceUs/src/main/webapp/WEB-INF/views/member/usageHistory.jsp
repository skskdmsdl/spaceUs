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
.nochoose {background-color:#e6e6e6;}
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
		                           <div class="col-md-9">
		                                <h5 class="card-title">사용 내역</h5>
		                                <h6 class="card-subtitle">사용 공간 내역을 확인하세요</h6>
		                           </div>
	                       		   <div class="col-md-3">
	                                   <select class="custom-select b-0" id="selectId" >
	                                       <option value="1" <c:if test="${status == 'all'}">selected</c:if> >
	                                       			전체 공간</option>
	                                       <option value="2" <c:if test="${status == 'ing'}">selected</c:if> >
	                                       			예약중</option>
	                                       <option value="3" <c:if test="${status == 'finish'}">selected</c:if> >
	                                       			예약취소/사용완료</option>
	                                   </select>
	                               </div> 
	                           </div>
                           
                               <div class="steamline m-t-40">
                               		<c:forEach items="${revList}" var="info" varStatus="vs">
										<div>
		                                     <c:choose>
									   				<c:when test="${ info.revCancle eq info.revComplete}">
										   			   <div class="row">
										   			   <p>${ vs.index + 1 }</p>
									   			 	</c:when>
									   			 	<c:otherwise>
									   			 		<div class="row nochoose">
									   			 		<p>${ vs.index + 1 }</p>
									   			 	</c:otherwise>
									   		 </c:choose>
									   		 <div class="mb-5 ml-5 mr-5 mt-3" >
									   		 <c:choose>
									   				<c:when test="${ info.spaceNo == null}">
									    					<img class="usageHistoryImg" src="${pageContext.request.contextPath }/resources/images/delete.png" alt="..."> 
				                                     	</div>
				                                        <div class="mt-2 col-md p-20">
				                                            <div><a href="">공간이 존재하지 않습니다</a> <span class="sl-date">${ info.revDate }</span></div>
									   			 	</c:when>
									   			 	<c:otherwise>
				                                        	<img class="usageHistoryImg" src="${pageContext.request.contextPath }/resources/upload/space/${spaceList[vs.index].rname}" alt="..."> 
				                                     	</div>
				                                        <div class="mt-2 col-md p-20">
				                                            <div><a href="${ pageContext.request.contextPath }/space/spaceDetail.do?spaceNo=${ spaceList[vs.index].spaceNo }">${ spaceList[vs.index].spaceName }</a> <span class="sl-date">${ info.revDate }</span></div>
									   			 	</c:otherwise>
									   		 </c:choose>
		                                    	
		                                        	<div class="row"> 
			                                            <div class="col-md-9 m-b-30">
			                                            	<c:choose>
			                                            		<c:when test="${ info.revCancle eq 1 }">
			                                            			<p>상태 : 예약취소</p>
			                                            		</c:when>
			                                            		<c:when test="${ info.revComplete eq 1 }">
			                                            			<p>상태 : 사용완료</p>
			                                            		</c:when>
			                                            		<c:otherwise>
			                                            			<p>상태 : 예약중</p>
			                                            		</c:otherwise>
			                                            	</c:choose>
			                                            </div>
			                                            <div class="col-md-9">
			                                                <form:form name="revCancle" id="revCancle"
										                         	   action="${pageContext.request.contextPath}/reservation/cancleReservation.do"
																	   method="POST">
															<input type="hidden" name="revNo" value="${ info.revNo }">
			                                                <button type="button" class="btn m-r-5 btn-rounded btn-outline-success" data-toggle="modal" data-target="#confirmModal${ vs.index }">예약확인</button>
															
															<c:choose>
													   				<c:when test="${ info.revCancle eq info.revComplete}">
														   			   <button type="submit" class="btn btn-rounded btn-outline-danger">예약취소</button>
													   			 	</c:when>
													   			 	<c:otherwise>
													   			 		<button type="button" class="btn btn-rounded btn-outline-danger">예약취소</button>
													   			 	</c:otherwise>
													   		 </c:choose>
															
															</form:form>
			                                            </div>
		                                            </div>
		                                        </div>
		                                	</div>
		                            	</div>
		                            	
		                            	<!-- Modal -->
										<div class="modal fade" id="confirmModal${ vs.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="exampleModalLabel">예약확인</h5>
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
										          <span aria-hidden="true">&times;</span>
										        </button>
										      </div>
										      <div class="modal-body">
							                        <div class="section-title sidebar-title-b">
							                            <h6>공간 정보</h6>
							                        </div>
							                            <p>공간 이름 : ${ spaceList[vs.index].spaceName }</p>
							                            <p>주소 : ${ spaceList[vs.index].address }</p>
							                            <p>전화번호 : ${ spaceList[vs.index].spacePhone }</p>
							                  		<div class="section-title sidebar-title-b">
							                            <h6>예약 정보</h6>
							                        </div>
							                            <p>예약 날짜 : ${ info.day }</p>
							                            <p>예약 시간 : ${ info.startHour }:00 ~ ${ info.endHour }:00</p>
							                            <p>결제 금액 : ${ info.totalPrice }</p>
							                            <p>결제 수단 : ${ info.pay }</p>
								              		
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary site-btn" data-dismiss="modal">Close</button>
										      </div>
										    </div>
										  </div>
										</div>
									</c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
              	<!-- 이용내역 끝 -->
    </div>
</div>
</div>
</div>

<script>

//제출전처리
$("#revCancle").submit(function(){
	return confirm('정말 예약을 취소하시겠습니까?');
});

//사용내역 모아보기
$("#selectId").change(function(){
	let option = $("#selectId").val();
	if(option == 1) location.href="${pageContext.request.contextPath}/member/usageHistory.do";
	else if(option == 2) location.href="${pageContext.request.contextPath }/member/usageIng.do";
	else location.href="${pageContext.request.contextPath }/member/usageFinish.do";
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

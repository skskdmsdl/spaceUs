<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%-- 한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/hostpageMenu.jsp" />
        
   <div class="page-wrapper">
       <div class="container-fluid">
       		    <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor ml-5">호스트 센터</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center mr-5">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">호스트 센터</a></li>
                                <li class="breadcrumb-item active">공간 예약 현황</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div id="profileEditPage" class="ml-5 mr-5">
                    <div class="card p-5">
                       <div class="card-body">
                        <div class="row"> 
                         <div class="col">
                             <h5 class="card-title">공간 예약 현황</h5>
                             <h6 class="card-subtitle mb-5">공간 예약 현황을 확인하세요</h6>
                              
                              <!--reservationList시작 -->
				            <div class="container-xl ml-5 mr-5">
						        <div class="table-responsive card p-5">
						            <div class="table-wrapper card-body">
						            	<!-- 테이블 타이틀 시작 -->
						                <div class="table-title" style="border-radius: 10px;">
						                    <div class="row" style="display: flex; justify-content: space-between;">
						                        <!-- 입력창  시작-->
							                    <div class="search-container" style="display: inline;">
							                    <div class="row">
							                    </div>
							                    <div class="row">
							                   
													<div class="font-bold mr-4 ml-5 align-self-center">회원 조회</div>
													<div id="search-userId" class="input-group-prepend">
														<form action="${ pageContext.request.contextPath }/host/hostSearchReservation.do" class="input-group-prepend">
															<input type="text" class="input-group-text" name="memberEmail"
																   id="searchKeyword" size="25" placeholder="검색할 이메일을 입력하세요"
																   style="border-radius: 5px; size: portrait;"/>
															<button type="submit" class="search-btn button btn btn-secondary ml-2">검색</button>
														</form>
													</div>
							                    </div>
													
												</div>
						                   		<!-- 입력창 끝 -->
						                   		<div class="btn-div" style="display: inline-block; float: right;">
													<form action="${pageContext.request.contextPath }/host/hostReservationOrder.do">
														<button type="submit" class="btn" name="order" value="all" style="background:#019efb; color: #fff;">예약일순</button>
														<button type="submit" class="btn mr-3" name="order" value="rev" style="background:#ffbc34; color: #fff;">이용일순</button>
													</form>
												</div>
						             
						                    </div>
						                </div>
						            	<!-- 테이블 타이틀 끝 -->
						            	
						                <table class="table table-striped table-hover mt-4">
						                
						                    <thead>
						                        <tr>
						                            <th class="text-center">NO</th>
						                            <th class="text-center">닉네임</th>
						                            <th class="text-center">이메일</th>
						                            <th class="text-center">전화번호</th>
						                            <th class="text-center">예약일자</th>
						                            <th class="text-center">이용일자</th>
						                            <th class="text-center">이용시간</th>
						                            <th class="text-center">취소여부</th>
						                        </tr>
						                    </thead>
						                    <tbody>
						                   <%--  <c:choose>
			         					 <c:when test="${ not empty list }"> --%>
					                    	<c:forEach items="${list}" var="reservation" varStatus="vs">
							                        <tr>
							                            <td class="text-center">${vs.count }</td>
							                            <td class="text-center">${reservation.nickName}</td>
							                            <td class="text-center">${reservation.memberEmail}</td>
							                            <td class="text-center">${reservation.phone}</td>
							                            <td class="text-center"><fmt:formatDate value="${reservation.revDate}" pattern="yy.MM.dd"/></td>
							                            <td class="text-center"><fmt:formatDate value="${reservation.day}" pattern="yy.MM.dd"/></td>
							                            <td class="text-center">${reservation.startHour}시 - ${reservation.endHour}시</td>
							                            <td class="text-center">
							                                ${ reservation.revCancle == 0 ? "-" : "취소" }
							                            </td>
							                        </tr>
						                    	</c:forEach>
						                    	<%-- </c:when>
												<c:otherwise>
												<tr>
													<div style="text-align: center; width: 90%; padding:20px;">
														<span class="icon-folder" style="letter-spacing:1px;"> 조회된 예약이 없습니다.</span>
													</div>
												</tr>
												</c:otherwise>
												</c:choose>	 --%>
						                    </tbody>
						                </table>
						                
						                    	
						                 <div class="container">
							                 <div class="container">
							                 <nav class="mt-5" >
												<ul class="justify-content-center pagination">${ pageBar }</ul>
											</nav>
							 			</div>
							 			</div>
						            </div>
						        </div>
						    </div>
				          <!-- reservaionList끝-->
                             
                             
                         </div>
	                    </div>
						 <table class="col-11">
							<tr>
							<th></th>
							</tr>
							<tr>
							<td></td>
							</tr>
					    </table>
					</div>
				</div>
			</div>		
       </div>
   </div>
        
 </div>
</div>    
 
<script>
$("#searchKeyword").click(function(){
	$("#searchKeyword").css("background-color", "white");
})
$("#searchKeyword").blur(function(){
	$("#searchKeyword").removeAttr('style');
})
</script>
	
	
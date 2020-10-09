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
                                <li class="breadcrumb-item active">내 정보관리</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- 회원정보 -->
                <!-- 채팅 -->
			 <div id="talkjs-container" style="background-color: rgba(0,0,0,0);margin-left: 300px; height: 500px; position: fixed; z-index: 10;box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px; display:none;">
			    <i>Loading chat...</i>
			</div> 
			 <sec:authorize access="hasAnyRole('ADMIN')">
			<div>
				<button id="chatBtn">🧑</button>
			</div>
			</sec:authorize>
                <div id="profileEditPage" class="ml-5 mr-5">
                    <div class="card p-5">
                       <div class="card-body">
                        <div class="row"> 
                         <div class="col-md-10">
                             <h5 class="card-title">나의 정보</h5>
                             <h6 class="card-subtitle mb-5">회원정보를 확인하세요</h6>
                         </div>
	                    </div>
						 <table class="col-11">
							<tr>
								<th class="align-baseline" >닉네임</th>
								<th><input type="text" class="col-7 input-group-text mb-4 mr-5 pull-right" style="background-color: white;" value="<sec:authentication property="principal.nickName"/>" required /></th>
							</tr>
						    <tr>
						      <td class="align-baseline">이메일 계정</td>
						      <td><input type="email" class="col-7 input-group-text mb-4 mr-5 pull-right" value="<sec:authentication property="principal.username"/>" disabled /></td>
							</tr>
						    <tr>
						      <td class="align-baseline">생일</td>
						      <td><input type="date" class="col-7 input-group-text mb-4 mr-5 pull-right" style="background-color: white;" value="<sec:authentication property="principal.birthDay"/>"/></td>
							</tr>
						    <tr>
						      <td class="align-baseline">핸드폰</td>
						      <td>
							      <div class="row" style="margin-right: 50px;">
								      <input type="tel" class="col-5 input-group-text mb-4 ml-auto mr-5" style="background-color: white;" maxlength="11" value="<sec:authentication property="principal.memberPhone"/>" required />
								      <div class="btn-wrap">
										<button class="btn btn-primary font-bold">휴대폰 인증</button>				
									  </div>
							      </div>
							  </td>
							</tr>
						</table >
							<div class="mt-5 mr-5" style="text-align: right;padding-top: 20px;">
						      <input type="submit" class="btn primary-btn p-3 pl-4 pr-4" value="회원정보 수정">&nbsp;
						      <input type="reset" class="btn btn-outline-secondary mr-5 btn-lg p-3 pl-4 pr-4 font-weight-bolder" value="변경사항 없음">
							</div>
						  <div class="mt-5" style="border-top: 1px solid #bbbbbb" ></div>
						  <h6 class="card-subtitle mt-3 mb-5">비밀번호를 입력해주세요.</h6>
						  <table class="col-11">
							<tr>
						      <td class="align-baseline">새 비밀번호</td>
						      <td><input type="password" class="col-8 input-group-text ml-auto mb-4 mr-5" style="background-color: white;" value="" /></td>
							</tr>
						    <tr>
						      <td class="align-baseline">새 비밀번호 확인</td>
						      <td><input type="password" class="col-8 input-group-text ml-auto mb-5 mr-5" style="background-color: white;" value="" required /></td>
							</tr>
						</table>
						<div class="mt-5 pull-right mr-5">
					      <input type="submit" class="btn primary-btn p-3 pl-4 pr-4" value="비밀번호 수정">&nbsp;
					      <input type="reset" class="btn btn-outline-secondary mr-5 btn-lg p-3 pl-4 pr-4 font-weight-bolder" value="변경사항 없음">
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
<script>
$(function(){
	$("#chatBtn").click(function(){
		$("#talkjs-container").toggle('show');
	});
	
});
</script>

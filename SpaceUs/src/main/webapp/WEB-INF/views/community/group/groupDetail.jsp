
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
.image-div {
	background-color:#f7f7f7;
	border:1px solid gray;
	display:inline-block;
	width:200px;
	height: 200px;
	margin-right: 20px;
}
.fas {position: absolute; padding: 90px;}
input[type=file], .address-input {margin-bottom:20px; margin-top:10px;}
.site-btn {width: 100%; font-size: 17px;}
</style>
<!-- 컨텐츠 시작 -->
<!-- 헤더 -->
<section class="ftco-section ftco-agent">

 <div class="navbar justify-content-center navbar-dark bg-dark">
	  <ul class="nav">
		  <li class="nav-item">
		    <a class="nav-link active" href="${pageContext.request.contextPath }/community/group/groupList.do">소모임</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="${pageContext.request.contextPath }/community/recruit/recruitList.do">구인/구직</a>
		  </li>
		</ul>
	</div>
</section>

    <div class="hero-wrap ftco-degree-bg"
    	 style="background-image: url('${pageContext.request.contextPath }/resources/images/bg_1.jpg');
    	 		height: 400px"
    	 data-stellar-background-ratio="0.5">
	
      <div class="overlay"></div>
	
      <div class="container">
        <div class="row no-gutters slider-text justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text text-center mx-auto" style="margin-bottom:80%;">
	            <h1 class="mb-4">소모임</h1>
	            <p class="h6">
	                        소모임 게시판은 공동체 활동에 대한 소모임 관련 정보를 교환하는 게시판으로, SpaceUs에서는 정보교환의 온라인 공간을 제공할 뿐 중개에 관여하지 않으며,
				그에 따른 과실 또는 손해발생에 대해 일체 책임을 지지 않음을 알려드립니다.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 소모임 시작-->
	<section class="blog-section spad">
	 <div class="row m-5">
                 <!-- column -->
                 <c:forEach items="${list}" var="list">
	                 <div class="col-12">
	                         <div class="m-5" style="border-bottom: 1px solid #dddddd;">
									
	                         <div style="border-bottom: 1px solid #dddddd; padding-bottom: 15px;">
	                            <p class="h4">${list.groupBoardTitle}</p>
	                         	<table style="display: inline-block;">
	                                <tr>
	                                    <th><i class="fa fa-user"></i>${list.nickname}</th>
	                                    <th class="col-xl-auto">|</th>
	                                    <th><i class="fa fa-calendar"></i>${list.groupBoardDate}</th>
	                                    <th class="col-xl-auto">|</th>
	                                    <th><i class="fa fa-eye"></i> 조회수 ${list.viewCnt}</th>
	                                </tr>
	                                <input type="hidden" name="groupBoardNo" value="${list.groupBoardNo}"/>
	                            </table>
	                            
		                        <!-- 수정삭제 버튼시작 -->
		                        <sec:authorize access="hasAnyRole('USER','ADMIN')">
		                        	<sec:authentication property="principal.username" var="loginMember"/>
		                            <button id="modifyBtn" class="btn btn-sm btn-danger" onclick="location.href='${pageContext.request.contextPath}/community/group/modifyBoard/${list.groupBoardNo}.do'" style="margin-top:50px; font-size:15px; color:white; float:right; margin-right: 35px; margin-top: 0;">신고하기 </button>	
		                          	<c:if test="${loginMember != null && loginMember eq list.memberEmail }">
			                            <button id="modifyBtn" class="btn btn-sm" onclick="location.href='${pageContext.request.contextPath}/community/group/modifyBoard/${list.groupBoardNo}.do'" style="margin-top:50px; background-color: #00c89e; font-size:15px; color:white; float:right; margin-right: 10px; margin-top: 0;">글 수정 </button>
			                           	<div style="display: inline-block;"></div>
			                            <button id="deleteBtn" class="btn btn-sm" style="margin-top:42px;background-color: #00c89e;font-size:15px;color:white;float:right;margin-right: 10px;margin-top: 0;border-right-width: 0px;padding-right: 9px;">글 삭제 </button>
		                          	</c:if>	                          	
		                        </sec:authorize>
		                        <!-- 수정삭제 버튼끝-->
	                         </div>
	                         
	                         <div class="m-5">
	                         <div class="mb-5">
	                   			${list.groupBoardContent}
	                         </div>
	                         
	                         
	                         <!-- 댓글 시작 -->
	                         <div style="background-color: #fafafa; height: 200px; border: 1px solid #edeceb; ">
	                         	<div class="pl-5 pr-5 pt-4">
	                         		<p>댓글 0개</p>
	                         		 <textarea class="col-lg-11" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px;"></textarea>
	                           		<button type="button" class="btn" style="margin-bottom: 70px;height: 80px; border: 1px solid #dddddd;width: 70px;">등록</button>
	                           </div>
	                         </div>
	                         <!-- 댓글 끝 -->
	                         </div>
	                         </div>
	                         <div class="text-center">
				                 	<a href='${pageContext.request.contextPath }/community/group/groupList.do' class="btn m-1" style="background-color: #00c89e; font-size:20px; color:white;"><i class="fa fa-list"></i> 목록</a>
	                             </div>
	                     </div>
                   </c:forEach>
          
                 </div>
             </section>
    <!-- 소모임 리스트 끝-->
<!-- 컨텐츠 끝 -->
<script type="text/javascript">
$("#deleteBtn").click(function(){
	let groupBoardNo = $("[name=groupBoardNo]").val();
	if(!confirm('정말 삭제하시겠습니까??')) return;
	location.href="${pageContext.request.contextPath }/community/group/deleteBoard.do?groupBoardNo="+groupBoardNo;
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
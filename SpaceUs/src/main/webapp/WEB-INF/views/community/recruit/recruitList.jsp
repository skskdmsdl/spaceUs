<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<%
Authentication auth = SecurityContextHolder.getContext().getAuthentication();
String loginMember = auth.getName();
pageContext.setAttribute("loginMember",loginMember);
%>
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
.viewDate{
	padding-right: 0;
}
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
	            <h1 class="mb-4">구인/구직</h1>
	            <p class="h6">구인ㆍ구직 게시판은 각 숙소에서의 스태프(매니저, 아르바이트, 주방 아주머니 등)의
				구인/구직 관련 정보를 교환하는 게시판으로, SpaceUs에서는 정보교환의 온라인 공간을 제공할 뿐 중개에 관여하지 않으며,
				그에 따른 과실 또는 손해발생에 대해 일체 책임을 지지 않음을 알려드립니다.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 구인구직 시작-->
	<section class="blog-section spad">
	 <div class="row m-5">
                 <!-- column -->
                 <div class="col-12">
                         <div class="m-5">
                             <div class="d-flex">
								</div>
									<c:if test="${ category eq 'all' }">
		                                  <input type="radio" class="m-r-10 ml-3 all" checked >전체
		                                  <input type="radio" class="m-r-10 ml-3 hire">구인
		                                  <input type="radio" class="m-r-10 ml-3 jobSearch">구직
	                                </c:if>
									<c:if test="${ category eq 'hire' }">
		                                  <input type="radio" class="m-r-10 ml-3 all" >전체
		                                  <input type="radio" class="m-r-10 ml-3 hire" checked>구인
		                                  <input type="radio" class="m-r-10 ml-3 jobSearch">구직
	                                </c:if>
									<c:if test="${ category eq 'jobSearch' }">
		                                  <input type="radio" class="m-r-10 ml-3 all" >전체
		                                  <input type="radio" class="m-r-10 ml-3 hire">구인
		                                  <input type="radio" class="m-r-10 ml-3 jobSearch" checked>구직
	                                </c:if>
									<c:if test="${ category eq null }">
		                                  <input type="radio" class="m-r-10 ml-3 all" >전체
		                                  <input type="radio" class="m-r-10 ml-3 hire">구인
		                                  <input type="radio" class="m-r-10 ml-3 jobSearch">구직
	                                </c:if>
	                            <form action="${pageContext.request.contextPath }/community/recruit/searchRecruit.do">    
	                                <div class="input-group mb-4 col-4 pull-right">
									  <input type="text" class="input-group-text" name="keyWord" style="background-color: white;">
									  <div class="input-group-append">
									    <button type="submit" class="btn btn-outline-secondary"><span><i class="fa fa-search fa-search mr-2"></i> </span>검색</button>
									  </div>
	                             	</div>
                                </form>
                         
                         <div class="table-responsive">
                             <table class="table table-hover">
                                 <thead>
                                     <tr>
                                         <th class="text-center">#</th>
                                         <th >제목</th>
                                         <th class="text-center" style="padding-right: 0;">작성일</th>
                                         <th class="text-center">조회수</th>
                                         <th class="text-center">작성자</th>
                                     </tr>
                                 </thead>
                                 <tbody>
                                 	<c:forEach items="${list}" var="recruit" varStatus="vs">
                                     <tr style="cursor: pointer;" onclick="recruitDetailFrm('${ recruit.no }')">
                                         <td class="text-center" >${ vs.count }</td>
                                         <td><span class="text-success mr-2" >[${ recruit.header }]</span>${ recruit.title }<span class="text-warning ml-2">[${ recruit.commentCnt }]</span></td>
                                         <td class="text-center"  class="text-center" style="padding-right: 0;"><fmt:formatDate value="${recruit.enrollDate}" pattern="yyyy/MM/dd"/></td>
                                         <td class="text-center">${ recruit.viewCnt }</td>
                                         <td class="text-center">${ recruit.nickName }</td>
                                     </tr>
                                     </c:forEach>
                                 </tbody>
                             </table>
                             <div class="container">
			                 <nav class="mt-5" >
			                 	<a class="btn waves-effect waves-light hidden-md-down m-1 pull-right font-bold" id="recruitEnroll" style="font-size:16px;background-color: #00c89e;  color:white;"> 글 등록</a>
								  <ul class="justify-content-center pagination">${ pageBar }</ul>
								</nav>
							 </div>
                         </div>
                         </div>
                     </div>
                 </div>
             </section>
    <!-- 구인구직 리스트 끝-->
<!-- 컨텐츠 끝 -->
<script>
function recruitDetailFrm(recruit_no){
	let no = recruit_no;
	location.href='${pageContext.request.contextPath }/community/recruit/recruitDetail.do?no='+no;
};
$("#recruitEnroll").click(function(){
	if('${loginMember}' == 'anonymousUser'){
		
		swal("로그인 후 이용할 수 있습니다.")
		.then((value) => {
			location.href="${pageContext.request.contextPath }/member/memberLoginForm.do";
		});
		
	}
	else location.href="${pageContext.request.contextPath }/community/recruit/recruitEnrollForm.do";
}); 
//페이지 모아보기
$(".all").click(function(){
	location.href="${pageContext.request.contextPath }/community/recruit/recruitList.do";
});
$(".hire").click(function(){
	location.href="${pageContext.request.contextPath }/community/recruit/recruitHire.do";
});
$(".jobSearch").click(function(){
	location.href="${pageContext.request.contextPath }/community/recruit/recruitJobSearch.do"; 
});
</script>
<script>$(function () { memberId();});</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
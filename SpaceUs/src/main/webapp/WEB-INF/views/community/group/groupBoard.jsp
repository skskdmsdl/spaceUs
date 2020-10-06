<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.spaceus.community.group.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- icons -->
<script src="https://kit.fontawesome.com/b74a25ff1b.js" crossorigin="anonymous"></script>

<style>
.image-div {
	background-color:#f7f7f7;
	border:1px solid gray;
	display:inline-block;
	width:200px;
	height: 200px;
	margin-right: 20px;
}
.fa-caret-down {float:right;}
.fa-arrow-right {float:left; margin-right: 1.5em; padding-top:.4em;}
/* .fa-arrow-right.click {
	transform: rotate(180deg);
}
.fa-arrow-right.click {
    height: 100%;
    transition: transform 300ms ease-in-out;
}
 */
input[type=file], .address-input {margin-bottom:20px; margin-top:10px;}
.site-btn {width: 100%; font-size: 17px;}

#sideinfo {float:left;}
#content  { background-color:#F5F5F5; float:right;}
.cPage{
	margin-right:9px;
	margin-left:9px;
}
.page-link{
	margin-top:-5px;
}
</style>


<!-- 컨텐츠 시작 -->
	<!-- 네브바 -->
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
	            <p class="h6">소모임 게시판은 사람과 사람을 연결하고 space와 us를 연결하기 위한 자유 게시판으로,<br>
	            			  SpaceUs에서는 정보교환의 온라인 공간을 제공할 뿐 중개에 관여하지 않으며,<br>
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
        	<div class="col-12">
            	<div class="m-5">
                	<!-- 사이드 바 메뉴 시작 -->
	                <aside id="sideinfo" class="w-25 pr-3" style="margin-top: 60px;">
	                	<div class="list-group" >
	                	<div class="list-group-item list-group-item-action" onclick = "location.href='${pageContext.request.contextPath }/community/group/groupList.do'">
							전체보기
							<span class="badge badge-primary badge-pill">${totalCnt}</span>
						</div>
		                <c:forEach items="${boardList}" var="board" varStatus="vs">
                			<form onclick = "location.href='${pageContext.request.contextPath }/community/group/groupList/${board.boardNo}/${board.boardRef}.do'">
			                	<c:if test="${board.boardLevel == 1}">
									<div class="list-group-item list-group-item-action upper-list" id="upper">
										${board.boardName}
									<!-- <span class="badge badge-primary badge-pill">14</span> -->
									<i class="fas fa-caret-down" style="padding: 0; position: relative; right:0;"></i>
									</div>
		                 		</c:if>
		                 		<c:if test="${board.boardLevel == 2}">
		                 			<div class="list-group-item list-group-item-action sub-list">
			                 			<i class="fas fa-arrow-right"></i>
											${board.boardName}
										<!-- <span class="badge badge-primary badge-pill">14</span> -->
									</div>
		                 		</c:if>
		                 		
                			</form>
			            </c:forEach>
						</div>							
	                </aside>
                	<!-- 사이드 바 메뉴 끝 -->
                	
                	<!-- 등록하기 버튼 시작 -->
                	<div>
                		<a href="${pageContext.request.contextPath }/community/group/groupEnrollForm.do" 
                		   class="btn waves-effect waves-light hidden-md-down m-1 pull-right" 
                		   style="font-size:18px;background-color: #00c89e; color:white;"> 
                		      	등록하기
                		</a>
                	</div>
                	<!-- 등록하기 버튼 끝 -->
                	
                	<br />
                	
                	<section id="content" class="w-75 p-3">
                		<div class="table-responsive">
		                	<table class="table table-hover">
			                    <thead>
			                        <tr>
			                            <th class="text-center">No</th>
			                            <th class="text-center">제목</th>
			                            <th>작성일</th>
			                            <th>조회수</th>
			                            <th>작성자</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    <c:forEach items="${groupBoardList}" var="gb" varStatus="vs">
			                        <tr style="cursor: pointer;" onclick = "location.href='${pageContext.request.contextPath }/community/group/groupDetail/${gb.groupBoardNo}.do'">
			                            <td class="text-center">${vs.count}</td>
			                            <td class="txt-oflo">
			                            	<span class="text-success mr-2">
			                            		[${ gb.boardNo=="1"?
			                            			"전체 크루원":gb.boardNo=="2"?
			                            			"카페 크루원":gb.boardNo=="3"?
			                            			"무비 크루원":gb.boardNo=="4"?
			                            			"먹방 크루원":gb.boardNo=="5"?
			                            			"전체공간 나눔":gb.boardNo=="6"?
			                            			"카페공간 나눔":gb.boardNo=="7"?
			                            			"식당공간 나눔":gb.boardNo=="9"?
			                            			"소모임 자랑":"기타"}]
			                            	</span>
			                            		${gb.groupBoardTitle} &nbsp;&nbsp;[${gb.commentCnt}]
			                            </td>
			                            <td class="txt-oflo">${gb.groupBoardDate }</td>
			                            <td class="txt-oflo">${gb.viewCnt}</td>
			                            <td class="txt-oflo">${gb.nickname}</td>
			                        </tr>
			                    </c:forEach>			                      
			                    </tbody>
							</table>
							<!-- 페이징처리 시작 -->
            				<nav aria-label="Page navigation" style="display:inline text-align: center; margin-left: 45%;">
							  <ul class="pagination" style="border:0; margin-right:10px;">
							    ${pageBar}
							  </ul>
							</nav>
							<!-- 페이징 처리 끝 -->
		                </div>
                	</section>      	
            	</div>
        	</div>
    	</div>
	</section>
    <!-- 소모임 끝-->

<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

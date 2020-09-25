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
	                <aside id="sideinfo" class="w-25 pr-3">
	                	<div class="list-group">
	                	<div class="list-group-item list-group-item-action">
							전체보기
						<span class="badge badge-primary badge-pill">14</span>
							</div>
		                <c:forEach items="${boardList}" var="board" varStatus="vs">
                			<form onclick = "location.href='${pageContext.request.contextPath }/community/group/groupList/${board.boardNo}.do'">
			                	<c:if test="${board.boardLevel == 1}">
									<div class="list-group-item list-group-item-action upper-list" id="upper">
										${board.boardName}
									<span class="badge badge-primary badge-pill">14</span>
									<i class="fas fa-caret-down" style="padding: 0; position: relative; right:0;"></i>
									</div>
		                 		</c:if>
		                 		<c:if test="${board.boardLevel == 2}">
		                 			<div class="list-group-item list-group-item-action sub-list">
			                 			<i class="fas fa-arrow-right"></i>
											${board.boardName}
										<span class="badge badge-primary badge-pill">14</span>
									</div>
		                 		</c:if>
		                 		<script>
								/*  function upperList(){
									var element = document.getElementById("upper");
									element.classList.toggle("click");			
								} */
								</script>
                			</form>
			            </c:forEach>
						</div>							
	                </aside>
                	<!-- 사이드 바 메뉴 끝 -->
                	
                	
                	<div></div>
                	
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
			                        <tr style="cursor: pointer;" onclick = "location.href='${pageContext.request.contextPath }/community/group/groupDetail.do'">
			                            <td class="text-center">${vs.count}</td>
			                            <td class="txt-oflo">
			                            	<span class="text-success mr-2">
			                            		[${ gb.boardNo=="BOARD6"?
			                            			"전체 크루원":gb.boardNo=="BOARD8"?
			                            			"카페 크루원":gb.boardNo=="BOARD09"?
			                            			"무비 크루원":gb.boardNo=="BOARD10"?
			                            			"먹방 크루원":gb.boardNo=="BOARD11"?
			                            			"전체공간 나눔":gb.boardNo=="BOARD12"?
			                            			"카페공간 나눔":gb.boardNo=="BOARD13"?
			                            			"식당공간 나눔":gb.boardNo=="BOARD14"?
			                            			"소모임 자랑":"기타"}]
			                            	</span>
			                            		${gb.groupBoardTitle}
			                            </td>
			                            <td class="txt-oflo">${gb.groupBoardDate }</td>
			                            <td class="txt-oflo">${gb.viewCnt}</td>
			                            <td class="txt-oflo">${gb.nickname}</td>
			                        </tr>
			                    </c:forEach>			                      
			                    </tbody>
							</table>
		                	<div class="container">
						    	<nav class="mt-5" >
									<ul class="justify-content-center pagination">
										<li class="page-item"><a class="page-link m-1 text-black-50" href="#">&lt;</a></li>
										<li class="page-item"><a class="page-link m-1 text-black-50" href="#">1</a></li>
										<li class="page-item"><a class="page-link m-1 text-black-50" href="#">2</a></li>
										<li class="page-item"><a class="page-link m-1 text-black-50" href="#">3</a></li>
										<li class="page-item"><a class="page-link m-1 text-black-50" href="#">4</a></li>
										<li class="page-item"><a class="page-link m-1 text-black-50" href="#">5</a></li>
										<li class="page-item"><a class="page-link m-1 text-black-50" href="#">></a></li>
										<li class="page-item"></li>
									</ul>
								</nav>
							</div>
		                </div>
                	</section>

                    <!-- <input type="radio" name="radio" class="m-r-10 ml-3" >전체
                    <input type="radio" name="radio" class="m-r-10 ml-3">구인
                    <input type="radio" name="radio" class="m-r-10 ml-3">구직
                    <div class="input-group mb-4 col-4 pull-right">
						<input type="text" class="input-group-text" style="background-color: white;">
						<div class="input-group-append">
							<button type="submit" class="btn btn-outline-secondary"><span><i class="fa fa-search fa-search mr-2"></i> </span>검색</button>
						</div>
                  	</div> -->
               
	            	
            	</div>
        	</div>
    	</div>
	</section>
    <!-- 소모임 끝-->

<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

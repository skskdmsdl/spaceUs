<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		    <a class="nav-link active" href="#">소모임</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="${pageContext.request.contextPath }/recruit/recruitList.do">구인/구직</a>
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
                         <div class="m-5" style="border-bottom: 1px solid #dddddd;">
								
                         
                         <div style="border-bottom: 1px solid #dddddd; padding-bottom: 15px;">
                            <p class="h4">집에서 간단한 환전업무도와주시고 주마다 2번 300만원이상벌어가실분</p>
                         	<table>
                                <tr>
                                    <th><i class="fa fa-user"></i> 작성자 </th>
                                    <th class="col-xl-auto">|</th>
                                    <th><i class="fa fa-calendar"></i> 2020.09.22</th>
                                    <th class="col-xl-auto">|</th>
                                    <th><i class="fa fa-eye"></i> 조회수</th>
                                </tr>
                            </table>
                         </div>
                         <div class="m-5">
                         <div class="mb-5">
                         
				                         곧명절이니 돈벌어가셔서 도움되셨으면 좋겠습니다.<br/><br/>
				
							안녕하세요 코로나때문에 모든나라가힘든시점에서 경제적인사회생활도,직장도잃으신분들이계시고 <br/>
							
							피해보신분들이많습니다 상담한번에 좋은기회를만나보실수있습니다.<br/> <br/>
							
							밑에내용글에소개해드리겠습니다 <br/><br/>
							
							 문의는 카카오톡모바일에서 아이디친추하기에 밑에제아이디를적으시고 메세지주시면됩니다 .<br/><br/>
							
							1" 집에서하시는일입니다 1시간정도시간내시면되십니다 주마다2번씩합니다 돈은당일로바로받으실수있습니다<br/>
							 불법아닙니다 환전업무입니다 메세지주실때 지역,나이,성별 기재부탁드립니다 <br/><br/>
							
							
							2" PC,휴대폰 있으면누구나가능합니다 지역상관없습니다 나이상관없습니다 해외송금,한국송금모두가능합니다<br/> <br/>
							
							
							3" 주마다2번씩 500이상 환전입금받으신돈에서 저에게 30프로,40프로를주시면됩니다 일이매우쉽고 간편합니다<br/><br/>
							
							
							4" 카톡주시면저는 아내,아가들있는 40대가장입니다 떳떳하게 좋은인연맺고싶습니다 신용있는분들과<br/>
							  코로나힘듬잊으시고 저와웃으면서 일해보실분구합니다 .<br/><br/>
							  문의는 카카오톡모바일에서 아이디친추하기에 밑에제아이디를적으시고 메세지주시면됩니다 .<br/><br/>
                         </div>
                         
                         
                         <!-- 댓글등록 시작 -->
                         <div style="background-color: #fafafa; height: 200px; border: 1px solid #edeceb; ">
	                         <div class="pl-5 pr-5 pt-4">
	                       		<p>댓글 0개</p>
	                       		<textarea class="col-lg-11" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px;"></textarea>
	                         	<button type="button" class="btn" style="margin-bottom: 70px;height: 80px; border: 1px solid #dddddd;width: 70px;">등록</button>
	                         </div>
                         </div>
                         <!-- 댓글등록 끝 -->
                         
                         <!-- 댓글시작 -->
                         <div style="border-bottom: 2px solid #d0d0d0;padding-buttom:2px;padding-bottom: 10px;">
		                    <div class="level1">
								<td>
									<sub class="comment-writer">
										김양희
									</sub>
									<sub class="comment-date">
										2020-1-2
									</sub>
									<br />
										안녕하세여
								</>
								<div style="float:right;">
									<button class="btn-reply button" value="ㅇㅇ">답글</button>
									<button class="btn-delete btn-primary" value="ㅇㅇ">삭제</button>
								</div>
							 </div>
                         </div>
                         <!-- 댓글 끝 -->
                         
                       
                         
                        
                         </div>
                         <div class="text-center">
			                 	<a href='#' class="btn m-1" style="background-color: #00c89e; font-size:20px; color:white;"><i class="fa fa-list"></i> 목록</a>
                         </div>
                     </div>
                 </div>
             </section>
    <!-- 구인구직 리스트 끝-->
<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="ftco-section ftco-agent">
  	<div class="container">
  	      <div class="col-md-12 heading-section text-center ftco-animate mb-5 mt-5">
      	<span class="subheading">SpaceUs MD가 큐레이션한 기획전 입니다</span>
        <h2 class="mb-2">기획전</h2>
      </div>
      <div class="row">
      	<div class="col-md-4">
      		<div class="agent space1">
  					<div class="img">
    				<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" class="img-fluid" alt="Colorlib Template">
  				</div>
  				<div class="desc">
  					<h3>스마트한 팀워크를 위한 
  					<br />공유오피스 모음
  					</h3>
  					<br />
					<p class="h-info">팀을 위한 공유 오피스</p>
  				</div>
 				</div>
     	</div>
     	<div class="col-md-4">
     		<div class="agent space2">
 					<div class="img">
   				<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" class="img-fluid" alt="Colorlib Template">
  				</div>
  				<div class="desc">
  					<h3>보컬 연습을 위한 
  					<br />녹음실 공간 모음
  					</h3>
  					<br />
					<p class="h-info">녹음실 기획전</p>
  				</div>
 				</div>
     	</div>
     	<div class="col-md-4">
     		<div class="agent space3">
 					<div class="img">
   				<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" class="img-fluid" alt="Colorlib Template">
  				</div>
  				<div class="desc">
  					<h3>1년에 한번, 
  					<br />나를 더 사랑하는 방법
  					</h3>
  					<br />
					<p class="h-info">특별한 생일을 위한 공간</p>
  				</div>
 				</div>
     	</div>
     	<div class="col-md-4">
     		<div class="agent space4">
 					<div class="img">
   				<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" class="img-fluid" alt="Colorlib Template">
  				</div>
  				<div class="desc">
  					<h3>제일 잘하는 요리
  					<br />친구들에게 만들어줘요
  					</h3>
  					<br />
					<p class="h-info">우리만의 요리대회 공간</p>
  				</div>
 				</div>
     	</div>

     	<div class="col-md-4">
     		<div class="agent space5">
 					<div class="img">
   				<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" class="img-fluid" alt="Colorlib Template">
  				</div>
  				<div class="desc">
  					<h3>카메라 렌탈이 가능한
  					<br />촬영스튜디오 모음
  					</h3>
  					<br />
					<p class="h-info">이 순간을 담기 좋은</p>
  				</div>
 				</div>
     	</div>
     	<div class="col-md-4">
     		<div class="agent space6">
 					<div class="img">
   				<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" class="img-fluid" alt="Colorlib Template">
  				</div>
  				<div class="desc">
  					<h3>영화, 영상 올나잇 파티
  					<br />이곳에서 어때요?
  					</h3>
  					<br />
					<p class="h-info">영상보기 좋은 공간 모음</p>
  				</div>
 				</div>
     	</div>
     	<div class="col-md-4">
     		<div class="agent space7">
 					<div class="img">
   				<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" class="img-fluid" alt="Colorlib Template">
  				</div>
  				<div class="desc">
  					<h3>뉴스몰의 시대,
  					<br />우리만을 위한 공간
  					</h3>
  					<br />
					<p class="h-info">작은 모임을 위한 프라이빗 공간</p>
  				</div>
 				</div>
     	</div>
     	<div class="col-md-4">
     		<div class="agent space8">
 					<div class="img">
   				<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" class="img-fluid" alt="Colorlib Template">
  				</div>
  				<div class="desc">
  					<h3>종강을 맞이한
  					<br />우리를 위한 파티
  					</h3>
  					<br />
					<p class="h-info">우리만의 종강파티 with 빔프로젝터</p>
  				</div>
 				</div>
     	</div>
     	<div class="col-md-4">
     		<div class="agent space9">
 					<div class="img">
   				<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" class="img-fluid" alt="Colorlib Template">
  				</div>
  				<div class="desc">
  					<h3>하루종일 공부할 
  					<br />공간이 필요하다면
  					</h3>
  					<br />
					<p class="h-info">집중 잘되는 스터디공간 모음</p>
  				</div>
 				</div>
     	</div>
     </div>
 	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
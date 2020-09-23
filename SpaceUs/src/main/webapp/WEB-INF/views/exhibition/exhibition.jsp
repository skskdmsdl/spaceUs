<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
.img img {height: 350px;}
.space1 {cursor: pointer;}
</style>
<script>
function exhibitionList () {
	location.href = "${pageContext.request.contextPath}/exhibition/exhibitionList.do";
}
</script>
<section class="ftco-section ftco-agent">
  	<div class="container">
  	      <div class="col-md-12 heading-section text-center ftco-animate mb-5 mt-5">
      	<span class="subheading">SpaceUs MD가 큐레이션한 기획전 입니다</span>
        <h2 class="mb-2">기획전</h2>
      </div>
      <div class="row">
      	<div class="col-md-4">
      		<div class="agent space1" onclick="exhibitionList();">
  					<div class="img">
    				<img src="https://kr.object.ncloudstorage.com/scloud-service/service/160042093_3c874989f2a7c83b4334157979430945.png">
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
   				<img src="https://kr.object.ncloudstorage.com/scloud-service/service/160067588_203975de09692ba4025f5c9b74792fae.png">
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
   				<img src="https://kr.object.ncloudstorage.com/scloud-service/service/159712958_f90dcf8b3dc46c169a80aa8add859020.png">
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
   				<img src="https://kr.object.ncloudstorage.com/scloud-service/service/159643719_d4636399cc347f1d1941231a4e5b5dfd.png">
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
   				<img src="https://kr.object.ncloudstorage.com/scloud-service/service/159532056_649a9cb7c2cca44b647d032c43cadbea.png">
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
   				<img src="https://kr.object.ncloudstorage.com/scloud-service/service/159427317_23a1ef690495d5fc4b30bf0faacad663.png">
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
   				<img src="https://kr.object.ncloudstorage.com/scloud-service/service/159056312_e21f3078f9b4f0477394e974d2d80beb.png">
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
   				<img src="https://kr.object.ncloudstorage.com/scloud-service/service/159341899_882cab7c9250d22c64d63e0f68bad8c5.png">
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
   				<img src="https://kr.object.ncloudstorage.com/scloud-service/service/159281061_a2dd593a8f8234e2b8c715f61e58d6bd.png">
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
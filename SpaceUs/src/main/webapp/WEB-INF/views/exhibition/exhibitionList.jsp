<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<style>
.search-result {
  background-color: #f8f9fa;
  padding-top: 20px;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- 컨텐츠 시작 -->
    <div class="hero-wrap ftco-degree-bg"
    	 style="background-image: url('https://kr.object.ncloudstorage.com/scloud-service/service/160042093_3c874989f2a7c83b4334157979430945.png');
    	 		height: 400px" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text text-center mx-auto" style="margin-bottom:50%;">
	            <h2 class="mb-4">${ exhibition.exTitle }</h2>
				<h5 class="h-info">${ exhibition.exSubtitle }</h5>
            </div>
          </div>
        </div>
      </div>
    </div>
<hr / style="margin-top: 8rem; margin-bottom: 3rem;">
<!-- 기획전 공간 리스트 시작 -->
<div class="container search-result" style="margin-bottom: 8rem;">
    <c:if test="${!empty exList}">
    <div class="row">
		<c:forEach items="${exList}" var="list">
			<div class="col-md-4">
				<div class="property-wrap ftco-animate">
		    		<a href="" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/upload/space/${list.renamedFilename});"></a>
	    			<div class="text">
	    				<p class="price"><span class="space-price"><fmt:formatNumber value="${list.hourlyPrice }" type="number"/><small>원/시간</small></span></p>
	    				<ul class="property_list">
	    					<li>
	    						<i class="fa fa-star"></i>
	    						<c:if test="${list.starAvg != 0 }">
		    						<fmt:formatNumber value="${list.starAvg}" pattern="0.0" type="number"/>
	    						</c:if>
	    						<c:if test="${list.starAvg == 0 }">0</c:if>
	    					</li><!-- 평균 별점 수 -->
	    					<li><span class="icon-heart"></span>${list.likeCnt }</li> <!-- 좋아요 수 -->
	    					<li><span class="icon-comments"></span>${list.reviewCnt}</li><!-- 리뷰 수 -->
	    				</ul>
	    				<h3><a href="${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo=${list.spaceNo}">${list.spaceName}</a></h3>
	    				<small><span class="icon-my_location">${list.address}</span></small>
	    			</div>
				</div>
	    	</div>		
		</c:forEach>
	</div>
	</c:if>
	<c:if test="${empty exList}">
	<div class="row" style="font-size: 20px; margin:auto;">
		<div class="col-md-4" style="margin:auto;">
			<div class="property-wrap ftco-animate" style="margin-top:10px; text-align: center;">
				검색 결과가 없습니다. <br />
				다른 검색조건으로 공간을 찾아보세요.
			</div>
		</div>
	</div>
	</c:if>
	
</div>
<!-- 기획전 공간 리스트 끝-->
</section>
<!-- 컨텐츠 끝 -->
<script>$(function () { memberId();});</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
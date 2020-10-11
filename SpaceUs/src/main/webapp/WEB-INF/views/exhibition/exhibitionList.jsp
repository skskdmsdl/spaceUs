<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
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
<!-- 기획전 공간리스트 -->
<div class="container">
    <div class="row" style="margin-top:100px">
   	 <c:forEach items="${ exList }" var="list">
    	  <div class="col-md-4">
    		<div class="property-wrap ftco-animate">
    			<a href="" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/images/work-1.jpg);"></a>
    			<div class="text">
    				<p class="price"><span class="space-price">${list.hourlyPrice}<small>원/시간</small></span></p>
    				<ul class="property_list">
    					<li><span class="icon-people"></span>최대3인</li>
    					<li><span class="icon-heart"></span>55</li>
    					<li><span class="icon-comments"></span>29</li>
    				</ul>
    				<h3><a href="${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo=space2">${list.spaceName}</a></h3>
    				<small><span class="icon-my_location">${list.address}</span></small>
    				<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
    				<span class="icon-heart"></span>
    				</a>
    			</div>
    		</div>
    	</div>
    	</c:forEach>
    </div>
</div>
</section>
<!-- 컨텐츠 끝 -->
<script>$(function () { memberId();});</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
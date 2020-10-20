<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
.carousel {
    margin: 25px 0 50px;
    background: #fff;
    position: relative;
    padding: 8px;
    box-shadow: 0 0 1px rgba(0, 0, 0, 0.3);
}

.carousel:before,
.carousel:after {
    z-index: -1;
    position: absolute;
    content: "";
    bottom: 15px;
    left: 10px;
    width: 50%;
    top: 80%;
    max-width: 400px;
    background: rgba(0, 0, 0, 0.7);
    box-shadow: 0 15px 10px rgba(0, 0, 0, 0.7);
    transform: rotate(-3deg);
}

.carousel:after {
    transform: rotate(3deg);
    right: 10px;
    left: auto;
}

.carousel .carousel-item {
    text-align: center;
    min-height: 200px;
}

.carousel .carousel-item img {
    width: 100%;
    height: 500px;
    margin: 0 auto;
    /* Align slide image horizontally center in Bootstrap v3 */
}

.carousel-control-prev,
.carousel-control-next {
    width: 27px;
    height: 54px;
    overflow: hidden;
    opacity: 1;
    margin: auto 0;
    background: none;
    text-shadow: none;
}

.carousel-control-prev span,
.carousel-control-next span {
    width: 54px;
    height: 54px;
    display: inline-block;
    background: #4a4a4a;
    border-radius: 50%;
    box-shadow: 0 0 1px rgba(0, 0, 0, 0.3);
}

.carousel-control-prev span {
    margin-right: -27px;
}

.carousel-control-next span {
    margin-left: -27px;
}

.carousel-control-prev:hover span,
.carousel-control-next:hover span {
    background: #3b3b3b;
}

.carousel-control-prev i,
.carousel-control-next i {
    font-size: 24px;
    margin-top: 13px;
}

.carousel-control-prev {
    margin-left: -28px;
}

.carousel-control-next {
    margin-right: -28px;
}

.carousel-control-prev i {
    margin-left: -24px;
}

.carousel-control-next i {
    margin-right: -24px;
}

.carousel-indicators {
    bottom: -42px;
}

.carousel-indicators li,
.carousel-indicators li.active {
    width: 11px;
    height: 11px;
    border-radius: 50%;
    margin: 1px 4px;
}

.carousel-indicators li {
    border: 1px solid #475c6f;
}

.carousel-indicators li.active {
    background: #20b0b9;
    border-color: #20b0b9;
}
</style>
<!-- 컨텐츠 시작 -->
    <div class="hero-wrap ftco-degree-bg"
    	 style="background-image: url('${pageContext.request.contextPath }/resources/images/bg_1.jpg');
    	 		height: 400px"
    	 data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text text-center mx-auto" style="margin-bottom:50%;">
	            <h1 class="mb-4">공간 승인하기</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- 공간 등록 폼 -->
    <section class="property-submit-section spad m-5">
        <div class="container ">
        <c:forEach items="${spaceOneList}" var="space">
            <div class="row m-5">
                <div class="col-lg-12">
                <div class="property-submit-form">
                
                <div class="pf-title" style="margin-bottom: 20px;">
                    <h4>공간이름</h4>
                    <div class="mx-lg-5"><h5>${space.spaceName}</h5></div>
                </div>
                
                 <div class="pf-feature-price" style="margin-bottom: 20px;">
                     <h4>공간 호스트 이메일</h4>
                     <div class="mx-lg-5 member"><h5>${space.memberEmail}</h5></div>
                 </div>
                 
                 <div class="pf-feature-price" style="margin-bottom: 20px;">
                     <h4>공간 호스트 사업자번호</h4>
                     <div class="mx-lg-5"><h5>${space.businessLicense}</h5></div>
                 </div>
                 
                 <div class="pf-feature-price" style="margin-bottom: 20px;">
                     <h4>공간 등록일자</h4>
                     <div class="mx-lg-5"><h5>${space.registrationDate}</h5></div>
                 </div>
                
                <!-- 사진 시작 -->
                 <div class="container-sm" style="margin-bottom: 20px;">
                 		<h4>공간 사진</h4>
				        <div class="row">
				            <div class="col-md-8 mx-auto">
				                <div id="myCarousel" class="carousel slide" data-ride="carousel">
				                    <!-- Carousel indicators -->
				                    <ol class="carousel-indicators" >
				                    	<c:forEach items="${sapceOneImageList}" var="image" varStatus="vs">
					                        <li data-target="#myCarousel" data-slide-to="${vs.count}"></li>
				                        </c:forEach>
				                    </ol>
				                    <!-- Wrapper for carousel items -->
				                    <div class="carousel-inner" >
							            <c:forEach items="${sapceOneImageList}" var="image" varStatus="vs">
					                        <div class="carousel-item" id="spaceImg">
					                            <img src="${pageContext.request.contextPath}/resources/upload/space/${image.renamedFilename}" class="img-fluid" alt="">
					                        </div> 
							            </c:forEach>
				                    </div>
				                    <!-- Carousel controls -->
				                    <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
				                        <span><i class="fa fa-angle-left"></i></span>
				                    </a>
				                    <a class="carousel-control-next" href="#myCarousel" data-slide="next">
				                        <span><i class="fa fa-angle-right"></i></span>
				                    </a>
				                </div>
				            </div>
				        </div>
				    </div>
				    <!-- 사진 끝 -->
				    
                     <div class="pf-summernote" style="margin-bottom: 20px;">
                         <h4>공간설명</h4>
                         <div class="mx-lg-5">
                         	${space.content}
                         </div>
                     </div>
                    
                     <div class="pf-location" style="margin-bottom: 20px;">
                         <h4>공간주소</h4>
                         <div class="mx-lg-5">
                         	<h5>${space.address}</h5>
                         </div>
                     </div>
                     
                     <div class="pf-phone" style="margin-bottom: 20px;">
                         <h4>공간전화번호</h4>
                         <div class="mx-lg-5">
                         	<h5>${space.spacePhone}</h5>
                         </div>
                     </div>
                     
                     <div class="pf-type" style="margin-bottom: 20px;">
                         <h4>카테고리 선택</h4>
                         <div class=" mx-lg-5">
                         	<c:forEach items="${spaceOneCategory}" var="category">
	                         	<span class="badge badge-warning badge-pill" style="font-size: 15px;">${category.categoryName}</span>
                         	</c:forEach>
                     	 </div>
                     </div>
                     
                
                     <div class="pf-feature-price" style="margin-bottom: 20px;">
                         <h4>공간 태그</h4>
                         <div class=" mx-lg-5">
                     
                         <c:if test="${!empty spaceOneTagList}">
                         	<c:forEach items="${spaceOneTagList}" var="tag">	                         		
                         		<span class="badge badge-success badge-pill" style="font-size: 15px;">${tag.tagName }</span>
                     	 	</c:forEach>
	                     </c:if>
	                     <c:if test="${empty spaceOneTagList}">
	                     	<h6>(공간 태그 값이 존재하지 않습니다.)</h6>
	                     </c:if>
                     	 </div>
                     </div>
                     
                     <div class="pf-feature-price" style="margin-bottom: 20px;">
                         <h4>가격 (시간당)</h4>
                       	 <div class="mx-lg-5">
                         	<h5>${space.hourlyPrice}원</h5>
                         </div>
                     </div>
                     
                     <div class="pf-feature" style="margin-bottom: 20px;">
                         <h4>옵션선택</h4>
                         <div class=" mx-lg-5">
                         	<c:if test="${!empty spaceOneOptionList}">
	                         	 <c:forEach items="${spaceOneOptionList}" var="option">	 	
				                 	<span class="badge badge-primary badge-pill" style="font-size: 15px;">${option.optionName}</span>
	                         	 </c:forEach>
	                        </c:if>
	                        <c:if test="${empty spaceOneOptionList}">
	                        		<h6>(공간 옵션 값이 존재하지 않습니다.)</h6>
	                        </c:if>
                         </div>
                     </div>
                     
                     <div class="pf-feature" style="margin-bottom: 20px;">
                     	<h4>공간게시물 상태</h4>
                     	<div class=" mx-lg-5">
                     		<span class="status text-warning">&bull;</span> 승인 대기중
                     	</div>
                     </div> 
                  
                     <form>                     
	                     <div class="pf-property-details" style="text-align: center;" >
	                     	 <input type="hidden" value="${space.memberEmail}" class="member" />
	                         <button type="button" class="confirm btn-info col-sm-3" value="${space.spaceNo}">공간 승인</button>
	                     </div>
                     </form>
                     
                  
                   </div>
               </div>
           </div>
       </c:forEach>
       </div>
    </section>
    
<script type="text/javascript">
$(".confirm").click(function(){
	
	var spaceNo = $(this).val();
	var memberEmail = $(this).siblings(".member").val();

	var param1 = "spaceNo="+spaceNo+
				"&memberEmail="+memberEmail;
	
	swal({
		  text: "공간 승인을 하시겠습니까?",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  
			$.ajax({
				method:"post",
				url:"${pageContext.request.contextPath}/admin/spaceConfirm.do",
				data:param1,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(){
					swal("공간 승인이 정상적으로 등록되었습니다.")
					.then((value) => {
						location.href="${pageContext.request.contextPath}/admin/spaceManage.do";
					});
				},
				error: function(){

					swal("공간 승인이 정상적으로 등록이 되지 않았습니다.")
					.then((value) => {
						location.href="${pageContext.request.contextPath}/admin/spaceManage.do";
					});
					
				}
			});

		} else {

		    location.href="${pageContext.request.contextPath}/admin/spaceManage.do";
		}

			}); 
});
 $(function(){
	$("#spaceImg").addClass("active");
}); 

</script>
    <!-- Property Submit Section End -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>


<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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
.more-list {visibility:hidden;}
</style>
<script>
function exhibitionList () {
	location.href = "${pageContext.request.contextPath}/exhibition/exhibitionList.do";
}

$(function(){
	
    $("[data-toggle=popover]").popover({
        html : true,
        content: function() {
          var content = $(this).attr("data-popover-content");
          return $(content).children(".popover-body").html();
        },
        title: function() {
          var title = $(this).attr("data-popover-content");
          return $(title).children(".popover-heading").html();
        }
    });

});

</script>
<section class="ftco-section ftco-agent">
  	<div class="container">
  	      <div class="col-md-12 heading-section text-center ftco-animate mb-5 mt-5">
      	<span class="subheading">SpaceUs MD가 큐레이션한 기획전 입니다</span>
        <h2 class="mb-2">기획전 등록</h2>
      </div>
<!-- 기획전 등록폼 시작-->
<section class="property-submit-section spad m-5">
    <div class="container ">
        <div class="row m-5">
            <div class="col-lg-12">
                <div class="property-submit-form">
                    <form action="#">
                        <div class="pf-title">
                            <h4>기획전 제목<span class="text-danger">*</span></h4>
                            <input type="text">
                        </div>
                        <div class="pf-title">
                            <h4>기획전 소제목</h4>
                            <input type="text">
                        </div>
                        <div class="pf-title">
                            <h4>태그<span class="text-danger">*</span></h4>
                            <input type="text">
                        </div>
                        <div class="pf-title">
                            <h4>이미지 등록</h4>
                        </div>
                        
                        <!-- 이미지업로드 팝오버시작 -->
                        <!-- 이미지업로드 팝오버끝-->
                        <div class="pf-property-details">
                            <button type="submit" class="site-btn">기획전등록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 기획전 등록폼 끝-->
      
      
      
     </div>
     </section>
<script>
$(".more-btn").click(function(){
	$(".more-list").css ('visibility', 'visible');
	
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
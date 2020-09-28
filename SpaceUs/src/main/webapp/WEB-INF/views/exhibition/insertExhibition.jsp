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
.pills {margin-top:0px;}
.pf-title h4 {cursor: pointer;}
.pf-title h4:hover {color: #00C89E;}

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
                            <h4 data-toggle="modal" data-target="#imageModal">이미지 등록</h4>
                        </div>
                        
                        <!-- 이미지업로드 모달시작 -->
                        <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						       	<div class="row">
						   		<div class="col-md-12 pills">
									<div class="bd-example bd-example-tabs">
								       <div class="d-flex justify-content-center">
										  <ul class="nav nav-pills mb-3" id="detail-tab" role="tablist">
										    <li class="nav-item">
										      <a class="nav-link" id="url-upload-tab" data-toggle="pill"
										      	 href="#url-upload" role="tab" aria-controls="url-upload"
										      	 aria-expanded="true">Url로 업로드</a>
										    </li>
										    <li class="nav-item">
										      <a class="nav-link active" id="file-upload-tab" data-toggle="pill"
										      	 href="#file-upload" role="tab" aria-controls="file-upload"
										      	 aria-expanded="true">이미지로 업로드</a>
										    </li>
										  </ul>
										</div>
						      		</div>
						      </div>
						      <!-- 모달바디 시작 -->
						      <div class="modal-body">
						      	<div class="tab-content" id="detail-tabContent">
								   <div class="tab-pane fade" id="url-upload" role="tabpanel" aria-labelledby="url-upload-tab">
								    	<input type="text" name="" id="" placeholder="url을 입력하세요"/>
								   </div>
								   <div class="tab-pane fade" id="file-upload" role="tabpanel" aria-labelledby="file-upload-tab">
								    	<div class="input-group mb-3" style="padding:0px;">
										  <div class="custom-file">
										    <input type="file" class="custom-file-input" name="upFile" id="upFile1" >
										    <label class="custom-file-label" for="upFile1">이미지를 선택하세요</label>
										  </div>
										</div>
								   </div>
						   		</div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary">업로드</button>
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						      </div>
						    </div>
						  </div>
						</div>
				   	</div>
			   </div>
		   </div>
                        <!-- 이미지업로드 모달끝-->
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
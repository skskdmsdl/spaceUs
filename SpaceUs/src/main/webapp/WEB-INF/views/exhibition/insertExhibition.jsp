<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
img {width: 500px; margin-bottom:30px}
.space1 {cursor: pointer;}
.pills {margin-top:0px;}
.pf-title h4 {cursor: pointer;}
.pf-title h4:hover {color: #00C89E;}
.btn-outline-danger {margin-bottom:10px}
.wrapper{
   height: 150%;
   overflow-x: hidden;
   width: 100px;
}
.wrapper .selection{
  width:100%;
   height: 150px;
  border:1px solid #ccc
}

</style>
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
       xhr.setRequestHeader(header,token);
});

$(function(){

	var $upUrl = $('#upUrl');
	var $fileLable = $('.custom-file-label');

   	$("[name=upFile]").on("change", function(){
   		var file = $(this).prop("files")[0];
   		var $label = $(this).next('.custom-file-label');

   		//label에 쓰기
   		if(file == undefined)
   			$label.html("이미지를 선택하세요.");
   		else 
   			$label.html(file.name);
   	});

   	$("#imageModal").on('hide.bs.modal', function(){
   		$fileLable.html("이미지를 선택하세요");
   		$upUrl.val("");
   	});

   	$("#url-upload-tab").click(function(){
   		$fileLable.html("이미지를 선택하세요");
  	});
  	
   	$("#file-upload-tab").click(function(){
   		$upUrl.val("");
  	});

   	$("#image-upload").click(function(){
	    
   	   	var $url = $('#upUrl').val();
   	   	var $div = $(".image-div");
   		var $label = $('.custom-file-label').html();
   		var $file = $("input[name=upFile]")[0].files[0];
   		var delBtn = "<button type='button' class='btn btn-outline-danger'>삭제</button><br />";


   	 	if(($url == undefined || $url == "") && ($file == undefined || $label == "이미지를 선택하세요")) {
   	   	 	alert("이미지를 업로드해주세요.");
   	   	 	$("#upUrl").focus();
 	   	 } else if (($url != undefined || $url != "") && ($file == undefined || $label == "이미지를 선택하세요")){
 	 	   	$("#image-upload").attr("data-dismiss","modal");
 	 	  	$div.html(delBtn + "<img src='"+ $url +"'/>");
 	 	  	$("#imageUrl").val($url);

			$(".btn-outline-danger").click(function(){
				$div.html("");
				$("#imageUrl").val("");
				$("#renamedFileName").val("");
		   	});
		   	
	 	} else if($file != undefined || $label != "이미지를 선택하세요") {
			var imageFile;
	 		var imgData = new FormData();
	 		imgData.append("upFile", $file)

	 		$.ajax({
		 		url: '${pageContext.request.contextPath}/exhibition/uploadImage.do',
		 		data: imgData,
		 		async : false,
		 		processData: false,
		 		contentType: false,
		 		type: 'POST',
		 		success: function(data){
		 			imageFile = data;
		 			$("#image-upload").attr("data-dismiss","modal");
		 	 	  	$div.html(delBtn + "<img src='${pageContext.request.contextPath }/resources/upload/exhibition/"+ imageFile +"'/>");
		 	 	  	$("#renamedFileName").val(imageFile);
		 		},
		 		error: function(xhr, status, err){
					console.log("처리실패", xhr, status, err);
				}
	 		});

			$(".btn-outline-danger").click(function(){
				$div.html("");
		   	});
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
                    <form name="exhibitionFrm" action="${pageContext.request.contextPath}/exhibition/insertExhibition.do">
                        <div class="pf-title">
                            <h4>기획전 제목<span class="text-danger">*</span></h4>
                            <input type="text" name="exTitle" id="exTitle" required>
                        </div>
                        <div class="pf-title">
                            <h4>기획전 소제목</h4>
                            <input type="text" name="exSubtitle" id="exSubtitle">
                        </div>
                      
                        <div class"pf-feature-price">
                            <h4>공간 태그<span class="text-danger">*</span></h4>
                            <div class="row">
	                            <div class="ml-3 mb-5 wrapper" style="width:31%">
			                        <select  size="30" name="tagNo" class="selection nice-select sm-width">
										<c:forEach items="${tagList}" var="tag">
										<option value="${tag.tagNo}">${tag.tagName }</option>
										</c:forEach>										
								    </select>
							    </div>
						    </div>
                        </div>
                      
                       
                        <div class="pf-title">
                            <h4>이미지 등록<span class="text-danger">*</span></h4>
                        </div>
                        <div class="tab-pane" id="file-upload" role="tabpanel" aria-labelledby="file-upload-tab">
                         <div class="input-group mb-3" style="padding:0px;">
	                         <div class="custom-file">
							    <input type="file" class="custom-file-input" name="upFile" id="upFile">
							    <label class="custom-file-label" for="upFile">이미지를 선택하세요</label>
							 </div>
						 </div>
						</div>
						
						<div class="mb-4">
					        <button type="button" class="btn btn-primary" id="image-upload">업로드</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					    </div>
						
                        <div class="image-div"></div>
                        
                        <input type="hidden" name="imageUrl" id="imageUrl"/>
                        <input type="hidden" name="renamedFileName" id="renamedFileName"/>
                        
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
<script>$(function () { memberId();});</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
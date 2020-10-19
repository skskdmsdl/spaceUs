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
 	 	  	//console.log($("#imageUrl").val());

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
	//태그 추가 클릭이벤트
	$("#addTags").on('click', function(){
	
		var $tagName = $("#tagName");
		
		if($tagName.val() == "")
			alert("내용을 입력해주세요");
		
		if($("#tags span").length >= 1){
			alert("1개만 입력 가능합니다");
			$tagName.val("");
		}
		else if($tagName.val() != ""){
			$("#tags").append("<span class='label label-success m-2 p-2'>#" + $tagName.val() + " X</span>");
			$("#tag").val($tagName.val());
			$tagName.val("");
			
	    }
	});
	//태그 삭제 클릭이벤트
	$("#tags").on("click", function(){
		$("#tags *").remove();
		$("#tag").val("");
		$("#tagName").val("");
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
                        <!-- <div class="pf-title">
                            <h4>태그<span class="text-danger">*</span></h4>
                            <input type="text" name="tag" id="tag" required>
                        </div> -->
                        <div class="pf-feature-price">
                               <h4>공간 태그<span class="text-danger">*</span></h4>
                               
                               <div class="row">
                                <div class="ml-3 mb-3" style="width:31%">
                                    <input id="tagName" type="text" placeholder="태그를 입력해주세요">
                                    <input type="hidden" id="tag" name="tag"/>
                                </div>
                                <div>
		                            <button id="addTags" type="button" class="btn btn-primary ml-4 pr-4 pl-4 p-10">추가</button>
	                            </div>
                            </div>
	                        <span id="tags" style="cursor: pointer;"></span>
                           </div>
                        
                        <div class="pf-title">
                            <h4 data-toggle="modal" data-target="#imageModal">이미지 등록</h4>
                        </div>
                        <div class="image-div">
                        </div>
                        <input type="hidden" name="imageUrl" id="imageUrl"/>
                        <input type="hidden" name="renamedFileName" id="renamedFileName"/>
                        
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
								    	<input type="text" name="upUrl" id="upUrl" placeholder="url을 입력하세요"/>
								   </div>
								   <div class="tab-pane fade" id="file-upload" role="tabpanel" aria-labelledby="file-upload-tab">
								    	<div class="input-group mb-3" style="padding:0px;">
								    	 <!-- <form name="frm" method="post" enctype="multipart/form-data"> -->
										  <div class="custom-file">
										    <input type="file" class="custom-file-input" name="upFile" id="upFile">
										    <label class="custom-file-label" for="upFile">이미지를 선택하세요</label>
										  </div>
										<!-- </form> -->
										</div>
								   </div>
						   		</div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary" id="image-upload">업로드</button>
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
<script>$(function () { memberId();});</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
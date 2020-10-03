<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- 한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8" />

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp" />
<style>	
*{margin:0; padding:0;}
.star{
  display:inline-block;
  width: 30px;height: 30px;
  cursor: pointer;
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0; 
  background-size: 100%; 
}
.star.on{
  background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
}
</style>

        <div class="page-wrapper">
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor ml-5">마이페이지</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center mr-5">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">마이페이지</a></li>
                                <li class="breadcrumb-item active">리뷰</li>
                            </ol>
                        </div>
                    </div>
                </div>
               
		        <!-- 리뷰 -->
		        <div id="reviewPage" class="ml-5 mr-5">
                  <div class="card p-5">
                      <div class="card-body">
                       <div class="row"> 
                       <div class="col-md-10">
                           <h5 class="card-title">공간 리뷰</h5>
                           <h6 class="card-subtitle">이용한 공간의 리뷰를 작성해주세요</h6>
                       </div>
                          <div class="col-md-2">
                              <select class="custom-select b-0 ">
                                  <option value="1" >전체 리뷰</option>
                                  <option value="2">작성 가능한 리뷰</option>
                                  <option value="3">내가 작성한 리뷰</option>
                              </select>
                           </div> 
                      </div>
                       <div class="steamline m-t-40">
                           <div class="sl-item">
                            <div class="row">
                             <div class="usageReviewImg mb-5 ml-5 mr-5 mt-3" >
		    			<img class="img-circle" src="${ pageContext.request.contextPath }/resources/images/image_6.jpg" alt="..."> 
                                 </div>
                                   <div class="mt-2 col-md p-20">
                                       <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
                                   	<div class="row"> 
                                        <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
                                        <div class="col-md-9">
                                            <a id="reviewBtn" class="btn m-r-5 btn-rounded btn-outline-success">리뷰등록</a> 
                                            <a id="modifyBtn" class="btn btn-rounded btn-outline-secondary">리뷰수정</a> 
                                        </div>
                                       </div>
                                   </div>
                                   </div>
                                   		<!-- 리뷰등록 -->
				                         <div class="pl-5 pr-5" style="height: 150px; display: none;" id="reviewFrm" >
				                         	<div class="row pl-3 align-items-xl-center">
				                         		<p class="m-1" style="font-size: 15px;">별점 &nbsp;&nbsp;:</p>
				                         		<div class="star-box">
												  <span class="star mt-2 star1" ></span>
												  <span class="star star2"></span>
												  <span class="star star3"></span>
												 <span class="star star4"></span>
												 <span class="star star5"></span>
												</div>
												<div>
												</div>
												<form name="ReviewFrm" 
													  action="${pageContext.request.contextPath}/member/insertReview.do" 
													  method="post" 
													  onsubmit="return reviewValidate();"
													  enctype="multipart/form-data"
													  style="position: absolute;right: 5%;">
													  <input type="hidden" name="starRating" required/>
													  <input type="hidden" name="nickName" value="${member.nickName}" />
													  <div class="input-group mb-3" style="padding:0px;">
													  <div class="custom-file">
													    <input type="file" class="custom-file-input" name="upFile" id="upFile1" >
													    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
													  </div>
													</div>
												<!-- <div class="m-1" style="position: absolute;right: 60px;">+ 사진</div> -->
				                         	</div>
				                         		 <textarea class="col-lg-11" id="reviewCon" name="content" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px;"></textarea>
				                           		<input type="submit" class="btn" style="margin-bottom: 70px;height: 80px; border: 1px solid #ddd;width: 70px;" value="등록">
				                           </div>
												</form>
												
											<!-- 리뷰수정 -->	
											<div class="pl-5 pr-5" style="height: 150px; display: none;" id="reviewUpdateFrm" >
				                         	<div class="row pl-3 align-items-xl-center">
				                         		<p class="m-1" style="font-size: 15px;">별점 &nbsp;&nbsp;:</p>
				                         		<div class="star-box">
												  <span class="star mt-2 star1" ></span>
												  <span class="star star2"></span>
												  <span class="star star3"></span>
												 <span class="star star4"></span>
												 <span class="star star5"></span>
												</div>
												<div>
												</div>
												<form name="ReviewUpdateFrm" 
													  action="${pageContext.request.contextPath}/member/updateReview.do" 
													  method="post" 
													  onsubmit="return reviewValidate();"
													  enctype="multipart/form-data"
													  style="position: absolute;right: 5%;">
													  <input type="hidden" name="starRating" required/>
													  <input type="hidden" name="nickName" value="${member.nickName}" />
													  <div class="input-group mb-3" style="padding:0px;">
													  <div class="custom-file">
													    <input type="file" class="custom-file-input" name="upFile" id="upFile1" >
													    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
													  </div>
													</div>
												<!-- <div class="m-1" style="position: absolute;right: 60px;">+ 사진</div> -->
				                         	</div>
				                         		 <textarea class="col-lg-11" id="reviewCon" name="content" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px;"></textarea>
				                           		<input type="submit" class="btn" style="margin-bottom: 70px;height: 80px; border: 1px solid #ddd;width: 70px;" value="수정">
				                           </div>
												</form>
                                  </div>
                                  <div class="sl-item">
                                <div class="row">
                                <div class="usageReviewImg mb-5 ml-5 mr-5 mt-3" >
		    						<img class="img-circle" src="${ pageContext.request.contextPath }/resources/images/image_7.jpg" alt="..."> 
                                 </div>
                                   <div class="mt-2 col-md p-20">
                                       <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
                                   	<div class="row"> 
                                        <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
                                        <div class="col-md-9">
                                            <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-success">리뷰등록</a> 
                                            <a href="javascript:void(0)" class="btn btn-rounded btn-outline-secondary">리뷰수정</a> 
                                        </div>
                                       </div>
                                   </div>
                                   </div>
                                  </div>
                                  <div class="sl-item">
                                <div class="row">
                                 <div class="usageReviewImg mb-5 ml-5 mr-5 mt-3" >
			    					<img class="img-circle" src="${ pageContext.request.contextPath }/resources/images/image_8.jpg" alt="..."> 
                                  </div>
                                    <div class="mt-2 col-md p-20">
                                        <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
                                    	<div class="row"> 
                                         <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
                                         <div class="col-md-9">
                                             <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-success">리뷰등록</a> 
                                             <a href="javascript:void(0)" class="btn btn-rounded btn-outline-secondary">리뷰수정</a> 
                                         </div>
                                        </div>
                                    </div>
                                  </div>
                                  </div>
                                  <div class="sl-item">
                               <div class="row">
                                <div class="usageReviewImg mb-5 ml-5 mr-5 mt-3" >
		    						<img class="img-circle" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg" alt="..."> 
                                 </div>
                                   <div class="mt-2 col-md p-20">
                                       <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
                                   	<div class="row"> 
                                        <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
                                        <div class="col-md-9">
                                            <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-success">리뷰등록</a> 
                                            <a href="javascript:void(0)" class="btn btn-rounded btn-outline-secondary">리뷰수정</a> 
                                        </div>
                                       </div>
                                   </div>
                                 </div>
                                  </div>
                                  <div class="sl-item">
                               <div class="row">
                                 <div class="usageReviewImg mb-5 ml-5 mr-5 mt-3" >
			    					<img class="img-circle" src="${ pageContext.request.contextPath }/resources/images/image_2.jpg" alt="..."> 
                                  </div>
                                  <div class="mt-2 col-md p-20">
                                      <div><a href="#">모락(MORAK) 서울대입구점</a> <span class="sl-date">20.09.18</span></div>
                                  	<div class="row"> 
                                       <div class="col-md-9 m-b-30">모임이 즐거워지는 공간! 서울대입구역 단독룸!</div>
                                       <div class="col-md-9">
                                           <a href="javascript:void(0)" class="btn m-r-5 btn-rounded btn-outline-success">리뷰등록</a> 
                                           <a href="javascript:void(0)" class="btn btn-rounded btn-outline-secondary">리뷰수정</a> 
                                       </div>
                                      </div>
                                  </div>
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>       
		<!-- 리뷰 끝 -->
    </div>
</div>
</div>
</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/jquery/jquery-3.2.1.min.js"></script>
<!-- Bootstrap popper Core JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/popper/popper.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/js/perfect-scrollbar.jquery.min.js"></script>
<!--Wave Effects -->
<script src="${ pageContext.request.contextPath }/resources/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${ pageContext.request.contextPath }/resources/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/js/custom.min.js"></script>
<!-- ============================================================== -->
<!-- This page plugins -->
<!-- ============================================================== -->
<!--morris JavaScript -->
<script>
$(".star").on('click',function(){
	   var idx = $(this).index();
	   $(".star").removeClass("on");
	     for(var i=0; i<=idx; i++){
	        $(".star").eq(i).addClass("on");
	   }
	 });
//사진 첨부
$(function(){
	$("[name=upFile]").on("change", function(){
		//input:file 내부에 저장된 file객체 가져오기
		var file = $(this).prop("files")[0];
		var $label = $(this).next('.custom-file-label');
		
		//label에 쓰기
		if(file == undefined)
			$label.html("파일을 선택하세요.");
		else 
			$label.html(file.name);
		
	});
});
//리뷰등록 버튼
$("#reviewBtn").on("click", function(){
	if($(this).hasClass("btn-primary")){
		$("#reviewFrm").hide();
		/* $("#reviewFrm").css("position","block"); */
		$(this).removeClass("btn-primary");
	}
	else{
		$("#reviewFrm").show();
		$(this).addClass("btn-primary");
	}	
});
//별 받기
 $(".star-box span").on("click", function(){
	/* alert($(this).hasClass("star1")?"1":$(this).hasClass("star2")?"2":$(this).hasClass("star3")?"3":$(this).hasClass("star4")?"4":"5"); */
	$("[name=starRating]").val($(this).hasClass("star1")?"1":$(this).hasClass("star2")?"2":$(this).hasClass("star3")?"3":$(this).hasClass("star4")?"4":"5");
}); 

 //리뷰 유효성 검사
function reviewValidate(){
	if($("[name=starRating]").val()==""){
		alert("별점을 선택해주세요");
		return false;
	}
	if($("#reviewCon").val().length<10){
		alert("내용을 최소 10자 이상 입력해주세요");
		return false;
	}
	/* 금칙어 */
	var reContent = $("#reviewCon").val();
	var j=0;
	var str = ["바보","멍청이"];
	var keyRegExp = new RegExp('(' + str.join('|') + ')', 'g');
	$("#reviewCon").val(reContent.replace(keyRegExp, "❤❤"));

	return true;
} 
//리뷰수정 버튼
$("#modifyBtn").on("click", function(){
	if($(this).hasClass("btn-primary")){
		$("#reviewFrm").hide();
		/* $("#reviewFrm").css("position","block"); */
		$(this).removeClass("btn-primary");
	}
	else{
		$("#reviewFrm").show();
		$(this).addClass("btn-primary");
	}	
});

</script>
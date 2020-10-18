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
	cursor: pointer;
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
                                <li class="breadcrumb-item active">리뷰 목록</li>
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
                           <h5 class="card-title">리뷰 목록</h5>
                           <h6 class="card-subtitle">이용한 공간의 리뷰를 작성해주세요</h6>
                       </div>
                          <div class="col-md-2">
                              <select class="custom-select b-0" id="selectId">
                              	<c:choose>
	                              	<c:when test="${ status eq 'all' }">
	                                  <option value="1" selected>전체 리뷰</option>
	                              	</c:when>
	                              	<c:otherwise>
	                                  <option value="1" >전체 리뷰</option>
	                              	</c:otherwise>
                              	</c:choose>
                              	<c:choose>
	                              	<c:when test="${ status eq 'possible' }">
	                                  <option value="2" selected>작성 가능한 리뷰</option>
	                              	</c:when>
	                              	<c:otherwise>
	                                  <option value="2" >작성 가능한 리뷰</option>
	                              	</c:otherwise>
                              	</c:choose>
                              	<c:choose>
	                              	<c:when test="${ status eq 'complete' }">
	                                  <option value="3" selected>내가 작성한 리뷰</option>
	                              	</c:when>
	                              	<c:otherwise>
	                                  <option value="3" >내가 작성한 리뷰</option>
	                              	</c:otherwise>
                              	</c:choose>
                              </select>
                           </div> 
                      </div>
                       <div class="steamline m-t-40">
                       <c:forEach items="${spaceList}" var="list" varStatus="vs">
                           <div class="sl-item">
                            <div class="row parent">
                             <div class="usageReviewImg mb-5 ml-5 mr-5 mt-3" >
		    					<img class="img-circle" src="${ pageContext.request.contextPath }/resources/upload/space/${list.rname}" alt="..."> 
                                 </div>
                                   <div class="mt-2 col-md p-20">
                                       <div><a style="color:#666;" href="${ pageContext.request.contextPath }/space/spaceDetail.do?spaceNo=${ list.spaceNo }">${ list.spaceName }</a> <span class="sl-date">${ list.enrollDate }</span></div>
                                   	<div class="row"> 
                                   	 <c:if test="${ list.reviewContent == null }">
                                        <div class="col-md-9 m-b-30" style="min-height: 15px;">리뷰를 작성해주세요</div>
									</c:if>
                                   	 <c:if test="${ list.reviewContent != null }">
                                        <div class="col-md-9 m-b-30" style="min-height: 15px;">${list.reviewContent }</div>
									</c:if>
									<c:if test="${ not empty list.reviewComment }">
			                         	<div class="mt-4" style=" width: 500px; cursor:default;  padding-bottom: 10px; ">
				                         <div class="pl-3 pr-5 ">
				                         	<p><i class="fa fa-quote-left mr-1 font-20" style="color: #0785fe;"></i> 호스트 답글</p>
				                         	<p>${ list.reviewComment }</p><i class="fa fa-quote-right mr-1 ml-1 font-20" style="color: #0785fe;"></i>
				                         </div>
			                         	</div>
			                         </c:if> 

<%--                                         <div class="col-md-9 m-b-30">${ fn:substring(list.content,0,30) }</div> --%>
                                        <div class="col-md-9">
                                         <c:if test="${ list.reviewNo == null }">
                                            	<a class="btn m-r-5 btn-rounded btn-outline-success reviewBtn" style="position: absolute;right: -140px;bottom: 1px;">리뷰등록</a> 
                                            </c:if>
                                            <c:if test="${ list.reviewNo != null }">
                                            <input type="hidden" name="starInfo" value="${ list.starRating }" />
                                            <input type="hidden" name="className" value="${ list.reviewNo }" />
                                            	<a class="btn btn-rounded btn-outline-secondary modifyBtn" style="position: absolute;right: -140px;bottom: 10px;">리뷰수정</a> 
                                            </c:if> 
                                        </div>
                                       </div>
                                   </div>
                                       
                                   </div>
                                   		<!-- 리뷰등록 -->
				                         <div class="pl-5 pr-5 reviewFrm" style="height: 150px; display: none;" >
				                         	<div class="row pl-3 align-items-xl-center">
				                         		<p class="m-1" style="font-size: 15px;">별점 &nbsp;&nbsp;:</p>
				                         		<div class="star-box">
												  <i class="fa fa-star-o star mt-2 star1" style="color:#f7b71d;" aria-hidden="true"></i>
												  <i class="fa fa-star-o star star2" style="color:#f7b71d;" aria-hidden="true"></i>
												  <i class="fa fa-star-o star star3" style="color:#f7b71d;" aria-hidden="true"></i>
												 <i class="fa fa-star-o star star4" style="color:#f7b71d;" aria-hidden="true"></i>
												 <i class="fa fa-star-o star star5" style="color:#f7b71d;" aria-hidden="true"></i>
												</div>
												<form name="ReviewFrm" 
													  action="${pageContext.request.contextPath}/member/insertReview.do" 
													  method="post" 
													  onsubmit="return reviewValidate();"
													  enctype="multipart/form-data"
													  style="position: absolute;right: 5%;">
													  <input type="hidden" name="spaceNo" value="${list.spaceNo }"/>
													  <input type="hidden" name="revNo" value="${list.revNo }"/>
													  <input type="hidden" name="nickName" value="${member.nickName}" />
													  <input type="hidden" name="content"  />
													  <div class="input-group mb-3" style="padding:0px;">
													  <div class="custom-file">
													    <input type="file" class="custom-file-input" name="upFile" id="upFile1" >
													    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
													  </div>
													</div>
													
													</div>
													  <input type="hidden" name="starRating" required/>
					                         		 <textarea class="col-lg-11 reviewCon" style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px;"></textarea>
					                           		<input type="submit" class="btn submit" style="margin-bottom: 70px;height: 80px; border: 1px solid #ddd;width: 70px;" value="등록">
					                           </div>
												</form>
												<!-- <div class="m-1" style="position: absolute;right: 60px;">+ 사진</div> -->
					                         	
					                           
												
											<!-- 리뷰수정 -->	
											<div class="pl-5 pr-5 reviewUpdateFrm" style="height: 150px; display: none;" >
				                         	<div class="row pl-3 align-items-xl-center">
				                         		<p class="m-1" style="font-size: 15px;">별점 &nbsp;&nbsp;:</p>
				                         		<div class="star-box">
												  <i class="fa fa-star-o star mt-2 star1 starInfo${ list.reviewNo }" style="color:#f7b71d;" aria-hidden="true"></i>
												  <i class="fa fa-star-o star star2 starInfo${ list.reviewNo }" style="color:#f7b71d;" aria-hidden="true"></i>
												  <i class="fa fa-star-o star star3 starInfo${ list.reviewNo }" style="color:#f7b71d;" aria-hidden="true"></i>
												 <i class="fa fa-star-o star star4 starInfo${ list.reviewNo }" style="color:#f7b71d;" aria-hidden="true"></i>
												 <i class="fa fa-star-o star star5 starInfo${ list.reviewNo }" style="color:#f7b71d;" aria-hidden="true"></i>
												</div>
												<form name="ReviewUpdateFrm" 
													  action="${pageContext.request.contextPath}/member/updateReview.do" 
													  method="post" 
													  onsubmit="return reviewValidate();"
													  enctype="multipart/form-data"
													  style="position: absolute;right: 5%;">
													  <input type="hidden" name="spaceNo" value="${list.spaceNo }"/>
													  <input type="hidden" name="revNo" value="${list.revNo }"/>
													  <input type="hidden" name="nickName" value="${member.nickName}" />
													  <input type="hidden" name="content"  />
													  <div class="input-group mb-3" style="padding:0px;">
													  <div class="custom-file">
													    <%-- <input type="file" class="custom-file-input" name="upFile" id="upFile1" >
													    <label class="custom-file-label" for="upFile1">${list.rname }</label> --%>
													  </div>
													</div>
					                         	</div>
													  <input type="hidden" name="starRating" value="${list.starRating }" required/>
				                         		<textarea class="col-lg-11 reviewCon"  style="resize: none; border:1px solid #edeceb; height: 80px; border-radius: 4px;">${list.reviewContent }</textarea>
				                           		<input type="submit" class="btn submit" style="margin-bottom: 70px;height: 80px; border: 1px solid #ddd;width: 70px;" value="수정">
				                           </div>
										</form>
                                 	</div>
                                 </c:forEach>
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
    if($(".star").hasClass("fa-star")){
	   for(var i=0; i<=10; i++){
		   $(this).siblings(".star").eq(i).removeClass("fa-star");
		   $(this).siblings(".star").eq(i).addClass("fa-star-o");
	   }
	}  
   if($(".star").hasClass("fa-star-o")){ 
	    for(var i=0; i<idx; i++){
	    	$(this).siblings(".star").eq(i).removeClass("fa-star-o");
	    	$(this).siblings(".star").eq(i).addClass("fa-star");
		}
	    	$(this).removeClass("fa-star-o");
	    	$(this).addClass("fa-star");
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
$(".reviewBtn").on("click", function(){
	
	if($(this).hasClass("btn-primary")){
		$(this).parents("div").siblings(".reviewFrm").hide();
		$(this).removeClass("btn-primary");
	}
	else{
		$(this).parents("div").siblings(".reviewFrm").show();
		$(this).addClass("btn-primary");
	} 	
});
//별 받기
 $(".star-box i").on("click", function(){
	 /* alert($(this).hasClass("star1")?"1":$(this).hasClass("star2")?"2":$(this).hasClass("star3")?"3":$(this).hasClass("star4")?"4":"5");  */
	$("[name=starRating]").val($(this).hasClass("star1")?"1":$(this).hasClass("star2")?"2":$(this).hasClass("star3")?"3":$(this).hasClass("star4")?"4":"5");
}); 
 //리뷰 유효성 검사
$(".submit").click(function(){
	if($(this).siblings("[name=starRating]").val()==""){
		alert("별점을 선택해주세요");
		return false;
	}
	
	 if($(this).siblings(".reviewCon").val().length<10){
		alert("내용을 최소 10자 이상 입력해주세요");
		return false;
	} 
		
	/* 금칙어 */
	var reContent = $(this).siblings("textarea").val();
	var j=0;
	var str = ["바보","멍청이"];
	var keyRegExp = new RegExp('(' + str.join('|') + ')', 'g');
	$(this).siblings("textarea").val(reContent.replace(keyRegExp, "❤❤"));
	
	$("[name=content]").val($(this).siblings("textarea").val());
	/* alert($(this).siblings("textarea").val()); */

	return true;
});
//리뷰수정 버튼
$(".modifyBtn").on("click", function(){
	if($(this).hasClass("btn-primary")){
		$(this).parents("div").siblings(".reviewUpdateFrm").hide();
		$(this).removeClass("btn-primary");
	}
	else{
		$(this).parents("div").siblings(".reviewUpdateFrm").show();
		$(this).addClass("btn-primary");
	}	
	var idx = $(this).siblings("[name=starInfo]").val();
	var className = $(this).siblings("[name=className]").val();
	for(var i=0; i<idx; i++){
		$(".starInfo"+className).eq(i).removeClass("fa-star-o");
		$(".starInfo"+className).eq(i).addClass("fa-star");
	} 
});
//리뷰 모아보기
$("#selectId").change(function(){
	let option = $("#selectId").val();
	if(option == 1) location.href="${pageContext.request.contextPath }/member/reviewList.do";
	else if(option == 2) location.href="${pageContext.request.contextPath }/member/reviewPossible.do";
	else location.href="${pageContext.request.contextPath }/member/reviewComplete.do";
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%-- 한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/hostpageMenu.jsp" />

        <div class="page-wrapper">
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor ml-5">호스트 센터</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center mr-5">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">호스트 센터</a></li>
                                <li class="breadcrumb-item active">공간 정보</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- 회원정보 -->
                <div id="profileEditPage" class="ml-5 mr-5">
                    <div class="card p-5">
                       <div class="card-body">
                        <div class="row"> 
                         <div class="col-md-10">
                             <h5 class="card-title">공간 정보</h5>
                             <h6 class="card-subtitle mb-5">공간 정보를 확인하세요</h6>
                         </div>
	                    </div>
		    			<c:set var="space" value="${space}" scope="page"/> 
						 <table class="col-11">
							<tr>
								<th class="align-baseline">공간명</th>
								<th><input type="text" class="col-8 input-group-text mb-4 mr-5 pull-right" value="${space.spaceName }" readonly /></th>
							</tr>
						    <tr>
						      <td class="align-baseline">공간 설명</td>
						      <td><input type="email" class="col-8 input-group-text mb-4 mr-5 pull-right" value="${space.content }" readonly /></td>
							</tr>
							<tr>
						      <td class="align-baseline">전화번호</td>
						      <td><input type="text" class="col-8 input-group-text mb-4 mr-5 pull-right" value="${space.spacePhone }" readonly /></td>
							</tr>
							<tr>
						      <td class="align-baseline">카테고리</td>
						      <td><input type="email" class="col-8 input-group-text mb-4 mr-5 pull-right" value="${space.categoryNo }" readonly /></td>
							</tr>
						    <tr>
						      <td class="align-baseline">사업자 번호</td>
						      <td><input type="number" class="col-8 input-group-text mb-4 mr-5 pull-right" value="${space.businessNo }" readonly/></td>
							</tr>
						    <tr>
						      <td class="align-baseline">주소</td>
						      <td><input type="tel" class="col-8 input-group-text mb-4 mr-5 pull-right" maxlength="11" value="${space.address }" readonly /></td>
							</tr>

						</table >
						  <div class="mt-5" style="border-top: 1px solid #bbbbbb" ></div>
						  <h6 class="card-subtitle mt-3 mb-5">수정 가능 항목</h6>
						  <form:form name="spaceFrm" id="spaceFrm" 
							  action="${pageContext.request.contextPath}/host/updateSpace.do" 
							  method="post"
							  enctype="multipart/form-data">
						  <table class="col-11">
							<tr>
						      <td class="align-baseline">공간 사진</td>
						      <td><input type="password" class="col-8 input-group-text ml-auto mb-4 mr-5" value="" /></td>
							</tr>
							<tr>
						      <td class="align-baseline">태그</td>
						       <c:if test="${ not empty space.tag }">
						      <td>
						      	
	                              <input id="tagName" type="text" placeholder="태그를 입력해주세요"></td>
	                              <button id="addTags" type="button" class="btn btn-primary ml-4 pr-4 pl-4 p-10">추가 ⅴ</button>
	                          <td>
							      <input type="tel" id="tags" class="col-8 input-group-text mb-4 mr-5 pull-right" maxlength="11" value="${space.address }" readonly />
							       <c:forEach items="${ space.tag }" var="tag" varStatus="vs">
							       <span class="tags" class="btn p-0" style="cursor: pointer;">${ tag }</span>
							      
								   </c:forEach>
							  </td>
							   </c:if>
							</tr>
							<tr>
						      <td class="align-baseline">가능시간</td>
						      <td><input type="tel" class="col-8 input-group-text mb-4 mr-5 pull-right" maxlength="11" value="${space.address }" readonly /></td>
							</tr>
							<tr>
						      <td class="align-baseline">옵션</td>
						      <td><input type="tel" class="col-8 input-group-text mb-4 mr-5 pull-right" maxlength="11" value="${space.address }" readonly /></td>
							</tr>
							<tr>
						      <td class="align-baseline">가능시간</td>
						      <td><input type="tel" class="col-8 input-group-text mb-4 mr-5 pull-right" maxlength="11" value="${space.address }" readonly /></td>
							</tr>
						    <tr>
						      <td class="align-baseline">공개여부</td>
						      <td>
								<input type="radio" id="open" name="status" class="col-8 input-group-text ml-auto mb-5 mr-5" value="O" style="display:inline;">
								<label for="open" style="display:inline;">공개</label><br> 
						      <input type="radio" id="close" name="status" class="col-8 input-group-text ml-auto mb-5 mr-5" value="C" style="display:inline;"/>
						      <label for="close" style="display:inline;">비공개</label><br>
						      </td>
							</tr>
						</table>
						<div class="mt-5 pull-right mr-5">
					      <input type="submit" class="btn btn-outline-success btn-lg p-3 pl-4 pr-4" value="정보 수정">&nbsp;
					      <input type="reset" class="btn btn-outline-secondary mr-5 btn-lg p-3 pl-4 pr-4" value="변경사항 없음">
						</div>
							  	</form:form>
						
	                   </div>
	               </div>
	           </div>

                <!-- 회원정보 끝 -->
    </div>
</div>
</div>
</div>
<script>
//태그 추가 클릭이벤트
$("#addTags").on('click', function(){
	if($("#tagName").val()==""){alert("내용을 입력해주세요");};
	if($("#tags span").length>=5){
		alert("최대 5개까지 입력 가능합니다");
	}
	else if($("#tagName").val()!=""){
		
		//태그 인서트
		$.ajax({
		url : "${ pageContext.request.contextPath }/space/insertHashTag.do",
		data : {
			"hashTag" : $("#tagName").val()
			}
		,
		dataType : "json",
		success : function(data){
			
			$("#tags").append("<input type='checkbox' name='tag' style='display:none' value="+$('#tagName').val() +" checked/><span class='label label-success m-2 p-2 small'>#"+$('#tagName').val() +" X</span>"); 
			/* $("#tags").append("<span class='label label-success m-2 p-2 small'>#"+$('#tagName').val() +" X</span>");  */
	    	$("#tagName").val("");	
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
		});  
    }
});
//태그 삭제 클릭이벤트
$("#tags").on("click", function(){
   //내용작성하기 
});

</script>

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


	

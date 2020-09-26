<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
.image-div {
	background-color:#f7f7f7;
	border:1px solid gray;
	display:inline-block;
	width:200px;
	height: 200px;
	margin-right: 20px;
}
.fas {position: absolute; padding: 90px;}
input[type=file], .address-input {margin-bottom:20px; margin-top:10px;}
.site-btn {width: 100%; font-size: 17px;}
</style>
<!-- 컨텐츠 시작 -->
<!-- 헤더 -->
<section class="ftco-section ftco-agent">
 <div class="navbar justify-content-center navbar-dark bg-dark">
	  <ul class="nav">
		  <li class="nav-item">
		    <a class="nav-link active" href="${pageContext.request.contextPath }/community/group/groupList.do">소모임</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="${pageContext.request.contextPath }/community/recruit/recruitList.do">구인/구직</a>
		  </li>
		</ul>
	</div>
	</section>
    <div class="hero-wrap" style="height: 200px">
      <div class="container">
        <div class="row no-gutters slider-text justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text text-center mx-auto" style="margin-bottom:80%;">
	            <h1 class="mb-4">소모임 글등록</h1>
	            <p class="h6">소모임 게시판은 공동체 활동에 대한 소모임 관련 정보를 교환하는 게시판으로, SpaceUs에서는 정보교환의 온라인 공간을 제공할 뿐 중개에 관여하지 않으며,
				그에 따른 과실 또는 손해발생에 대해 일체 책임을 지지 않음을 알려드립니다.</p>
            </div>
          </div>
        </div>
      </div>
    </div>



    <!-- 글등록시작-->
	<section class="blog-section spad">
                 <div class="m-5">
	 <div class="row m-5">
                 <!-- column -->
                 <div class="col-12">
						<p class="h3 mt-5 mb-3">글쓰기</p>
                         <div class="table-responsive">
                         <form action="${pageContext.request.contextPath}/community/recruit/insertRecruit.do" id="recruitFrm" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                             <table class="table">
                           			 <c:forEach items="${boardList}" var="board">
	                                     <tr>
	                                         <th >분류</th>
	                                         <th><select class="nice-select sm-width small" name="header">
								                    <option value="" selected hidden>분류선택</option>
								                    <option value="${board.boardNo }">${board.boardName}</option>
								                </select>
								             </th>
	                                     </tr>
	                                  </c:forEach>
	                                     <tr>
	                                         <td >제목</td>
	                                         <td>
	                                         	<input type="text" placeholder="제목을 입력해주세요" style="border:1px solid #d0d0d0; width:100%" name="title"/>
	                                         </td>
	                                     </tr>
	                                     <tr>
	                                         <td >글쓴이</td>
	                                         <td>
	                                         	<input type="text" value="로그인 하게되면 loginMember가져올것임" style="border:none;" name="nickname"/>
	                                         </td>
	                                     </tr>
	                                     <tr>
	                                     <td >내용</td>
	                                        <td >
								       			<textarea name="ir1" id="ir1" rows="15" style="width:100%;" ></textarea>
	                                        </td>
	                                     </tr>
	                             </table>
                          
                             <div class="text-center">
			                 	<button  id="insertBtn" class="btn " style="margin-top:50px; background-color: #00c89e; font-size:18px; color:white;">글 등록 </button>
                             </div>
                             </form>
							 </div>
                         </div>
                     </div>
                 </div>
             </section>
    <!-- 글등록 끝-->
<!-- 컨텐츠 끝 -->
    

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/smartEditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript"> 
 var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "ir1",
 sSkinURI: "${pageContext.request.contextPath}/resources/js/smartEditor/SmartEditor2Skin.html",
 fCreator: "createSEditor2",
  htParams : { 
	 // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
	 bUseToolbar : true, 
	 // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
	 bUseVerticalResizer : false, 
	 // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
	 bUseModeChanger : false,
	 
	  fOnBeforeUnload : function(){
	 }  
 },

	   fOnAppLoad : function(){	 
		//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
		 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		} 
}); 
 $("#insertBtn").click( function(){
	 if($("select[name=header]").val()==""){
		alert("분류를 선택해주세요");
		return false;
		 }
	 if($("input[name=title]").val()==""){
		alert("제목을 입력해주세요");
		return false;
		 }
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);  
	$("#recruitFrm").submit(); 
	 
}); 

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
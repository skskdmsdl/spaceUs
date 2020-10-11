<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
.img img {height: 350px; width: 350px;}
.space1 {cursor: pointer;}
.more-list {visibility:hidden;}
.btn-outline-danger {margin-bottom:5px;}
.text-right a:hover {color:#666666;}
</style>
<section class="ftco-section ftco-agent">
  	<div class="container">
  	      <div class="col-md-12 heading-section text-center ftco-animate mb-5 mt-5">
      	<span class="subheading">SpaceUs MD가 큐레이션한 기획전 입니다</span>
        <h2 class="mb-2">기획전</h2>
        <!-- admin계정만 보이게 -->
        <sec:authorize access="hasRole('ADMIN')">
        <h1 class="text-right" style="height: 40px;"><a href="${pageContext.request.contextPath}/exhibition/insertExhibitionFrm.do">+</a></h1>
        </sec:authorize>
      </div>
      <div class="row">
      	<c:forEach items="${ list }" var="list">
	      	<div class="col-md-4">
	      	<sec:authorize access="hasRole('ADMIN')">
	      	<button type="button" class="btn btn-outline-danger" onclick="deleteEx('${ list.exNo }');">삭제</button>
	      	<br />
	      	</sec:authorize>
	      	<input type="hidden" id="exNo" value="${ list.exNo }"/>
	      		<div class="agent space1" onclick="exhibitionList('${list.tag}');">
  					<div class="img">
	  					<c:if test="${ not empty list.imageUrl }">
	    					<img src="${ list.imageUrl  }">
	  					</c:if>
	  					<c:if test="${ not empty list.renamedFileName }">
	    					<img src="${pageContext.request.contextPath}/resources/upload/exhibition/${ list.renamedFileName  }">
	  					</c:if>
	  				</div>
	  				<div class="desc">
	  					<h3>${ list.exTitle }
	  					</h3>
	  					<br />
						<p class="h-info">${ list.exSubtitle } </p>
	  				</div>
	 				</div>
	     	</div>
      	</c:forEach>
     </div>
     </section>
<script>

function deleteEx(exNo){

	if(confirm("정말 삭제하시겠습니까?") == false)
		return;

	$.ajax({
		url : "${ pageContext.request.contextPath }/exhibition/deleteExhibition?no=" + exNo,
		data : {
			exNo : $("#exNo").val()
		},
		success : function(data){
			//console.log(data);
			alert('삭제가 완료되었습니다.');
			window.location.reload();
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	});
}

function exhibitionList (tag) {
	console.log("tag = " + tag);
	location.href = "${pageContext.request.contextPath}/exhibition/exhibitionList.do?tag=" + tag;
};

</script>
<script>$(function () { memberId();});</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
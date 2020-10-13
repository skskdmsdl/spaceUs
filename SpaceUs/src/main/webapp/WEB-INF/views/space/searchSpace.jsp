<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<%-- 한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<style>
.txt_result{
	display: inline;
	color: #343a40;
	font-family: 'NEXON Lv1 Gothic OTF';
	letter-spacing: 2px;
}
.txt_keyword{
	color: #007bff;
	font-family: 'NEXON Lv1 Gothic OTF';
	font-size: 2em;
	font-weight: 1.5
}

.search-btn{
  float: right;
  right: 30px;
  padding-right: 15px;
  padding-left: 15px;
  font-size: 14px;
  letter-spacing: 2px;
  color: white;
  font-weight: 600;
  text-transform: uppercase;
  background: #20c997;
  padding: 10px 20px;
  border-radius: 4px;
  border-style: groove;
  border-color: #20c997;
}
#btn-wrap{
  display: block;
  width: 100%;
  color: #17a2b8;
  text-align: center;
  margin-left: 10px;
  argin-right: 20px;
  margin-top: 10px;
  padding-left: 15px;
}
.option-select{
  display: block;
  width: 100%;
  text-align: left;
  
}
.sort-wrap{ 
  display:block;
  width: 100%;
  height: 60px;
  margin-bottom: 20px;
}
#space-sort{
  width: 240px;
  height: 40px;
}
.space-price{
  color: #007bff;
}
.flex-wrap{
  display:block;
  width: 100%;
}
.search-category{
  display:inline-block;
  width: 33%;
  height: 50px;
  text-align: left;
  color:#343a40;
  padding: 13px;
}
.search-result {
  background-color: #f8f9fa;
  padding-top: 20px;
}
h1 {
font-family: 'NEXON Lv1 Gothic OTF';
}

@import url(https://fonts.googleapis.com/css?family=Lato:100,300,400,700);
@import url(https://raw.github.com/FortAwesome/Font-Awesome/master/docs/assets/css/font-awesome.min.css);

#wrap {
  /* margin: 50px 78px; */
  top: 2em;
  display: inline-block;
  position: relative;
  height: 60px;
  flaot: left;
  padding: 0;
  position: relative;
}

.searchInput{
  height: 40px;
  width: 400px;
  font-size: 20px;
  display: inline-block;
  font-family: "NEXON Lv1 Gothic OTF";
  text-align: center;
  font-weight: 100;
  border:none;
  border-bottom : 1px solid #d0d0d0;
  margin-right:10px;
  outline: none;
  color: black;
  padding: 3px;
  padding-right: 60px;
  padding-left: 60px;
  top: 0;
  right: 0;
  background: none;
  cursor: pointer; 
}

#search_keyword {
	color: black;
}

#search_keyword:focus:hover {
  border-bottom: 1px solid black;
}

.searchInput:focus {
  width: 400px;
  z-index: 1;
  border-bottom: 1px solid black;
  cursor: text;
  left: -180px;
  top: 55px;
  text-align: center;
} 

#search_submit:hover {
  opacity: 0.8;
}
.space-price{
  color: #007bff;
}

</style>

<script type="text/javascript">
$(function() { 
    
    $("#searchInput").autocomplete({
        
        source : function( request, response ) {
			//tag
       	 	$.ajax({
                 type: 'get',
                 url: "${pageContext.request.contextPath}/space/autocomplete.do",
                 dataType: "json",
                 data: {value : request.term},
                 success: function(data) {
                     console.log(request.term);
                     //서버에서 json 데이터 response 후 목록에 추가
                     response(
                         $.map(data, function(item) {  
                             console.log(item);
                             return {
                             	label:item
                             }
                         })
                     );
                 }
            });             
             
        },    // source 는 자동 완성 대상
        select : function(event, ui) {    //아이템 선택시
            console.log(ui.item);
        },
        focus : function(event, ui) {    //포커스 가면
            return false;//한글 에러 잡기용도로 사용됨
        },
        minLength: 2,// 최소 글자수
        autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
        classes: {  
            "ui-autocomplete": "highlight"
        },
        delay: 500,   
        position: { my : "right top", at: "right bottom" }, 
        close : function(event){ 
        }
        
    });
    
});

function searchSpace(){
	var keyword = $(".searchInput").val();
	//alert(keyword);

	keyword = keyword.replace('#','%23');
	
	if(keyword == null || keyword == ''){
		alert("키워드를 입력해주세요!");
		return;
	}
	else{
		location.href='${pageContext.request.contextPath}/space/searchSpace.do?keyword='+keyword;
	}
}

</script>


<section class="ftco-section goto-here">
	<!-- 컨텐츠 시작 -->
<div class="hero-wrap ftco-degree-bg" style="background-image: url('${pageContext.request.contextPath }/resources/images/bg_1.jpg'); height: 600px" data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text justify-content-center align-items-center">
 			<div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
 				<div class="text text-center mx-auto" style="margin-bottom:25%;">
 					<!-- 검색결과 시작 -->
     				<div class="container col-md-12 heading-section text-center mb-5">
    					<span class="txt_keyword" style="font-size:40px !important;">${ keyword }</span>
    					<span class="txt_result" style="font-size:20px !important;">(으)로 검색한 결과입니다.</span>
  					</div>
  					<!-- 검색결과 끝 -->
 
					<div>
						<!-- 검색시작 -->
						<div id="wrap">
	  						<input id="searchInput" class="searchInput" name="search_keyword" placeholder="키워드를 입력하세요">
	  						<input type="submit" class="btn-lg search-btn" value="입력" onclick="searchSpace();" />
	  						<!-- <i class="fas fa-search fa-2x" style="color:#00C89E"></i> -->	
						</div>
						<!-- 검색끝 -->
    				</div>
    				
  				</div>
			</div>
		</div>
	   		
	  	<div class="mouse">
			<a href="#" class="mouse-icon">
				<div class="mouse-wheel"><span class="ion-ios-arrow-round-down"></span></div>
			</a>
		</div>
		
	</div>
</div>
	<!-- 컨텐츠 끝 -->

<!-- 옵션/카테고리/지역 선택 시작-->
<div class="container">
	<div class="search-form-content" style="margin-top:100px;">
		<div class="flex-wrap">
			<div class="search-category">공간유형</div>
			<div class="search-category">지역</div>
			<div class="search-category">날짜</div>
			<form id="filter-search" class="filter-form">
				<!-- 카테고리 선택 시작 -->
				<select name="space_type" id="space_type" class="nice-select sm-width">
					<option value="all_category">모든유형</option>
					<c:forEach items="${categoryList}" var="category">
						<option value="${category.categoryNo}">${category.categoryName}</option>
					</c:forEach>
				</select>
				<!-- 카테고리 선택 끝-->
				
				<!-- 지역 선택 시작 -->
				<select name="space_location" id="space_location" class="nice-select sm-width">		
					<option value="all_location">모든지역</option>
					<option value="seoul">서울특별시</option>
					<option value="seoul">인천광역시</option>
					<option value="seoul">경기도</option>
					<option value="seoul">강원도</option>
				</select>
				<!-- 지역 선택 끝-->
				
				<!-- 날짜 선택 시작 -->
				<input type="date" name="space_date" id="space_date" class="nice-select sm-width"/>
				<!-- 날짜 선택 끝 -->
			</form>
			
			<div class="container">
				<button type="button" class="search-btn" onclick="searchSpace();">검색</button>
			</div>
		</div>
	</div>
	
	<!-- 더많은 옵션 시작-->   
	<div class="more-option">
		<div class="accordion" id="accordionExample">
			<div class="card">
				<div class="card-heading-active" id="btn-wrap">
					<a class="icon-arrow_drop_down_circle" data-toggle="collapse" data-target="#collapseOne">
						<b>더 많은 옵션</b>
					</a>
					<br />
				</div>  
					
				<div id="collapseOne" class="collapse">
					<div class="card-body">
						<span><b>편의시설</b>을 선택하세요.</span>
						<hr />
						<div class="mo-list">
							<div class="ml-column">
								<label for="${option.optionNO}">${option.optionName}
									<input type="checkbox" id="${option.optionNO}" value="${option.optionNO}">
									<span class="checkbox"></span>
								</label>
							</div>
						</div>
					</div>
				</div> 
				
			</div>
		</div>
	</div>
	<!-- 더많은 옵션 끝 -->    
</div>
<!-- 옵션/카테고리/지역 선택 끝 -->

<hr />
   
   
<!-- 리스트 정렬 순서 시작 -->   
<div class="container">
	<div class="sort-wrap" name="sort-wrap">
		<select name="space-sort" id="space-sort" class="nice-select">
			<option value="price">가격 순</option>
			<option value="price">날짜 순</option>
			<option value="price">별점 높은 순</option>
			<option value="price">이용후기 많은 순</option>
		</select>
	</div>
</div>
<!-- 리스트 정렬 순서 끝 -->   

<!-- 공간 리스트 시작 -->
<div class="container search-result">
    <c:if test="${!empty spaceList}">
    <div class="row">
		<c:forEach items="${spaceList}" var="space">
			<div class="col-md-4">
				<div class="property-wrap ftco-animate">
	    			<a href="" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/upload/space/${space.renamedFilename});"></a>
	    			<div class="text">
	    				<p class="price"><span class="space-price">${space.hourlyPrice}<small>원/시간</small></span></p>
	    				<ul class="property_list">
	    					<li><span class="icon-star"></span>${space.starAvg }</li><!-- 평균 별점 수 -->
	    					<li><span class="icon-heart"></span>${space.likeCnt }</li> <!-- 좋아요 수 -->
	    					<li><span class="icon-comments"></span>${space.reviewCnt}</li><!-- 리뷰 수 -->
	    				</ul>
	    				<h3><a href="${pageContext.request.contextPath }/space/spaceDetail.do">${space.spaceName}</a></h3>
	    				<small><span class="icon-my_location">${space.address}</span></small>
	    				<!-- <a href="#" class="d-flex align-items-center justify-content-center btn-custom">
	    				<span class="icon-heart"></span>
	    				</a> -->
	    			</div>
				</div>
	    	</div>		
		</c:forEach>
	</div>
	</c:if>
	<c:if test="${empty spaceList}">
	<div class="row" style="font-size: 20px; margin:auto;">
		<div class="col-md-4" style="margin:auto;">
			<div class="property-wrap ftco-animate" style="margin-top:10px; text-align: center;">
				검색 결과가 없습니다. <br />
				다른 검색조건으로 공간을 찾아보세요.
			</div>
		</div>
	</div>
	</c:if>
	
</div>
<!-- 공간 리스트 끝-->
</section>	

<!-- <script>$(function () { memberId();});</script> -->
	
<jsp:include page="/WEB-INF/views/common/footer1.jsp" />

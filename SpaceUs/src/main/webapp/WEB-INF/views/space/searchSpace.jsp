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
	var sort = $("select[name=space-sort]").val(); //all
	
	keyword = keyword.replace('#','%23');
	
	 if(keyword == null || keyword == ''){
		alert("키워드를 입력해주세요!");
		return;
	}
	else{
		location.href='${pageContext.request.contextPath}/space/searchSpace.do?keyword='+keyword+"&sort="+ sort;
	}  

}

function searchDetailSpace(){

	var category = $("select[name=space_type]").val();
	var location = $("select[name=space_location]").val();
	var option = $("select[name=space_option]").val();
	var sort = $("select[name=space-sort]").val();

	window.location.href="${pageContext.request.contextPath}/space/searchDetailSpace.do?category="+category+"&location="+location+"&option="+option+"&sort="+sort;
}

function sortChange(obj){

	var category = $("select[name=space_type]").val();
	var location = $("select[name=space_location]").val();
	var option = $("select[name=space_option]").val();
	var keyword = $("[name=keyword]").val();
	var sort = $("select[name=space-sort]").val();
	
	if((category == null && location == null && option == null) || (category == "" && location == "" && option == "")){
		//alert("키워드");
		window.location.href='${pageContext.request.contextPath}/space/searchSpace.do?keyword='+keyword+"&sort="+ sort;
	}
	else{
		//alert("세부입력");
		window.location.href="${pageContext.request.contextPath}/space/searchDetailSpace.do?category="+category+"&location="+location+"&option="+option+"&sort="+sort;
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
     					<input type="hidden" name="keyword" value="${keyword}"/>
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
				<div class="search-category">옵션</div>
				<form id="filter-search" class="filter-form">
					<!-- 카테고리 선택 시작 -->
					<select name="space_type" id="space_type" class="nice-select sm-width">
						<option value=""  ${category == ''? 'selected':'' }>모든유형</option>
						<option value="회의실" ${category == '회의실'? 'selected':'' }>회의실</option>
						<option value="세미나실" ${category == '세미나실'? 'selected':'' }>세미나실</option>
						<option value="다목적홀" ${category == '다목적홀'? 'selected':'' }>다목적홀</option>
						<option value="작업실" ${category == '작업실'? 'selected':'' }>작업실</option>
						<option value="파티룸" ${category == '파티룸'? 'selected':'' }>파티룸</option>
						<option value="공연장" ${category == '공연장'? 'selected':'' }>공연장</option>
						<option value="연습실" ${category == '연습실'? 'selected':'' }>연습실</option>
						<option value="카페" ${category == '카페'? 'selected':'' }>카페</option>
						<option value="스터디룸" ${category == '스터디룸'? 'selected':'' }>스터디룸</option>
						<option value="엠티장소" ${category == '엠티장소'? 'selected':'' }>엠티장소</option>
						<option value="독립 오피스" ${category == '독립 오피스'? 'selected':'' }>독립 오피스</option>
						<option value="코워커 스페이스"  ${category == '코워커 스페이스'? 'selected':'' }>코워커 스페이스</option>	
					</select>
					<!-- 카테고리 선택 끝-->
					
					<!-- 지역 선택 시작 -->
					<select name="space_location" id="space_location" class="nice-select sm-width">		
						<option value="" ${location == ''?'selected':''}>모든 지역</option>
						<option value="서울" ${location == '서울'?'selected':''}>서울특별시</option>
						<option value="인천" ${location == '인천'?'selected':''}>인천광역시</option>
						<option value="경기" ${location == '경기'?'selected':''}>경기도</option>
						<option value="강원" ${location == '강원'?'selected':''}>강원도</option>
					</select>
					<!-- 지역 선택 끝-->
					
					<!-- 옵션 선택 시작 -->
					<select name="space_option" id="space_option" class="nice-select sm-width">		
						<option value="" ${option == ''?'selected':''}>모든 옵션</option>
						<option value="TV/프로젝터" ${option == 'TV/프로젝터'?'selected':''}>TV/프로젝터</option>
						<option value="인터넷/와이파이" ${option == '인터넷/와이파이'?'selected':''}>인터넷/와이파이</option>
						<option value="복사/인쇄기" ${option == '복사/인쇄기'?'selected':''}>복사/인쇄기</option>
						<option value="화이트보드" ${option == '화이트보드'?'selected':''}>화이트보드</option>
						<option value="음향/마이크" ${option == '음향/마이크'?'selected':''}>음향/마이크</option>
						<option value="취사시설" ${option == '취사시설'?'selected':''}>취사시설</option>
						<option value="음식물반입가능" ${option == '음식물반입가능'?'selected':''}>음식물반입가능</option>
						<option value="주류반입가능" ${option == '주류반입가능'?'selected':''}>주류반입가능</option>
						<option value="샤워시설" ${option == '샤워시설'?'selected':''}>샤워시설</option>
						<option value="주차" ${option == '주차'?'selected':''}>주차</option>
						<option value="금연" ${option == '금연'?'selected':''}>금연</option>
						<option value="반려동물 동반가능" ${option == '반려동물 동반가능'?'selected':''}>반려동물 동반가능</option>
						<option value="PC/노트북" ${option == 'PC/노트북'?'selected':''}>PC/노트북</option>
						<option value="의자/테이블" ${option == '의자/테이블'?'selected':''}>의자/테이블</option>
						<option value="내부화장실" ${option == '내부화장실'?'selected':''}>내부화장실</option>
						<option value="탈의실" ${option == '탈의실'?'selected':''}>탈의실</option>
						<option value="테라스/루프탑" ${option == '테라스/루프탑'?'selected':''}>테라스/루프탑</option>
						<option value="공용라운지" ${option == '공용라운지'?'selected':''}>공용라운지</option>
						<option value="전신거울" ${option == '전신거울'?'selected':''}>전신거울</option>
						<option value="바베큐시설" ${option == '바베큐시설'?'selected':''}>바베큐시설</option>
					</select>
					<!-- 옵션 선택 끝 -->
					
					
				</form>				
				<div class="container">
					<!-- <button type="submit" class="search-btn search-detail" onclick="searchDetailSpace();">검색</button> -->
					<input type="submit" value="검색" onclick="searchDetailSpace();" class="search-btn search-detail" />
				</div>
			</div>
	</div>
</div>
<!-- 옵션/카테고리/지역 선택 끝 -->

<hr />
   
<!-- 리스트 정렬 순서 시작 -->   
<div class="container">
	<div class="sort-wrap" name="sort-wrap">
		<select name="space-sort" id="space-sort" class="nice-select" onchange="sortChange(this.value);">
			<option value="all" ${sort == 'all'?'selected':''}>전체보기 순</option>
			<option value="price" ${sort == 'price'?'selected':''}>가격 순</option>
			<option value="star" ${sort == 'star'?'selected':''}>별점 높은 순</option>
			<option value="review" ${sort == 'review'?'selected':''}>이용후기 많은 순</option>
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
	    					<li>
	    						<i class="fa fa-star"></i>
	    						<c:if test="${space.starAvg != 0 }">
		    						<fmt:formatNumber value="${space.starAvg}" pattern="0.0" type="number"/>
	    						</c:if>
	    						<c:if test="${space.starAvg == 0 }">0</c:if>
	    					</li><!-- 평균 별점 수 -->
	    					<li><span class="icon-heart"></span>${space.likeCnt }</li> <!-- 좋아요 수 -->
	    					<li><span class="icon-comments"></span>${space.reviewCnt}</li><!-- 리뷰 수 -->
	    				</ul>
	    				<h3><a href="${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo=${space.spaceNo}">${space.spaceName}</a></h3>
	    				<small><span class="icon-my_location">${space.address}</span></small>
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

<script>$(function () { memberId();});</script>
	
<jsp:include page="/WEB-INF/views/common/footer1.jsp" />

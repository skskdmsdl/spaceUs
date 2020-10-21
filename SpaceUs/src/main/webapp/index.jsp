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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	  integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	  crossorigin="anonymous">

<style>
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

.searchInput{
  height: 40px;
  width: 300px;
  font-size: 20px;
  display: inline-block;
  font-family: "NEXON Lv1 Gothic OTF";
  text-align: center;
  font-weight: 100;
  border:none;
  border-bottom : 1px solid gray;
  margin-right:10px;
  outline: none;
  color: black;
  padding: 3px;
 /*  padding-right: 60px;
  padding-left: 60px; */
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
  width: 300px;
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
#disapear {display: none;}

/*  내가 추가 한 것 */

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
        delay: 30,
        position: { my : "right top", at: "right bottom" }, 
        close : function(event){ 
        }
        
    });
    
});

$(document).on("click",".fa-2x",function(){
   $(this).siblings("#disapear").toggle('30000');
});

function cook(){
	window.location.href="${pageContext.request.contextPath}/exhibition/exhibitionList.do?tagNo=TAG182";
}
function birthday(){
	window.location.href="${pageContext.request.contextPath}/exhibition/exhibitionList.do?tagNo=TAG63";
}
function meeting(){
	window.location.href="${pageContext.request.contextPath}/exhibition/exhibitionList.do?tagNo=TAG204";
}
</script>

<!-- 컨텐츠 시작 -->
 
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="top:12%;">
  <div class="carousel-inner">
    <div class="carousel-item active" style="height: 500px;">
      <img src="${pageContext.request.contextPath }/resources/images/cook.jpg" class="d-block w-100" style="opacity: .5;">
      <div class="carousel-caption d-none d-md-block" style="top: 6em;">
        <h2 class="mb-4" style="text-decoration: underline; text-underline-position: under;">"제일 잘하는 요리 친구들에게 만들어줘요!"</h2>
        <h4 class="mb-4">우리만의 요리대회 공간</h4>
        <button type="submit" class="btn-lg btn btn-black font-18 mt-4" style="border-radius: 100px;" onclick="cook();">바로가기</button>
      </div>
	</div>
    <div class="carousel-item" style="height: 500px;">
      <img src="${pageContext.request.contextPath }/resources/images/birthday.jpg" class="d-block w-100" style="opacity: .5;">
   	  <div class="carousel-caption d-none d-md-block" style="top: 6em;">
        <h2 class="mb-4" style="text-decoration: underline; text-underline-position: under;">"1년에 한번! 나를 더욱 더 사랑하는 방법"</h2>
        <h4 class="mb-4">특별한 생일을 위한 공간</h4>
        <button type="submit" class="btn-lg btn btn-black font-18 mt-4" style="border-radius: 100px;" onclick="birthday();">바로가기</button>
      </div>
    </div>
    <div class="carousel-item" style="height: 500px;">
      <img src="${pageContext.request.contextPath }/resources/images/meeting.jpg" class="d-block w-100" style="opacity: .5;">
      <div class="carousel-caption d-none d-md-block" style="top: 6em;">
        <h2 class="mb-4" style="text-decoration: underline; text-underline-position: under;">"스마트한 팀워크를 위한 공유오피스 모음"</h2>
        <h4 class="mb-4">팀을 위한 공유 오피스</h4>
        <button type="submit" class="btn-lg btn btn-black font-18 mt-4" style="border-radius: 100px;" onclick="meeting();">바로가기</button>
      </div>	
    </div>
    <!-- 커뮤니티 -->
    <div class="carousel-item" style="height: 500px;">
      <img src="${pageContext.request.contextPath }/resources/images/work.jpg" class="d-block w-100" style="opacity: .5;">
      <div class="carousel-caption d-none d-md-block" style="top: 6em;">
        <h2 class="mb-4" style="text-decoration: underline; text-underline-position: under;">"JOB을 잡고 싶은 사람들을 위한 커뮤니티"</h2>
        <h4 class="mb-4">구인/구직 어렵지 않아요</h4>
        <button type="submit" class="btn-lg btn btn-black font-18 mt-4" style="border-radius: 100px;" onclick="work();">바로가기</button>
      </div>	
    </div>
    <div class="carousel-item" style="height: 500px;">
      <img src="${pageContext.request.contextPath }/resources/images/group.jpg" class="d-block w-100" style="opacity: .5;">
      <div class="carousel-caption d-none d-md-block" style="top: 6em;">
        <h2 class="mb-4" style="text-decoration: underline; text-underline-position: under;">"나도 똑똑하게 인맥을 쌓아간다!!"</h2>
        <h4 class="mb-4">넓은 인맥을 공유하고 싶다면?</h4>
        <button type="submit" class="btn-lg btn btn-black font-18 mt-4" style="border-radius: 100px;" onclick="group();">바로가기</button>
      </div>	
    </div>
    <!-- /커뮤니티 -->
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<!-- 검색창 시작 -->
<section class="ftco-section goto-here search-section spad">
 <div class="container">
    	<div class="row justify-content-center align-items-center">
      		<div class="col-lg-9 col-md-1">
      			<div class="text text-center mx-auto" style="margin-top:5%; margin-bottom :10%;">
          			<h2 class="mb-4"><strong>당신은 어떤 공간을 찾고 있나요?</strong></h2>
          			<p></p>
		  				<i class="fas fa-search fa-2x mt-4" style="color:#00C89E"></i>	
     					<div id="disapear" style="margin-top:-20px">
     						<div id="wrap" class="mb-5 mt-3" >
		  						<input id="searchInput" class="searchInput" name="search_keyword" placeholder="지역 또는 공간유형을 검색해보세요!" style="width: 400px; display: inline-block; text-align: center;">
		  						<input type="submit" class="search-btn btn btn-primary " value="입력" onclick="searchSpace();" style="background: #00c89e; display: inline-block;"/>
							</div>
         				</div>
       			</div>
     		</div>
   		</div>
  <!-- <div class="mouse">
	<a href="#" class="mouse-icon">
		<div class="mouse-wheel"><span class="ion-ios-arrow-round-down"></span></div>
	</a>
</div> -->
 </div>
<!-- 옵션/카테고리/지역 선택 시작-->
<div class="container">
	<div class="search-form-content">
		<div class="flex-wrap">
			<div class="search-category">공간유형</div>
			<div class="search-category">지역</div>
			<div class="search-category">옵션</div>
			<form id="filter-search" class="filter-form">
				<!-- 카테고리 선택 시작 -->
				<select name="space_type" id="space_type" class="nice-select sm-width">
					<option value="">모든유형</option>
					<option value="회의실">회의실</option>
					<option value="세미나실">세미나실</option>
					<option value="다목적홀">다목적홀</option>
					<option value="작업실">작업실</option>
					<option value="파티룸">파티룸</option>
					<option value="공연장">공연장</option>
					<option value="연습실">연습실</option>
					<option value="카페">카페</option>
					<option value="스터디룸">스터디룸</option>
					<option value="엠티장소">엠티장소</option>
					<option value="독립 오피스">독립 오피스</option>
					<option value="코워커 스페이스">코워커 스페이스</option>	
				</select>
				<!-- 카테고리 선택 끝-->
				
				<!-- 지역 선택 시작 -->
				<select name="space_location" id="space_location" class="nice-select sm-width">		
					<option value="">모든지역</option>
					<option value="서울">서울특별시</option>
					<option value="인천">인천광역시</option>
					<option value="경기">경기도</option>
					<option value="강원">강원도</option>
				</select>
				<!-- 지역 선택 끝-->
				
				<!-- 옵션 선택 시작 -->
				<select name="space_option" id="space_option" class="nice-select sm-width">		
					<option value="">모든 옵션</option>
					<option value="TV/프로젝터">TV/프로젝터</option>
					<option value="인터넷/와이파이">인터넷/와이파이</option>
					<option value="복사/인쇄기">복사/인쇄기</option>
					<option value="화이트보드">화이트보드</option>
					<option value="음향/마이크">음향/마이크</option>
					<option value="취사시설">취사시설</option>
					<option value="음식물반입가능">음식물반입가능</option>
					<option value="주류반입가능">주류반입가능</option>
					<option value="샤워시설">샤워시설</option>
					<option value="주차">주차</option>
					<option value="금연">금연</option>
					<option value="반려동물 동반가능">반려동물 동반가능</option>
					<option value="PC/노트북">PC/노트북</option>
					<option value="의자/테이블">의자/테이블</option>
					<option value="내부화장실">내부화장실</option>
					<option value="탈의실">탈의실</option>
					<option value="테라스/루프탑">테라스/루프탑</option>
					<option value="공용라운지">공용라운지</option>
					<option value="전신거울">전신거울</option>
					<option value="바베큐시설">바베큐시설</option>
				</select>
				<!-- 옵션 선택 끝 -->
			</form>
			
			<div class="container">
				<button type="button" class="search-btn btn btn-primary" onclick="searchDetailSpace();">검색</button>
			</div>
		</div>
	</div>
</div>
<!-- 옵션/카테고리/지역 선택 끝 -->
<!-- 검색창 끝 -->
<br />
<br />
<!-- 추천공간 시작 -->
	<div class="container">
		<div class="row justify-content-center">
      <div class="col-md-12 heading-section text-center ftco-animate mb-5">
      	<span class="subheading">오늘의 추천</span>
        <h2 class="mb-2">인기 공간</h2>
      </div>
    </div>
    <div id="popularList" class="row">
    	  <div class="col-md-4">
    		<div class="property-wrap ftco-animate">
    		<span class="pop0"></span>
    			<div class="text">
    				<p class="price"><span class="space-price price0"></span><small>원/시간</small></p>
    				<ul class="property_list">
    					<li class="view0"><span class="icon-star"></span></li>
    					<li class="like0"><span class="icon-heart"></span></li>
    					<li class="star0"><span class="icon-comments"></span></li>
    				</ul>
    				<h3 class="title0"></h3>
    				<small><span class="icon-my_location location0"></span></small>
    	
    			</div>
    		</div>
    	</div>
    	  <div class="col-md-4">
    		<div class="property-wrap ftco-animate">
    		<span class="pop1"></span>
    			<div class="text">
    				<p class="price"><span class="space-price price1"></span><small>원/시간</small></p>
    				<ul class="property_list">
    					<li class="view1"><span class="icon-star"></span></li>
    					<li class="like1"><span class="icon-heart"></span></li>
    					<li class="star1"><span class="icon-comments"></span></li>
    				</ul>
    				<h3 class="title1"></h3>
    				<small><span class="icon-my_location location1"></span></small>
    
    			</div>
    		</div>
    	</div>
    	 <div class="col-md-4">
    		<div class="property-wrap ftco-animate">
    		<span class="pop2"></span>
    			<div class="text">
    				<p class="price"><span class="space-price price2"></span><small>원/시간</small></p>
    				<ul class="property_list">
    					<li class="view2"><span class="icon-star"></span></li>
    					<li class="like2"><span class="icon-heart"></span></li>
    					<li class="star2"><span class="icon-comments"></span></li>
    				</ul>
    				<h3 class="title2"></h3>
    				<small><span class="icon-my_location location2"></span></small>
    				
    			</div>
    		</div>
    	</div> 
    </div>
	</div>
</section>
<!-- 추천공간 끝 -->
<!-- 이용자리뷰 시작 -->
    <section class="ftco-section ftco-no-pt">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">생생한 리뷰를 만나보세요</span>
            <h2>이용자 리뷰</h2>
          </div>
        </div>
        <div class="row d-flex" id="review-wrapper">
         
      </div>
    </section>	
<!-- 이용자리뷰 끝-->
<script>
$(function () { 
	memberId();
}); 
$(function () { 
	popular();
}); 
//이용자 리뷰 ajax 요청
$(function () { 
	review();
}); 
function review(){
	console.log("리뷰function 실행");
	$.ajax({
		type:"GET",
		url:"${pageContext.request.contextPath}/space/recentRev.do",
		dataType:"json",
		success:function(data){
			console.log("ajax 요청 성공!");
			console.log(data);
			 $.each(data, function(i, item){
				var html="";
				
				 var date = new Date(item.enrollDate);
				 /**
				  *  yyyy년 MM 월 dd일 포맷으로 반환
				  */
				 function getFormatDate(date){
				     var year = date.getFullYear();              //yyyy
				     var month = (1 + date.getMonth());          //M
				     month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
				     var day = date.getDate();                   //d
				     day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
					 	
						
				     return ' '+year + '년 ' + month + '월 ' + day + '일 ';       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
				 }
				/* html += for(var i=0; i<${item.starRating}; i++){+"<span class=\"icon-star\"></span>"+}; */
				html  +=  "<div class=\"col-md-3 d-flex\">";
	          	html  += "<div class=\"blog-entry justify-content-end\">";
          	    html  += "<div class=\"text\">";
	          	html  += "<h4 class=\"headig mb-2 text-center\"><a style=\"color :#343a40;\" class=\"font-bold\" href=\"${pageContext.request.contextPath }/space/spaceReviewDetail.do?spaceNo="+item.spaceNo+"\">"+item.spaceName+"</a></h4>";
          		html  += "<img class=\"lock-20 mt-2 img\" style=\"width:100%; height:200px;\" src=\'${pageContext.request.contextPath}/resources/upload/review/"+item.image+"\'>";
	          	html  += "<div class=\"meta mt-1 mb-1\">";
	          	html  +=  "<div><a href=\"${pageContext.request.contextPath }/space/spaceReviewDetail.do?spaceNo="+item.spaceNo+"\">"+getFormatDate(date)+"</a></div>";
	          	html  +=  "<div><a href=\"${pageContext.request.contextPath }/space/spaceReviewDetail.do?spaceNo="+item.spaceNo+"\">"+item.nickName+"</a></div>";
	          	html  +=  "<div><a href=\"${pageContext.request.contextPath }/space/spaceReviewDetail.do?spaceNo="+item.spaceNo+"\" class=\"meta-chat\"><span class=\"icon-star\"></span>"+item.starRating+"</a></div>";
          		html  += "</div>";
          		html += "<p style=\"margin-top:10px; overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; -webkit-line-clamp: 3; display: -webkit-box;\"  >"+item.content+"</p>";
          		html  += "</div></div></div>";
				/* console.log(html); */
				$("#review-wrapper").append(html);
			}); 
		},error:function(){
			console.log("ajax 요청 실패");
			}
		});
};
		
function searchSpace(){
	var keyword = $(".searchInput").val();
	//alert(keyword);

	keyword = keyword.replace('#','%23');
	
	if(keyword == null || keyword == ''){
		swal("키워드를 입력해주세요!");
		return;
	}
	else{
		location.href='${pageContext.request.contextPath}/space/searchSpace.do?keyword='+keyword+"&sort=all";
	}
}

function searchDetailSpace(){

	var category = $("select[name=space_type]").val();
	var location = $("select[name=space_location]").val();
	var option = $("select[name=space_option]").val();

	window.location.href="${pageContext.request.contextPath}/space/searchDetailSpace.do?category="+category+"&location="+location+"&option="+option+"&sort=all";
}

document.querySelector('.stick').addEventListener('click',()=>{
	  document.querySelector('.four').value = '';
	}); 
function popular(){
	$.ajax({
		url : "${ pageContext.request.contextPath }/space/selectPopularSpaces.do",
		dataType : "json",
		success : function(data){
			console.log(data.list);
			 $.each(data.list, function(i, list){
				$(".pop"+i).before("<a href='${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo="+list.spaceNo+"'>");
				//$("link_"+i).append("<a href='${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo="+list.spaceNo+"'>");
				$(".pop"+i).addClass('img').css("background-image", "url(${pageContext.request.contextPath }/resources/upload/space/"+list.renamedFilename+")")
				$(".pop"+i).after("</a>");
				$(".price"+i).append(list.hourlyPrice);
				$(".view"+i).append(Math.round(list.starAvg * 10)/10);
				$(".like"+i).append(list.likeCnt);
				$(".star"+i).append(list.reviewCnt);
				$(".title"+i).append("<a href='${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo="+list.spaceNo+"'>"+list.spaceName+"</a>");
				$(".location"+i).append(list.address);
				
			 });
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	}); 
}; 

</script>
<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<!-- autocomplete -->
<!-- CSS , JS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
#disapear {display: none;}
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

</script>

<!-- 컨텐츠 시작 -->
<div class="hero-wrap ftco-degree-bg"
	 style="background-image: url('${pageContext.request.contextPath }/resources/images/bg_1.jpg');
	 		height: 600px"
	 data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  	<div class="container">
    	<div class="row no-gutters slider-text justify-content-center align-items-center">
      		<div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
      			<div class="text text-center mx-auto" style="margin-bottom:25%;">
          			<h1 class="mb-4">어떤 공간을<br>찾고 있나요?</h1>
          			<p></p>
		  				<i class="fas fa-search fa-2x" style="color:#00C89E"></i>	
     					<div id="disapear" style="margin-top:-20px">
     						<div id="wrap">
		  						<input id="searchInput" class="searchInput" name="search_keyword" placeholder="키워드를 입력하세요">
		  						<input type="submit" class="btn-lg search-btn" value="입력" onclick="searchSpace();" style="background: #00c89e;"/>
							</div>
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
<!-- 검색창 시작 -->
<section class="ftco-section goto-here">
<section class="search-section spad">
    <div class="container">
           		<div class="row justify-content-center">
      <div class="col-md-12 heading-section text-center ftco-animate mb-5">
      	<span class="subheading">원하는 옵션으로 검색해보세요</span>
        <h2 class="mb-2">공간 검색</h2>
      </div>
    </div>
        <div class="search-form-content">
            <form id="filter-search" class="filter-form">
                <select class="nice-select sm-width">
                    <option value="">Chose The City</option>
                </select>
                <select class="nice-select sm-width">
                    <option value="">Location</option>
                </select>
                <select class="nice-select sm-width">
                    <option value="">Property Status</option>
                </select>
                <select class="nice-select sm-width">
                    <option value="">Property Type</option>
                </select>
                <select class="nice-select sm-width">
                    <option value="">No Of Bedrooms</option>
                </select>
                <select class="nice-select sm-width">
                    <option value="">No Of Bathrooms</option>
                </select>
                <div class="room-size-range-wrap sm-width">
                    <div class="price-text">
                        <label for="roomsizeRange">Size:</label>
                        <input type="text" id="roomsizeRange" readonly>
                    </div>
                    <div id="roomsize-range" class="slider ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content">
                    <div class="ui-slider-range ui-corner-all ui-widget-header" style="left: 14.2857%; width: 42.8571%;"></div>
                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 14.2857%;"></span>
                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 57.1429%;"></span>
                    </div>
                </div>
                <div class="price-range-wrap sm-width">
                    <div class="price-text">
                        <label for="priceRange">Price:</label>
                        <input type="text" id="priceRange" readonly>
                    </div>
                    <div id="price-range" class="slider ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content">
                    <div class="ui-slider-range ui-corner-all ui-widget-header" style="left: 6.66667%; width: 60%;"></div>
                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 6.66667%;"></span>
                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 66.6667%;"></span>
                    </div>
                </div>
                <button type="button" onclick="location.href='${pageContext.request.contextPath}/space/searchSpace.do?search_keyword=';" class="search-btn sm-width">검색</button>
            </form>
        </div>
        <div class="more-option">
            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-heading active">
                        <a data-toggle="collapse" data-target="#collapseOne">
                            더 많은 옵션
                        </a>
                    </div>
                    <div id="collapseOne" class="collapse" data-parent="#accordionExample">
                        <div class="card-body">
                            <div class="mo-list">
                                <div class="ml-column">
                                    <label for="air">Air conditioning
                                        <input type="checkbox" id="air">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="lundry">Laundry
                                        <input type="checkbox" id="lundry">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="refrigerator">Refrigerator
                                        <input type="checkbox" id="refrigerator">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="washer">Washer
                                        <input type="checkbox" id="washer">
                                        <span class="checkbox"></span>
                                    </label>
                                </div>
                                <div class="ml-column">
                                    <label for="barbeque">Barbeque
                                        <input type="checkbox" id="barbeque">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="lawn">Lawn
                                        <input type="checkbox" id="lawn">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="sauna">Sauna
                                        <input type="checkbox" id="sauna">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="wifi">Wifi
                                        <input type="checkbox" id="wifi">
                                        <span class="checkbox"></span>
                                    </label>
                                </div>
                                <div class="ml-column">
                                    <label for="dryer">Dryer
                                        <input type="checkbox" id="dryer">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="microwave">Microwave
                                        <input type="checkbox" id="microwave">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="pool">Swimming Pool
                                        <input type="checkbox" id="pool">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="window">Window Coverings
                                        <input type="checkbox" id="window">
                                        <span class="checkbox"></span>
                                    </label>
                                </div>
                                <div class="ml-column last-column">
                                    <label for="gym">Gym
                                        <input type="checkbox" id="gym">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="shower">OutdoorShower
                                        <input type="checkbox" id="shower">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="tv">Tv Cable
                                        <input type="checkbox" id="tv">
                                        <span class="checkbox"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
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
    <div class="row">
    	  <div class="col-md-4">
    		<div class="property-wrap ftco-animate">
    			<a href="" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/images/work-1.jpg);"></a>
    			<div class="text">
    				<p class="price"><span class="space-price">70,000<small>원/시간</small></span></p>
    				<ul class="property_list">
    					<li><span class="icon-people"></span>최대3인</li>
    					<li><span class="icon-heart"></span>55</li>
    					<li><span class="icon-comments"></span>29</li>
    				</ul>
    				<h3><a href="${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo=space2">The Blue Sky Home</a></h3>
    				<small><span class="icon-my_location">문발리</span></small>
    				<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
    				<span class="icon-heart"></span>
    				</a>
    			</div>
    		</div>
    	</div>
    	<div class='col-md-4'><div class='property-wrap ftco-animate'><a href='' class='img' style='background-image: url(/spaceus/resources/images/work-1.jpg);'></a><div class='text'><p class='price'><span class='space-price'>25000<small>원/시간</small></span></p><ul class='property_list'><li><span class='icon-eye'></span>0</li><li><span class='icon-heart'></span>0</li><li><span class='icon-star'></span>0</li></ul><h3><a href='/spaceus/space/spaceDetail.do?spaceNo=space26'>노르웨이숲</a></h3><small><span class='icon-my_location'>경기도 수원시 영통구</span></small><a href='#' class='d-flex align-items-center justify-content-center btn-custom'><span class='icon-heart'></span></a></div></div></div>
			<!-- 인기공간 리스트 -->
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
         
<%--           <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                <div class="meta mb-3">
                  <div><a href="#">July. 24, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <a href="blog-single.html" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/image_4.jpg');">
	              </a>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              </div>
            </div>
          </div> --%>
          <%-- <div class="col-md-3 d-flex ftco-animate"><div class="blog-entry justify-content-end"><div class="text"><h3 class="heading"><a href="#">Why Lead Generation is Key for Business Growth</a></h3><div class="meta mb-3">
          <div><a href="#">1601471972000</a></div><div><a href="#">홍길동</a></div><div><a href="#" class="meta-chat"><span class="icon-heart"></span>5</a></div></div><a href="blog-single.html" class="lock-20 img" 
          							style="background-image:url('${pageContext.request.contextPath }
										/resources/upload/review/20201001_071933031_653.jpg');"></a><p>❤❤같이 예약 시간을 잘못알았네요 잊고있다가 갑자기 생각나서 갔는데 시간도 미뤄주시고 정말 감사했습니다. 깔끔했구요 덕분에 좋은 추억 만들 수 있었습니다! </p></div></div></div>
        </div> --%>
      </div>
    </section>	
<!-- 이용자리뷰 끝-->
<script>
$(function () { 
	popular();
});

function popular(){
	console.log("인기공간function 실행");
	$.ajax({
		type:"GET",
		url:"${pageContext.request.contextPath}/space/popular.do",
		dataType:"json",
		success:function(data){
			console.log("ajax 요청 성공!");
			console.log(data);
			 $.each(data, function(i, item){
				var html="";

			    html+= "<div class='col-md-4'>";
		    	html+= "<div class='property-wrap ftco-animate'>";
 		    	html+= "<a href='' class='img' style='background-image: url(${pageContext.request.contextPath }/resources/images/work-1.jpg);'></a>";
		    	html+= "<div class='text'>";
		    	html+= "<p class='price'><span class='space-price'>"+item.hourlyPrice+"<small>원/시간</small></span></p>";
		    	html+= "<ul class='property_list'>";
		    	html+= "<li><span class='icon-eye'></span>"+item.views+"</li>";
		    	html+= "<li><span class='icon-heart'></span>"+item.likeCnt+"</li>";
		    	html+= "<li><span class='icon-star'></span>"+item.starAvg+"</li>";
		    	html+= "</ul>";
		    	html+= "<h3><a href='${pageContext.request.contextPath }/space/spaceDetail.do?spaceNo="+item.spaceNo+"'>"+item.spaceName+"</a></h3>"; 
		    	html+= "<small><span class='icon-my_location'>"+item.address+"</span></small>";
		    	//html+= "<a href='#' class='d-flex align-items-center justify-content-center btn-custom'>"; 
		    	//html+= "<span class='icon-heart'></span></a>";
		    	html+= "</div></div></div>";
				
				console.log(html);
				$("#popular").append(html);
			}); 
		},error:function(){
			console.log("ajax 요청 실패");
			}
		});
	//AJAX요청끝
};
//인기공간리스트 끝

$(function () { 
	memberId();
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
				  *  yyyy년 MM 월 dd일 hh:mm 포맷으로 반환
				  */
				 function getFormatDate(date){
				     var year = date.getFullYear();              //yyyy
				     var month = (1 + date.getMonth());          //M
				     month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
				     var day = date.getDate();                   //d
				     day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
					 var hh = date.getHours();
					 hh = hh>=10 ? hh : '0' + hh;
					 var mm = date.getMinutes();	
						
				     return ' '+year + '년 ' + month + '월 ' + day + '일 ' + hh + ':' + mm;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
				 }
				
				
				html  +=  "<div class=\"col-md-3 d-flex\">";
	          	html  += "<div class=\"blog-entry justify-content-end\">";
          	    html  += "<div class=\"text\">";
	          	html  += "<h3 class=\"headig\"><a href=\"${pageContext.request.contextPath }/space/spaceReviewDetail.do?spaceNo="+item.spaceNo+"\">"+item.spaceName+"</a></h3>";
	          	html  += "<div class=\"meta mb-3\">";
	          	html  +=  "<div><a href=\"${pageContext.request.contextPath }/space/spaceReviewDetail.do?spaceNo="+item.spaceNo+"\">"+getFormatDate(date)+"</a></div>";
	          	html  +=  "<div><a href=\"${pageContext.request.contextPath }/space/spaceReviewDetail.do?spaceNo="+item.spaceNo+"\">"+item.nickName+"</a></div>";
	          	html  +=  "<div><a href=\"${pageContext.request.contextPath }/space/spaceReviewDetail.do?spaceNo="+item.spaceNo+"\" class=\"meta-chat\"><span class=\"icon-star\"></span>"+item.starRating+"</a></div>";
          		html  += "</div>";
          		html += "<p>"+item.content+"</p>";
          		html  += "<img class=\"lock-20 img\" src=\'${pageContext.request.contextPath}/resources/upload/review/"+item.image+"\'>";
          		html  += "</div></div></div>";
				console.log(html);
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
		alert("키워드를 입력해주세요!");
		return;
	}
	else{
		location.href='${pageContext.request.contextPath}/space/searchSpace.do?keyword='+keyword;
	}
}

document.querySelector('.stick').addEventListener('click',()=>{
	  document.querySelector('.four').value = '';
	}); 

$.ajax({
	url : "${ pageContext.request.contextPath }/space/indexList.do",
	dataType : "json",
	success : function(data){
		alert("index List!");
	},
	error : function(xhr, status, err){
		console.log("처리실패", xhr, status, err);
	}
}); 

</script>
<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<!-- autocomplete -->
<!-- CSS , JS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
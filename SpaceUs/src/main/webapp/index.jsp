<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
  margin: 50px 78px;
  display: inline-block;
  position: relative;
  height: 60px;
  float: right;
  padding: 0;
  position: relative;
}


input[type="text"] {
  height: 40px;
  font-size: 20px;
  display: inline-block;
  font-family: "NEXON Lv1 Gothic OTF";
  font-weight: 100;
  border: none;
  outline: none;
  color: black;
  padding: 3px;
  padding-right: 60px;
  padding-left: 60px;
  width: 0px;
  position: absolute;
  top: 0;
  right: 0;
  background: none;
  z-index: 3;
  transition: .4s cubic-bezier(0.5, 0.795, 0.5, 0.50);
  cursor: pointer;
}

#search_keyword {
	color: black;
}

#search_keyword:focus:hover {
  border-bottom: 1px solid black;
}

input[type="text"]:focus {
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
     					<div class="col-lg-10 align-items-end" style="margin-top:-20px">
     						<div id="wrap">
							  <form id="searchFrm" onsubmit="searchSpace();" action="" autocomplete="on">
							  <input id="search_keyword" name="search_keyword" type="text" placeholder="키워드를 입력하세요">
							  <i class="fas fa-search fa-2x" id="search_submit" type="submit" style="color:#00C89E"></i>
							  </form>
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
                    <div class="card-heading active" id="option-toggler">
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
    				<h3><a href="${pageContext.request.contextPath }/space/spaceDetail.do">The Blue Sky Home</a></h3>
    				<small><span class="icon-my_location">문발리</span></small>
    				<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
    				<span class="icon-heart"></span>
    				</a>
    			</div>
    		</div>
    	</div>
    	<div class="col-md-4">
    		<div class="property-wrap ftco-animate">
    			<a href="#" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/images/work-2.jpg);"></a>
    			<div class="text">
    				<p class="price"><span class="space-price">50,000<small>원/시간</small></span></p>
    				<ul class="property_list">
    					<li><span class="icon-people"></span>최대8인</li>
    					<li><span class="icon-heart"></span>45</li>
    					<li><span class="icon-comments"></span>340</li>
    				</ul>
    				<h3><a href="#">망원옥탑</a></h3>
    				<small><span class="icon-my_location">망원동</span></small>
    				<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
    				<span class="icon-heart"></span>
    				</a>
    			</div>
    		</div>
    	</div>
	    	<div class="col-md-4">
	    		<div class="property-wrap ftco-animate">
	    			<a href="#" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/images/work-3.jpg);"></a>
	    			<div class="text">
	    				<p class="price"><span class="space-price">60,000<small>원/시간</small></span></p>
	    				<ul class="property_list">
	    					<li><span class="icon-people"></span>최대4인</li>
	    					<li><span class="icon-heart"></span>20</li>
	    					<li><span class="icon-comments"></span>19</li>
	    				</ul>
	    				<h3><a href="#">노원 스튜디오 스페이셔스</a></h3>
	    				<small><span class="icon-my_location">상계동</span></small>
	    				<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
	    				<span class="icon-heart"></span>
	    				</a>
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
        <div class="row d-flex">
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                <div class="meta mb-3">
                  <div><a href="#">July. 24, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <a href="blog-single.html" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/image_1.jpg');">
	              </a>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                <div class="meta mb-3">
                  <div><a href="#">July. 24, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <a href="blog-single.html" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/image_2.jpg');">
	              </a>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                <div class="meta mb-3">
                  <div><a href="#">July. 24, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <a href="blog-single.html" class="block-20 img" style="background-image: url('${pageContext.request.contextPath }/resources/images/image_3.jpg');">
	              </a>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3 d-flex ftco-animate">
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
          </div>
        </div>
      </div>
    </section>	
<!-- 이용자리뷰 끝-->
<script>
function searchSpace(){
	
	$("#searchFrm").attr("action", 
				"${ pageContext.request.contextPath}/space/searchSpace.do")
				.attr("method", "GET");
}


document.querySelector('.stick').addEventListener('click',()=>{
	  document.querySelector('.four').value = '';
	});
</script>
<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
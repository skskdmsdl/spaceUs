<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
h1 {
font-family: 'NEXON Lv1 Gothic OTF';
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
	            <form action="#" class="search-location mt-md-5">
		        		<div class="row justify-content-center">
		        			<div class="col-lg-10 align-items-end">
		        			</div>
		        		</div>
		        	</form>
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
 
<!-- 검색창 시작 -->
<section class="ftco-section goto-here">
<section class="search-section spad">
    <div class="container">
           		<div class="row justify-content-center">
      <div class="col-md-12 heading-section text-center ftco-animate mb-5">
      	<span class="subheading">원하는 공간을 검색해보세요</span>
        <h2 class="mb-2">공간 검색</h2>
      </div>
    </div>
        <div class="search-form-content">
            <form action="#" class="filter-form">
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
                <button type="button" class="search-btn sm-width">Search</button>
            </form>
        </div>
        <div class="more-option">
            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-heading active">
                        <a data-toggle="collapse" data-target="#collapseOne">
                            더 많은 옵션보기
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
    				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
    				<ul class="property_list">
    					<li><span class="flaticon-bed"></span>3</li>
    					<li><span class="flaticon-bathtub"></span>2</li>
    					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
    				</ul>
    				<h3><a href="${pageContext.request.contextPath }/space/spaceDetail.do">The Blue Sky Home</a></h3>
    				<span class="location">Oakland</span>
    				<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
    					<span class="ion-ios-link"></span>
    				</a>
    			</div>
    		</div>
    	</div>
    	<div class="col-md-4">
    		<div class="property-wrap ftco-animate">
    			<a href="#" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/images/work-2.jpg);"></a>
    			<div class="text">
    				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
    				<ul class="property_list">
    					<li><span class="flaticon-bed"></span>3</li>
    					<li><span class="flaticon-bathtub"></span>2</li>
    					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
    				</ul>
    				<h3><a href="#">The Blue Sky Home</a></h3>
    				<span class="location">Oakland</span>
    				<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
    					<span class="ion-ios-link"></span>
    				</a>
    			</div>
    		</div>
    	</div>
    	<div class="col-md-4">
    		<div class="property-wrap ftco-animate">
    			<a href="#" class="img" style="background-image: url(${pageContext.request.contextPath }/resources/images/work-3.jpg);"></a>
    			<div class="text">
    				<p class="price"><span class="old-price">800,000</span><span class="orig-price">$3,050<small>/mo</small></span></p>
    				<ul class="property_list">
    					<li><span class="flaticon-bed"></span>3</li>
    					<li><span class="flaticon-bathtub"></span>2</li>
    					<li><span class="flaticon-floor-plan"></span>1,878 sqft</li>
    				</ul>
    				<h3><a href="#">The Blue Sky Home</a></h3>
    				<span class="location">Oakland</span>
    				<a href="#" class="d-flex align-items-center justify-content-center btn-custom">
    					<span class="ion-ios-link"></span>
    				</a>
    			</div>
    		</div>
    	</div>
    </div>
	</div>
</section>
<!-- 추천공간 끝 -->
	

<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
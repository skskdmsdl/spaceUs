<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	
}
.txt_keyword{
	color: #007bff;
	font-family: 'NEXON Lv1 Gothic OTF';
	font-size: 2em;
	font-weight: 1.5
}
.search-result{
	width:100%;
	padding-top: 15px;
	padding-right: 15px;
	padding-left: 15px;
	margin-top: 15px;
	background-color: #f8f9fa;
}
.filter-btn{
  display: inline-block;
  right: 20px;
  padding-right: 15px;
  padding-left: 15px;
  font-family: 'NEXON Lv1 Gothic OTF';
  font-size: 14px;
  color: #20c997;
  font-weight: 600;
  text-transform: uppercase;
  background: white;
  padding: 10px 20px;
  display: inline-block;
  border-radius: 9px;
  border-style: groove;
  border-color: #20c997;
}
#btn-wrap{
  display: block;
  width: 100%;
  text-align: right;
  margin-left: 10px;
  argin-right: 20px;
  margin-top: 10px;
  padding-left: 15px;
}
.sort-wrap{ 
  display: block;
  width: 100%;
}
#space_sort{
  width: 240px;
  height: 40px;
}
</style>
<section class="ftco-section goto-here">
	<div class="container">
      	<div class="col-md-12 heading-section text-center mb-5">
      		<span class="txt_keyword">${ keyword }</span>
      		<span class="txt_result">(으)로 검색한 결과입니다.</span>
        	
    	</div>
		<div class="search-form-content">
			<form id="filter-search" class="filter-form">
			   <select name="space_type" id="space_type" class="nice-select sm-width">
				  <option value="work_space">코워킹 스페이스</option>
				  <option value="cafe">카페</option>
				  <option value="study_room">스터디룸</option>
				  <option value="party_room">파티룸</option>
				  <option value="filming_studio">촬영 스튜디오</option>
				  <option value="atelier">작업실</option>
				  <option value="mt">엠티장소</option>
		       </select>
			   <select name="space_location" id="space_location" class="nice-select sm-width">		
			   </select>
    		   <input type="date" name="space_date" id="space_date" class="nice-select sm-width"/>
    		 </form>
		</div>
	<div class="more-option">
      <div class="accordion" id="accordionExample">

    	<div class="card-heading-active" id="btn-wrap">
            <a data-toggle="collapse" data-target="#collapseOne">
   			<button type="button" class="filter-btn">필터</button>
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
    
		<div class="card-heading-active">
   			<select name="space_sort" id="space_sort" class="nice-select">
   				<option value="price">가격 순</option>
   				<option value="price">날짜 순</option>
   				<option value="price">별점 높은 순</option>
   				<option value="price">이용후기 많은 순</option>
   			</select>
   		</div>
   <div class="search-result">
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
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	
	
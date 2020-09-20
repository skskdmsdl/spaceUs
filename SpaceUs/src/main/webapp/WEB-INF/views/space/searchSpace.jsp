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
</style>
<section class="ftco-section goto-here">
	<div class="container">
      	<div class="col-md-12 heading-section text-center mb-5">
      		<span class="txt_keyword">${ keyword }</span>
      		<span class="txt_result">(으)로 검색한 결과입니다.</span>
        	
    	</div>
		<div class="search-form-content">
			<div class="flex-wrap">
			   <div class="search-category">공간유형</div>
			   <div class="search-category">지역</div>
			   <div class="search-category">날짜</div>
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
			   	  <option value="seoul">서울특별시</option>
			   	  <option value="seoul">경기도</option>
			   	  <option value="seoul">대전광역시</option>
			   	  <option value="seoul">충청도</option>
			   	  <option value="seoul">경상북도</option>
			   	  <option value="seoul">전라북도</option>
			   	  <option value="seoul">인천광역시</option>
			   </select>
    		   <input type="date" name="space_date" id="space_date" class="nice-select sm-width"/>
    		 </form>
			<div class="container">
            <button type="button" class="search-btn" onclick="searchSpace();">검색</button>
			</div>
    	   </div>
		</div>
	<div class="more-option">
      <div class="accordion" id="accordionExample">
       <div class="card">
    	<div class="card-heading-active" id="btn-wrap">
   			<a class="icon-arrow_drop_down_circle" data-toggle="collapse" data-target="#collapseOne">
                            <b>더 많은 옵션</b>
            </a>
            <br />
    	</div>
    	
      <div id="collapseOne" class="collapse" data-parent="#btn-wrap">
            <div class="card-body">
               <span><b>편의시설</b>을 선택하세요.</span>
               <hr />
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
   <hr />
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
   <div class="container search-result">
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
<script>
function searchSpace(){
	location.href='${pageContext.request.contextPath}/space/searchSpace.do?search_keyword=${keyword}';	
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

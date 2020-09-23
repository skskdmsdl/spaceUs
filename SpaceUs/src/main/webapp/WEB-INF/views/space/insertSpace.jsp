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
</style>
<!-- 컨텐츠 시작 -->
    <div class="hero-wrap ftco-degree-bg"
    	 style="background-image: url('${pageContext.request.contextPath }/resources/images/bg_2.jpg');
    	 		height: 400px"
    	 data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-center align-items-center">
          <div class="col-lg-8 col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text text-center mx-auto" style="margin-bottom:50%;">
	            <h1 class="mb-4">공간 등록하기</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- 공간 등록 폼 -->
    <section class="property-submit-section spad m-5">
        <div class="container ">
            <div class="row m-5">
                <div class="col-lg-12">
                    <div class="property-submit-form">
                        <form action="#">
                            <div class="pf-title">
                                <h4>공간이름<span class="text-danger">*</span></h4>
                                <input type="text">
                            </div>
                            <div class="pf-summernote">
                                <h4>공간설명<span class="text-danger">*</span></h4>
                                <textarea name="example" style="width:100%; height:350px; resize: none;"></textarea>
                            </div>
                            <div class="pf-location">
                                <h4>공간주소<span class="text-danger">*</span></h4>
                                <div style="display:inline-block; width:40%">
	                                <input class="zipCode-input" type="text" placeholder="우편번호"/>
	                            </div>
                                <div style="display:inline-block; width:40%">
		                            <button class="btn btn-primary ml-4 p-10">주소 검색</button>
	                            </div>
                                <input class="address-input" type="text">
                                <input class="detail-address-input" type="text" placeholder="상세주소를 입력해주세요">
                            </div>
                            <div class="pf-phone" style="margin-bottom: 45px;">
                                <h4>공간전화번호<span class="text-danger">*</span></h4>
                                 	<input type='tel' name='phone1' style="width: 10%"/>&emsp;-&emsp;
							        <input type='tel' name='phone2' style="width: 10%"/>&emsp;-&emsp;
							        <input type='tel' name='phone3' style="width: 10%"/>
                            </div>
                            <div class="pf-type">
                                <h4>카테고리 선택<span class="text-danger">*</span></h4>
                                <div class="type-item">
                                    <label for="pt-apart">카페
                                        <input type="checkbox" id="pt-apart">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="pt-house">식당
                                        <input type="checkbox" id="pt-house">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="pt-off">사무실
                                        <input type="checkbox" id="pt-off">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="pt-villa">Villa
                                        <input type="checkbox" id="pt-villa">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="pt-store">Store
                                        <input type="checkbox" id="pt-store">
                                        <span class="checkbox"></span>
                                    </label>
                                    <label for="pt-rest">Resturent
                                        <input type="checkbox" id="pt-rest">
                                        <span class="checkbox"></span>
                                    </label>
                                </div>
                            </div>
                            <div class="pf-status">
                                <h4>가능시간<span class="text-danger">*</span></h4>
                                <div class="status-item">
                                    <label for="ps-rent">월요일
                                    	&emsp;<select></select>
                                    </label>
                                    <label for="ps-sale">화요일
                                        &emsp;<select></select>
                                    </label>
                                    <label for="ps-sale">수요일
                                        &emsp;<select></select>
                                    </label>
                                    <label for="ps-sale">목요일
                                        &emsp;<select></select>
                                    </label>
                                    <label for="ps-sale">금요일
                                        &emsp;<select></select>
                                    </label>
                                    <label for="ps-sale">토요일
                                        &emsp;<select></select>
                                    </label>
                                    <label for="ps-sale">일요일
                                        &emsp;<select></select>
                                    </label>
                                </div>
                            </div>
                            <div class="pf-feature-price">
                                <h4>가격 (시간당)<span class="text-danger">*</span></h4>
                                <div class="fp-inputs">
                                    <input type="number" placeholder="Price">원
                                </div>
                            </div>
                            <div class="pf-feature">
                                <h4>옵션선택</h4>
                                <div class="features-list">
                                    <div class="feature-item">
                                        <label for="air">와이파이
                                            <input type="checkbox" id="air">
                                            <span class="checkbox"></span>
                                        </label>
                                        <label for="lundry">식기
                                            <input type="checkbox" id="lundry">
                                            <span class="checkbox"></span>
                                        </label>
                                        <label for="refrigerator">취사가능
                                            <input type="checkbox" id="refrigerator">
                                            <span class="checkbox"></span>
                                        </label>
                                    </div>
                                    <div class="feature-item">
                                        <label for="barbeque">에어컨
                                            <input type="checkbox" id="barbeque">
                                            <span class="checkbox"></span>
                                        </label>
                                        <label for="lawn">반려동물 동반가능
                                            <input type="checkbox" id="lawn">
                                            <span class="checkbox"></span>
                                        </label>
                                        <label for="sauna">테이블/의자
                                            <input type="checkbox" id="sauna">
                                            <span class="checkbox"></span>
                                        </label>
                                    </div>
                                    <div class="feature-item">
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
                                    </div>
                                    <div class="feature-item">
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
                            <div class="pf-feature-image">
                                <h4>공간이미지<span class="text-danger">*</span></h4>
                                <div class="image-div">
	                                <div>
	                                	<i class="fas fa-plus"></i>
	                                </div>
	                            </div>
                                <div class="image-div">
	                                <div>
	                                	<i class="fas fa-plus"></i>
	                                </div>
	                            </div>
                                <div class="image-div">
	                                <div>
	                                	<i class="fas fa-plus"></i>
	                                </div>
	                            </div>
	                            <input type="file" name="" id="" />
	                            <input type="file" name="" id="" />
	                            <input type="file" name="" id="" />
                            </div>
                            <div class="pf-account" style="margin-bottom: 45px;">
	                            <div style="display:inline-block; width:40%">
	                                <h4>사업자등록증<span class="text-danger">*</span></h4>
	                                <input type="text"/>
	                            </div>
	                            <div style="display:inline-block; width:40%; margin-left: 14em;">
	                                <h4>계좌번호<span class="text-danger">*</span></h4>
	                                <input type="text"/>
	                            </div>
                            </div>
                            <div class="pf-property-details">
                            	<p>* 공간등록 심사는 2일 ~ 7일 소요됩니다.</p>
                                <button type="submit" class="site-btn">공간등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Property Submit Section End -->
	

<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
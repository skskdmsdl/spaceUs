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
#error, #duplicate, #ok{display: none;}
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
                                <textarea name="example" style="width:100%; height:350px; border: 1px solid #ebebeb; resize: none;"></textarea>
                            </div>
                           
                            <div class="pf-location">
                                <h4>공간주소<span class="text-danger">*</span></h4>
                                <div style="display:inline-block; width:40%">
	                                <input class="zipCode-input" id="sample6_postcode" type="text" placeholder="우편번호"/>
	                            </div>
                                <div style="display:inline-block; width:40%">
		                            <button type="button" class="btn btn-primary ml-4 pr-4 pl-4 p-10" onclick="sample6_execDaumPostcode()">주소 검색</button>
	                            </div>
                                <input class="address-input mt-4" type="text" id="sample6_address">
                                <div style="display:inline-block; width:48.5%" >
                                	<input class="detail-address-input" type="text" id="sample6_extraAddress">
                            	</div>
                                <div style="display:inline-block; width:48.5%" class="ml-4">
                                	<input class="detail-address-input" type="text" id="sample6_detailAddress" placeholder="상세주소를 입력해주세요">
                            	</div>
                            </div>
                            <div class="pf-phone" style="margin-bottom: 45px;">
                                <h4>공간전화번호<span class="text-danger">*</span></h4>
                                 	<input type='tel' name='phone1' style="width: 10%"/>&emsp;ㅡ&emsp;
							        <input type='tel' name='phone2' style="width: 10%"/>&emsp;ㅡ&emsp;
							        <input type='tel' name='phone3' style="width: 10%"/>
                            </div>
                            <div class="pf-type">
                                <h4>카테고리 선택<span class="text-danger">*</span></h4>
                                <table class="table table-bordered" id="categoryTb">
                                	<tr>
										<th >회의실</th>	                                
										<th>세미나실</th>	                                
										<th>다목적홀</th>	                                
										<th>작업실</th>	                                
                                	</tr>
                                	<tr>
										<th>파티룸</th>	                                
										<th>공연장</th>	                                
										<th>연습실</th>	                                
										<th>카페</th>	                                
                                	</tr>
                                	<tr>
										<th>스터디룸</th>	                                
										<th>엠티장소</th>	                                
										<th style="width:25%;">독립 오피스</th>	                                
										<th style="width:25%;">코워킹 스페이스</th>	                                
                                	</tr>
                                </table>
                            </div>
                            
                            <div class="pf-status">
                                <h4>가능시간<span class="text-danger">*</span></h4>
                                
                                <div class="jumbotron pb-1 pt-1 status-item">
	                                    <label for="mon" class="mr-5" style="font-size: 15px;">월요일
	                                    <input type="checkbox" id="mon">
                                        <span class="checkbox mt-1"></span>
	                                    </label>
                                    <label for="tue" class="mr-5" style="font-size: 15px;">화요일
	                                    <input type="checkbox" id="tue">
	                                    <span class="checkbox mt-1"></span>
                                    </label>
                                    <label for="wed" class="mr-5" style="font-size: 15px;">수요일
	                                    <input type="checkbox" id="wed">
	                                    <span class="checkbox mt-1"></span>
                                    </label>
                                    <label for="thu" class="mr-5" style="font-size: 15px;">목요일
	                                    <input type="checkbox" id="thu">
	                                    <span class="checkbox mt-1"></span>
                                    </label>
                                    <label for="fri" class="mr-5" style="font-size: 15px;">금요일
	                                    <input type="checkbox" id="fri">
	                                    <span class="checkbox mt-1"></span>
                                    </label>
                                    <label for="sat" class="mr-5" style="font-size: 15px;">토요일
	                                    <input type="checkbox" id="sat">
	                                    <span class="checkbox mt-1"></span>
                                    </label>
                                    <label for="sun" class="mr-5" style="font-size: 15px;">일요일
	                                    <input type="checkbox" id="sun">
	                                    <span class="checkbox mt-1"></span>
                                    </label>
                                </div>
                                <table class="table table-bordered" style="cursor: pointer;" id="availableTime">
                                	<tr>
										<th style="width:16.6%;">00:00 - 01:00</th>	                                
										<th style="width:16.6%;">01:00 - 02:00</th>	                                
										<th style="width:16.6%;">02:00 - 03:00</th>	                                
										<th style="width:16.6%;">03:00 - 04:00</th>	                                
										<th style="width:16.6%;">04:00 - 05:00</th>	                                
										<th style="width:16.6%;">05:00 - 06:00</th>	                                
                                	</tr>
                                	<tr>
										<th>06:00 - 07:00</th>	                                
										<th>07:00 - 08:00</th>	                                
										<th>08:00 - 09:00</th>	                                
										<th>09:00 - 10:00</th>	                                
										<th>10:00 - 11:00</th>	                                
										<th>11:00 - 12:00</th>	                                
                                	</tr>
                                	<tr>
										<th>12:00 - 13:00</th>	                                
										<th>13:00 - 14:00</th>	                                
										<th>14:00 - 15:00</th>	                                
										<th>15:00 - 16:00</th>	                                
										<th>16:00 - 17:00</th>	                                
										<th>17:00 - 18:00</th>	                                
                                	</tr>
                                	<tr>
										<th>18:00 - 19:00</th>	                                
										<th>19:00 - 20:00</th>	                                
										<th>20:00 - 21:00</th>	                                
										<th>21:00 - 22:00</th>	                                
										<th>22:00 - 23:00</th>	                                
										<th>23:00 - 24:00</th>	                                
                                	</tr>
                                </table>
                                
                            </div>
                            
                            <div class="pf-feature-price">
                                <h4>공간 태그<span class="text-danger">*</span></h4>
                                
                                <div class="row">
	                                <div class="ml-3 mb-3" style="width:31%">
	                                    <input id="tagName" type="text" placeholder="태그를 입력해주세요">
	                                </div>
	                                <div>
			                            <button id="addTags" type="button" class="btn btn-primary ml-4 pr-4 pl-4 p-10">추가 ⅴ</button>
		                            </div>
	                            </div>
		                        <span id="tags" style="cursor: pointer;"></span>
                            </div>
                            <div class="pf-feature-price">
                                <h4>가격 (시간당)<span class="text-danger">*</span></h4>
                                <div class="fp-inputs">
                                    <input type="number" placeholder="가격을 입력해주세요">원
                                </div>
                            </div>
                            <div class="pf-feature">
                                <h4>옵션선택</h4>
                                <table class="table table-bordered" id="optionTb">
                                	<tr>
										<th style="width:25%;">TV/프로젝터</th>	                                
										<th style="width:25%;">인터넷/와이파이</th>	                                
										<th style="width:25%;">복사/인쇄기</th>	                                
										<th style="width:25%;">화이트보드</th>	                                
                                	</tr>
                                	<tr>
										<th>음향/마이크</th>	                                
										<th>취사시설</th>	                                
										<th>음식물반입가능</th>	                                
										<th>주류반입가능</th>	                                
                                	</tr>
                                	<tr>
										<th>샤워시설</th>	                                
										<th>주차</th>	                                
										<th>금연</th>	                                
										<th>반려동물 동반가능</th>	                                
                                	</tr>
                                	<tr>
										<th>PC/노트북</th>	                                
										<th>의자/테이블</th>	                                
										<th>내부화장실</th>	                                
										<th>탈의실</th>	                                
                                	</tr>
                                	<tr>
										<th>테라스/루프탑</th>	                                
										<th>공용라운지</th>	                                
										<th>전신거울</th>	                                
										<th>바베큐시설</th>	                                
                                	</tr>
                                </table>
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
                            <div class="pf-feature-price">
                                <h4>사업자등록번호<span class="text-danger">*</span></h4>
                                <div class="row">
	                                <div class="ml-3 mb-3" style="width:31%">
	                                    <input id="businessNum" type="text" placeholder="사업자 번호를 입력해주세요">
	                                </div>
	                                <div class="pt-2">
	                                 	<span id="error" class="ml-4 text-danger">유효하지 않은 번호입니다.</span>
	                                 	<span id="duplicate" class="ml-4 text-danger">이미 등록된 번호입니다.</span>
	                                 	<span id="ok" class="ml-4 text-primary">사용가능한 번호입니다.</span>
			                            <input type="hidden" id="idValid" value="0" />
			                            <!-- <button type="button" id="numInfo" class="btn btn-primary ml-4 pr-4 pl-4 p-10">조회</button> -->
		                            </div>
	                            </div>
		                       
                            </div>
                            <div class="pf-feature-price">
                                <h4>계좌정보<span class="text-danger">*</span></h4>
                                <div class="row ml-1">
									  <select  name="bank" style="height: 46px; width:100px; border-color:  #eaeaea;">
									    <option value="">국민</option>
									    <option value="">우리</option>
									    <option value="">신한</option>
									    <option value="">기업</option>
									  </select>
	                                <div class="ml-3 mb-3" style="width:31%">
	                                    <input id="accountNo" type="text" placeholder="계좌번호를 입력해주세요">
	                                </div>
	                            </div>
		                        <span ></span>
                            </div>
                            <div class="pf-property-details" style="text-align: center;" >
                            	<p>* 공간등록 심사는 2일 ~ 7일 소요됩니다.</p>
                                <button type="submit" class="site-btn col-lg-3">공간등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Property Submit Section End -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script>
//카테고리테이블 클릭이벤트
$("#categoryTb th").on("click", function(){
	if($("#categoryTb th").hasClass("bg-primary")){
    	$("#categoryTb th").removeClass("bg-primary");
    	$(this).addClass("bg-primary");
	}else
    	$(this).addClass("bg-primary");
});
//옵션테이블 클릭이벤트
$("#optionTb th").on("click", function(){
	if($(this).hasClass("bg-primary"))
    	$(this).removeClass("bg-primary");
	else
    	$(this).addClass("bg-primary");
});
//가능시간 클릭이벤트
$("#availableTime th").on("click", function(){
	if($(this).hasClass("bg-primary"))
    	$(this).removeClass("bg-primary");
	else
    	$(this).addClass("bg-primary");
});
//태그 추가 클릭이벤트
$("#addTags").on('click', function(){
	if($("#tagName").val()==""){alert("내용을 입력해주세요");};
	if($("#tags span").length>=5){
		alert("최대 5개까지 입력 가능합니다");
	}
	else if($("#tagName").val()!=""){
		
		//태그 인서트
		$.ajax({
		url : "${ pageContext.request.contextPath }/space/insertHashTag.do",
		data : {
			"hashTag" : $("#tagName").val()
			}
		,
		dataType : "json",
		success : function(data){
			
			$("#tags").append("<span class='label label-success m-2 p-2 small'>#"+$('#tagName').val() +" X</span>"); 
	    	$("#tagName").val("");	
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
		});  
    }
});
//태그 삭제 클릭이벤트
$("#tags").on("click", function(){
   //내용작성하기 
});
//사업자 등록정보 조회(중복조회)
$("#businessNum").keyup(function(){
	if(!/[0-9]{10}$/.test($(this).val())){
		$("#duplicate").hide();
		$("#ok").hide();
		$("#error").show();
		$("#idValid").val(0);
		return;
	}
	 $.ajax({
		url : "${ pageContext.request.contextPath }/space/checkIdDuplicate.do",
		data : {
			businessNum : $(this).val()
		},
		dataType : "json",
		success : function(data){
			console.log(data);

			if(data.isUsable == true){
				$("#error").hide();
				$("#duplicate").hide();
				$("#ok").show();
				$("#idValid").val(1);
			}
			else {
				$("#error").hide();
				$("#duplicate").show();
				$("#ok").hide();
				$("#idValid").val(0);
			}
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	}); 
	
});
</script>

<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
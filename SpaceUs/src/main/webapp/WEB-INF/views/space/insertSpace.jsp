<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 한글 인코딩처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
.image-div {
	background-color:#f7f7f7;
	border:1px solid gray;
	display:inline-block;
	width:300px;
	height: 200px;
	margin: 0 20px 15px 15px;
}
.fas {position: absolute; padding: 90px 140px 80px 143px;}
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
                        <form:form name="spaceFrm" id="spaceFrm" 
							  action="${pageContext.request.contextPath}/space/insertSpace.do" 
							  method="post"
							  enctype="multipart/form-data">
							  <!-- enctype="multipart/form-data"> -->
<!-- 							  onsubmit="return spaceValidate();" -->
                            <div class="pf-title">
                                <h4>공간이름<span class="text-danger">*</span></h4>
                                <!-- <h6>(공간이름은 수정이 불가능합니다 정확히 입력해주세요)</h6> -->
                                <input type="text" name="spaceName" id="spaceName">
                            </div>
                            <div class="pf-summernote">
                                <h4>공간설명<span class="text-danger">*</span></h4>
                                <textarea id="content" name="content" style="width:100%; height:350px; border: 1px solid #ebebeb; resize: none;"></textarea>
                            </div>
                           
                            <div class="pf-location">
                                <h4>공간주소<span class="text-danger">*</span></h4>
                                <!-- <h6>(공간주소는 수정이 불가능합니다 정확히 입력해주세요)</h6> -->
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
                            	<input type="hidden" name="address" value="" />
                            </div>
                            <div class="pf-phone" style="margin-bottom: 45px;">
                                <h4>공간전화번호<span class="text-danger">*</span></h4>
                                 	<input type='tel' id='phone1' style="width: 10%"/>&emsp;ㅡ&emsp;
							        <input type='tel' id='phone2' style="width: 10%"/>&emsp;ㅡ&emsp;
							        <input type='tel' id='phone3' style="width: 10%"/>
							        <input type="hidden" name="spacePhone" value="" />
                            </div>
                            <div class="pf-type">
                                <h4>카테고리 선택<span class="text-danger">*</span></h4>
                                <table class="table table-bordered" id="categoryTb">
                                	<tr>
										<th id="cate1">회의실</th>	                                
										<th id="cate2">세미나실</th>	                                
										<th id="cate3">다목적홀</th>	                                
										<th id="cate4">작업실</th>	                                
                                	</tr>
                                	<tr>
										<th id="cate5">파티룸</th>	                                
										<th id="cate6">공연장</th>	                                
										<th id="cate7">연습실</th>	                                
										<th id="cate8">카페</th>	                                
                                	</tr>
                                	<tr>
										<th id="cate9">스터디룸</th>	                                
										<th id="cate10">엠티장소</th>	                                
										<th id="cate11" style="width:25%;">독립 오피스</th>	                                
										<th id="cate12" style="width:25%;">코워킹 스페이스</th>	                                
                                	</tr>
                                </table>
                                <input type="hidden" name="categoryNo" value="" />
                            </div>
                            
                            <div class="pf-status" id="time">
                                <h4>가능시간<span class="text-danger">*</span></h4>
                                

                                <div class="jumbotron pb-1 pt-1 status-item" id="day">
	                                <label for="mon" class="mr-5" style="font-size: 15px;">월요일
	                                	<input type="radio" name="radio" id="mon">
                                        <span class="checkbox mt-1"></span>
	                                </label>
                                    <label for="tue" class="mr-5" style="font-size: 15px;">화요일
	                                    <input type="radio" name="radio" id="tue">
	                                    <span class="checkbox mt-1"></span>
                                    </label>
                                    <label for="wed" class="mr-5" style="font-size: 15px;">수요일
	                                    <input type="radio" name="radio" id="wed">
	                                    <span class="checkbox mt-1"></span>
                                    </label>
                                    <label for="thu" class="mr-5" style="font-size: 15px;">목요일
	                                    <input type="radio" name="radio" id="thu">
	                                    <span class="checkbox mt-1"></span>
                                    </label>
                                    <label for="fri" class="mr-5" style="font-size: 15px;">금요일
	                                    <input type="radio" name="radio" id="fri">
	                                    <span class="checkbox mt-1"></span>
                                    </label>
                                    <label for="sat" class="mr-5" style="font-size: 15px;">토요일
	                                    <input type="radio" name="radio" id="sat">
	                                    <span class="checkbox mt-1"></span>
                                    </label>
                                    <label for="sun" class="mr-5" style="font-size: 15px;">일요일
	                                    <input type="radio" name="radio" id="sun">
	                                    <span class="checkbox mt-1"></span>
                                    </label>
                                </div>
                                <table class="table table-bordered" style="cursor: pointer;" id="availableTime">
                                	<tr>
										<th id=0 style="width:16.6%;">00:00 - 01:00</th>	                                
										<th id=1 style="width:16.6%;">01:00 - 02:00</th>	                                
										<th id=2 style="width:16.6%;">02:00 - 03:00</th>	                                
										<th id=3 style="width:16.6%;">03:00 - 04:00</th>	                                
										<th id=4 style="width:16.6%;">04:00 - 05:00</th>	                                
										<th id=5 style="width:16.6%;">05:00 - 06:00</th>	                                
                                	</tr>
                                	<tr>
										<th id=6>06:00 - 07:00</th>	                                
										<th id=7>07:00 - 08:00</th>	                                
										<th id=8>08:00 - 09:00</th>	                                
										<th id=9>09:00 - 10:00</th>	                                
										<th id=10>10:00 - 11:00</th>	                                
										<th id=11>11:00 - 12:00</th>	                                
                                	</tr>
                                	<tr>
										<th id=12>12:00 - 13:00</th>	                                
										<th id=13>13:00 - 14:00</th>	                                
										<th id=14>14:00 - 15:00</th>	                                
										<th id=15>15:00 - 16:00</th>	                                
										<th id=16>16:00 - 17:00</th>	                                
										<th id=17>17:00 - 18:00</th>	                                
                                	</tr>
                                	<tr>
										<th id=18>18:00 - 19:00</th>	                                
										<th id=19>19:00 - 20:00</th>	                                
										<th id=20>20:00 - 21:00</th>	                                
										<th id=21>21:00 - 22:00</th>	                                
										<th id=22>22:00 - 23:00</th>	                                
										<th id=23>23:00 - 24:00</th>	                                
                                	</tr>
                                </table>
                                <!-- <hr>
                                <h6>익일</h6>
                                <hr>
                                <table class="table table-bordered" style="cursor: pointer;" id="availableTime2">
                                	<tr>
										<th id=24 style="width:16.6%;">00:00 - 01:00</th>	                                
										<th id=25 style="width:16.6%;">01:00 - 02:00</th>	                                
										<th id=26 style="width:16.6%;">02:00 - 03:00</th>	                                
										<th id=27 style="width:16.6%;">03:00 - 04:00</th>	                                
										<th id=28 style="width:16.6%;">04:00 - 05:00</th>	                                
										<th id=29 style="width:16.6%;">05:00 - 06:00</th>	                                
                                	</tr>
                                	<tr>
										<th id=30>06:00 - 07:00</th>	                                
										<th id=31>07:00 - 08:00</th>	                                
										<th id=32>08:00 - 09:00</th>
									</tr>
                                </table> -->
                                <input type="hidden" name="day" value="" />
                               
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
		                        <span id="tags" class="btn p-0" style="cursor: pointer;"></span>
                            </div>
                            <div class="pf-feature-price">
                                <h4>가격 (시간당)<span class="text-danger">*</span></h4>
                                <div class="fp-inputs">
                                    <input id="hourlyPrice" name="hourlyPrice" type="number" placeholder="가격을 입력해주세요">원
                                </div>
                            </div>
                            <div class="pf-feature">
                                <h4>옵션선택</h4>
                                <input type="hidden" name="" />
                                <table class="table table-bordered" id="optionTb">
                                	<tr>
										<th id='OPTION1' style="width:25%;">TV/프로젝터</th>	                                
										<th id='OPTION2' style="width:25%;">인터넷/와이파이</th>	                                
										<th id='OPTION3' style="width:25%;">복사/인쇄기</th>	                                
										<th id='OPTION4' style="width:25%;">화이트보드</th>	                                
                                	</tr>       
                                	<tr>        
										<th id='OPTION5'>음향/마이크</th>	                                
										<th id='OPTION6'>취사시설</th>	                                
										<th id='OPTION7'>음식물반입가능</th>	                                
										<th id='OPTION8'>주류반입가능</th>	                                
                                	</tr>       
                                	<tr>        
										<th id='OPTION9'>샤워시설</th>	                                
										<th id='OPTION10'>주차</th>	                                
										<th id='OPTION11'>금연</th>	                                
										<th id='OPTION12'>반려동물 동반가능</th>	                                
                                	</tr>       
                                	<tr>        
										<th id='OPTION13'>PC/노트북</th>	                                
										<th id='OPTION14'>의자/테이블</th>	                                
										<th id='OPTION15'>내부화장실</th>	                                
										<th id='OPTION16'>탈의실</th>	                                
                                	</tr>       
                                	<tr>        
										<th id='OPTION17'>테라스/루프탑</th>	                                
										<th id='OPTION18'>공용라운지</th>	                                
										<th id='OPTION19'>전신거울</th>	                                
										<th id='OPTION20'>바베큐시설</th>	                                
                                	</tr>
                                </table>
                                <input type="hidden" name="optionNo" value="" />
                            </div>
                            <div class="pf-feature-image">
                                <h4>공간이미지<span class="text-danger">*</span></h4>
                                <div class="row"> 
	                                <div class="image-div">
		                                <i class="fas fa-plus"></i>
		                                <img id="preImage0" style="object-fit: cover;width: 100%;height: 200px;" />
		                            </div>
	                                <div class="image-div">
		                                <div>
		                                	<i class="fas fa-plus"></i>
		                                	<img id="preImage1" style="object-fit: cover;width: 100%;height: 200px;" />
		                                </div>
		                            </div>
	                                <div class="image-div">
		                                <div>
		                                	<i class="fas fa-plus"></i>
		                                	<img id="preImage2" style="object-fit: cover;width: 100%;height: 200px;" />
		                                </div>
		                            </div>
                                </div>
	                            <input type="file" name="upFile" class="upFile f0" />
	                            <input type="file" name="upFile" class="upFile f1" />
	                            <input type="file" name="upFile" class="upFile f2" />
                            </div>
                            <div class="pf-feature-price">
                                <h4>사업자등록번호<span class="text-danger">*</span></h4>
                                <div class="row">
	                                <div class="ml-3 mb-3" style="width:31%">
	                                    <input name="businessNo" id="businessNo" type="text" placeholder="사업자 번호를 입력해주세요">
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
									  <select name="bank" id="bank" style="height: 46px; width:100px; border-color:  #eaeaea;">
									    <option value="국민">국민</option>
									    <option value="우리">우리</option>
									    <option value="신한">신한</option>
									    <option value="기업">기업</option>
									  </select>
	                                <div class="ml-3 mb-3" style="width:31%">
	                                    <input name="account" id="account" type="text" placeholder="계좌번호를 입력해주세요">
	                                </div>
	                            </div>
		                        <span ></span>
                            </div>
                            <div class="pf-property-details" style="text-align: center;" >
                            	<p>* 공간등록 심사는 2일 ~ 7일 소요됩니다.</p>
                                <button type="submit" class="site-btn col-lg-3">공간등록</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Property Submit Section End -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 주소 script -->
<script>
	//주소검색
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

    $("#sample6_detailAddress").focus(function(){
    	if($("#sample6_postcode").val()==""){
        	alert("우편번호 주소검색을 먼저 해주세요.");
    		document.getElementById("sample6_postcode").focus();
        }
    });

  //주소 합치기
    $("#sample6_detailAddress").blur(function(){
    	$("[name=address]").val("우("+$("#sample6_postcode").val()+") "+$("#sample6_address").val()+" "+$("#sample6_extraAddress").val()+" "+$("#sample6_detailAddress").val());
    });
</script>

<!-- 전화번호script -->
<script>
$("#phone3").focus(function(){
   	if($("#phone1").val()==""){
   		document.getElementById("phone1").focus();
       }
});
//전화번호 합치기
$("#phone2").blur(function(){
	document.getElementById("phone3").focus();
});
$("#phone3").blur(function(){
	$("[name=spacePhone]").val($("#phone1").val()+$("#phone2").val()+$("#phone3").val());
});
</script>
<!-- 카테고리, 옵션 script -->
<script>
//카테고리테이블 클릭이벤트
$("#categoryTb th").on("click", function(){
	if($("#categoryTb th").hasClass("bg-primary"))
    	$("#categoryTb th").removeClass("bg-primary");

   	$(this).addClass("bg-primary");
   	//console.log($(this).attr("id"));
   	$("[name=categoryNo]").val($(this).attr("id"));
   	console.log($("[name=categoryNo]").val());
});
//옵션테이블 클릭이벤트
var optionArr = new Array();
$("#optionTb th").on("click", function(){
	var $option = $(this).attr("id");
	if($(this).hasClass("bg-primary")){
    	$(this).removeClass("bg-primary");
    	optionArr.splice(optionArr.indexOf($option),1);
	}
	else{
    	$(this).addClass("bg-primary");
    	optionArr.push($option);
	}
   	//console.log(optionArr);
   	var oStr='';
   	for(var i=0; i<optionArr.length; i++)
   	   	oStr += optionArr[i]+",";
   	   	
   	$("[name=optionNo]").val(oStr);
   	//console.log($("[name=optionNo]").val());
});
</script>

<!-- 시간선택 script -->
<script>
var dayTime = [
	{ day: 'mon', startHour: -1, endHour: -1},
	{ day: 'tue', startHour: -1, endHour: -1},
	{ day: 'wed', startHour: -1, endHour: -1},
	{ day: 'thu', startHour: -1, endHour: -1},
	{ day: 'fri', startHour: -1, endHour: -1},
	{ day: 'sat', startHour: -1, endHour: -1},	
	{ day: 'sun', startHour: -1, endHour: -1}	
];
var day;
var first;
var flag=0;
//요일 선택클릭 이벤트
$("#day input").on("click", function(){
	//배열 인덱스 찾기
	day = dayTime.findIndex(obj => obj.day == $(this).attr("id"));
	//console.log(day);
	//셀 색 지우기
	for(var i=0; i<33; i++)
		$("#"+i).removeClass("bg-primary");

	var s=dayTime[day].startHour;
	//요일에 맞춰 색채우기
	if(s == dayTime[day].endHour){
		flag=0;
		return;
	}
	if(s != 0 && dayTime[day].endHour==0){
		flag=1;
		$("#"+s).addClass("bg-primary");
		return;
	}
	flag=2;
	for(var i=s; i<=dayTime[day].endHour; i++)
		$("#"+i).addClass("bg-primary");
});
//가능시간 클릭이벤트
$("#availableTime th").on("click", function(){
	//요일선택
	if(day==null){
		alert("요일을 먼저 선택해주세요");
		return;
	}
	
	flag++;
	//초기화하기
	if(flag==3){
		flag=0;
		//배열값 초기화
		dayTime[day].startHour=-1;
		dayTime[day].endHour=-1;
		console.log(dayTime);
		//셀 색 지우기
		for(var i=0; i<33; i++)
    		$("#"+i).removeClass("bg-primary");
		return;
	};
	//연속선택
	if(flag==2){
		//선택한 셀의 아이디 찾기
		var last = Number($(this).attr("id"));

		//셀 색 바꾸기
		if(last == dayTime[day].startHour){
			$(this).removeClass("bg-primary");
			dayTime[day].startHour=-1;
			return;
		}
		if(last<first){
			var temp = first;
			first = last;
			last = temp;
		}

		//셀 값 배열에 넣기
		dayTime[day].startHour=first;
		dayTime[day].endHour=last;
		console.log(dayTime);
		
		for(var i=first; i<=last; i++)
			$("#"+i).addClass("bg-primary");
		return;
	};

	//선택한 셀의 아이디 찾기
	first = Number($(this).attr("id"));
	//셀 값 배열에 넣기
	dayTime[day].startHour=first;
	console.log(dayTime);
	//셀 색 바꾸기
    $(this).addClass("bg-primary");
});
</script>

<!-- 태그 script -->
<script>
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
			alert(data.hashTag);
			$("#tags").append("<span class='label label-success m-2 p-2'>#"+$('#tagName').val() +" X</span>"); 
			/* $("#tags").append("<span class='label label-success m-2 p-2 small'>#"+$('#tagName').val() +" X</span>");  */
	    	$("#tagName").val("");	
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
		});  
    }
});
//태그 삭제 클릭이벤트
/* $("#tags").on("click", function(){
   //내용작성하기 
}); */
</script>

<!-- 사업자등록 script -->
<script>
//사업자 등록정보 조회(중복조회)
$("#businessNo").keyup(function(){
	if(!/^[0-9]{10}$/.test($(this).val())){
		$("#duplicate").hide();
		$("#ok").hide();
		$("#error").show();
		$("#idValid").val(0);
		return;
	}
	 $.ajax({
		url : "${ pageContext.request.contextPath }/space/checkIdDuplicate.do",
		data : {
			businessNo : $(this).val()
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
<script>

//제출전처리
$("#spaceFrm").submit(function(){
	
	//빈칸이면 입력 요구
	if($("[name=spaceName]").val() == ""){
		alert("공간이름을 입력해주세요.");
		document.getElementById("spaceName").focus();
		return false;
	}
	if($("[name=content]").val() == ""){
		alert("공간설명을 입력해주세요.");
		document.getElementById("content").focus();
		return false;
	} 
	if($("#sample6_detailAddress").val() == ""){
		alert("주소를 입력해주세요.");
		document.getElementById("sample6_postcode").focus();
		return false;
	}
	if($("[name=spacePhone]").val() == ""){
		alert("전화번호를 입력해주세요.");
		document.getElementById("phone3").focus();
		return false;
	}
	if($("[name=spacePhone]").val().length > 11){
		alert("11자리까지 가능합니다. 전화번호를 확인해주세요");
		document.getElementById("phone3").focus();
		return false;
	}
	if($("[name=categoryNo]").val() == ""){
		alert("카테고리를 선택해주세요.");
		$('html, body').animate({scrollTop : $("#phone1").offset().top}, 100);
		return false;
	} 
	if($("[name=hourlyPrice]").val() == 0){
		alert("시간당 가격을 입력해주세요.");
		document.getElementById("hourlyPrice").focus();
		return false;
	} 
	if($("#idValid").val()!=1){
		alert("올바른 사업자번호를 입력하세요.");
		document.getElementById("businessNo").focus();
		return false;
	}
	if($("[name=account]").val() == ""){
		alert("계좌번호를 입력하세요.");
		document.getElementById("account").focus();
		return false;
	} 

	//시간배열 넣기
	var arr = ['월','화','수','목','금','토','일'];
	var str = "";
	for(var i=0; i<7; i++){
		str += arr[i]+ " : ";
		if(dayTime[i].startHour==dayTime[i].endHour)
			str += "없음";
		else
			str += dayTime[i].startHour + "시 ~ " +(dayTime[i].endHour+1) +"시 "; 
	}
	
	var result = confirm("요일별 선택된 시간이 맞으면 확인을 눌러주세요"+str);
	if(result){	
		$("[name=day]").val(JSON.stringify(dayTime));
	}else{
		$('html, body').animate({scrollTop : $("#time").offset().top}, 100);
	    return false;
	}

	return true;
});
//이미지 미리보기
$(function() {
    $(".upFile").on('change', function(){
        readURL(this);
    });
});
function readURL(input) {
	console.log($(input).hasClass('f0'));
    if (input.files && input.files[0] && $(input).hasClass('f0') ) {
       var reader = new FileReader();
       reader.onload = function (e) {
          $('#preImage0').siblings('i').removeClass(".fas fa-plus");
          $('#preImage0').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
    }
    if (input.files && input.files[0] && $(input).hasClass('f1') ) {
       var reader = new FileReader();
       reader.onload = function (e) {
          $('#preImage1').siblings('i').removeClass(".fas fa-plus");
          $('#preImage1').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
    }
    if (input.files && input.files[0] && $(input).hasClass('f2') ) {
       var reader = new FileReader();
       reader.onload = function (e) {
          $('#preImage2').siblings('i').removeClass(".fas fa-plus");
          $('#preImage2').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
    }
}

</script>
<script>$(function () { memberId();});</script>
<!-- 컨텐츠 끝 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
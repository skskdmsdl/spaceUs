<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%-- 한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/hostpageMenu.jsp" />

        <div class="page-wrapper">
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor ml-5">호스트 센터</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center mr-5">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">호스트 센터</a></li>
                                <li class="breadcrumb-item active">공간 정보</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- 회원정보 -->
                <div id="profileEditPage" class="ml-5 mr-5">
                    <div class="card p-5">
                       <div class="card-body">
                        <div class="row"> 
                         <div class="col-md-10">
                             <h5 class="card-title">공간 정보</h5>
                             <h6 class="card-subtitle mb-5">공간 정보를 확인하세요</h6>
                         </div>
	                    </div>
		    			<c:set var="space" value="${space}" scope="page"/> 
						 <table class="col-11">
							<tr>
								<th class="align-baseline">공간명</th>
								<th><input type="text" class="col-8 input-group-text mb-4 pull-right" value="${space.spaceName }" readonly /></th>
							</tr>
						    <tr>
						      <td class="align-baseline">공간 설명</td>
						      <td><textarea rows="5" cols="10"
						      			 class="col-8 mb-4 pull-right" readonly
						      	  		>${space.content}
						      	  </textarea>	 
						      </td>
							</tr>
							<tr>
						      <td class="align-baseline">전화번호</td>
						      <td><input type="text" class="col-8 input-group-text mb-4 pull-right" value="${space.spacePhone }" readonly /></td>
							</tr>
							<tr>
						      <td class="align-baseline">카테고리</td>
						      <td><input type="text" class="col-8 input-group-text mb-4 pull-right" value="${cateName}" readonly /></td>
							</tr>
						    <tr>
						      <td class="align-baseline">사업자 번호</td>
						      <td><input type="number" class="col-8 input-group-text mb-4 pull-right" value="${space.businessNo }" readonly/></td>
							</tr>
						    <tr>
						      <td class="align-baseline">주소</td>
						      <td><input type="text" class="col-8 input-group-text mb-4 pull-right" maxlength="11" value="${space.address }" readonly /></td>
							</tr>
						</table >
						
						<!-- 공간수정 -->
						<hr />
		                <div class="panel panel-default">
		                	<div class="panel-heading" role="tab">
								<a role="button" id="updateTitle" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false" style="color:#666;">
								공간 수정
								</a>
							</div>
							<div id="collapse1" class="panel-collapse collapse" role="tabpanel">
							  <h6 class="card-subtitle mt-3 mb-5">수정 가능 항목</h6>
							  <form:form name="spaceFrm" id="spaceFrm" 
									     action="${pageContext.request.contextPath}/host/updateSpace.do" 
									     method="post"
									     enctype="multipart/form-data">
							  		<table class="col-11">
										<tr>
										    <td class="align-baseline" style="width:25%;">옵션</td>
										    <td>
										    <table class="table table-bordered" id="optionTb">
			                                	<tr>
													<th id='OPTION1' style="width:25%;">TV/프로젝터</th>	                                
													<th id='OPTION2' style="width:25%;">인터넷/와이파이</th>	                                
													<th id='OPTION3' style="width:25%;">복사/인쇄기</th>	                                
			                                	</tr>       
			                                	<tr>        
													<th id='OPTION4'>화이트보드</th>	                                
													<th id='OPTION5'>음향/마이크</th>	                                
													<th id='OPTION6'>취사시설</th>	                                
			                                	</tr>       
			                                	<tr>        
													<th id='OPTION7'>음식물반입가능</th>	                                
													<th id='OPTION8'>주류반입가능</th>	                                
													<th id='OPTION9'>샤워시설</th>	                                
			                                	</tr>       
			                                	<tr>        
													<th id='OPTION10'>주차</th>	                                
													<th id='OPTION11'>금연</th>	                                
													<th id='OPTION12'>반려동물 동반가능</th>	                                
			                                	</tr>       
			                                	<tr>        
													<th id='OPTION13'>PC/노트북</th>	                                
													<th id='OPTION14'>의자/테이블</th>	                                
													<th id='OPTION15'>내부화장실</th>	                                
			                                	</tr>
			                                	<tr>
													<th id='OPTION16'>탈의실</th>	                                
													<th id='OPTION17'>테라스/루프탑</th>	                                
													<th id='OPTION18'>공용라운지</th>	                                
			                                	</tr>
			                                	<tr>
													<th id='OPTION19'>전신거울</th>	                                
													<th id='OPTION20'>바베큐시설</th>	                                
			                                	</tr>
			                                </table>
			                                <input type="hidden" name="optionNo" value="" />
			                                </td>
										</tr>
										<tr>
									    	<td class="align-baseline">가능시간</td>
									    	<td>
									    	
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
			                                <input type="hidden" name="day" value="" />
			                                </td>
										</tr>
									    <tr>
									      	<td class="align-baseline">공개여부</td>
									      	<td>
												<input type="radio" id="open" name="status" class="col-8 input-group-text ml-auto mb-5" value="O" style="display:inline;"
														<c:if test="${space.status eq 'O'}">checked</c:if>>
												<label for="open" style="display:inline;">공개</label><br> 
									      		<input type="radio" id="close" name="status" class="col-8 input-group-text ml-auto mb-5" value="C" style="display:inline;"
									      				<c:if test="${space.status eq 'C'}">checked</c:if>/>
									      		<label for="close" style="display:inline;">비공개</label><br>
									      	</td>
										</tr>
										<tr>
											<td></td>
											<td>
												<input type="hidden" name="spaceNo" value="${space.spaceNo}" />
												<div class="mt-5 pull-right">
												    <input type="submit" class="btn btn-outline-success btn-lg p-3 pl-4 pr-4" value="정보 수정">&nbsp;
												    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="btn btn-outline-secondary btn-lg p-3 pl-4 pr-4">취소</a>
												</div>
											</td>
										</tr>
									</table>
							  </form:form>
					  		</div>
						</div>
						  
						  <!-- 공간삭제 -->
						  <hr />
			                <div class="panel panel-default">
								<div class="panel-heading" role="tab">
									<a role="button" id="deleteTitle" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false" style="color:#666;">
									공간삭제
									</a>
								</div>
								<div id="collapse2" class="panel-collapse collapse mr-5" role="tabpanel">
									<br/>
									<div class="panel-body">삭제하시면 모든 정보가 삭제됩니다.<br/>정말로 삭제하시겠습니까?</div>
									<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="btn btn-outline-secondary font-bold mr-3 pull-right">취소</a>
									<button id="deleteBtn" class="btn btn-danger font-bold mr-2 pull-right">삭제</button>
									<form action="${pageContext.request.contextPath }/space/deleteSpace.do" id="deleteFrm">
										<input type="hidden" name="spaceNo" value="${space.spaceNo}"/>
									</form>
								</div>
							</div>
	                   </div>
	               </div>
	           </div>

                <!-- 회원정보 끝 -->
    </div>
</div>
</div>
</div>

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
var optionArr = new Array();
$(function(){
	/* 기존 옵션 */
	<c:forEach items="${optionList}" var="option">
		var str = "${option.optionNO}";
		//console.log(str);
		$("#"+str).addClass("bg-primary");
		optionArr.push(str);
	</c:forEach>

	var oStr='';
   	for(var i=0; i<optionArr.length; i++)
   	   	oStr += optionArr[i]+",";
   	   	
   	$("[name=optionNo]").val(oStr);
   	//console.log($("[name=optionNo]").val());
   	//console.log($("[name=status]").val());

   	/* 기존 시간 */
   	<c:forEach items="${revAvail}" var="rev">
		var index = dayTime.findIndex(obj => obj.day == "${rev.day}");
		console.log(index);
		dayTime[index].startHour = ${rev.startHour};
		dayTime[index].endHour = ${rev.endHour};
		
	</c:forEach>

	document.getElementById('mon').checked = true;
	day=0;
	
	//셀 색 지우기
	for(var i=0; i<33; i++)
		$("#"+i).removeClass("bg-primary");

	var s=dayTime[0].startHour;
	//요일에 맞춰 색채우기
	if(s == dayTime[0].endHour){
		flag=0;
		return;
	}
	if(s != -1 && dayTime[0].endHour==-1){
		flag=1;
		$("#"+s).addClass("bg-primary");
		return;
	}
	flag=2;
	for(var i=s; i<=dayTime[0].endHour; i++)
		$("#"+i).addClass("bg-primary");

	//console.log($("[name=optionNo]").val());
	//console.log($("[name=status]").val());
	
});
</script>

<!-- option -->
<script>
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
	if(s != -1 && dayTime[day].endHour==-1){
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
		swal("요일을 먼저 선택해주세요");
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

<script>
//제출전처리
$("#spaceFrm").submit(function(){
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
	    return false;
	}

	return true;
});
</script>

<script>
//탈퇴
$("#deleteBtn").click(function(){
	 if(!confirm("정말로 공간을 삭제하시겠습니까?")) return;
	 $("#deleteFrm").submit();
});
</script>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/jquery/jquery-3.2.1.min.js"></script>
<!-- Bootstrap popper Core JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/popper/popper.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/js/perfect-scrollbar.jquery.min.js"></script>
<!--Wave Effects -->
<script src="${ pageContext.request.contextPath }/resources/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${ pageContext.request.contextPath }/resources/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/js/custom.min.js"></script>
<!-- ============================================================== -->
<!-- This page plugins -->
<!-- ============================================================== -->
<!--morris JavaScript -->


	

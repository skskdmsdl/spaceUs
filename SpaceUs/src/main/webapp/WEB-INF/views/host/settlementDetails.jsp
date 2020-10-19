<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- 한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
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
                                <li class="breadcrumb-item active">정산 내역</li>
                            </ol>
                        </div>
                    </div>
                </div>

            	<div class="ml-5 mr-5">
	           		<div class="card p-5">
	           			 <div class="card-body-wrapper">
							<div class="btn-group">
							
							<form id="form1" name="form1" method="post" enctype="multipart/form-data">
							    <input type="file" id="fileInput" name="fileInput">
							    <button type="button" onclick="doExcelUploadProcess()">엑셀업로드 작업</button>
							    <button type="button" onclick="doExcelDownloadProcess()">엑셀다운로드 작업</button>
							</form>
							<div id="result">
							</div>
								   <sec:authorize access="hasRole('HOST')"> 
								  <form:form id="excelForm" name="excelForm" method="post" action="${pageContext.request.contextPath }/host/excelDown.do" enctype="multipart/form-data">
									  <button id="file-download" name="hostId" type="submit" class="btn btn-primary alig-right" value="${loginMember.principal.memberEmail}">
									  	정산내역 다운받기(.xlsx)
									  </button>
								  </form:form>	
								  </sec:authorize>	
								<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Dropdown button
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="#">Action</a>
    <a class="dropdown-item" href="#">Another action</a>
    <a class="dropdown-item" href="#">Something else here</a>
  </div>
</div>				 
							</div>
						 </div>

	           			 	<div class="card-body">
			                	<h5 class=" mb-1">일간 정산 내역</h5>
			                	<table class="table table-hover">
			                	   <thead class="thead-dark">
				                	   <tr>
				                		<th scope="col">공간 번호</th>
				                		<th scope="col">날짜</th>
				                		<th scope="col">일 이용시간</th>
				                		<th scope="col">일매출</th>
				                	   </tr>
			                	   </thead>
			                	   <tbody>
				                	   <tr>
				                		<th scope="row">S1001</th>
				                		<td>2020/09/20</td>
				                		<td>3</td>
				                		<td>120,000</td>
				                	   </tr>
				                	   <tr>
				                		<th scope="row">S1001</th>
				                		<td>2020/09/21</td>
				                		<td>2</td>
				                		<td>80,000</td>
				                	   </tr>					                   
				                  </tbody>               		
			                	</table>
		                	</div>
	           				<div class="card-body">
	            				<h5 class="card-title">
	            				월간 매출 추이 
	            				</h5>
				 		 	</div>
						 	<canvas id="bar-chart">차트가 들어갈 자리</canvas>
						</div>
	 				</div>
 				</div>
<!--                 <div class="ml-5 mr-5">
                    <div class="card p-5">
                        <div class="card-body">
                            <div class="col-md-10">
                                <h5 class="card-title ">정산 내역</h5>
                                <div class="ml-auto">
                                    <ul class="list-inline font-12">
                                        <li><i class="fa fa-circle text-info"></i> Iphone</li>
                                        <li><i class="fa fa-circle text-primary"></i> Ipad</li>
                                    </ul>
                                </div>
                            </div>
                            <div id="morris-area-chart" style="height: 350px;"></div>
                        </div>
                        <div class="card-body bg-light">
                            <div class="row text-center m-b-20">
                                <div class="col-lg-4 col-md-4 m-t-20">
                                    <h2 class="m-b-0 font-light">6000</h2><span class="text-muted">Total sale</span>
                                </div>
                                <div class="col-lg-4 col-md-4 m-t-20">
                                    <h2 class="m-b-0 font-light">4000</h2><span class="text-muted">Iphone</span>
                                </div>
                                <div class="col-lg-4 col-md-4 m-t-20">
                                    <h2 class="m-b-0 font-light">2000</h2><span class="text-muted">Ipad</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
    </div>
</div>
</div>
	<script>
	
/*   	function download(){
		$("#file-download").attr("action", 
		"${ pageContext.request.contextPath}/host/excelDown.do")
		.attr("method", "POST")
		.submit();	
	} */

	let canvas = document.getElementById("bar-chart").getContext('2d');
	let ylabel= [0,0,0,0,0,9,9,9,9,9,10,10];
	let xdata = [1,2,3,4,5,6,7,8,9,10,11,12];

	let barChart = new Chart(canvas, {
		type:'bar',
		data: {labels: ylabel,
	    	datasets:[{
	    		label: "2020",
	    		backgroundColor: '#fe7096',
	    		borderColor: '#58c5ed',
	    		data: xdata,
	    	}]
	    	
	    },
	     options: {
	         title: {
	             text: "월간 매출 추이",
	             display: true
	         }
	     }
	 }); 

    function doExcelUploadProcess(){
        var f = new FormData(document.getElementById('form1'));
        $.ajax({
            url: "uploadExcelFile",
            data: f,
            processData: false,
            contentType: false,
            type: "POST",
            success: function(data){
                console.log(data);
                document.getElementById('result').innerHTML = JSON.stringify(data);
            }
        })
    } 
    
    function doExcelDownloadProcess(){
        var f = document.form1;
        f.action = "downloadExcelFile";
        f.submit();
    }
    
</script>


<script src="${pageContext.request.contextPath }/resources/js/Chart.js"></script>
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

<!-- loader -->
<%--   <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  <script src="${pageContext.request.contextPath }/resources/js/aos.js"></script>
  <script src="${ pageContext.request.contextPath }/resources/assets/node_modules/raphael/raphael-min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/morrisjs/morris.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/jquery-sparkline/jquery.sparkline.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/d3/d3.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/node_modules/c3-master/c3.min.js"></script>
  
<!--c3 JavaScript -->

<!-- Chart JS -->
  <script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery-migrate-3.0.1.min.js"></script> --%>
  <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<%--   <script src="${pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/scrollax.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>  --%>

  </body>

</html>
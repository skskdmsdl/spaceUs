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
<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp" />


        <div class="page-wrapper">
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor ml-5">마이페이지</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center mr-5">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">마이페이지</a></li>
                                <li class="breadcrumb-item active">출석이벤트</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="memberEmail" value="<sec:authentication property="principal.username"/>"/>
                
                <!-- 출석이벤트 달력 -->
                <div id="calendar">
				    <div id="calendar_header">
				    	<i class="icon-chevron-left"></i>          
					    <h1></h1>
					    <i class="icon-chevron-right"></i>         
				    </div>
				    <div id="calendar_weekdays"></div>
				    <div id="calendar_content"></div>
			    </div>
                <!-- 달력끝 -->
    </div>
</div>
</div>
</div>


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

<script>

<!-- 출석이벤트  -->
$(function(){
	function c(){
		p();
		var e=h();
		var r=0;
		var u=false;
		l.empty();
		while(!u){
			if(s[r]==e[0].weekday){u=true
			}else{
				l.append('<div class="blank"></div>');
				r++
			}
		}
		for(var c=0;c<42-r;c++){
			if(c>=e.length){
				l.append('<div class="blank"></div>')
			}else{
				var v=e[c].day;
				if(${member.today} != 0){
					var m=g(new Date(t,n-1,v))?'<div class="today"><i class="fa fa-check"></i>':"<div>";
				}else{ 
					var m=g(new Date(t,n-1,v))?'<div class="today">':"<div>";
				 } 
				l.append(m+""+v+"</div>")
			}
		}
		var y=o[n-1];
		a.css("background-color",y).find("h1").text(i[n-1]+" "+t);
		f.find("div").css("color",y);
		l.find(".today").css("background-color",y);
		d()
	}
	function h(){
		var e=[];
		for(var r=1;r<v(t,n)+1;r++){
			e.push({day:r,weekday:s[m(t,n,r)]})
		}
		return e
	}
	function p(){
		f.empty();
		for(var e=0;e<7;e++){
			f.append("<div>"+s[e].substring(0,3)+"</div>")}
	}
	function d(){
		var t;
		var n=$("#calendar").css("width",e+"px");
		n.find(t="#calendar_weekdays, #calendar_content").css("width",e+"px").find("div").css({width:e/7+"px",height:e/7+"px","line-height":e/7+"px"});
		n.find("#calendar_header").css({height:e*(1/7)+"px"}).find('i[class^="icon-chevron"]').css("line-height",e*(1/7)+"px")
	}
	function v(e,t){
		return(new Date(e,t,0)).getDate()
	}
	function m(e,t,n){
		return(new Date(e,t-1,n)).getDay()
	}
	function g(e){
		return y(new Date)==y(e)
	}
	function y(e){
		return e.getFullYear()+"/"+(e.getMonth()+1)+"/"+e.getDate()
	}
	function b(){
		var e=new Date;
		t=e.getFullYear();
		n=e.getMonth()+1
	}
	var e=480;
	var t=2013;
	var n=9;
	var r=[];
	var i=["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"];
	var s=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
	var o=["#16a085","#1abc9c","#c0392b","#27ae60","#FF6860","#f39c12","#f1c40f","#e67e22","#2ecc71","#e74c3c","#d35400","#2c3e50"];
	var u=$("#calendar");
	var a=u.find("#calendar_header");
	var f=u.find("#calendar_weekdays");
	var l=u.find("#calendar_content");
	b();
	c();
	a.find('i[class^="icon-chevron"]').on("click",function(){
		var e=$(this);
		var r=function(e){
			n=e=="next"?n+1:n-1;
			if(n<1){n=12;t--
			}else if(n>12){n=1;t++}c()
		};
		if(e.attr("class").indexOf("left")!=-1){
			r("previous")
		}else{
			r("next")
		}
	})
});
//클릭이벤트 
$("#calendar_content").css("cursor", "pointer");
$("#calendar_content").click(function(){
	if(${member.today} != 0){
		alert('이미 출석하셨습니다.');
		return;
	}
	$.ajax({
		url : "${ pageContext.request.contextPath }/member/insertStamp.do",
		data : {
			memberEmail : $("#memberEmail").val()
		},
		dataType : "json",
		success : function(data){
			alert("출석확인 되었습니다!");
			location.reload();
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	}); 
})
</script>
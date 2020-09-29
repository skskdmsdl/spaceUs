<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>SpaceUs</title>
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<!-- bootstrap js: jquery load 이후에 작성할것.-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 4 admin, bootstrap 4, css3 dashboard, bootstrap 4 dashboard, AdminWrap lite admin bootstrap 4 dashboard, frontend, responsive bootstrap 4 admin template, Elegant admin lite design, Elegant admin lite dashboard bootstrap 4 dashboard template">
    <meta name="description" content="Elegant Admin Lite Free Version is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    

    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.request.contextPath }/assets/images/favicon.png">
    <!-- This page CSS -->
    <!-- chartist CSS -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/assets/node_modules/morrisjs/morris.css">
    <!--c3 plugins CSS -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/assets/node_modules/c3-master/c3.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/dist/css/style.css">
    <!-- Dashboard 1 Page CSS -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link rel="canonical" href="https://www.wrappixel.com/templates/elegant-admin-lite/" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css">


    <!-- icons -->
    <script src="https://kit.fontawesome.com/b74a25ff1b.js" crossorigin="anonymous"></script>

    <!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
   <script src="${pageContext.request.contextPath }/resources/js/aos.js"></script>  
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    
  <!-- loader -->
  <%-- <script src="${pageContext.request.contextPath }/resources/https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath }/resources/js/google-map.js"></script> --%>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script>
	<!-- RedirectAttributes에 등록된 msg값 존재여부 확인 후 출력 -->
	<c:if test="${ not empty msg }">
		alert('${ msg }');	
	</c:if>
	<c:if test="${ not empty script }">
		self.close();	
	</c:if>
</script>
<!-- <script>
/* talkJS */
(function(t,a,l,k,j,s){
s=a.createElement('script');s.async=1;s.src="https://cdn.talkjs.com/talk.js";a.head.appendChild(s)
;k=t.Promise;t.Talk={v:3,ready:{then:function(f){if(k)return new k(function(r,e){l.push([f,r,e])});l
.push([f])},catch:function(){return k&&new k()},c:l}};})(window,document,[]);


Talk.ready.then(function() {
let user = ${loginMember};
let userName = user.equals('관리자') ? '상담사' : '유저' ;
    var me = new Talk.User({
        id: user,
        name: userName,
        email: user,
        photoUrl: "http://localhost:9090/spaceus/",
        welcomeMessage: "대화를 시작하세요 :-)"
    });
    window.talkSession = new Talk.Session({
        appId: "t9ROalbH",
        me: me
    });
    var other = new Talk.User({
        id: "관리자",
        name: "상담사",
        email: "admin@spaceus.com",
        photoUrl: "http://localhost:9090/spaceus/",
        welcomeMessage: "무엇을 도와드릴까요?"
    });

    var conversation = talkSession.getOrCreateConversation(Talk.oneOnOneId(me, other))
    conversation.setParticipant(me);
    conversation.setParticipant(other);

    if(user.equals('관리자')){
	    var inbox = talkSession.createInbox({selected: conversation});
	    inbox.mount(document.getElementById("talkjs-container"));
    }
    else{

        var conversation = window.talkSession.getOrCreateConversation(Talk.oneOnOneId(me, other));
        conversation.setParticipant(me);
        conversation.setParticipant(other);
        var popup = window.talkSession.createPopup(conversation, { keepOpen: false });
        popup.mount({ show: false });

        var button = document.getElementById("btn-getInTouch");
        button.addEventListener("click", function(event) {
            event.preventDefault();
            popup.show();
        });
    }
});

var other = new Talk.User({
	 id: user,
     name: userName,
     email: user,
     photoUrl: "http://localhost:9090/spaceus/",
     welcomeMessage: "무엇을 도와드릴까요?"
});

var conversation = talkSession.getOrCreateConversation(Talk.oneOnOneId(me, other));
conversation.setParticipant(me);
conversation.setParticipant(other);

var conversation = talkSession.getOrCreateConversation(user);

conversation.setAttributes({
    subject: "Hair Wax 5 Gallons"
}); 
</script> -->
  </head>
  
  <body>
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light">
	    <div class="container">
	      <a class="navbar-brand" href="${pageContext.request.contextPath }">SpaceUs</a>
	      <button class="navbar-toggler" type="button">
	        <span class="oi oi-menu"></span>
	      </button>
	      
	      <sec:authorize access="isAnonymous()">
	      
		      <div class="collapse navbar-collapse">
		        <ul class="navbar-nav ml-auto">
		          <li class="nav-item"><a href="${pageContext.request.contextPath }/exhibition/exhibition.do" class="nav-link">기획전</a></li>
		          <li class="nav-item"><a href="${pageContext.request.contextPath }/space/insertSpace.do" class="nav-link">공간 등록하기</a></li>
		          <li class="nav-item"><a href="${pageContext.request.contextPath }/community/group/groupList.do" class="nav-link">커뮤니티</a></li>
		          <li class="nav-item"><a href="${pageContext.request.contextPath }/member/memberLoginForm.do" class="nav-link">로그인</a></li>
		          <li class="nav-item"><a href="${pageContext.request.contextPath }/member/memberEnrollForm.do" class="nav-link">회원가입</a></li>
		        </ul>
		      </div>
	      </sec:authorize>
	      
		  <sec:authorize access="hasRole('ROLE_HOST')">
		  <div class="collapse navbar-collapse" id="ftco-nav">
        	 <ul class="navbar-nav ml-auto">

		  	  <li class="nav-item"><a href="${pageContext.request.contextPath }/host/spaceInfo.do" class="nav-link">호스트 센터</a></li>
		      <li class="nav-item"><a href="${pageContext.request.contextPath }/community/group/groupList.do" class="nav-link">커뮤니티</a></li>
		      <li class="nav-item"><a href="${pageContext.request.contextPath }/exhibition/exhibition.do" class="nav-link">기획전</a></li>
		      
			  <div class="align-self-center navbar-nav ml-3" style="cursor: pointer !important;">
	        		<div data-toggle="modal" data-target="#exampleModal">
			        	<div style="display: inline-block;">반갑습니다. &nbsp;</div>
	        			<sec:authentication property="principal.nickName"/> 님!
	        		</div>
	          </div>  	 
		  	</ul>
		  </div>
		  </sec:authorize>
	      <sec:authorize access="hasAnyRole('USER','ADMIN')">
	        <div class="collapse navbar-collapse" id="ftco-nav">
        	 <ul class="navbar-nav ml-auto">
		          <li class="nav-item"><a href="${pageContext.request.contextPath }/exhibition/exhibition.do" class="nav-link">기획전</a></li>
		          <li class="nav-item"><a href="${pageContext.request.contextPath }/space/insertSpace.do" class="nav-link">공간 등록하기</a></li>
		          <li class="nav-item"><a href="${pageContext.request.contextPath }/community/group/groupList.do" class="nav-link">커뮤니티</a></li>
		   
	        	  <div class="align-self-center navbar-nav ml-3" style="cursor: pointer !important;">
	        		<div  data-toggle="modal" data-target="#exampleModal">
		        		<div style="display: inline-block;">반갑습니다. &nbsp;</div>
	        			<sec:authentication property="principal.nickName"/> 님!
	        		</div>
	        	  </div>
	          </ul>
	        </div>
		  </sec:authorize>
		      </div> 
	  </nav>
	 
	
    <!-- END nav -->
    
    <!-- user 권한 -->
    <!-- Modal -->
     <%-- <sec:authorize access="isAuthenticated()"> --%>
     <div class="fade modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-auto" role="document">
	    <div class="modal-content"  style="background:#625c55; border-radius: 1.3em; left:36rem; top:3rem; width:55%; ">
	      <div class="modal-header" style="background: #30D795; border-radius: 1.3em;">
	        <h5 class="modal-title" id="exampleModalLabel">
	        	<div data-toggle="modal" data-target="#exampleModal">
		        	<img src="https://resource.miricanvas.com/image/common/profile_argo.svg" style="background: #22B47B; border-right: 0; border-radius: 90%; width: 40px;  height: 40px;">
	        		<sec:authentication property="principal.nickName"/>님
	        	</div>
	        </h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<div class="col-sm-10 mb-2">
	    	    <a href="${pageContext.request.contextPath }/member/memberProfile.do">
	    	            👩🏻 회원정보
	    	    </a>
	      	</div>
	      	<div class="col-sm-10 mb-2">
		        <a href="${pageContext.request.contextPath }/member/usageHistory.do">
		           🧭 나의 예약내역
		        </a>
	      	 </div>
	      	 <div class="col-sm-10 mb-2">
		        <a href="${pageContext.request.contextPath }/member/wishList.do">
		         	 💚  위시리스트
		        </a>
	      	 </div>
	      </div>
	      <div class="modal-footer">
	      	 <form:form action="${ pageContext.request.contextPath }/member/memberLogout.do">
	      	 	 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">로그아웃</button>
	      	 </form:form>
	      </div>
	    </div>
	  </div>
	</div>
     
     <sec:authorize access="hasAnyRole('USER', 'HOST')">
	<div class="fade modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-auto" role="document">
	    <div class="modal-content"  style="background:#625c55; border-radius: 1.3em; left:36rem; top:3rem; width:55%; ">
	      <div class="modal-header" style="background: #30D795; border-radius: 1.3em;">
	        <h5 class="modal-title" id="exampleModalLabel">
	        	<div data-toggle="modal" data-target="#exampleModal">
		        	<img src="https://resource.miricanvas.com/image/common/profile_argo.svg" style="background: #22B47B; border-right: 0; border-radius: 90%; width: 40px;  height: 40px;">
	        		<sec:authentication property="principal.nickName"/>님
	        	</div>
	        </h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<div class="col-sm-10 mb-2">
	    	    <a href="${pageContext.request.contextPath }/member/memberProfile.do">
	    	            👩🏻 회원정보
	    	    </a>
	      	</div>
	      <%-- 	<div class="col-sm-10 mb-2">
	    	    <a href="${pageContext.request.contextPath }/space/insertSpace.do">
	    	            💒 공간 등록 
	    	    </a>
	      	</div> --%>
	      	<div class="col-sm-10 mb-2">
		        <a href="${pageContext.request.contextPath }/member/usageHistory.do">
		           🧭 나의 예약내역
		        </a>
	      	 </div>
	      	 <div class="col-sm-10 mb-2">
		        <a href="${pageContext.request.contextPath }/member/wishList.do">
		         	 💚  위시리스트
		        </a>
	      	 </div>
	      	 <!-- admin 권한 -->
	      	 <sec:authorize access="hasRole('ROLE_ADMIN')">
	      	 	<div class="col-sm-10 mb-2">
		        <a href="${pageContext.request.contextPath }/admin/memberManage.do">
		         	 👨‍👨‍👧‍👧	 SpaceUs 관리       
		        </a>
	      	    </div>
	      	 </sec:authorize>
	      	 <!-- admin 권한 끝 -->
	      </div>
	      <div class="modal-footer">
	      	 <form:form action="${ pageContext.request.contextPath }/member/memberLogout.do">
	      	 	 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">로그아웃</button>
	      	 </form:form>
	      </div>
	    </div>
	  </div>
	</div>
	</sec:authorize>
	<!-- /user 권한 -->
	
<!-- admin 권한 -->	
<sec:authorize access="hasRole('ADMIN')">
	<div class="fade modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-auto" role="document">
	    <div class="modal-content"  style="background:#625c55; border-radius: 1.3em; left:36rem; top:3rem; width:55%; ">
	      <div class="modal-header" style="background: #30D795; border-radius: 1.3em;">
	        <h5 class="modal-title" id="exampleModalLabel">
	        	<div>
		        	<img src="https://resource.miricanvas.com/image/common/profile_argo.svg" style="background: #22B47B; border-right: 0; border-radius: 90%; width: 40px;  height: 40px;">
	        		<sec:authentication property="principal.nickName"/>님
	        	</div>
	        </h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<div class="col-sm-10 mb-2">
	    	    <a href="${pageContext.request.contextPath }/member/memberProfile.do">
	    	            👩🏻 마이 프로필
	    	    </a>
	      	</div>
	      	<div class="col-sm-10 mb-2">
	    	    <a href="${pageContext.request.contextPath }/space/insertSpace.do">
	    	            💒 공간 등록 
	    	    </a>
	      	</div>
	      <%-- 	<div class="col-sm-10 mb-2">
		        <a href="${pageContext.request.contextPath }/member/usageHistory.do">
		           🧭 예약관리
		        </a>
	      	 </div>
	      	 <div class="col-sm-10 mb-2">
		        <a href="${pageContext.request.contextPath }/member/wishList.do">
		         	 ❤   위시리스트
		        </a>
	      	 </div> --%>
      	 	<div class="col-sm-10 mb-2">
		        <a href="${pageContext.request.contextPath }/admin/memberManage.do">
		         	 👨‍👨‍👧‍👧	 SpaceUs 관리       
		        </a>
	      	 </div>
	      </div>
	      <div class="modal-footer">
	      	 <form:form action="${ pageContext.request.contextPath }/member/memberLogout.do">
	      	 	 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">로그아웃</button>
	      	 </form:form>
	      </div>
	    </div>
	  </div>
	</div>

	</sec:authorize>
	<!-- /admin 권한 끝 -->
<!-- <div id="talkjs-container" style="right:30px;">
	<i>Loading chat...</i>
</div>	 -->

	
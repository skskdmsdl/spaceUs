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
<%-- <jsp:include page="/WEB-INF/views/common/myPageHeader.jsp" /> --%>
<!-- <script>
let userName =${member.nickName =='admin'?'상담사':'회원'};
/* talkJS */
(function(t,a,l,k,j,s){
s=a.createElement('script');s.async=1;s.src="https://cdn.talkjs.com/talk.js";a.head.appendChild(s)
;k=t.Promise;t.Talk={v:3,ready:{then:function(f){if(k)return new k(function(r,e){l.push([f,r,e])});l
.push([f])},catch:function(){return k&&new k()},c:l}};})(window,document,[]);

Talk.ready.then(function() {
    var me = new Talk.User({
        id: ${member.nickName},
        name: userName,
        email: ${member.nickName},
        photoUrl: "http://localhost:9090/spaceus/",
        welcomeMessage: "대화를 시작하세요 :-)"
    });
    window.talkSession = new Talk.Session({
        appId: "t9ROalbH",
        me: me
    });
    var other = new Talk.User({
        id: "admin",
        name: "상담사",
        email: "admin@spaceus.com",
        photoUrl: "http://localhost:9090/spaceus/",
        welcomeMessage: "무엇을 도와드릴까요?"
    });

    var conversation = talkSession.getOrCreateConversation(Talk.oneOnOneId(me, other))
    conversation.setParticipant(me);
    conversation.setParticipant(other);

    if(${member.nickName == 'admin'}){
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
	 id: ${member.nickName},
     name: userName,
     email: ${member.nickName},
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
 
</script>  --> 
<script>
(function(t,a,l,k,j,s){
s=a.createElement('script');s.async=1;s.src="https://cdn.talkjs.com/talk.js";a.head.appendChild(s)
;k=t.Promise;t.Talk={v:3,ready:{then:function(f){if(k)return new k(function(r,e){l.push([f,r,e])});l
.push([f])},catch:function(){return k&&new k()},c:l}};})(window,document,[]);
</script>


<input type="hidden" id="nick" value="${member.nickName}" />
<input type="hidden" id="mail" value="${member.memberEmail}" />
<input type="hidden" id="result" value="${member.nickName =='관리자'?'SpaceUs':'회원'}" />
<script>

Talk.ready.then(function() {
    var me = new Talk.User({
        id: $("#nick").val(),
        name: $("#nick").val(),
        email: $("#mail").val(),
        photoUrl: "https://localhost:9090/spaceus/",
        welcomeMessage: "Hey there! How are you? :-)"
    });
    window.talkSession = new Talk.Session({
        appId: "t9ROalbH",
        me: me
    });
    var other = new Talk.User({
        id: "관리자",
        name: "SpaceUs",
        email: "admin@spaceus.com",
        photoUrl: "https://localhost:9090/spaceus/",
        welcomeMessage: "Hey, how can I help?"
    });

    var conversation = talkSession.getOrCreateConversation(Talk.oneOnOneId(me, other))
    conversation.setParticipant(me);
    conversation.setParticipant(other);


    if($("#nick").val() == '관리자'){
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
	 id: $("#nick").val(),
    name: $("#result").val(),
    email: $("#mail").val(),
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
</script>
<div class="skin-default-dark fixed-layout">
    <div id="main-wrapper">
        <!-- 마이페이지 헤더 -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header">
                    <a style="color:black" class="navbar-brand" href="${pageContext.request.contextPath }">SpaceUs</a>
                </div>
                <div class="navbar-collapse">
                    
                   <!-- <ul class="navbar-nav my-lg-0">
                       <li class="nav-item dropdown">
                           <a id="logout" class="m-r-30">로그아웃</a>
                       </li>
                   </ul> -->
               </div>
            </nav>
        </header>
        
        <!-- 왼쪽 목록들 -->
        <aside class="left-sidebar">
            <div class="d-flex no-block nav-text-box align-items-center">
                <span>마이페이지</span>
                <a class="waves-effect waves-dark ml-auto hidden-sm-down" href="javascript:void(0)"><i class="ti-menu"></i></a>
                <a class="nav-toggler waves-effect waves-dark ml-auto hidden-sm-up" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
            </div>
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
 					<ul id="sidebarnav">
                        <sec:authorize access="hasAnyRole('USER', 'HOST')">
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/memberProfile.do"><i class="fa fa-user"></i><span class="hide-menu">회원정보</span></a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/wishList.do"><i class="fa fa-heart"></i><span class="hide-menu">위시리스트</span></a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/usageHistory.do"><i class="fa fa-table"></i><span class="hide-menu"></span>나의 예약내역</a></li>
  						<li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/reviewList.do"><i class="fa fa-book"></i><span class="hide-menu">내가 쓴 글 리스트</span></a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/couponList.do"><i class="fa fa-gift"></i><span class="hide-menu"></span>쿠폰함</a></li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false" href="${pageContext.request.contextPath }/member/stampEvent.do"><i class="fa fa-stamp"></i><span class="hide-menu"></span>출석체크</a></li>
                        </sec:authorize>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- 목록 끝 -->

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
                                <li class="breadcrumb-item active">내 정보관리</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- 회원정보 -->
                <!-- 채팅 -->
			 <div id="talkjs-container" style="background-color: rgba(0,0,0,0);margin-left: 300px; height: 500px; position: fixed; z-index: 10;box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px; display:none;">
			    <i>Loading chat...</i>
			</div> 
			 <sec:authorize access="hasAnyRole('ADMIN')">
			<div>
				<button id="chatBtn">🧑</button>
			</div>
			</sec:authorize>
                <div id="profileEditPage" class="ml-5 mr-5">
                    <div class="card p-5">
                       <div class="card-body">
                        <div class="row"> 
                         <div class="col-md-10">
                             <h5 class="card-title">나의 정보</h5>
                             <h6 class="card-subtitle mb-5">회원정보를 확인하세요</h6>
                         </div>
	                    </div>
						 <table class="col-11">
							<tr>
								<th class="align-baseline">닉네임</th>
								<th><input type="text" class="col-8 input-group-text mb-4 mr-5 pull-right" value="<sec:authentication property="principal.nickName"/>" required /></th>
							</tr>
						    <tr>
						      <td class="align-baseline">이메일 계정</td>
						      <td><input type="email" class="col-8 input-group-text mb-4 mr-5 pull-right" value="<sec:authentication property="principal.username"/>" required /></td>
							</tr>
						    <tr>
						      <td class="align-baseline">생일</td>
						      <td><input type="date" class="col-8 input-group-text mb-4 mr-5 pull-right" value="<sec:authentication property="principal.birthDay"/>"/></td>
							</tr>
						    <tr>
						      <td class="align-baseline">핸드폰</td>
						      <td><input type="tel" class="col-8 input-group-text mb-4 mr-5 pull-right" maxlength="11" value="<sec:authentication property="principal.memberPhone"/>" required /></td>
							</tr>
						</table >
						  <div class="mt-5" style="border-top: 1px solid #bbbbbb" ></div>
						  <h6 class="card-subtitle mt-3 mb-5">비밀번호를 입력해주세요.</h6>
						  <table class="col-11">
							<tr>
						      <td class="align-baseline">새 비밀번호</td>
						      <td><input type="password" class="col-8 input-group-text ml-auto mb-4 mr-5" value="" /></td>
							</tr>
						    <tr>
						      <td class="align-baseline">새 비밀번호 확인</td>
						      <td><input type="password" class="col-8 input-group-text ml-auto mb-5 mr-5"value="" required /></td>
							</tr>
						</table>
						<div class="mt-5 pull-right mr-5">
					      <input type="submit" class="btn btn-outline-success btn-lg p-3 pl-4 pr-4" value="회원 수정">&nbsp;
					      <input type="reset" class="btn btn-outline-secondary mr-5 btn-lg p-3 pl-4 pr-4" value="변경사항 없음">
						</div>
	                   </div>
	               </div>
	           </div>
                <!-- 회원정보 끝 -->
                
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
$(function(){
	$("#chatBtn").click(function(){
		$("#talkjs-container").toggle('show');
	});
	
});
</script>

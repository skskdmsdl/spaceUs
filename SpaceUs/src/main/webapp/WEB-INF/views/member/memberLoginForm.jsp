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
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
	<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
	<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
	<!-- 구글 로긴 -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-client_id" content="778421516975-r2f80c2f91aalftfppl2kq4sqn1om06i.apps.googleusercontent.com">
<script>
	<!-- RedirectAttributes에 등록된 msg값 존재여부 확인 후 출력 -->
	<c:if test="${ not empty msg }">
		alert('${ msg }');	
	</c:if>
	<c:if test="${ not empty email }">
		alert('이미 가입하신 이메일입니다. 로그인해주세요.');
	</c:if>
	<c:if test="${ not empty closeFunction }">
	    self.close();
	</c:if>
	
	<c:if test="${ not empty returnPath }">
		alert("not empty returnPath"); //뷰단에 오기전에 컨트롤러에서 다 리턴되어버리는듯..
	    self.close();
		opener.parent.location="${returnPath}"
	</c:if>
	
	/* window.onload = function(){
		signOut();
		alert('onload signOut.');
	} */
	
	function onSignIn(googleUser) {
		var id_token = googleUser.getAuthResponse().id_token;
		var profile = googleUser.getBasicProfile();
		var email = profile.getEmail();

		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		console.log('Name: ' + profile.getName());
		console.log('Image URL: ' + profile.getImageUrl());
		console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		console.log('id_token: ' + id_token); // id_token
		console.log('tokenEmail ${tokenEmail}');
		<c:if test="${ empty tokenEmail }">
			signOut();
			location.href='${pageContext.request.contextPath }/member/googleLogin.do?idtoken='+id_token+'&email='+email;
		</c:if>
		<c:if test="${ not empty tokenEmail }">
			signOut();
			location.href='${pageContext.request.contextPath }/member/googleLogin.do?idtoken='+id_token+'&tokenEmail='+tokenEmail;
			<c:remove var = "tokenEmail"/>
		</c:if>
		/*
		<c:if test="${ empty tokenEmail }">
			var xhr = new XMLHttpRequest();
			xhr.open('POST', '${pageContext.request.contextPath }/member/googleLogin.do');
			xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			xhr.onload = function() {
			  console.log('Signed in as: ' + xhr.responseText);
			  document.open();
			  document.write(xhr.responseText);
			  document.close();
			  
			};
			xhr.send('idtoken=' + id_token+'&email='+email);
		</c:if>
		*/
	}

	function newWindow(url) {
		if('${returnPath}' == "") {
			window.open(url, 'popup','width=600,height=600')
		}

		else {
			self.close();
			//window.opener.parent.location.reload();
		}
		//if(!window.opener) window.opener = window.open('${returnPath}', 'popup','width=600,height=600');
		//opener.parent.location="${returnPath}"; //parent가 null이 나옴.
	}

	
</script>

</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100" style="background-image: url('${pageContext.request.contextPath }/resources/images/bg-01.jpg');
											 background-position: right">
				<form:form action="${pageContext.request.contextPath }/member/memberLogin.do" method="POST"
							class="login100-form validate-form">
					<span class="login100-form-title p-b-43">
						<a class="navbar-brand" href="${pageContext.request.contextPath }">SpaceUs</a>
					</span>
					<div id="naver_id_login" style="text-align:center">
						<%-- <a href="${naver_url}"> --%>
						<a href="#" onClick="window.open('${naver_url}', 'popup','width=600,height=600')">
						<%-- <a href="#" onClick="newWindow('${naver_url}')"> --%>
							<div class="social-btn">
								<img src="${pageContext.request.contextPath }/resources/images/icons/naver-icon.jpg"/>
									&nbsp;네이버로 시작하기
							</div>
						</a>
					</div>
					<div id="kakao_id_login" style="text-align:center">
						<%-- <a href="${kakao_url}"> --%>
						<a href="#" onClick="window.open('${kakao_url}', 'popup','width=600,height=600')">
							<div class="social-btn">
								<img src="${pageContext.request.contextPath }/resources/images/icons/kakao-icon.png"/>
									&nbsp;카카오로 시작하기
							</div>
						</a>
					</div>
					<div id="google_id_login" style="text-align:center">
						<!--c:if test="${ empty tokenEmail }"-->				
							<div class="g-signin2 social-btn" data-onsuccess="onSignIn" data-longtitle="true" data-width="645" data-height="50px" style="opacity: 100">
								<img src="${pageContext.request.contextPath }/resources/images/icons/google-icon.png"/>
									&nbsp;구글로 시작하기
							</div>
						<!--/c:if-->
						<!--c:if test="${ not empty tokenEmail }"-->
							<!-- <a href="#" onclick="signOut();">Sign out</a> -->
							<script>
							  function signOut() {
							    var auth2 = gapi.auth2.getAuthInstance();
							    auth2.signOut().then(function () {
							      console.log('User signed out.');
							    });
							  }
							</script>
						<!--/c:if-->
					</div>
						<div class="text-center p-t-46 p-b-20">
						<p class="txt1">
							또는
						</p><br />
						</div>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz"
						style="width: 100%;">
						<input class="input100" type="text" name="memberEmail" id="memberEmail" placeholder="email">
						<span class="focus-input100">email</span>
						<span class="focus-output100"></span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="Password is required"
						 style="width: 100%;">
						<input class="input100" type="password" name="password" placeholder="password">
						<span class="focus-input100">password</span>
						
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="idSaveCheck" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="idSaveCheck">
								아이디 저장
							</label>
						</div>

						<div>
							<a class="txt1" href=""
								onclick="window.open('${pageContext.request.contextPath}/member/passwordFinder.do','_blank', 'top=1,left=500,width=600,height=450', 'scrollbars=no')">
								비밀번호를 잊으셨나요?
							</a>
						</div>
					</div>
			

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn" onclick="${pageContext.request.contextPath}/member/memberLogin">
							Login
						</button>
					</div>
					
					<div class="text-center p-t-46 p-b-20">
						<a href="${pageContext.request.contextPath }/member/memberEnrollForm.do" class="txt1">
							아직 회원이 아니신가요?
						</a>
					</div>

				</form:form>

			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/vendor/animsition/js/animsition.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/vendor/select2/select2.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath }/resources/vendor/countdowntime/countdowntime.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
<script>
//아이디저장
	$("#memberEmail").val(Cookies.get('key'));      
	if($("#memberEmail").val() != ""){
	    $("#idSaveCheck").attr("checked", true);
	}
	
	$("#idSaveCheck").change(function(){
	if($("#idSaveCheck").is(":checked")){
	    Cookies.set('key', $("#memberEmail").val(), { expires: 7 });
	}else{
	      Cookies.remove('key');
	}
	});
	 
	$("#memberEmail").keyup(function(){
	if($("#idSaveCheck").is(":checked")){
	    Cookies.set('key', $("#memberEmail").val(), { expires: 7 });
	}
	});
</script>
</body>
</html>
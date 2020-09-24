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
</head>
<script>
<!-- RedirectAttributes에 등록된 msg값 존재여부 확인 후 출력 -->
<c:if test="${ not empty msg }">
	alert('${ msg }');	
</c:if>
</script>
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
					<button class="social-btn"><img src="${pageContext.request.contextPath }/resources/images/icons/naver-icon.jpg"/>&nbsp;네이버로 로그인하기</button>
						<button class="social-btn"><img src="${pageContext.request.contextPath }/resources/images/icons/google-icon.png"/>&nbsp;구글로 로그인하기</button>
						<button class="social-btn"><img src="${pageContext.request.contextPath }/resources/images/icons/facebook-icon.png"/>&nbsp;페이스북으로 로그인하기</button>
						<div class="text-center p-t-46 p-b-20">
						<p class="txt1">
							또는
						</p><br />
						</div>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz"
						style="width: 100%;">
						<input class="input100" type="text" name="memberEmail" placeholder="email">
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
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								아이디 저장
							</label>
						</div>

						<div>
							<a class="txt1" href=""
								onclick="window.open('${pageContext.request.contextPath}/member/passwordFinder.do','_blank','top=1,left=500,width=600,height=450')">
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

</body>
</html>
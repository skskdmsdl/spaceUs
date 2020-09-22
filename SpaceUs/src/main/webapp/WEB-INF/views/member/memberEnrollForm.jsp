<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원가입</title>
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
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
</head>
<style>
.login100-form-btn {
	background-color: #00C89E;
}
a:hover {
    text-decoration: none;
    color: #00C89E;
}
.phone {
    margin: auto;
}
</style>
<body style="background-color: #666666;">
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form"
					  action="${pageContext.request.contextPath}">
					<span class="login100-form-title p-b-43">
						<a class="navbar-brand" href="${pageContext.request.contextPath }">SpaceUs</a>
					</span>
					
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="email" name="email" placeholder="email *">
						<span class="focus-input100">email</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="password" placeholder="password *">
						<span class="focus-input100">password</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="passwordChk" placeholder="password Check">
						<span class="focus-input100">password Check</span>
					</div>
					
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="nickName" placeholder="nickName *">
						<span class="focus-input100">nickName</span>
					</div>
					
					<div class="wrap-input100 validate-input">
						<input class="input100" type="tel" name="phone" placeholder="mobile *">
						<span class="focus-input100">mobile</span>
					</div>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="tel" name="phone" placeholder="인증번호 입력 *">
						<span class="focus-input100">인증번호 입력</span>
					</div>
				
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="${pageContext.request.contextPath}">
							회원가입
						</button>
					</div>
					
					<div class="text-center p-t-46 p-b-20">
						<a href="${pageContext.request.contextPath }/member/memberLoginForm.do" class="txt1">
							이미 가입하셨나요?
						</a>
						<br /><br />
					</div>

					<div class="login100-form-social flex-c-m">
						<a href="#" class="login100-form-social-item flex-c-m bg1 m-r-5">
							<i class="fa fa-facebook-f" aria-hidden="true"></i>
						</a>

						<a href="#" class="login100-form-social-item flex-c-m bg2 m-r-5">
							<i class="fa fa-twitter" aria-hidden="true"></i>
						</a>
					</div>
				</form>

				<div class="login100-more" style="background-image: url('${pageContext.request.contextPath }/resources/images/bg_2.jpg');">
				</div>
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
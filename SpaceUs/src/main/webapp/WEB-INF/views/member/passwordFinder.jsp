<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 인코딩처리 -->
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>비밀번호 찾기</title>
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
<body style="background-color: #f7f7f7;">
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100" style="padding: 50px;">
				<span class="login100-form-title p-b-43">
					<p class="navbar-brand">비밀번호 찾기</p>
				</span>
				<div class="wrap-input100 validate-input" style="width: 100%; margin-right: 0px">
					<input class="input100" type="text" name="email" placeholder="email">
					<span class="focus-input100">email</span>
					<span class="focus-output100"></span>
				</div>
					
				<div class="text-left p-b-20" style="width:99%">
					<p class="txt1">
						가입 시 사용한 이메일 주소를 입력해주시면 임시비밀번호를 메일로 보내드립니다. <br />
						네이버, 구글, 페이스북으로 가입하신 경우 비밀번호 찾기가 불가합니다.
					</p><br />
				</div>
				<div class="container-login100-form-btn">
					<button type="submit" class="login100-form-btn" onclick="${pageContext.request.contextPath}/member/memberLogin">
						임시 비밀번호 전송
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
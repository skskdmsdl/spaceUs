<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script>
	<!-- RedirectAttributes에 등록된 msg값 존재여부 확인 후 출력 -->
	<c:if test="${ not empty msg }">
		alert('${ msg }');	
	</c:if>
	<c:if test="${ not empty script }">
		self.close();	
	</c:if>
</script>
</head>
<body style="background-color: #f7f7f7; overflow-x:hidden; overflow-y:hidden;">

<div class="limiter">
	<div class="container-login100">
 		<form:form action="${pageContext.request.contextPath}/member/sendMail.do" method="post">
		<div class="wrap-login100" style="padding: 50px; padding-top: 20px">
			<span class="login100-form-title p-b-43">
				<p class="navbar-brand">비밀번호 찾기</p>
			</span>
			<div class="wrap-input100 validate-input" style="width: 100%; margin-right: 0px">
				<input class="input100" type="email" name="tomail" placeholder="email">
				<span class="focus-input100">email</span>
				<span class="focus-output100"></span>
			</div>
				
			<div class="text-left p-b-20" style="width:99%">
				<p class="txt1">
					가입 시 사용한 이메일 주소를 입력해주시면 임시비밀번호를 메일로 보내드립니다.
				</p><br />
			</div>
			<div class="container-login100-form-btn">
				<button type="submit" class="login100-form-btn">
					임시 비밀번호 전송
				</button>
			</div>
		</div>
		</form:form>
	</div>
</div>
</body>
</html>
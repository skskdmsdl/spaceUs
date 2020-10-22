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
   <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.png">
   <link rel="icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.png">  
   
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
   <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
   <meta name="google-signin-client_id" content="398489879454-c5aqb8i12qv1gku3dgtt31fd8iogm2hd.apps.googleusercontent.com">
<script>
   <!-- RedirectAttributes에 등록된 msg값 존재여부 확인 후 출력 -->
   /* <c:if test="${ not empty msg }">
      alert("${msg}");   
   </c:if>
   <c:if test="${ not empty email }">
      alert('이미 가입하신 이메일입니다. 로그인해주세요.');
   </c:if>
   <c:if test="${ not empty closeFunction }">
       self.close();
   </c:if> */
   
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

      }
    function onSuccess(googleUser) {
         console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
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
         
       }
       function onFailure(error) {
         console.log(error);
       }
       function renderButton() {
         gapi.signin2.render('my-signin2', {
           /* 'scope': 'profile email', */
           'width': 645,
           'height': 50,
           'longtitle': true,
           'theme': 'white',
           'onsuccess': onSuccess,
           'onfailure': onFailure
         });
       }

   
</script>

<style type="text/css">
.abcRioButtonContentWrapper{
   border: none !important;
   font-family: Poppins-Regular;
    font-size: 14px;
    line-height: 1.7;
    color: #666666;
   
   
}
</style>

</head>
<body>
   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100" style="background-image: url('https://interiordesignideas2014.files.wordpress.com/2016/12/image-41434.jpg');">
            <form:form action="${pageContext.request.contextPath }/member/memberLogin.do" method="POST"
                     class="login100-form validate-form">
               <span class="login100-form-title p-b-43">
                  <a class="navbar-brand" href="${pageContext.request.contextPath }">SpaceUs</a>
               </span>
               <div id="naver_id_login">
                  <a href="${naver_url}">
                  <%-- <a href="#" onClick="window.open('${naver_url}', 'popup','width=600,height=600')"> --%>
                     <div class="social-btn">
                        <div  class="btn" style="float: left;">
                           <img src="${pageContext.request.contextPath }/resources/images/icons/naver-icon.jpg"/>
                        </div>
                        <p style="margin: 0 auto;">Sign in with Naver</p>   
                     </div>
                  </a>
               </div>
               <div id="kakao_id_login">
                  <a href="${kakao_url}">
                  <%-- <a href="#" onClick="window.open('${kakao_url}', 'popup','width=600,height=600')"> --%>
                     <div class="social-btn">
                        <div class="btn" style="float: left;">
                           <img src="${pageContext.request.contextPath }/resources/images/icons/kakao-icon.png" style="left: 0;"/>
                        </div>
                        <p style="margin: 0 auto;">Sign in with Kakao</p>   
                     </div>
                  </a>
               </div>
               <div id="google_id_login" >
                  <!--c:if test="${ empty tokenEmail }"-->
                     <!-- <div class="social-btn my-signin2"  data-longtitle="true" data-longtitle="true" data-width="645" data-height="50px"> -->
                     
                        <!-- <input type="hidden" id="my-signin2" /> -->
                        
                        <div id="my-signin2"></div>
                     
                     <!-- <div class="social-btn g-signin2" data-width="300" data-height="200" data-longtitle="true"> -->
                     <%--     <img src="${pageContext.request.contextPath }/resources/images/icons/google-icon.png"/>
                           &nbsp;구글로 시작하기 
                     </div> --%>   
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
               <div class="wrap-input100 validate-input" 
                  style="width: 100%;">
                   <input class="input100" type="text" name="memberEmail" id="memberEmail" placeholder="email" >
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
<script>
<!-- RedirectAttributes에 등록된 msg값 존재여부 확인 후 출력 -->
<c:if test="${ not empty msg }">
   alert("${msg}");   
</c:if>
<c:if test="${ not empty email }">
   alert('이미 가입하신 이메일입니다. 로그인해주세요.');
   $("[name=memberEmail]").val('${email}');
</c:if>
<c:if test="${ not empty closeFunction }">
    self.close();
</c:if>
</script>
</body>
</html>
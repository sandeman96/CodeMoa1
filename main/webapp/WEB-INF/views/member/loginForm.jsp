<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Codemoa</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- js-cookie -->
  <script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.0/dist/js.cookie.min.js"></script>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/dist/css/adminlte.min.css">
  
  <style>
  	.kakao-login-btn:hover{filter: brightness(80%); }
  </style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
  
  <c:if test="${ msg != null}">
  	<script>
  		alert('${ msg }');
  	</script>
  </c:if>
  
    <div class="card-header text-center">
      <a href="home.do" class="h1"><b>Codemoa</b></a>
    </div>
    
    <div class="card-body">
      <p class="login-box-msg"></p>
      
      <form action="login.me" method="post">
        <div class="input-group mb-3">
          <input type="text" name="id" class="form-control" placeholder="아이디" id="id" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="pwd" class="form-control" placeholder="비밀번호" id="pwd" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                	이메일 기억하기
              </label>
            </div>
          </div>

        
        <div class="social-auth-links text-center mt-2 mb-3">
	    	<div class="col-4">
	        	<button type="submit" class="btn btn-primary btn-block" style="width: 300px; margin-bottom: 10px;" id="loginBtn">로그인</button>
	        	<a class="kakao-login-btn" href="#">
		        	<img src="resources/img/kakao_login_medium_wide.png">
		        </a>
	        </div>
     	</div>
      </form>
      <!-- /.social-auth-links -->

      <p class="mb-1">
        <a href="findPwdForm.me">비밀번호 찾기</a>
      </p>
      <p class="mb-0">
        <a href="registerForm.me" class="text-center">회원가입</a>
      </p>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<script>
	// 로그인 버튼
	$('#loginBtn').on('click', function(){
		$.ajax({
			url: 'login.me',
			data: {id:id, pwd:pwd},
			success: function(data){
				if(data == 'true'){
					location.href='home.do';
				} else {
					alert('이메일 또는 비밀번호를 확인해주세요');
					$('#email').val('');
					$('#pwd').val('');
				}
			}
		});
	});

	// 이메일 기억하기
	$('#id').val(Cookies.get('id'));
	if($('#id').val() != ''){
		$('#remember').attr('checked', true);
	}
	
	$('#remember').change(function(){
			if($(this).is(":checked")){
				Cookies.set('id', $('#id').val().trim(), 7);
			} else {
				Cookies.remove('id');
			}
	});
	
	$('#id').keyup(function(){
		if($('#remember').is(":checked")){
			Cookies.set('id', $('#id').val(), 7);
		}
	});
	
</script>

<!-- jQuery -->
<script src="resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="resources/dist/js/adminlte.min.js"></script>
</body>
</html>

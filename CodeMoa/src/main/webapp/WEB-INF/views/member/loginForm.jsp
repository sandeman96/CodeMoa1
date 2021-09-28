<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Codemoa</title>
  
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- kakao JavaScript SDK -->
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
</head>
<style>
/*a태그 밑줄x/글씨색변화x*/
a:link, a:visited {
	color: #939597;
	text-decoration: none;
}

.kakao-login-btn:hover{filter: brightness(80%); }
</style>
<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
  
  <c:if test="${ msg != null}">
  	<script>
  		Swal.fire('이메일 / 비밀번호를 확인해주세요', '', 'info');
  	</script>
  </c:if>
  
    <div class="card-header text-center">
      <a href="/codemoa" class="h1"><b>Codemoa</b></a>
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
	        	<button type="submit" class="btn btn-primary btn-block" style="width: 300px; margin-bottom: 10px;" id="loginBtn" onclick="login();">로그인</button>
	        	<a class="kakao-login-btn" onclick="kakaoLogin();">
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
      <input type="hidden" id="text" value="${ text }">
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<script>

	$('#pwd').keypress(function (e) {
		if(e.keyCode == 13){ // 엔터 키
			var id = $('#id').val().trim();
			var pwd = $('#pwd').val().trim();
			if(id != '' && pwd != ''){
				login(id, pwd);
			} else {
				$('#pwd').focus();
			}
		}
	});

	// 로그인 버튼
	function login(id, pwd){
		if(id != null && id != '' && pwd != null && pwd != ''){
			$.ajax({
				url: 'login.me',
				dataType: 'post',
				data: {id:id, pwd:pwd},
				success: function(data){
					if(data == 'true'){
						location.href='home.do';
					} else {
						$('#email').val('');
						$('#pwd').val('');
					}
				}
			});
		}
	};

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
	
	Kakao.init('4342ea3b7dffd99d9662964fcd3f3267');
// 	console.log(Kakao.isInitialized());
	
	function kakaoLogin(){
		
		window.Kakao.Auth.login({
			scope: 'profile_nickname, account_email',
			success: function(authObj){
				
				window.Kakao.API.request({
					url: '/v2/user/me',
					success: function(res){
						
						var email = res.kakao_account.email;
						var nickName = res.kakao_account.profile.nickname;
			            
                		$.ajax({
                			url: 'kakaoLogin.me',
                			type: 'post',
			                data : {email:email, pwd : "kakaoPassword", nickName: nickName},
			                success: function(data){
								
								location.href=data;
			                }
                		});
                	}
                })		
			}
		});
	}
</script>

<!-- jQuery -->
<script src="resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="resources/dist/js/adminlte.min.js"></script>
</body>
</html>

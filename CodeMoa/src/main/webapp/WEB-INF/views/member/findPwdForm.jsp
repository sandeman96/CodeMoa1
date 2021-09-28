<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Codemoa</title>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/dist/css/adminlte.min.css">
<style>
/*a태그 밑줄x/글씨색변화x*/
a:link, a:visited {
	color: #939597;
	text-decoration: none;
}
</style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="/codemoa" class="h1"><b>Codemoa</b></a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">비밀번호 변경</p>
      <form action="pwdReset.me" method="post">
        <div class="input-group mb-3" id="email_div">
          <input type="email" name="email" id="email" class="form-control" placeholder="이메일 주소를 입력해주세요">
          <div class="input-group-append">
            <div class="input-group-text">
              	<span class="fas fa-envelope" id="emailBasic"></span>
				<span id="emailPass">✔</span>
				<span id="emailFail">❌</span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3" id="code_div">
          <input type="text" id="code" class="form-control" placeholder="인증번호를 입력하세요">
          <div class="input-group-append">
            <div class="input-group-text">
              	<span class="fas"><ion-icon name="key-outline"></ion-icon></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3" id="pwd_div">							
			<input type="password" name="pwd" class="form-control" placeholder="비밀번호 (8자 이상, 문자/숫자/기호 조합)" id="pwd" required>
			<div class="input-group-append">
				<div class="input-group-text">
					<span class="fas fa-lock" id="pwdBasic"></span>
					<span id="pwdPass">✔</span>
					<span id="pwdFail">❌</span>
				</div>
			</div>
		</div>
		<div class="input-group mb-3" id="pwdCheck_div">
			<input type="password" class="form-control" placeholder="비밀번호 확인" id="pwdCheck" required>
			<div class="input-group-append">
				<div class="input-group-text">
					<span class="fas fa-lock" id="pwdCheckBasic"></span>
					<span id="pwdCheckPass">✔</span>
					<span id="pwdCheckFail">❌</span>
				</div>
			</div>
		</div>
        <div class="row">
          <div class="col-12">
            <button type="button" class="btn btn-primary btn-block" id="send">인증메일 발송</button>
          </div>
          <div class="col-12">
            <button type="button" class="btn btn-primary btn-block" id="checkBtn">확인</button>
          </div>
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block" id="resetPwd">비밀번호 변경</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
      <table width="100%">
      	<tr>
      		<td>
	      		<p class="mt-3 mb-1">
			      	<a href="loginForm.me">로그인</a>
				</p>
	  		</td>
      		<td>
	      		<p class="mt-3 mb-1" style="text-align: right;">
	      			<a href="#" id="reSend">인증메일 재발송</a>
				</p>
      		</td>
      	</tr>
      </table>
    </div>
    
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<script>
	var regExp = /^[a-zA-Z0-9]+([-_\.]?[0-9a-zA-Z]+[-_\.])*@[a-zA-Z]+\.[a-zA-Z]+$/;
	$('#send').attr('disabled', 'true');
	$('#emailPass').hide();
	$('#emailFail').hide();
	$('#checkBtn').hide();
	$('#resetPwd').hide();
	$('#code_div').hide();
	$('#reSend').hide();
	$('#pwd_div').hide();
	$('#pwdCheck_div').hide();
	
	// 이메일 형식 검사
	$('#email').on('keyup', function(){
		if(regExp.test($(this).val()) == true){
			$('#send').removeAttr('disabled');
			$('#emailPass').show();
			$('#emailFail').hide();
			$('#emailBasic').hide();
		} else {
			$('#emailPass').hide();
			$('#emailFail').show();
			$('#emailBasic').hide();
		}
		
		if($('#email').val().trim() == ''){ // 값을 지웠을 때
			$('#send').attr('disabled', 'true');
			$('#emailPass').hide();
			$('#emailFail').hide();
			$('#emailBasic').show();
		}
	});
	
	// 인증메일 발송 버튼
	$('#send').on('click', function(){
		
		$.ajax({
			url : 'sendemail.me',
			data : {
				mail : $('#email').val(),
				what : '비밀번호 변경'
			},
			success : function(data) {
				code = data;
			}
		});
		
		$(this).hide();
		$('#email_div').hide();
		$('#code_div').show();
		$('#checkBtn').show();
		$('#reSend').show();
	});
	
	// 메일 인증 버튼
	$('#checkBtn').on('click', function(){
		if($('#code').val().trim() == code){
			$('#code_div').hide();
			$(this).hide();
			$('#pwd_div').show();
			$('#pwdCheck_div').show();
			$('#resetPwd').show();
		} else{
			alert('인증번호를 확인해주세요');
			$('#code').focus();
		}
	});
	
	// 인증메일 재발송 버튼
	$('#reSend').on('click', function(){
		$.ajax({
			url : 'sendemail.me',
			data : {
				mail : $('#email').val(),
				what : '비밀번호 변경'
			},
			success : function(data) {
				code = data;
			}
		});
	});
	
	$('#checkBtn').on('click', function(){
		$('#reSend').hide();
		$('#pwd_div').show();
		$('#pwdCheck_div').show();
		$('#resetPwd').show();
	});
	
	// 비밀번호 형식 검사
	var pwdRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
	var pwdStatus = false;
	$('#pwdPass').hide();
	$('#pwdFail').hide();
	$('#pwdCheckPass').hide();
	$('#pwdCheckFail').hide();
	$('#resetPwd').attr('disabled', true);
	
	$('#pwd').on('keyup',function(){
		if(pwdRegExp.test($(this).val())){
			$('#pwdPass').show();
			$('#pwdFail').hide();
			$('#pwdBasic').hide();
			pwdStatus = true;
		} else {
			$('#pwdPass').hide();
			$('#pwdFail').show();
			$('#pwdBasic').hide();
			pwdStatus = false;
		}
		
		if($('#pwd').val().trim() == ''){ // 값을 지웠을 때
			$('#pwdPass').hide();
			$('#pwdFail').hide();
			$('#pwdBasic').show();
			pwdStatus = false;
		}
	});
	
	$('#pwdCheck').on('keyup',function(){
		if($('#pwdCheck').val() == $('#pwd').val() && pwdStatus == true){
			$('#pwdCheckPass').show();
			$('#pwdCheckFail').hide();
			$('#pwdCheckBasic').hide();
			$('#resetPwd').removeAttr('disabled');
		} else{
			$('#pwdCheckPass').hide();
			$('#pwdCheckFail').show();
			$('#pwdCheckBasic').hide();
		}
		
		if($('#pwdCheck').val().trim() == ''){ // 값을 지웠을 때
			$('#pwdCheckPass').hide();
			$('#pwdCheckFail').hide();
			$('#pwdCheckBasic').show();
		}
	});
	
</script>

<!-- jQuery -->
<script src="resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="resources/dist/js/adminlte.min.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>

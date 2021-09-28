<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Codemoa</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- kakao JavaScript SDK -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet" href="resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="resources/dist/css/adminlte.min.css">

<style>
.kakao-reg-btn:hover {
	filter: brightness(80%);
}

/* 모달 창 */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.2); /* Black w/ opacity */
}

.modal_body{ 
	position: fixed;
	top: 50%;
	left: 50%;
	background: white; 
	width: 420px;  
	height: 300px;  
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	border-radius: 1%;
} 

.header{text-align: right;}
.body{text-align: center; height: 280px;}
.content{text-align: left; padding-left: 30px;}
.modalBtn{display: inline-block; text-align: center; width: 300px;}
#x_icon{width: 30px; height: 30px;}

#emailNum {
	display: none;
}

::placeholder{font-size: 14px;}

/*a태그 밑줄x/글씨색변화x*/
a:link, a:visited {
	color: #939597;
	text-decoration: none;
}
</style>
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="card card-outline card-primary">
			<div class="card-header text-center">
				<a href="/codemoa" class="h1">
					<b>Codemoa</b>
				</a>
			</div>
			<div class="card-body">
				<form action="minsert.me" method="post" id="regForm">
					<div class="input-group mb-3">
						<input type="email" name="email" class="form-control" placeholder="Email" id="email" required>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope" id="emailBasic"></span>
								<span id="emailPass">✔</span>
								<span id="emailFail">❌</span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3" id="div_email">
						<table>
							<tr>
								<td style="width: 200px;"><input type="text" class="form-control" placeholder="인증번호" id="emailNum"></td>
								<td><input type="button" class="btn btn-primary" id="sendMail" value="인증메일 발송" style="width: 130px;"></td>
							</tr>
							<tr>
								<td colspan="2">
									<a href="#" id="sendingCheck" style="text-decoration: underline;">인증메일을 받지 못하셨나요?</a>
								</td>
							</tr>
						</table>
					</div>
					<div class="input-group mb-3">
						<input type="text" name="id" class="form-control" placeholder="아이디는 Email로 생성됩니다" id="id" readonly required>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user" id="idBasic"></span>
								<span id="idPass">✔</span>
								<span id="idFail">❌</span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="text" name="nickName" class="form-control" placeholder="닉네임 (2~8자, 한글/영문/숫자 사용 가능)" id="nickName" required>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user" id="nickBasic"></span>
								<span id="nickPass">✔</span>
								<span id="nickFail">❌</span>
							</div>
						</div>
					</div>

					<div class="input-group mb-3">							
						<input type="password" name="pwd" class="form-control" placeholder="비밀번호 (8자 이상, 문자/숫자/기호 조합)" id="pwd" required>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock" id="pwdBasic"></span>
								<span id="pwdPass">✔</span>
								<span id="pwdFail">❌</span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
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
						<div class="col-8">
							<div class="icheck-primary">
								<input type="checkbox" id="agreeTerms" name="terms" value="agree" required> <label for="agreeTerms"> <a href="#">약관</a>에 동의합니다
								</label>
							</div>
						</div>
					</div>
					<div class="social-auth-links text-center">
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block" style="width: 300px; margin-bottom: 10px;" id="submit" disabled>회원가입</button>
							<a class="kakao-reg-btn" onclick="kakaoLogin();">
								<img src="resources/img/kakao_start_medium_wide.png" />
							</a>
						</div>
					</div>
				</form>

				<a href="loginForm.me" class="text-center">이미 회원입니다</a>
			</div>
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->

	<div class="modal">
		<div class="modal_body">
			<div class="header">
				<a href="#" id="close"><ion-icon name="close-outline" id="x_icon"></ion-icon></a>
			</div>
			<div class="body">
				<div class='content'>
					<p style="font-weight: bolder; font-size: 22px; ">인증번호를 받지 못하셨나요?</p>
					<p style="color: #6E6E6E; font-size: 15px;">
					이메일이 정확한지 확인해주세요. <br>
					메일서비스에 따라 인증번호 발송이 늦어질 수 있습니다.<br>
					계속 메일이 오지 않으면 다시 인증번호를 요청해 주세요.<br>
					</p>
					
				</div>
				<div class="modalBtn">
					<input type="button" id="reSend" class="btn btn-primary btn-block" style="height: 45px;" value="인증번호 재발송">
					<input type="button" id="emailChange" class="btn btn-primary btn-block" style="height: 45px;" value="다른 이메일로 인증">
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$('#emailPass').hide();
		$('#emailFail').hide();
		$('#sendMail').attr('disabled', 'true');
		$('#idPass').hide();
		$('#idFail').hide();
		
	
		// 이메일 형식 검사
		var emailRegExp = /^[a-zA-Z0-9]+([-_\.]?[0-9a-zA-Z]+[-_\.])*@[a-zA-Z]+\.[a-zA-Z]+$/;
		var idStatus = false;
		
		$('#email').on('keyup',function(){
			var eId = $('#email').val().split('@');
			$('#id').val(eId[0]);
			
			$.ajax({
				url: 'idCheck.me',
				data: {id:eId[0]},
				success: function(data){
					if(data == 0){
						idStatus = true;
					} else {
						idStatus = false;
					} 
				}
			});
			
			if(emailRegExp.test($(this).val()) == true && idStatus == true){
				$('#sendMail').removeAttr('disabled');
				$('#emailPass').show();
				$('#emailFail').hide();
				$('#emailBasic').hide();
				$('#idBasic').hide();
				$('#idPass').show();
				$('#idFail').hide();
			} else {
				$('#sendMail').attr('disabled', 'true');
				$('#emailPass').hide();
				$('#emailFail').show();
				$('#emailBasic').hide();
				$('#idBasic').hide();
				$('#idPass').hide();
				$('#idFail').show();
			}
			
			if($('#email').val().trim() == ''){ // 값을 지웠을 때
				$('#sendMail').attr('disabled', 'true');
				$('#emailPass').hide();
				$('#emailFail').hide();
				$('#emailBasic').show();
				$('#idBasic').show();
				$('#idPass').hide();
				$('#idFail').hide();
			}
			
		});
	
		// 인증메일 발송 
		$('#emailNum').hide();
		$('#sendingCheck').hide();
		var emailStatus = false;
		
		$('#sendMail').on('click', function(){
			email = $('#email').val();
			
			if($(this).val() == '인증메일 발송'){
				$('#email').prop('readonly', 'true');
				$('#emailNum').show(100);
				$('#sendingCheck').show(100);
				$(this).val('인증번호 확인');
				
				// 인증메일 발송
				$.ajax({
					url : 'sendemail.me',
					data : {
						mail : $('#email').val(),
						what : '회원가입'
					},
					success : function(data) {
						code = data;
						console.log(data);
						emailStatus = true;
					}
				});
				
			} else if($(this).val() == '인증번호 확인'){
				if($('#emailNum').val().trim() == ''){
					alert('인증번호를 입력하세요');
					$('#emailNum').focus();
				} else if(code == $('#emailNum').val().trim()){
					$('#div_email').hide();
					var eId = $('#email').val().split('@');
					$('#id').val(eId[0]);
				} else{
					alert('인증번호를 확인해주세요');
				}
			}
		});
		
		$('#reSend').on('click', function(){ // 인증메일 재발송
			$.ajax({
				url : 'sendemail.me',
				data : {
					mail : $('#email').val(),
					what : '회원가입'
				},
				success : function(data) {
					code = data;
					emailStatus = true;
				}
			});
			$('.modal').fadeOut();
		});
		
		// 모달 창
		$('#sendingCheck').on('click', function(){
			$('.modal').fadeIn();
		});
		$('#close').on('click', function(){
			$('.modal').fadeOut();
		});
		
		$('#emailChange').on('click', function(){ // 이메일 재입력
			$('#email').removeAttr('readonly');
			$('#email').focus();
			$('#emailNum').hide();
			$('#sendingCheck').hide();
			$('#sendMail').val('인증메일 발송');
			$('.modal').fadeOut();
		});
		
		// 닉네임 정규식 검사 & 중복 확인
		var nickRegExp = /^([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{2,8}$/;
		var nickStatus = false;
		$('#nickPass').hide();
		$('#nickFail').hide();
		
		$('#nickName').on('keyup',function(){
			var nickName = $(this).val();
			
			if(nickRegExp.test($(this).val())){
				$.ajax({
					url: 'nickNameCheck.me',
					data: {nickName:nickName},
					success: function(data){
						console.log(data);
						if(data == 0){
							$('#nickPass').show();
							$('#nickFail').hide();
							$('#nickBasic').hide();
							nickStatus = true;
						} else if(data == 1){
							$('#nickPass').hide();
							$('#nickFail').show();
							$('#nickBasic').hide();
							nickStatus = false;
						} 
					}
				});
			} else{
				$('#nickPass').hide();
				$('#nickFail').show();
				$('#nickBasic').hide();
				nickStatus = false;
			}
			
			if($(this).val().trim() == ''){
				$('#nickPass').hide();
				$('#nickFail').hide();
				$('#nickBasic').show();
				nickStatus = false;
			}
		});
		
		// 비밀번호 형식 검사
		$('#pwdPass').hide();
		$('#pwdFail').hide();
		$('#pwdCheckPass').hide();
		$('#pwdCheckFail').hide();
		
		var pwdStatus = false;
		var pwdCheckStatus = false;
		var pwdRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
		
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
			if($('#pwdCheck').val() == $('#pwd').val()){
				$('#pwdCheckPass').show();
				$('#pwdCheckFail').hide();
				$('#pwdCheckBasic').hide();
				pwdCheckStatus = true;
			} else{
				$('#pwdCheckPass').hide();
				$('#pwdCheckFail').show();
				$('#pwdCheckBasic').hide();
				pwdCheckStatus = false;
			}
			
			if($('#pwdCheck').val().trim() == ''){ // 값을 지웠을 때
				$('#pwdCheckPass').hide();
				$('#pwdCheckFail').hide();
				$('#pwdCheckBasic').show();
				pwdCheckStatus = false;
			}
		});
		
		$('#kakao').on('click', function(){
			console.log($('#agreeTerms').is(':checked'));
		});
		
		$('#regForm').change(function(){
			if(emailStatus == true && pwdStatus == true && pwdCheckStatus == true && nickStatus == true && $('#agreeTerms').is(':checked') == true){
				$('#submit').removeAttr('disabled');
			} else {
				$('#submit').attr('disabled', true);
			}
		});
		
		Kakao.init('4342ea3b7dffd99d9662964fcd3f3267');
// 		console.log(Kakao.isInitialized());
		
		function kakaoLogin(){
			
			window.Kakao.Auth.login({
				scope: 'profile_nickname, account_email',
				success: function(authObj){
//	 				console.log(authObj);
					
					window.Kakao.API.request({
						url: '/v2/user/me',
						success: function(res){
//	 						console.log(res.kakao_account);
							
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
	
	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>


</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한수정 비밀번호 입력</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="/codemoa/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet" href="/codemoa/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="/codemoa/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="/codemoa/resources/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/codemoa/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/codemoa/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">

</head>
<body>
	<c:import url="../admin/adminSidebar.jsp" />
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
<!-- 			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>권한 수정 비밀번호 입력</h1>
					</div>
				</div>
			</div>/.container-fluid -->
		</section>
		
		<!-- Automatic element centering -->
		<div class="lockscreen-wrapper">
		  <div class="lockscreen-logo">
		    <b>Enter Password</b>
		  </div>	
		  <!-- START LOCK SCREEN ITEM -->
			<div class="lockscreen-item">
			    <!-- lockscreen credentials (contains the form) -->
				<form action="updateMember.ad" class="lockscreen-credentials" onsubmit="return validate();">
					<div class="input-group">
						<input type="password" class="form-control" placeholder="password" id="pwd">
						
						<div class="input-group-append">
							<button type="submit" class="btn">
								<i class="fas fa-arrow-right text-muted"></i>
							</button>
						</div>
					</div>
				</form>
				<!-- /.lockscreen credentials -->
			</div>
			
			<!-- /.lockscreen-item -->
			<div class="help-block text-center">
				Enter your password to retrieve your session<br>
				Or sign in as a different user
			</div>
			<div class="lockscreen-footer text-center">
				Copyright &copy; 2014-2021 <b>CodeMoa</b><br>
				All rights reserved
			</div>
		</div>
		<!-- /.center -->
	</div>
	</div>
	
	<script type="text/javascript">
		function validate(){
			var pwd = $('#pwd');
			var pwd1 = ${ loginUser.email };
			
			if(pwd.val() != pwd1.val()){
				alert('잘못된 비밀번호를 입력하셨습니다');
				pwd.focus();
				return false;
			}	
			return true;
		}
	</script>

   <!-- jQuery -->
   <script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
   <!-- Bootstrap 4 -->
   <script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- AdminLTE App -->
   <script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="/codemoa/resources/dist/js/demo.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Codemoa</title>

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
<!-- Daterange picker -->
<link rel="stylesheet" href="/codemoa/resources/plugins/daterangepicker/daterangepicker.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<c:import url="../admin/adminSidebar.jsp"/>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">	
		<!-- Automatic element centering -->
		<div class="lockscreen-wrapper">
		  <div class="lockscreen-logo">
		    <b>Enter Password</b>
		  </div>
		  <!-- START LOCK SCREEN ITEM -->
			<div class="lockscreen-item">
			    <!-- lockscreen credentials (contains the form) -->
				<div>
					<div class="input-group">
						<input type="hidden" value="${loginUser.id}" id="id">
						<input type="password" class="form-control border" id="pwd" placeholder="password" required>
						<button type="submit" class="btn bg-gradient-warning float-right" id="pwdCheck"
								style="font-size: 0.8rem; display: inline-block; color: #939597; width: 3rem; border-radius: 0px;">
								<i class="fas fa-arrow-right text-muted"></i></button>
						</div>
				</div>
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
	
	<script>
	$(function(){
		$('#pwdCheck').click(function(){
			var pwd = $('#pwd').val();
			var id = $('#id').val();
			
			if(pwd == "") {
				Swal.fire({
					  position: 'middle',
					  icon: 'warning',
					  title: '비밀번호를 입력해주세요.',
					  timer: 1300
					})
				return false;
			}
			
			$.ajax({
				url: 'adminPwdCheck.ad',
				data: {id:id, pwd:pwd},
				type: "POST",
				success:function(data) {
					if(data == 'success'){
						location.href="adminUpdateMember.ad";
					} else{
						Swal.fire({
							  position: 'middle',
							  icon: 'error',
							  title: '비밀번호를\n잘못 입력하셨습니다.',
							  timer: 1000
							})
						return false;
		            }
				}
			});
		});
	});
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
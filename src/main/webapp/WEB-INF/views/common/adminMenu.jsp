<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<style>
#logoutBtn {
	position: absolute;
	bottom: 10px;
	font-weight: bold;
}
#logoutBtn:hover {
	background-color: rgba(255, 255, 255, .1);
	color: #fff;
}
#dark i{
	color: #f5df4d;
}
</style>


</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<div class="wrapper">

		<!-- Preloader -->
		<div class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="/codemoa/resources/img/codemoa.png" alt="CodeMoaLogo">
		</div>

		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light fixed-top">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" data-widget="pushmenu" href="#" role="button">
						<i class="fas fa-bars"></i>
					</a>
				</li>
				<li class="nav-item d-none d-sm-inline-block">
					<a href="home.do" class="nav-link">Home</a>
				</li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" data-widget="fullscreen" href="#" role="button">
						<i class="fas fa-expand-arrows-alt"></i>
					</a>
				</li>

				<li class="nav-item">
					<a id="dark" class="nav-link" data-widget="dark-mode" data-slide="true" href="#" role="button">
						<i class="fas fa-moon"></i>
					</a>
				</li>


			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="home.do" class="brand-link">
				<img src="/codemoa/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">CODE MOA</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="/codemoa/resources/dist/img/user2-160x160.jpg" alt="User Image">
					</div>
					<div class="info">
						<a href="mypage.me" class="d-block">책임 관리자</a>
					</div>
				</div>

				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

						<li class="nav-item">
							<a href="adminMember.bo" class="nav-link">
								<i class="nav-icon fas fa-users"></i>
								<p>사용자 관리</p>
							</a>
						</li>

						<li class="nav-item">
							<a href="adminBoard.bo" class="nav-link">
								<i class="nav-icon fas fa-newspaper"></i>
								<p>게시판 관리</p>
							</a>
						</li>

						<li class="nav-item">
							<a href="gittrending.html" class="nav-link">
								<i class="nav-icon fa fa-calendar"></i>
								<p>캘린더 관리</p>
							</a>
						</li>

					</ul>

				</nav>

				<a href="#" id="logoutBtn" class="nav-link">
					&nbsp;&nbsp;
					<i class="nav-icon fas fa-sign-out-alt"></i>
					<p class="float-right">LOGOUT</p>
				</a>

				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<footer class="main-footer">
			<strong>Copyright &copy; <a href="https://adminlte.io">CodeMoA.io</a>.
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.1.0
			</div>
		</footer>

	</div>
	
	<script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
	<script>
		$('#dark').on('click', function(){
	    	
	    	var toggle = $(this).children().attr('class').indexOf('moon');    		
	    	if(toggle > 0){
	    		$(this).children().removeClass('fa-moon').addClass('fa-sun');
	    		$('body').addClass('dark-mode');
	    	}else{
	    		$(this).children().removeClass('fa-sun').addClass('fa-moon');
	    		$('body').removeClass('dark-mode');
	    	}
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
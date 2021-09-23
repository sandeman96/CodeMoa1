<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- Theme style -->
<link rel="stylesheet" href="/codemoa/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/codemoa/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">


<style>
#logoutBtn {
	position: absolute;
	bottom: 15px;
	font-weight: bold;
}

#logoutBtn:hover {
	background-color: rgba(255, 255, 255, .1);
	color: #fff;
}

#dark i {
	color: #f5df4d;
}

.logotext {
	font-size: 30px;
	line-height: 70px;
}

.im {
	font-size: 40px;
	line-height: 70px;
}
</style>

</head>

<body class="hold-transition sidebar-mini layout-fixed">

	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />

	<div class="wrapper">

		<!-- Preloader -->
		<div class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="resources/img/codemoa.png" alt="CodeMoaLogo">
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
					<a href="index.jsp" class="nav-link">Home</a>
				</li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">

				<li class="nav-item">
					<a id="dark" class="nav-link" data-widget="dark-mode" data-slide="true" href="#" role="button">
						<i class="fas fa-moon"></i>
					</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" data-widget="fullscreen" href="#" role="button">
						<i class="fas fa-expand-arrows-alt"></i>
					</a>
				</li>

			</ul>
		</nav>
		<!-- /.navbar -->
		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="adminPage.ad" class="brand-link">
				<span class="brand-image im ml-2">🗿</span>
				<span class="brand-text logotext">CODEMOA‍</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 flex-column align-items-center">
					<c:if test="${ loginUser == null }">
						<div class="image ml-2">
							<h5>🚪</h5>
						</div>

						<div class="image">
							<a href="loginForm.me">로그인을 해주세요</a>
						</div>
					</c:if>

					<c:if test="${ loginUser != null }">

						<span class="brand-image logotext ml-2"> 👷 ‍ </span>

						<span class="brand-text">
							<a href="adminPage.ad">
								${ loginUser.nickName }
								<span class="text-sm">(관리자)</span>
							</a>
						</span>

					</c:if>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

						<li class="nav-item">
							<a href='adminPage.ad' class="nav-link">
								<i class="nav-icon fas fa-home"></i>
								<p>관리자 메인 화면</p>
							</a>
						</li>

						<li class="nav-item">
							<a href="adminMember.ad" class="nav-link">
								<i class="nav-icon fas fa-users"></i>
								<p>
									사용자
									<i class="fas fa-angle-left right"></i>
								</p>
							</a>
							<ul class="nav nav-treeview">

								<li class="nav-item">
									<a href="adminMember.ad" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>사용자 관리</p>
									</a>
								</li>

								<li class="nav-item">
									<a href="adminReportMember.ad" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>신고된 사용자</p>
									</a>
								</li>

							</ul>
						</li>

						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="nav-icon fas fa-newspaper"></i>
								<p>
									게시글 관리
									<i class="fas fa-angle-left right"></i>
								</p>
							</a>

							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="adminBoard.ad" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>게시판 관리</p>
									</a>
								</li>
							</ul>

							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="adminReportBoard.ad" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>신고된 게시글</p>
									</a>
								</li>
							</ul>
						</li>




						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="nav-icon fab fa-medium"></i>
								<p>
									사용자 메뉴
									<i class="fas fa-angle-left right"></i>
								</p>
							</a>

							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="boardListFaq.bo" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										Q&amp;A
									</a>
								</li>
							</ul>

							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="boardListTips.bo" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										Tips
									</a>
								</li>
							</ul>
							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="boardListStudy.bo" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										Study
									</a>
								</li>
							</ul>
						</li>


					</ul>

				</nav>
				<c:if test="${ loginUser != null }">
					<a href="logout.me" id="logoutBtn" class="nav-link">
						&nbsp;&nbsp;
						<i class="nav-icon fas fa-sign-out-alt"></i>
						<p class="float-right">LOGOUT</p>
					</a>
				</c:if>
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
		$('#dark').on('click', function() {
			var toggle = $(this).children().attr('class').indexOf('moon');
			if (toggle > 0) {
				$(this).children().removeClass('fa-moon').addClass('fa-sun');
				$('body').addClass('dark-mode');
			} else {
				$(this).children().removeClass('fa-sun').addClass('fa-moon');
				$('body').removeClass('dark-mode');
			}
		});
	</script>

</body>
</html>
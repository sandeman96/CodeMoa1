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
	bottom: 10px;
	font-weight: bold;
}

#logoutBtn:hover {
	background-color: rgba(255, 255, 255, .1);
	color: #fff;
}

#dark i {
	color: #f5df4d;
}

#chatbox {
	position: absolute;
	top: 58;
	right: 15px;
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
					<a href="/codemoa/" class="nav-link">Home</a>
				</li>
				<li class="nav-item d-none d-sm-inline-block">
					<a href="#" class="nav-link">Contact</a>
				</li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item">
					<a class="nav-link" data-widget="navbar-search" href="#" role="button">
						<i class="fas fa-search"></i>
					</a>
					<div class="navbar-search-block">
						<form>
							<div class="input-group col-6 ml-7">
								<input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button" data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</li>

				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown">
					<a id="chat" class="nav-link" data-toggle="dropdown" href="#">
						<i class="far fa-comments" title=""></i>
						<span class="badge badge-danger navbar-badge">3</span>
						<input id="bool" type="hidden" value="false">
					</a>
					<div>
						<!-- ==============================채팅창=========================== -->
						<div id="chatbox" style="display: none">

							<!-- DIRECT CHAT WARNING -->
							<div class="card card-warning direct-chat direct-chat-warning" style="width: 25rem;">
								<div class="card-header">
									<h3 class="card-title">Direct Chat</h3>

									<div class="card-tools">
										<span title="3 New Messages" class="badge bg-danger">3</span>
										<button type="button" class="btn btn-tool" data-card-widget="collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool" title="Contacts" data-widget="chat-pane-toggle">
											<i class="fas fa-comments"></i>
										</button>
									</div>
								</div>
								<!-- /.card-header -->

								<div class="card-body">

									<div class="direct-chat-messages">

										<div class="direct-chat-msg">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-left">Alexander Pierce</span>
												<span class="direct-chat-timestamp float-right">23 Jan 2:00 pm</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img" src="resources/dist/img/user1-128x128.jpg" alt="Message User Image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">Is this template really for free? That's unbelievable!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message to the right -->
										<div class="direct-chat-msg right">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-right">Sarah Bullock</span>
												<span class="direct-chat-timestamp float-left">23 Jan 2:05 pm</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img" src="resources/dist/img/user3-128x128.jpg" alt="Message User Image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">You better believe it!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->
									</div>
									<!--/.direct-chat-messages-->

									<!-- Contacts are loaded here -->
									<div class="direct-chat-contacts">
										<ul class="contacts-list">
											<li>
												<img class="contacts-list-img" src="resources/dist/img/user1-128x128.jpg" alt="User Avatar">

												<div class="contacts-list-info">
													<span class="contacts-list-name">
														Count Dracula <small class="contacts-list-date float-right">2/28/2015</small>
													</span>
													<span class="contacts-list-msg">How have you been? I was...</span>
												</div>
												<!-- /.contacts-list-info -->

											</li>
											<!-- End Contact Item -->
										</ul>
										<!-- /.contatcts-list -->
									</div>
									<!-- /.direct-chat-pane -->
								</div>
								<!-- /.card-body -->

								<div class="card-footer">
									<form action="#" method="post">
										<div class="input-group">
											<input type="text" name="message" placeholder="Type Message ..." class="form-control">
											<span class="input-group-append">
												<button type="submit" class="btn btn-warning">Send</button>
											</span>
										</div>
									</form>
								</div>

								<!-- /.card-footer-->
							</div>
							<!--/.direct-chat -->

						</div>

					</div>
				</li>

				<!-- Notifications Dropdown Menu -->
				<c:if test="${ loginUser != null }">
				<li class="nav-item dropdown">
					<a class="nav-link" href="messageBox.ms">
						<i class="far fa-bell"></i>
						<span id="msgBadge" class="badge badge-warning navbar-badge"></span>
					</a>
				</li>
				</c:if>

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
			<a href="/codemoa/" class="brand-link">
				<img src="/codemoa/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">CODE MOA</span>
			</a>
			<!-- Sidebar -->
			<div class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<c:if test="${ loginUser == null }">
						<div class="info text-center">
							<a href="loginForm.me" class="d-block">로그인을 해주세요</a>
						</div>
					</c:if>

					<c:if test="${ loginUser != null }">
					<c:url var="mypage" value="mypage.me">
						<c:param name="userId" value="${ loginUser.id }"/>
					</c:url>
						<div class="image">
							<img src="resources/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
						</div>
						<div class="info">
							<a href="${ mypage }" class="d-block">${ loginUser.nickName }</a>
						</div>
					</c:if>
				</div>

				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="nav-icon fas fa-code"></i>
								<p>
									Tech
									<i class="fas fa-angle-left right"></i>
								</p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="boardListFaq.bo" class="nav-link"> Q&amp;A </a>
								</li>
								<li class="nav-item">
									<a href="boardListTips.bo" class="nav-link"> Tips </a>
								</li>
							</ul>
						</li>

						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="nav-icon fas fa-users"></i>
								<p>
									Community
									<i class="fas fa-angle-left right"></i>
								</p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="boardListStudy.bo" class="nav-link"> Study </a>
								</li>
								<li class="nav-item">
									<a href="job.bo"" class="nav-link"> Job </a>
								</li>
							</ul>
						</li>

						<li class="nav-item">
							<a href="boardListCalendar.bo" class="nav-link">
								<i class="nav-icon fas fa-calendar-alt"></i>
								<p>Calendar</p>
							</a>
						</li>


						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="nav-icon fab fa-github"></i>
								<p>Git Trending</p>
							</a>
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

		/* 채팅창 */
 		$('#chat').on('click', function() {

			if ($('#bool').val() == 'false') {
				$('#bool').val('true');
				$('#chatbox').css('display', 'block');
			} else {
				$('#bool').val('false');
				$('#chatbox').css("display", 'none');
			}
		});
		
		$('#msgBadge').text();
		
		
		function msgAlarm(){
			$.ajax({
				url:'msgAlarm.ms',
				data: {
					id:'${loginUser.id}'
				}, success:function(data){
					console.log(data);
					if(data != 0){
						$('#msgBadge').text(data);						
					}
				}
			});
		}
		
		$(function(){
			msgAlarm();
			
			setInterval(function(){
				msgAlarm();
			}, 60000);
		});
	</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	top: 125%;
	right: -280%;
}

#userProfileMini {
	display: inline-block;
	height: 57px;
	width: 57px;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	overflow: hidden;
	/* 	white-space: nowrap;
	text-overflow: ellipsis; */
	word-break: break-all;
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
					<a href="home" class="nav-link">Home</a>
				</li>
				<li class="nav-item d-none d-sm-inline-block">
					<a href="javascript:contact();" class="nav-link">Contact</a>
				</li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				
				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown">
					<c:if test="${ loginUser != null }">
						<a id="chat" class="nav-link" data-toggle="dropdown" href="#">
							<i class="far fa-comments" title=""></i>
							<input id="bool" type="hidden" value="false">
						</a>
						<script>
							// 채팅창 띄우기
							var winHeight = document.body.clientHeight;
							var winWidth = document.body.clientWidth;
							var winX = window.screenLeft;
							var winY = window.screenTop;
							
							var h = winY + (winHeight - 380) / 2;
							var w = winX + (winWidth - 400) / 2;
							
							$('#chat').on('click', function(){
								window.open("goRoom.ch", "chatting", "top=" + h + ", left=" + w + ", width=400, height=380, status=no,toolbars=no,scrollbars=no, resizable=no");
							});
						</script>
					</c:if>
					<c:if test="${ loginUser == null }">
<!-- 						<a href="loginForm.me" class="nav-link" id="chat" onclick="alert('로그인 후 이용해주세요');"> -->
<!-- 							<i class="far fa-comments" title=""></i> -->
<!-- 						</a> -->
						<a class="nav-link" id="chat" onclick="goLogin();">
							<i class="far fa-comments" title=""></i>
						</a>
					</c:if>
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
			<h1>
				<a href="/codemoa" class="brand-link">
					<span class="brand-image im ml-2">🗿</span>
					<span class="brand-text logotext">CODEMOA‍</span>
				</a>
			</h1>
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
						<c:url var="mypage" value="mypage.me">
							<c:param name="userId" value="${ loginUser.id }" />
						</c:url>

						<div id="userProfileMini" class="text-center img-circle elevation-2 userImg">
							<span style="line-height: 57px;"> ${ loginUser.nickName } </span>
						</div>

						<div class="info">
							<h5>
								<a href="${ mypage }"> ${ loginUser.nickName }</a>
							</h5>
						</div>
					</c:if>
				</div>

				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

						<li class="nav-item menu-open">
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

						<li class="nav-item menu-open">
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
									<a href="crawling.bo" class="nav-link"> Job </a>
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

	<!-- jQuery -->
   <script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
   <!-- Bootstrap 4 -->
   <script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- AdminLTE App -->
   <script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="/codemoa/resources/dist/js/demo.js"></script>
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
		
$('#msgBadge').text();
		
		function msgAlarm(){
			if('${loginUser.id}' != null){
				
			$.ajax({
				url:'msgAlarm.ms',
				data: {
					id:'${loginUser.id}'
				}, success:function(data){
					// console.log(data);
					if(data != 0){
						$('#msgBadge').text(data);						
					}
				}
			});
			}
		}
		
		$(function(){
			random();
			msgAlarm();
			userImg();
			
			setInterval(function(){
				msgAlarm();
			}, 60000);
			
			
		});
		
		function random(){
			var back_R = Math.floor(Math.random() * 256);
			var back_G = Math.floor(Math.random() * 256);
			var back_B = Math.floor(Math.random() * 256);

			var font_R = Math.floor(Math.random() * 256);
			var font_G = Math.floor(Math.random() * 256);
			var font_B = Math.floor(Math.random() * 256);
			
			var backColor = 'rgb(' + back_R + ', ' + back_G + ', ' + back_B + ')';
			var fontColor = 'rgb(' + font_R + ', ' + font_G + ', ' + font_B + ')';
			
			$('.userImg').css({
				'background-color': backColor,
				'color' :fontColor
			});
		}
		
		function userImg(){
			$.ajax({
				url:'profileImg.me',
				data:{userId: '${loginUser.id}'},
				success:function(data){
					if(data != 'none'){
						$("#userProfileMini span").text("");
						$("#userProfileMini").css({"background-image" :"url(/codemoa/resources/userProfile/"+data+")"});
					}
				}
			});
		}
		
		function contact(){
			console.log('contact!!');
			Swal.fire({
				  title: '모두를 위한 코딩 커뮤니티, <br>코드모아입니다.',
				  text: '광고문의  codemoa0916@gmail.com',
				  width: 600,
				  padding: '3em',
				  background: '#fff url(https://sweetalert2.github.io//images/trees.png)',
				  backdrop: 'rgba(143, 188, 147, 0.9) url("/codemoa/resources/img/mo.gif") center top no-repeat',
				  showClass: {
					    popup: 'animate__animated animate__fadeInDown'
				  },
				  hideClass: {
					  popup: 'animate__animated animate__fadeOutUp'
				  
				  }
			})
		}
		
		function goLogin(){
			Swal.fire({
			  title: '로그인 후 이용해주세요!',
			  icon: 'warning',
			}).then((result) => {
			  if (result.isConfirmed) {
					location.href='loginForm.me'; 
			  }
			});
		}
		
	</script>
	
</body>
</html>

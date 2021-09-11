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
					<a href="index.jsp" class="nav-link">Home</a>
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
			<a href="index.jsp" class="brand-link">
				<img src="/codemoa/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">CODE MOA</span>
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
						<c:url var="mypage" value="mypage.me">
							<c:param name="userId" value="${ loginUser.id }"/>
							<c:param name="side" value="Y"/>
						</c:url>
					
						<div id="userProfileMini" class="text-center img-circle elevation-2 userImg">
							<h6 style="line-height: 50px;">
								<b>${ loginUser.nickName }</b>
							</h6>
						</div>
						
						<div class="info">
							<h5>
								<a href="${ mypage }" class="d-block" style="line-height:50px;">
									${ loginUser.nickName }
								</a>
							</h5>
						</div>
					</c:if>
				</div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
               <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                  <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
				
				 <li class="nav-item">
                     <a onclick="location.href='adminPage.ad'" class="nav-link">
                        <i class="nav-icon fab fa-github"></i>
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
                              <p>사용자 관리</p>
                           </a>
                        </li>
                        <li class="nav-item">
                           <a href="adminReportMember.ad" class="nav-link">
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
                              <p>게시판 관리</p>
                           </a>
                        </li>
                     </ul>
                     
                     <ul class="nav nav-treeview">
                        <li class="nav-item">
                           <a href="adminReportBoard.ad" class="nav-link">
                              <p>신고된 게시글</p>
                           </a>
                        </li>
                     </ul>
                  </li>

                  <li class="nav-item">
                     <a onclick="location.href='/codemoa/'" class="nav-link">
                        <i class="nav-icon fab fa-medium"></i>
                        <p>사용자 메인 화면</p>
                     </a>
                  </li>
<!--                    <li class="nav-item"> -->
<!--                      <a onclick="location.href='adminCalendar.ad'" class="nav-link"> -->
<!--                         <i class="nav-icon fa fa-calendar"></i> -->
<!--                         <p>캘린더 관리</p> -->
<!--                      </a> -->
<!--                   </li> -->

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
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
		
		$(function(){
			random();
			userImg();
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
					if('${userImg}' != 'none'){
					console.log(data);
						$("#userProfileMini span").text("");
						$("#userProfileMini").css({"background-image" :"url(/codemoa/resources/userProfile/"+data+")"});
					}
				}
			});
		}
		
	</script>

</body>
</html>
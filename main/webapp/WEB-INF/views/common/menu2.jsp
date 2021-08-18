<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<style>
#logoutBtn {
	position: absolute;
	bottom: 10px;
	font-weight: bold;
}

#logoutBtn i {
	float: right;
}

#logoutBtn:hover {
	background-color: rgba(255, 255, 255, .1);
	color: #fff;
}
</style>


</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<c:set var="chatOnOff" value="false" scope="application"/>
	
	<div class="wrapper">

		<!-- Preloader -->
		<div class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="/codemoa/resources/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
		</div>

		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" data-widget="pushmenu" href="#" role="button">
						<i class="fas fa-bars"></i>
					</a>
				</li>
				<li class="nav-item d-none d-sm-inline-block">
					<a href="index.html" class="nav-link">Home</a>
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
						<form class="form-inline">
							<div class="input-group input-group-sm">
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

				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown">
					<a class="nav-link" data-toggle="dropdown" href="#">
						<i class="far fa-bell"></i>
						<span class="badge badge-warning navbar-badge">15</span>
					</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header">15 Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="fas fa-envelope mr-2"></i>
							4 new messages <span class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="fas fa-users mr-2"></i>
							8 friend requests <span class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="fas fa-file mr-2"></i>
							3 new reports <span class="float-right text-muted text-sm">2 days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-widget="fullscreen" href="#" role="button">
						<i class="fas fa-expand-arrows-alt"></i>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
						<i class="fas fa-th-large"></i>
					</a>
				</li>
				
				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown">
					<a class="nav-link" data-toggle="dropdown" href="#">
						<i class="far fa-comments"></i>
						<span class="badge badge-danger navbar-badge">3</span>
					</a>
					<div class="dropdown-menu" id="chat" style="width: 450px; height:0px;">
<!-- 					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right"> -->
						<!-- 채팅창 -->
				        <div class="row">
				          <div class="col-md-3">
				            <!-- DIRECT CHAT WARNING -->
				            <div class="card card-warning direct-chat direct-chat-warning" style="width: 448px;">
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
				                  <button type="button" class="btn btn-tool" data-card-widget="remove">
				                    <i class="fas fa-times"></i>
				                  </button>
				                </div>
				              </div>
				              <!-- /.card-header -->
				              <div class="card-body">
				                <!-- Conversations are loaded here -->
				                <div class="direct-chat-messages">
				                  <!-- Message. Default to the left -->
				                  <div class="direct-chat-msg">
				                    <div class="direct-chat-infos clearfix">
				                      <span class="direct-chat-name float-left">Alexander Pierce</span>
				                      <span class="direct-chat-timestamp float-right">23 Jan 2:00 pm</span>
				                    </div>
				                    <!-- /.direct-chat-infos -->
				                    <img class="direct-chat-img" src="resources/dist/img/user1-128x128.jpg" alt="Message User Image">
				                    <!-- /.direct-chat-img -->
				                    <div class="direct-chat-text">
				                      Is this template really for free? That's unbelievable!
				                    </div>
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
				                    <div class="direct-chat-text">
				                      You better believe it!
				                    </div>
				                    <!-- /.direct-chat-text -->
				                  </div>
				                  <!-- /.direct-chat-msg -->
				                </div>
				                <!--/.direct-chat-messages-->
				
				                <!-- Contacts are loaded here -->
				                <div class="direct-chat-contacts">
				                  <ul class="contacts-list">
				                    <li>
				                      <a href="#">
				                        <img class="contacts-list-img" src="../dist/img/user1-128x128.jpg" alt="User Avatar">
				
				                        <div class="contacts-list-info">
				                          <span class="contacts-list-name">
				                            Count Dracula
				                            <small class="contacts-list-date float-right">2/28/2015</small>
				                          </span>
				                          <span class="contacts-list-msg">How have you been? I was...</span>
				                        </div>
				                        <!-- /.contacts-list-info -->
				                      </a>
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
				          <!-- /.col -->
				        </div>
				        <!-- /.row -->
						
<!-- 						<a href="#" class="dropdown-item"> -->
<!-- 							<div class="media"> -->
<!-- 								<img src="/codemoa/resources/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle"> -->
<!-- 								<div class="media-body"> -->
<!-- 									<h3 class="dropdown-item-title"> -->
<!-- 										Brad Diesel <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span> -->
<!-- 									</h3> -->
<!-- 									<p class="text-sm">Call me whenever you can...</p> -->
<!-- 									<p class="text-sm text-muted"> -->
<!-- 										<i class="far fa-clock mr-1"></i> -->
<!-- 										4 Hours Ago -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</a> -->
<!-- 						<div class="dropdown-divider"></div> -->
<!-- 						<a href="#" class="dropdown-item"> -->
<!-- 							<div class="media"> -->
<!-- 								<img src="/codemoa/resources/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3"> -->
<!-- 								<div class="media-body"> -->
<!-- 									<h3 class="dropdown-item-title"> -->
<!-- 										John Pierce <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span> -->
<!-- 									</h3> -->
<!-- 									<p class="text-sm">I got your message bro</p> -->
<!-- 									<p class="text-sm text-muted"> -->
<!-- 										<i class="far fa-clock mr-1"></i> -->
<!-- 										4 Hours Ago -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</a> -->
<!-- 						<div class="dropdown-divider"></div> -->
<!-- 						<a href="#" class="dropdown-item"> -->
<!-- 							<div class="media"> -->
<!-- 								<img src="/codemoa/resources/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3"> -->
<!-- 								<div class="media-body"> -->
<!-- 									<h3 class="dropdown-item-title"> -->
<!-- 										Nora Silvester <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span> -->
<!-- 									</h3> -->
<!-- 									<p class="text-sm">The subject goes here</p> -->
<!-- 									<p class="text-sm text-muted"> -->
<!-- 										<i class="far fa-clock mr-1"></i> -->
<!-- 										4 Hours Ago -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</a> -->
<!-- 						<div class="dropdown-divider"></div> -->
<!-- 						<a href="#" class="dropdown-item dropdown-footer">See All Messages</a> -->
					</div>
				</li>
				
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="home.do" class="brand-link">
				<img src="/codemoa/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> <span class="brand-text font-weight-light">CODEMOA</span>
			</a>


			<!-- Sidebar -->
			<div class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<c:if test="${ loginUser == null }">
				        <div class="info">
				          <a href="loginForm.me" class="d-block">로그인을 해주세요</a>
				        </div>
			        </c:if>
			        <c:if test="${ loginUser != null }">
				        <div class="image">
				          <img src="resources/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
				        </div>
				        <div class="info">
				          <a href="#" class="d-block">Alexander Pierce</a>
				        </div>
			        </c:if>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

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
									<a href="pages/tables/simple.html" class="nav-link">
										<p>Q&A</p>
									</a>
								</li>
								<li class="nav-item">
									<a href="pages/examples/faq.html" class="nav-link">
										<p>Tips</p>
									</a>
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
									<a href="pages/examples/projects.html" class="nav-link">
										<p>Study</p>
									</a>
								</li>
								<li class="nav-item">
									<a href="pages/calendar.html" class="nav-link">
										<p>Calendar</p>
									</a>
								</li>
								<li class="nav-item">
									<a href="pages/mailbox/mailbox.html" class="nav-link">
										<p>Job</p>
									</a>
								</li>
							</ul>
						</li>

						<li class="nav-item">
							<a href="gittrending.html" class="nav-link">
								<i class="nav-icon fab fa-github"></i>
								<p>Git Trending</p>
							</a>
						</li>
						
						<li class="nav-item">
							<a href="chat.bo" class="nav-link">
<!-- 								<i class="nav-icon fab fa-github"></i> -->
								<p>Chat</p>
							</a>
						</li>
					</ul>

				</nav>
				<a href="#" id="logoutBtn" class="nav-link">
					LOGOUT
					<i class="fas fa-sign-out-alt right"></i>
				</a>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>


		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>

	</div>

	<script>
// 		$(function(){
// 			$('.chat').on('click', function(){
// 				alert('테스트');
// 			});
// 		});
	</script>

	<!-- jQuery -->
	<script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="/codemoa/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="/codemoa/resources/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script src="/codemoa/resources/plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script src="/codemoa/resources/plugins/jqvmap/jquery.vmap.min.js"></script>
	<script src="/codemoa/resources/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="/codemoa/resources/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="/codemoa/resources/plugins/moment/moment.min.js"></script>
	<script src="/codemoa/resources/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script src="/codemoa/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="/codemoa/resources/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script src="/codemoa/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/codemoa/resources/dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/codemoa/resources/dist/js/demo.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="/codemoa/resources/dist/js/pages/dashboard.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 수정</title>

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
	input[type=radio]:checked + label {color:white; background-color:gray;}
	input[type=radio]{display:none;}
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
					<a href="home.do" class="nav-link">Home</a>
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
							4 new messages
							<span class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="fas fa-users mr-2"></i>
							8 friend requests
							<span class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="fas fa-file mr-2"></i>
							3 new reports
							<span class="float-right text-muted text-sm">2 days</span>
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
					<c:if test="${ loginUser == null }">
						<div class="info">
							<a href="loginForm.me" class="d-block">로그인을 해주세요</a>
						</div>
					</c:if>

					<c:if test="${ loginUser != null }">
					<c:url var="mypage" value="mypage.me">
						<c:param name="user" value="${ loginUser.email }"/>
					</c:url>
						<div class="image">
							<img src="resources/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
						</div>
						<div class="info">
							<a href="${ mypage }" class="d-block">${ loginUser.name }</a>
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
                     <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-code"></i>
                        <p>
                           	사용자 관리
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
                           <a href="pages/tables/simple.html" class="nav-link">
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
                           <a href="pages/examples/projects.html" class="nav-link">
                              <p>신고된 게시글</p>
                           </a>
                        </li>
                     </ul>
                  </li>

                  <li class="nav-item">
                     <a onclick="location.href='adminCalendar.ad'" class="nav-link">
                        <i class="nav-icon fab fa-github"></i>
                        <p>캘린더 관리</p>
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



      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
         <!-- Control sidebar content goes here -->
      </aside>
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>권한 수정</h1>
					</div>
				</div>
			</div><!-- /.container-fluid -->
		</section>
    
		<section class="content">
			<form action="adminMember.ad" onsubmit="return update();">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header d-flex p-0">
									<h3 class="card-title p-3">사용자 list</h3>
									<ul class="nav nav-pills ml-auto p-2">
										<li class="nav-item">
											<div class="btn-group">
						                        <button type="button" class="btn btn-default btn-sm click">전체</button>
						                        <button type="button" class="btn btn-default btn-sm">탈퇴</button>
						                        <button type="button" class="btn btn-default btn-sm">사용자</button>
						                        <button type="button" class="btn btn-default btn-sm">운영자</button>
						                    </div>
										</li>
										<li>&ensp;</li>
										<li class="nav-item">
											<div class="card-tools">         
					                           <div class="input-group input-group-sm" style="width: 150px;">
					                              <input type="text" class="form-control float-right" placeholder="Search">
					                              <div class="input-group-append">
					                                 <button type="button" class="btn btn-default" onclick="">
					                                 <i class="fas fa-search"></i>
					                              </button>
					                              </div>
					                           </div>
					                        </div>
					                	</li>
										<li>&ensp;</li>
										<li class="nav-item">
											<button type="submit" class="btn btn-block btn-warning btn-sm">수정하기</button>
										</li>									
									</ul>
								</div>
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table class="table table-hover text-nowrap">
										<thead>
											<tr>
												<th>ID</th>
												<th>이름</th>
												<th>닉네임</th>
												<th>연락처</th>
												<th>이메일</th>
												<th>권한</th>
												<th>탈퇴</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													2108
													<input type="hidden" name="id" value="${ user.id }">
												</td>
												<td>
													rosegold
													<input type="hidden" name="name" value="${ user.name }">
												</td>
												<td>
													rose
													<input type="hidden" name="nickName" value="${ user.nickName }">
												</td>
												<td>
													<input type="tel" name="phone" value="01011112222" class="form-control form-control-sm">
												</td>
												<td>
													<input type="email" name="email" value="rose@rose.com" class="form-control form-control-sm">
												</td>
												<td>
													<div class="input-group-sm">
									                   <select name="admin" class="form-control">
									                     <option>사용자</option>
									                     <option>운영자</option>
									                    </select>
									                 </div>
												</td>
												<td>
													<div class="btn-group">
														<input type="radio" name="status" id="statusY" checked/>
														<label for="statusY" class="btn btn-default btn-sm my-0 py-0">Y</label>
														<input type="radio" name="status" id="statusN"/>
														<label for="statusN" class="btn btn-default btn-sm my-0 py-0">N</label>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
								<div class="card-footer clearfix">
									<div class="card-tools d-flex justify-content-center">
										<ul class="pagination pagination-sm m-0 float-right">
											<li class="page-item"><a class="page-link" href="#">&laquo;</a>
											<li class="page-item"><a class="page-link" href="#">1</a>
											<li class="page-item"><a class="page-link" href="#">2</a>
											<li class="page-item"><a class="page-link" href="#">3</a>
											<li class="page-item"><a class="page-link" href="#">&raquo;</a>
										</ul>
									</div>
								</div>
							<!-- /.card -->
							</div>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div> 
	</div>
	
	<script>
		function update() {
			if(confirm("정말 수정하시겠습니까?") == true){
			     alert("사용자 권한 수정이 완료되었습니다");
			     return true;
			 }else{
			     return false;
			 }
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" href="${contextPath}/codemoa/resources/css/admin.css" type="text/css">
<!-- <link rel="stylesheet" href="/codemoa/resources/dist/css/admin.css"> -->
<link rel="stylesheet" href="/codemoa/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/codemoa/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="/codemoa/resources/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="/codemoa/resources/plugins/summernote/summernote-bs4.min.css">
 <!-- fullCalendar -->
  <link rel="stylesheet" href="/codemoa/resources/plugins/fullcalendar/main.css">


<style>
/* css작동 안해서 여기서 작성 */
/* 사용자 상태  */
#userStatus{
	width: 1500px;
	height: 500px;
	border: 1px solid black;
	margin-left: 15px;
/* 	background-color: white; */
}

.crd-body {
    min-height: 1px;
    padding: 1.25rem;
	width: 1500px;
}

/* .jsgrid-row100 { */
/* 	width: 1200px; */
/* } */

/* .jsgrid-pager-container{ */
/* 	width: 1200px;	 */
/* } */

/* 게시글 상태 */
#userBoard{
	width: 1500px;
	height: 500px;
	border: 1px solid black;
	margin-left: 15px;
	background-color: white;
}

/* 달력 */
.adminCalender {
	
/* 	background-color: white; */
	width: 1600px;
	height: 580px;
/* 	border: 1px solid black; */
	margin-left: 5px;
/* 	margin-left: 750px; */
}


.cal-md-9 {
    width: 780px;
	height: 580px;
 }
.card {
   	width: 780px;
	height: 585px;
   }
   
.card {
    /* box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%); */
    margin-bottom: 1rem;
}
.card {
    position: relative;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: 0.25rem;
}
/* #calendar{ */
/* 	width: 780px; */
/* 	height: 580px; */
/* } */
#calendar{
	width: 1500px;
	height: 580px;
}
/* 로그아웃 */
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

/* 상태체크박스 */
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
      
	<div class="content-wrapper">
		<div class="content-header">
      	<div class="container-fluid">
        	<div class="row mb-2">
          	<div class="col-sm-6">
            	<h1 class="m-0">관리자 메인페이지</h1>
          	</div><!-- /.col -->
          	<div class="col-sm-6">
            	<ol class="breadcrumb float-sm-right">
              	<li class="breadcrumb-item"><a href="#">Home</a></li>
              	<li class="breadcrumb-item active">Dashboard v1</li>
            	</ol>
          	</div><!-- /.col -->
        	</div><!-- /.row -->
      	</div>
      	<!-- /.container-fluid -->
    	</div>
    	<!-- /.content-header -->
	<section class="content">
      <div class="container-fluid">
        <div class="row">
        <!-- Small boxes (Stat box) -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>총 회원수</h3>

                <p>${ mi.listCountM } 명</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>총 게시물 수</h3>
                <p> ${ pi.listCount } 개</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>캘린더 일정</h3>

                <p>User Registrations</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>광고수</h3>

                <p>개</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
         </div>
         <!-- 상단 카드 빨주노초 -->
        
        <!-- 합체시도중 -->
       		<section class="content" style="width: 1600px; height: 500px; margin-left: 5px;">
			<form action="#" onsubmit="return update();">
				<div class="container-fluid" style="width: 1600px; height: 500px;">
					<div class="row" style="width: 1600px; height: 500px;">
						<div class="col-12" style="width: 1600px; height: 500px;">
							<div class="card" style="width: 1600px; height: 500px;">
								<div class="card-header d-flex p-0">
									<h3 class="card-title p-3">사용자 글 목록</h3>
									<ul class="nav nav-pills ml-auto p-2">
										<li class="nav-item">
											<div class="btn-group">
						                        <button type="button" class="btn btn-default btn-sm">전체</button>
						                        <button type="button" class="btn btn-default btn-sm">신고</button>
						                        <button type="button" class="btn btn-default btn-sm">Tech</button>
						                        <button type="button" class="btn btn-default btn-sm">Community</button>
						                        <button type="button" class="btn btn-default btn-sm">Git Trending</button>
						                    </div>
										</li>
										<li>&ensp;</li>
										<li class="nav-item">
											<div class="card-tools">         
					                           <div class="input-group input-group-sm" style="width: 150px;">
					                              <input type="text" class="form-control float-right" placeholder="Search">
					                              <div class="input-group-append">
					                                 <button type="button" class="btn btn-default">
					                                 <i class="fas fa-search"></i>
					                              </button>
					                              </div>
					                           </div>
					                        </div>
					                	</li>
					                	<li>&ensp;</li>			
									</ul>
								</div>
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>NO</th>
												<th>Type</th>
												<th>ID</th>
												<th>제목</th>
												<th>작성일</th>
												<th>Status</th>
												<th>신고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<c:forEach var="b" items="${ bList }">
								        			<tr class="jsgrid-row">
								        				<td>${ b.bNo }</td>
								        				<td>${ b.bType }</td>
								        				<td>${ b.bWriter }</td>
								        				<td>${ b.bTitle }</td>
								        				<td>${ b.bDate }</td>
														<c:choose>
															<c:when test="${ b.bStatus =='Y'}">
															<td>
																<div class="btn-group">
																	<input type="radio" name="statusY" id="statusY" checked/>
																	<label for="statusY" class="btn btn-default btn-sm my-0 py-0">Y</label>
																	<input type="radio" name="statusN" id="statusN"/>
																	<label for="statusN" class="btn btn-default btn-sm my-0 py-0">N</label>
																</div>
															</td>
															</c:when>	
															<c:otherwise>																	
										        				<td>
																<div class="btn-group">
																	<input type="radio" name="statusY" id="statusY"/>
																	<label for="statusY" class="btn btn-default btn-sm my-0 py-0">Y</label>
																	<input type="radio" name="statusN" id="statusN" checked/>
																	<label for="statusN" class="btn btn-default btn-sm my-0 py-0">N</label>
																</div>
															</td>
															</c:otherwise>
														</c:choose>			
														<td>◎</td>
								        		</c:forEach>
								        		</tr>
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
								<div class="card-footer clearfix">
									<div class="card-tools d-flex justify-content-center">
									<ul class="pagination pagination-sm m-0">						
											<!-- [이전] -->
												<c:if test="${ pi.currentPage <= 1 }">
													<li class="page-item"><a class="page-link">&laquo;</a>
												</c:if>
												<c:if test="${ pi.currentPage > 1 }">
													<c:url var="before" value="adminPage.ad">
														<c:param name="page" value="${ pi.currentPage - 1 }"/>
													</c:url>
													<li class="page-item"><a href="${ before }" class="page-link">&laquo;</a>
												</c:if>
															
												<!-- 페이지 -->
												<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
													<c:if test="${ p eq pi.currentPage }">
														<li class="page-item"><a class="page-link" style="color: red;">${ p }</a>
													</c:if>
															
													<c:if test="${ p ne pi.currentPage }">
														<c:url var="pagination" value="adminPage.ad">
															<c:param name="page" value="${ p }"/>
														</c:url>
														<li class="page-item"><a href="${ pagination }" class="page-link">${ p }</a>
													</c:if>	
												</c:forEach>
														
												<!-- [다음] -->
												<c:if test="${ pi.currentPage >= pi.maxPage }">
													<li class="page-item"><a class="page-link">&raquo;</a>
												</c:if>
												<c:if test="${ pi.currentPage < pi.maxPage }">
													<c:url var="after" value="adminPage.ad">
														<c:param name="page" value="${ pi.currentPage + 1 }"/>
													</c:url> 
													<li class="page-item"><a href="${ after }" class="page-link">&raquo;</a>
												</c:if>
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
         
        <br> 
        
         <section class="content" style="width: 1600px; height: 500px; margin-left: 5px;">
			<form action="#" onsubmit="return update();">
				<div class="container-fluid" style="width: 1600px; height: 500px;">
					<div class="row" style="width: 1600px; height: 500px;">
						<div class="col-12" style="width: 1600px; height: 500px;">
							<div class="card" style="width: 1600px; height: 500px;">
								<div class="card-header d-flex p-0">
									<h3 class="card-title p-3">회원 정보</h3>
									<ul class="nav nav-pills ml-auto p-2">
										<li class="nav-item">
											<div class="btn-group">
						                        <button type="button" class="btn btn-default btn-sm">전체</button>
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
					                                 <button type="button" class="btn btn-default">
					                                 <i class="fas fa-search"></i>
					                              </button>
					                              </div>
					                           </div>
					                        </div>
					                	</li>
					                	<li>&ensp;</li>
									</ul>
								</div>
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>ID</th>
												<th>Nick</th>
												<th>이름</th>
												<th>가입일? 소개?</th>
												<th>관리자</th>
												<th>Status</th>
												<th>신고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<c:forEach var="m" items="${ mList }">
								        			<tr class="jsgrid-row">
								        				<td>${ m.email }</td>
								        				<td>${ m.nickName }</td>
								        				<td>${ m.name }</td>
								        				<td>${ m.email }</td>
								        				<td>${ m.admin }</td>
										        		<c:choose>
															<c:when test="${ m.status =='Y'}">
															<td>
																<div class="btn-group">
																	<input type="radio" name="statusY" id="statusY" checked/>
																	<label for="statusY" class="btn btn-default btn-sm my-0 py-0">Y</label>
																	<input type="radio" name="statusN" id="statusN"/>
																	<label for="statusN" class="btn btn-default btn-sm my-0 py-0">N</label>
																</div>
															</td>
															</c:when>	
															<c:otherwise>																	
										        				<td>
																<div class="btn-group">
																	<input type="radio" name="statusY" id="statusY"/>
																	<label for="statusY" class="btn btn-default btn-sm my-0 py-0">Y</label>
																	<input type="radio" name="statusN" id="statusN" checked/>
																	<label for="statusN" class="btn btn-default btn-sm my-0 py-0">N</label>
																</div>
															</td>
															</c:otherwise>
														</c:choose>							
													<td>◎</td>
								        		</c:forEach>
								        	</tr>
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
								<div class="card-footer clearfix">
									<div class="card-tools d-flex justify-content-center">
										<ul class="pagination pagination-sm m-0">						
											<!-- [이전] -->
												<c:if test="${ mi.currentPageM <= 1 }">
													<li class="page-item"><a class="page-link">&laquo;</a>
												</c:if>
												<c:if test="${ mi.currentPageM > 1 }">
													<c:url var="before" value="adminPage.ad">
														<c:param name="pageM" value="${ mi.currentPageM - 1 }"/>
													</c:url>
													<li class="page-item"><a href="${ before }" class="page-link">&laquo;</a>
												</c:if>
															
												<!-- 페이지 -->
												<c:forEach var="m" begin="${ mi.startPageM }" end="${ mi.endPageM }">
													<c:if test="${ m eq mi.currentPageM }">
														<li class="page-item"><a class="page-link" style="color: red;">${ m }</a>
													</c:if>
															
													<c:if test="${ m ne mi.currentPageM }">
														<c:url var="pagination" value="adminPage.ad">
															<c:param name="pageM" value="${ m }"/>
														</c:url>
														<li class="page-item"><a href="${ pagination }" class="page-link">${ m }</a>
													</c:if>	
												</c:forEach>
														
												<!-- [다음] -->
												<c:if test="${ mi.currentPageM >= mi.maxPageM }">
													<li class="page-item"><a class="page-link">&raquo;</a>
												</c:if>
												<c:if test="${ mi.currentPageM < mi.maxPageM }">
													<c:url var="after" value="adminPage.ad">
														<c:param name="pageM" value="${ mi.currentPageM + 1 }"/>
													</c:url> 
													<li class="page-item"><a href="${ after }" class="page-link">&raquo;</a>
												</c:if>
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
  
 		 <br>
       
         <div class="adminCalender">
         <section class="content" style="width: 1600px; height: 500px; margin-left: 5px;">
          <div class="cal-md-9" style="width: 1600px; height: 580px;">
            <div class="card card-primary" style="width: 1600px; height: 580px;">
              <div class="card-body p-0" style="width: 1600px; height: 580px;">
<!--                 THE CALENDAR -->
                <div id="calendar" class="fc fc-media-screen fc-direction-ltr fc-theme-bootstrap">
                <div class="fc-header-toolbar fc-toolbar fc-toolbar-ltr" style="width: 1600px;">
                <div class="fc-toolbar-chunk">
                <div class="btn-group">
                <button class="fc-prev-button btn btn-primary" type="button" aria-label="prev">
                <span class="fa fa-chevron-left"></span>
                </button>
                <button class="fc-next-button btn btn-primary" type="button" aria-label="next">
                <span class="fa fa-chevron-right"></span>
                </button>
                </div>
                <button disabled="" class="fc-today-button btn btn-primary" type="button">today</button>
                </div>
                <div class="fc-toolbar-chunk">
                <h2 class="fc-toolbar-title">August 2021</h2>
                </div><div class="fc-toolbar-chunk"
                ><div class="btn-group">
                <button class="fc-dayGridMonth-button btn btn-primary active" type="button">month</button>
                <button class="fc-timeGridWeek-button btn btn-primary" type="button">week</button>
                <button class="fc-timeGridDay-button btn btn-primary" type="button">day</button>
                </div>
                </div>
                </div>
                <div class="fc-view-harness fc-view-harness-active" style="height: 557.037px;">
                <div class="fc-daygrid fc-dayGridMonth-view fc-view">
                <table class="fc-scrollgrid table-bordered fc-scrollgrid-liquid" style="width: 1600px;">
                	<thead>
                	<tr class="fc-scrollgrid-section fc-scrollgrid-section-header ">
                		<td>
                			<div class="fc-scroller-harness">
                			<div class="fc-scroller" style="overflow: hidden;">
                			<table class="fc-col-header " style="width: 1600px;">
                			<colgroup></colgroup>
                			<tbody>
                				<tr>
                					<th class="fc-col-header-cell fc-day fc-day-sun">
                						<div class="fc-scrollgrid-sync-inner">
                						<a class="fc-col-header-cell-cushion ">Sun</a>
                						</div>
                					</th>
                					<th class="fc-col-header-cell fc-day fc-day-mon">
	                					<div class="fc-scrollgrid-sync-inner">
	                					<a class="fc-col-header-cell-cushion ">Mon</a>
	                					</div>
                					</th>
                					<th class="fc-col-header-cell fc-day fc-day-tue">
	                					<div class="fc-scrollgrid-sync-inner">
	                					<a class="fc-col-header-cell-cushion ">Tue</a>
	                					</div>
                					</th>
                					<th class="fc-col-header-cell fc-day fc-day-wed">
	                					<div class="fc-scrollgrid-sync-inner">
	                					<a class="fc-col-header-cell-cushion ">Wed</a>
	                					</div>
                					</th>
                					<th class="fc-col-header-cell fc-day fc-day-thu">
	                					<div class="fc-scrollgrid-sync-inner">
	                					<a class="fc-col-header-cell-cushion ">Thu</a>
	                					</div>
                					</th>
                					<th class="fc-col-header-cell fc-day fc-day-fri">
	                					<div class="fc-scrollgrid-sync-inner">
	                					<a class="fc-col-header-cell-cushion ">Fri</a>
	                					</div>
                					</th>
                					<th class="fc-col-header-cell fc-day fc-day-sat">
                						<div class="fc-scrollgrid-sync-inner">
                						<a class="fc-col-header-cell-cushion ">Sat</a>
                						</div>
                					</th>
                				</tr>
                				</tbody>
                			</table>
                			</div>
                			</div>
                		</td>
                		</tr>
                		</thead>
                		<tbody>
                			<tr class="fc-scrollgrid-section fc-scrollgrid-section-body  fc-scrollgrid-section-liquid">
                			<td>
	                			<div class="fc-scroller-harness fc-scroller-harness-liquid">
	                			<div class="fc-scroller fc-scroller-liquid-absolute" style="overflow: hidden auto;">
	                			<div class="fc-daygrid-body fc-daygrid-body-unbalanced " style="width: 762px;">
                			<table class="fc-scrollgrid-sync-table" style="width: 1600px; height: 580px;"> <!-- 여기가 달력 사이즈 -->
                			<colgroup></colgroup>
                			<tbody>
                			<tr>
                				<td class="fc-daygrid-day fc-day fc-day-sun fc-day-past" data-date="2021-08-01">
	                				<div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
	                				<div class="fc-daygrid-day-top">
	                				<a class="fc-daygrid-day-number">1</a>
                				</div>
	                				<div class="fc-daygrid-day-events">
	                				<div class="fc-daygrid-event-harness">
	                			<a class="fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-past" style="border-color: rgb(245, 105, 84); background-color: rgb(245, 105, 84);"><div class="fc-event-main"><div class="fc-event-main-frame"><div class="fc-event-title-container">
	                				<div class="fc-event-title fc-sticky">All Day Event</div>
	                				</div>
	                				</div>
	                				</div>
                					<div class="fc-event-resizer fc-event-resizer-end"></div>
                				</a>
                				</div>
                				</div>
                				<div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-mon fc-day-past" data-date="2021-08-02"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">2</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-tue fc-day-past" data-date="2021-08-03"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">3</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-past" data-date="2021-08-04"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">4</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-thu fc-day-past" data-date="2021-08-05"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">5</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-fri fc-day-past" data-date="2021-08-06"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">6</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-past" data-date="2021-08-07"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">7</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td></tr><tr><td class="fc-daygrid-day fc-day fc-day-sun fc-day-past" data-date="2021-08-08"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">8</a></div><div class="fc-daygrid-day-events" style="padding-bottom: 25px;"><div class="fc-daygrid-event-harness fc-daygrid-event-harness-abs" style="right: -217.688px;"><a class="fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-draggable fc-event-start fc-event-end fc-event-past" style="border-color: rgb(243, 156, 18); background-color: rgb(243, 156, 18);"><div class="fc-event-main"><div class="fc-event-main-frame"><div class="fc-event-time">12a</div><div class="fc-event-title-container"><div class="fc-event-title fc-sticky">Long Event</div></div></div></div></a></div></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-mon fc-day-past" data-date="2021-08-09"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">9</a></div><div class="fc-daygrid-day-events" style="padding-bottom: 25px;"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-tue fc-day-past" data-date="2021-08-10"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">10</a></div><div class="fc-daygrid-day-events" style="padding-bottom: 25px;"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-past" data-date="2021-08-11"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">11</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-thu fc-day-past" data-date="2021-08-12"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">12</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-fri fc-day-today " data-date="2021-08-13"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">13</a></div><div class="fc-daygrid-day-events"><div class="fc-daygrid-event-harness"><a class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-today"><div class="fc-daygrid-event-dot" style="border-color: rgb(0, 115, 183);"></div><div class="fc-event-time">10:30a</div><div class="fc-event-title">Meeting</div></a></div><div class="fc-daygrid-event-harness"><a class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-today"><div class="fc-daygrid-event-dot" style="border-color: rgb(0, 192, 239);"></div><div class="fc-event-time">12p</div><div class="fc-event-title">Lunch</div></a></div></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2021-08-14"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">14</a></div><div class="fc-daygrid-day-events"><div class="fc-daygrid-event-harness"><a class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-future"><div class="fc-daygrid-event-dot" style="border-color: rgb(0, 166, 90);"></div><div class="fc-event-time">7p</div><div class="fc-event-title">Birthday Party</div></a></div></div><div class="fc-daygrid-day-bg"></div></div></td></tr><tr><td class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2021-08-15"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">15</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2021-08-16"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">16</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2021-08-17"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">17</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2021-08-18"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">18</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2021-08-19"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">19</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-fri fc-day-future" data-date="2021-08-20"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">20</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2021-08-21"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">21</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td></tr><tr><td class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2021-08-22"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">22</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2021-08-23"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">23</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2021-08-24"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">24</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2021-08-25"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">25</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2021-08-26"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">26</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-fri fc-day-future" data-date="2021-08-27"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">27</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2021-08-28"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">28</a></div><div class="fc-daygrid-day-events"><div class="fc-daygrid-event-harness"><a class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-future" href="https://www.google.com/"><div class="fc-daygrid-event-dot" style="border-color: rgb(60, 141, 188);"></div><div class="fc-event-time">12a</div><div class="fc-event-title">Click for Google</div></a></div></div><div class="fc-daygrid-day-bg"></div></div></td></tr><tr><td class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2021-08-29"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">29</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2021-08-30"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">30</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2021-08-31"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">31</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-future fc-day-other" data-date="2021-09-01"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">1</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-thu fc-day-future fc-day-other" data-date="2021-09-02"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">2</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other" data-date="2021-09-03"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">3</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other" data-date="2021-09-04"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">4</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td></tr><tr><td class="fc-daygrid-day fc-day fc-day-sun fc-day-future fc-day-other" data-date="2021-09-05"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">5</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-mon fc-day-future fc-day-other" data-date="2021-09-06"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">6</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-tue fc-day-future fc-day-other" data-date="2021-09-07"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">7</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-future fc-day-other" data-date="2021-09-08"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">8</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-thu fc-day-future fc-day-other" data-date="2021-09-09"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">9</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other" data-date="2021-09-10"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">10</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other" data-date="2021-09-11"><div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number">11</a></div><div class="fc-daygrid-day-events"></div><div class="fc-daygrid-day-bg"></div></div></td></tr></tbody></table></div></div></div></td></tr></tbody></table></div></div></div>
              </div>
<!--               /.card-body -->
            </div>
<!--             /.card -->
          </div>
<!--           /.col      -->
</section>
        </div>
<!--         달력부분 -->
        
        
       	 </div>
       	 <!-- 컨테이너 필드 -->
		</section>
		<!-- 전체 섹션 -->
  <br>
	</div>
     <!-- ./Content-wrapper 콘텐츠 레퍼 -->
  

     
   <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.1.0
    </div>
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>
  
 </div>
 <!-- wrapper all -->
	

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
   
	<!-- fullCalendar 2.2.5 -->
	<script src="/codemoa/resources/plugins/moment/moment.min.js"></script>
	<script src="/codemoa/resources/plugins/fullcalendar/main.js"></script>
	<!-- Page specific script -->
	<!-- jsGrid -->
	<script src="/codemoa/resources//plugins/jsgrid/demos/db.js"></script>
	<script src="/codemoa/resources//plugins/jsgrid/jsgrid.min.js"></script>
	<!-- jQuery -->
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
	</script>
<script>
  $(function () {

    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {

        // create an Event Object (https://fullcalendar.io/docs/event-object)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        }

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject)

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex        : 1070,
          revert        : true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        })

      })
    }

    ini_events($('#external-events div.external-event'))

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()

    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    var containerEl = document.getElementById('external-events');
    var checkbox = document.getElementById('drop-remove');
    var calendarEl = document.getElementById('calendar');

    // initialize the external events
    // -----------------------------------------------------------------

    new Draggable(containerEl, {
      itemSelector: '.external-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText,
          backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
        };
      }
    });

    var calendar = new Calendar(calendarEl, {
      headerToolbar: {
        left  : 'prev,next today',
        center: 'title',
        right : 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      themeSystem: 'bootstrap',
      //Random default events
      events: [
        {
          title          : 'All Day Event',
          start          : new Date(y, m, 1),
          backgroundColor: '#f56954', //red
          borderColor    : '#f56954', //red
          allDay         : true
        },
        {
          title          : 'Long Event',
          start          : new Date(y, m, d - 5),
          end            : new Date(y, m, d - 2),
          backgroundColor: '#f39c12', //yellow
          borderColor    : '#f39c12' //yellow
        },
        {
          title          : 'Meeting',
          start          : new Date(y, m, d, 10, 30),
          allDay         : false,
          backgroundColor: '#0073b7', //Blue
          borderColor    : '#0073b7' //Blue
        },
        {
          title          : 'Lunch',
          start          : new Date(y, m, d, 12, 0),
          end            : new Date(y, m, d, 14, 0),
          allDay         : false,
          backgroundColor: '#00c0ef', //Info (aqua)
          borderColor    : '#00c0ef' //Info (aqua)
        },
        {
          title          : 'Birthday Party',
          start          : new Date(y, m, d + 1, 19, 0),
          end            : new Date(y, m, d + 1, 22, 30),
          allDay         : false,
          backgroundColor: '#00a65a', //Success (green)
          borderColor    : '#00a65a' //Success (green)
        },
        {
          title          : 'Click for Google',
          start          : new Date(y, m, 28),
          end            : new Date(y, m, 29),
          url            : 'https://www.google.com/',
          backgroundColor: '#3c8dbc', //Primary (light-blue)
          borderColor    : '#3c8dbc' //Primary (light-blue)
        }
      ],
      editable  : true,
      droppable : true, // this allows things to be dropped onto the calendar !!!
      drop      : function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
      }
    });

    calendar.render();
    // $('#calendar').fullCalendar()

    /* ADDING EVENTS */
    var currColor = '#3c8dbc' //Red by default
    // Color chooser button
    $('#color-chooser > li > a').click(function (e) {
      e.preventDefault()
      // Save color
      currColor = $(this).css('color')
      // Add color effect to button
      $('#add-new-event').css({
        'background-color': currColor,
        'border-color'    : currColor
      })
    })
    $('#add-new-event').click(function (e) {
      e.preventDefault()
      // Get value and make sure it is not null
      var val = $('#new-event').val()
      if (val.length == 0) {
        return
      }

      // Create events
      var event = $('<div />')
      event.css({
        'background-color': currColor,
        'border-color'    : currColor,
        'color'           : '#fff'
      }).addClass('external-event')
      event.text(val)
      $('#external-events').prepend(event)

      // Add draggable funtionality
      ini_events(event)

      // Remove event from text input
      $('#new-event').val('')
    });
  });
  
// 	Page specific script
//   $(function () {
//     $("#jsGrid1").jsGrid({
//         height: "100%",
//         width: "100%",

//         sorting: true,
//         paging: true,

//         data: db.clients,

//         fields: [
//             { name: "Name", type: "text", width: 150 },
//             { name: "Age", type: "number", width: 50 },
//             { name: "Address", type: "text", width: 200 },
//             { name: "Country", type: "select", items: db.countries, valueField: "Id", textField: "Name" },
//             { name: "Married", type: "checkbox", title: "Is Married" }
//         ]
//     });
//   });
</script>
</body>
</html>
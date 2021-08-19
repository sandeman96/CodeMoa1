<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title>

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

	<c:import url="../common/adminMenu.jsp"/>
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>게시판 관리</h1>
					</div>
				</div>
			</div><!-- /.container-fluid -->
		</section>
    
		<section class="content">
			<form action="adminBoard.bo" onsubmit="return update();">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header d-flex p-0">
									<h3 class="card-title p-3">게시판 list</h3>
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
										<li class="nav-item">
											<button type="submit" class="btn btn-block btn-warning btn-sm">Status 수정</button>
										</li>				
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
												<td>2</td>
												<td>Tech</td>
												<td>rosegold</td>
												<td>KH Final Project, CodeMoa</td>
												<td>8월 15일</td>
												<td>
													<div class="btn-group">
														<input type="radio" name="status" id="statusY" checked/>
														<label for="statusY" class="btn btn-default btn-sm my-0 py-0">Y</label>
														<input type="radio" name="status" id="statusN"/>
														<label for="statusN" class="btn btn-default btn-sm my-0 py-0">N</label>
													</div>
												</td>
												<td>◎</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
								<div class="card-footer clearfix">
									<div class="card-tools d-flex justify-content-center">
										<ul class="pagination pagination-sm m-0">
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
	
	<script>
		function update() {
			if(confirm("정말 수정하시겠습니까?") == true){
			     alert("Status 수정이 완료되었습니다");
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
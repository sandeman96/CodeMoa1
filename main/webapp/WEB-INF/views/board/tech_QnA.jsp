<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
/*사이드바때문에*/
.wrapper {
	position: absolute;
	display: inline;
}
/*페이지네이션*/
.pagination li a {
	color: #939597;
}
/*페이지네이션*/
.pagination li a:hover {
	color: #f5df4d;
}
/*a태그 밑줄x/글씨색변화x*/
a:link, a:visited {
	color: #939597;
	text-decoration: none;
}

/*태그버튼*/
.btn-tag {
	display: inline-block;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	padding: 0.375rem 0.75rem;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	font-size: 0.7rem;
	line-height: 0.3;
	background-color: #f5df4d;
	color: #939597;
}
/*정렬기준*/
.btn-outline-secondary {
	color: #939597;
	border-color: #939597;
	font-size: 0.2rem;
}
/*테이블 글씨색 호버 x*/
.table-hover tbody tr:hover {
	color: unset !important;
	background-color: rgba(0, 0, 0, .075);
}
</style>
</head>
<body>
	<c:import url="../common/menu.jsp" />
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2" style="margin-left: 1.25rem;">
						<div class="col-sm-7">
							<h1>Q&A</h1>
						</div>
						<div class="col-sm-4 btn float-sm-right">
							<button type="button" class="btn btn-warning"
								onclick="location.href='edit.bo'"
								style="font-size: 1rem; color: #939597;">글 쓰기</button>
						</div>
					</div>
					<br>
					<div class="col-sm-2 btn-group">
						<button type="button" class="btn btn-outline-secondary" style="font-size: 0.3rem;">최신순</button>
						<button type="button" class="btn btn-outline-secondary" style="font-size: 0.3rem;">추천순</button>
						<button type="button" class="btn btn-outline-secondary" style="font-size: 0.3rem;">댓글순</button>
						<button type="button" class="btn btn-outline-secondary" style="font-size: 0.3rem;">조회순</button>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- Main content -->
			<section class="content" style="margin-bottom: 50rem;">
				<div class="container-fluid">
					<!-- /.row -->
					<div class="row">
						<div class="col-10">
							<div class="card">
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table class="table table-hover" style="color: #939597;">
										<tbody>
											<tr>
												<td><span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
														아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
												<td><br>
												<a href="#">개발자도비</a></td>
												<td><br>2021-09-16 16:24</td>
												<td><br>
												<span><i class="bi bi-hand-thumbs-up"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-eye"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-chat"></i>100</span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<div class="col-2"></div>
						<!-- /.card -->
					</div>
					<!-- /.card-body -->

					<!-- /.row -->
					<div class="row" style="margin-top: 3.5rem;">
						<div class="col-10">
							<div class="card">
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table class="table table-hover" style="color: #939597;">
										<tbody>
											<tr>
												<td><span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
														아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
												<td><br>
												<a href="#">개발자도비</a></td>
												<td><br>2021-09-16 16:24</td>
												<td><br>
												<span><i class="bi bi-hand-thumbs-up"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-eye"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-chat"></i>100</span></td>
											</tr>
											<tr>
												<td><span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
														아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
												<td><br>
												<a href="#">개발자도비</a></td>
												<td><br>2021-09-16 16:24</td>
												<td><br>
												<span><i class="bi bi-hand-thumbs-up"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-eye"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-chat"></i>100</span></td>
											</tr>
											<tr>
												<td><span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
														아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
												<td><br>
												<a href="#">개발자도비</a></td>
												<td><br>2021-09-16 16:24</td>
												<td><br>
												<span><i class="bi bi-hand-thumbs-up"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-eye"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-chat"></i>100</span></td>
											</tr>
											<tr>
												<td><span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
														아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
												<td><br>
												<a href="#">개발자도비</a></td>
												<td><br>2021-09-16 16:24</td>
												<td><br>
												<span><i class="bi bi-hand-thumbs-up"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-eye"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-chat"></i>100</span></td>
											</tr>
											<tr>
												<td><span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
														아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
												<td><br>
												<a href="#">개발자도비</a></td>
												<td><br>2021-09-16 16:24</td>
												<td><br>
												<span><i class="bi bi-hand-thumbs-up"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-eye"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-chat"></i>100</span></td>
											</tr>
											<tr>
												<td><span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
														아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
												<td><br>
												<a href="#">개발자도비</a></td>
												<td><br>2021-09-16 16:24</td>
												<td><br>
												<span><i class="bi bi-hand-thumbs-up"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-eye"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-chat"></i>100</span></td>
											</tr>
											<tr>
												<td><span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
														아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
												<td><br>
												<a href="#">개발자도비</a></td>
												<td><br>2021-09-16 16:24</td>
												<td><br>
												<span><i class="bi bi-hand-thumbs-up"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-eye"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-chat"></i>100</span></td>
											</tr>
											<tr>
												<td><span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
														아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
												<td><br>
												<a href="#">개발자도비</a></td>
												<td><br>2021-09-16 16:24</td>
												<td><br>
												<span><i class="bi bi-hand-thumbs-up"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-eye"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-chat"></i>100</span></td>
											</tr>
											<tr>
												<td><span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
														아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
												<td><br>
												<a href="#">개발자도비</a></td>
												<td><br>2021-09-16 16:24</td>
												<td><br>
												<span><i class="bi bi-hand-thumbs-up"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-eye"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-chat"></i>100</span></td>
											</tr>
											<tr>
												<td><span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<span><button type="button" class="btn-tag">oracle</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
														아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
												<td><br>
												<a href="#">개발자도비</a></td>
												<td><br>2021-09-16 16:24</td>
												<td><br>
												<span><i class="bi bi-hand-thumbs-up"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-eye"></i>100</span></td>
												<td><br>
												<span><i class="bi bi-chat"></i>100</span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<div class="col-2"></div>
						<!-- /.card -->
					</div>
					<!-- /.card-body -->
				</div>
				<div class="pagination-margin" style="margin-top: 1.5rem;">
					<nav aria-label="Page navigation example">
						<ul class="pagination" style="justify-content: center;">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">6</a></li>
							<li class="page-item"><a class="page-link" href="#">7</a></li>
							<li class="page-item"><a class="page-link" href="#">8</a></li>
							<li class="page-item"><a class="page-link" href="#">9</a></li>
							<li class="page-item"><a class="page-link" href="#">10</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<!-- /.content -->
		</div>
	</div>
</body>
</html>

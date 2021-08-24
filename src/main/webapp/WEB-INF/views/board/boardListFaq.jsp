<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
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
/*테이블 글씨색 호버 x*/
.table-hover tbody tr:hover {
	color: unset !important;
	background-color: rgba(0, 0, 0, .075);
}
/*float 마진x*/
.nav-sidebar>.nav-item .float-right {
	margin-top: 0px;
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
				<div class="container-fluid mb-3">
					<h1 style="text-align: center; margin-bottom:3rem;">Q&amp;A</h1>
					<div class="col-sm-3 btn-group mt-3">
						<button type="button" class="btn btn-outline-secondary"
							style="font-size: 0.8rem;">최신순</button>
						<button type="button" class="btn btn-outline-secondary"
							style="font-size: 0.8rem;">추천순</button>
						<button type="button" class="btn btn-outline-secondary"
							style="font-size: 0.8rem;">댓글순</button>
						<button type="button" class="btn btn-outline-secondary"
							style="font-size: 0.8rem;">조회순</button>
					</div>
					<div class="col-sm-2 btn float-sm-right">
						<button type="button" class="btn btn-warning"
							onclick="location.href='insertBoardForm.bo'"
							style="font-size: 0.8rem; color: #939597; width: 7rem;">글 쓰기</button>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="card">
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<table class="table table-hover" style="color: #939597;">
								<tbody>
									<tr>
										<td style="vertical-align: middle;"><span><button
													type="button" class="btn-tag">oracle</button>&nbsp;</span> <span><button
													type="button" class="btn-tag">oracle</button>&nbsp;</span> <span><button
													type="button" class="btn-tag">oracle</button>&nbsp;</span> <span><button
													type="button" class="btn-tag">oracle</button>&nbsp;</span> <span><button
													type="button" class="btn-tag">oracle</button>&nbsp;</span> <br>
											<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
												아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
										<td style="vertical-align: middle;"><a href="#">개발자도비</a></td>
										<td style="vertical-align: middle;">2021-09-16 16:24</td>
										<td style="vertical-align: middle;"><span><i
												class="bi bi-hand-thumbs-up"></i>100</span></td>
										<td style="vertical-align: middle;"><span><i
												class="bi bi-eye"></i>100</span></td>
										<td style="vertical-align: middle;"><span><i
												class="bi bi-chat"></i>100</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /.card-body -->
					<hr>

					<div class="card mt-5">
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<table class="table table-hover" style="color: #939597;">
								<tbody>
									<tr>
										<td style="vertical-align: middle;"><span><button
													type="button" class="btn-tag">oracle</button>&nbsp;</span> <span><button
													type="button" class="btn-tag">oracle</button>&nbsp;</span> <span><button
													type="button" class="btn-tag">oracle</button>&nbsp;</span> <span><button
													type="button" class="btn-tag">oracle</button>&nbsp;</span> <span><button
													type="button" class="btn-tag">oracle</button>&nbsp;</span> <br>
											<a href="boardDetail.bo">DB는 타입이 다르면 값이 안들어가지는거
												아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???</a></td>
										<td style="vertical-align: middle;"><a href="#">개발자도비</a></td>
										<td style="vertical-align: middle;">2021-09-16 16:24</td>
										<td style="vertical-align: middle;"><span><i
												class="bi bi-hand-thumbs-up"></i>100</span></td>
										<td style="vertical-align: middle;"><span><i
												class="bi bi-eye"></i>100</span></td>
										<td style="vertical-align: middle;"><span><i
												class="bi bi-chat"></i>100</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /.card-body -->
				</div>
				<div class="pagination-margin mt-5 mb-5">
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
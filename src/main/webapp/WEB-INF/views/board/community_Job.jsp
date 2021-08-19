<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<!-- Select2 -->
  <link rel="stylesheet" href="/codemoa/resources/plugins/select2/css/select2.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
.wrapper {
	position: absolute;
	display: inline;
}

.pagination li a {
	color: #939597;
}

.pagination li a:hover {
	color: #f5df4d;
}

a:link, a:visited {
	color: #939597;
	text-decoration: none;
}
</style>
</head>
<body>
	<c:import url="../common/menu.jsp" />
	<div class="wrapper">
 	<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2" style="margin-left: 1.25rem;">
						<div class="col-sm-7">
							<h1>Job</h1>
						</div>
						<div class="col-sm-4 btn float-sm-right">
							<button type="button" class="btn"
								onclick="location.href=''"
								style="font-size: 1rem; background-color: #f5df4d; color: #939597; font-weight: bold; line-height: 1.3rem;">검색조건</button>&nbsp;
								<button type="button" class="btn"
								onclick="location.href='editJob.bo'"
								style="font-size: 1rem; background-color: #f5df4d; color: #939597; font-weight: bold; line-height: 1.3rem;">구인/구직하기</button>
						</div>
					</div>
				</div>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<!-- /.row -->
					<div class="row">
						<div class="col-10">
							<div class="card">
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table class="table table-hover text-nowrap"
										style="color: #939597;">
										<!-- <thead>
											<tr>
												<th>글번호</th>
												<th>제목</th>
												<th>작성일</th>
												<th>작성자</th>
											</tr>
										</thead> -->
										<tbody>
										<tr>
												<td><span><button type="button"
															class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">SI</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">정규직</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">금융</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">PM</button>&nbsp;</span>
													<br>
												<a href="boardDetailJob.bo">풀스택개발, PM 금융 데이터 서비스 구축 프로젝트
														PM/PL</a></td>
												<td><br>
												<button type="button" class="btn btn-secondary"
														data-toggle="popover" data-placement="left"
														data-content="연봉: 3000만원<br>경력: 12년 이상 ~ 무관<br>근무지: 서울 서초구<br>학력사항: 무관<br>근무형태: 상근<br>계약기간: 21.09.16(6개월)"
														data-html="true"
														style="font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;">
														간략정보</button></td>
												<td><br>
												<a href="#">(주)개발노예를찾습니다</a></td>
												<td><br>마감 6일전</td>
											</tr>
											<tr>
												<td><span><button type="button"
															class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">SI</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">정규직</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">금융</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">PM</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">풀스택개발, PM 금융 데이터 서비스 구축 프로젝트
														PM/PL</a></td>
												<td><br>
												<button type="button" class="btn btn-secondary"
														data-toggle="popover" data-placement="left"
														data-content="연봉: 3000만원<br>경력: 12년 이상 ~ 무관<br>근무지: 서울 서초구<br>학력사항: 무관<br>근무형태: 상근<br>계약기간: 21.09.16(6개월)"
														data-html="true"
														style="font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;">
														간략정보</button></td>
												<td><br>
												<a href="#">(주)개발노예를찾습니다</a></td>
												<td><br>마감 6일전</td>
											</tr>
											<tr>
												<td><span><button type="button"
															class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">SI</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">정규직</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">금융</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">PM</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">풀스택개발, PM 금융 데이터 서비스 구축 프로젝트
														PM/PL</a></td>
												<td><br>
												<button type="button" class="btn btn-secondary"
														data-toggle="popover" data-placement="left"
														data-content="연봉: 3000만원<br>경력: 12년 이상 ~ 무관<br>근무지: 서울 서초구<br>학력사항: 무관<br>근무형태: 상근<br>계약기간: 21.09.16(6개월)"
														data-html="true"
														style="font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;">
														간략정보</button></td>
												<td><br>
												<a href="#">(주)개발노예를찾습니다</a></td>
												<td><br>마감 6일전</td>
											</tr>
											<tr>
												<td><span><button type="button"
															class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">SI</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">정규직</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">금융</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">PM</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">풀스택개발, PM 금융 데이터 서비스 구축 프로젝트
														PM/PL</a></td>
												<td><br>
												<button type="button" class="btn btn-secondary"
														data-toggle="popover" data-placement="left"
														data-content="연봉: 3000만원<br>경력: 12년 이상 ~ 무관<br>근무지: 서울 서초구<br>학력사항: 무관<br>근무형태: 상근<br>계약기간: 21.09.16(6개월)"
														data-html="true"
														style="font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;">
														간략정보</button></td>
												<td><br>
												<a href="#">(주)개발노예를찾습니다</a></td>
												<td><br>마감 6일전</td>
											</tr>
											<tr>
												<td><span><button type="button"
															class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">SI</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">정규직</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">금융</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">PM</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">풀스택개발, PM 금융 데이터 서비스 구축 프로젝트
														PM/PL</a></td>
												<td><br>
												<button type="button" class="btn btn-secondary"
														data-toggle="popover" data-placement="left"
														data-content="연봉: 3000만원<br>경력: 12년 이상 ~ 무관<br>근무지: 서울 서초구<br>학력사항: 무관<br>근무형태: 상근<br>계약기간: 21.09.16(6개월)"
														data-html="true"
														style="font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;">
														간략정보</button></td>
												<td><br>
												<a href="#">(주)개발노예를찾습니다</a></td>
												<td><br>마감 6일전</td>
											</tr>
											<tr>
												<td><span><button type="button"
															class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">SI</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">정규직</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">금융</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">PM</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">풀스택개발, PM 금융 데이터 서비스 구축 프로젝트
														PM/PL</a></td>
												<td><br>
												<button type="button" class="btn btn-secondary"
														data-toggle="popover" data-placement="left"
														data-content="연봉: 3000만원<br>경력: 12년 이상 ~ 무관<br>근무지: 서울 서초구<br>학력사항: 무관<br>근무형태: 상근<br>계약기간: 21.09.16(6개월)"
														data-html="true"
														style="font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;">
														간략정보</button></td>
												<td><br>
												<a href="#">(주)개발노예를찾습니다</a></td>
												<td><br>마감 6일전</td>
											</tr>
											<tr>
												<td><span><button type="button"
															class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">SI</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">정규직</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">금융</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">PM</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">풀스택개발, PM 금융 데이터 서비스 구축 프로젝트
														PM/PL</a></td>
												<td><br>
												<button type="button" class="btn btn-secondary"
														data-toggle="popover" data-placement="left"
														data-content="연봉: 3000만원<br>경력: 12년 이상 ~ 무관<br>근무지: 서울 서초구<br>학력사항: 무관<br>근무형태: 상근<br>계약기간: 21.09.16(6개월)"
														data-html="true"
														style="font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;">
														간략정보</button></td>
												<td><br>
												<a href="#">(주)개발노예를찾습니다</a></td>
												<td><br>마감 6일전</td>
											</tr>
											<tr>
												<td><span><button type="button"
															class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">SI</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">정규직</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">금융</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">PM</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">풀스택개발, PM 금융 데이터 서비스 구축 프로젝트
														PM/PL</a></td>
												<td><br>
												<button type="button" class="btn btn-secondary"
														data-toggle="popover" data-placement="left"
														data-content="연봉: 3000만원<br>경력: 12년 이상 ~ 무관<br>근무지: 서울 서초구<br>학력사항: 무관<br>근무형태: 상근<br>계약기간: 21.09.16(6개월)"
														data-html="true"
														style="font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;">
														간략정보</button></td>
												<td><br>
												<a href="#">(주)개발노예를찾습니다</a></td>
												<td><br>마감 6일전</td>
											</tr>
											<tr>
												<td><span><button type="button"
															class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">SI</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">정규직</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">금융</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">PM</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">풀스택개발, PM 금융 데이터 서비스 구축 프로젝트
														PM/PL</a></td>
												<td><br>
												<button type="button" class="btn btn-secondary"
														data-toggle="popover" data-placement="left"
														data-content="연봉: 3000만원<br>경력: 12년 이상 ~ 무관<br>근무지: 서울 서초구<br>학력사항: 무관<br>근무형태: 상근<br>계약기간: 21.09.16(6개월)"
														data-html="true"
														style="font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;">
														간략정보</button></td>
												<td><br>
												<a href="#">(주)개발노예를찾습니다</a></td>
												<td><br>마감 6일전</td>
											</tr>
											<tr>
												<td><span><button type="button"
															class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">SI</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">정규직</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">금융</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">PM</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">풀스택개발, PM 금융 데이터 서비스 구축 프로젝트
														PM/PL</a></td>
												<td><br>
												<button type="button" class="btn btn-secondary"
														data-toggle="popover" data-placement="left"
														data-content="연봉: 3000만원<br>경력: 12년 이상 ~ 무관<br>근무지: 서울 서초구<br>학력사항: 무관<br>근무형태: 상근<br>계약기간: 21.09.16(6개월)"
														data-html="true"
														style="font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;">
														간략정보</button></td>
												<td><br>
												<a href="#">(주)개발노예를찾습니다</a></td>
												<td><br>마감 6일전</td>
											</tr>
											<tr>
												<td><span><button type="button"
															class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">SI</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">정규직</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">금융</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">PM</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">풀스택개발, PM 금융 데이터 서비스 구축 프로젝트
														PM/PL</a></td>
												<td><br>
												<button type="button" class="btn btn-secondary"
														data-toggle="popover" data-placement="left"
														data-content="연봉: 3000만원<br>경력: 12년 이상 ~ 무관<br>근무지: 서울 서초구<br>학력사항: 무관<br>근무형태: 상근<br>계약기간: 21.09.16(6개월)"
														data-html="true"
														style="font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;">
														간략정보</button></td>
												<td><br>
												<a href="#">(주)개발노예를찾습니다</a></td>
												<td><br>마감 6일전</td>
											</tr>
											<tr>
												<td><span><button type="button"
															class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">SI</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">정규직</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">금융</button>&nbsp;</span>
													<span><button type="button" class="btn techs"
															style="font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;">PM</button>&nbsp;</span>
													<br>
												<a href="boardDetail.bo">풀스택개발, PM 금융 데이터 서비스 구축 프로젝트
														PM/PL</a></td>
												<td><br>
												<button type="button" class="btn btn-secondary"
														data-toggle="popover" data-placement="left"
														data-content="연봉: 3000만원<br>경력: 12년 이상 ~ 무관<br>근무지: 서울 서초구<br>학력사항: 무관<br>근무형태: 상근<br>계약기간: 21.09.16(6개월)"
														data-html="true"
														style="font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;">
														간략정보</button></td>
												<td><br>
												<a href="#">(주)개발노예를찾습니다</a></td>
												<td><br>마감 6일전</td>
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
				<div style="margin-top: 1.5rem;">
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
<script>
		$(function() {
			$('[data-toggle="popover"]').popover()
		});
	</script>
	<script>
    $(function () {
      $('.select2').select2()
    });
</script>
	<!-- Select2 -->
<script src="/codemoa/resources/plugins/select2/js/select2.full.min.js"></script>
</body>
</html>
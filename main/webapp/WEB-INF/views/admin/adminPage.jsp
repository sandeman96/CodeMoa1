<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


<style>
/* css작동 안해서 여기서 작성 */
/* 사용자 상태  */
#userStatus {
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

/* 게시글 상태 */
#userBoard {
	width: 1500px;
	height: 500px;
	border: 1px solid black;
	margin-left: 15px;
	background-color: white;
}

/* 상태체크박스 */
input[type=radio]:checked+label {
	color: white;
	background-color: gray;
}

input[type=radio] {
	display: none;
}
</style>

</head>
<body>
	<%-- <c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" /> --%>
	<c:import url="../admin/adminSidebar.jsp" />

	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="col-sm-6">
					<h1 class="m-0">관리자 메인페이지</h1>
				</div>
			</div>
		</section>
		<!-- /.content-header -->
		<section class="content">
			<div class="container-fluid">
				<div class="row col-6" style="float: none; margin: 0 auto;">

					<div class="col-4">
						<div class="small-box bg-info">
							<div class="inner">
								<h3>총 회원수</h3>

								<p>${ mi.listCountM }명</p>
							</div>
							<div class="icon">
								<i class="ion ion-bag"></i>
							</div>
							<a href="#user" class="small-box-footer">
								More info
								<i class="fas fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-4">
						<!-- small box -->
						<div class="small-box bg-success">
							<div class="inner">
								<h3>총 게시물 수</h3>
								<p>${ bi.listCountB }개</p>
							</div>
							<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
							<a href="#board" class="small-box-footer">
								More info
								<i class="fas fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>

					<div class="col-4">
						<!-- small box -->
						<div class="small-box bg-danger">
							<div class="inner">
								<h3>신고수</h3>

								<p>${rpi.listCountP}개</p>
							</div>
							<div class="icon">
								<i class="ion ion-pie-graph"></i>
							</div>
							<a href="#" class="small-box-footer">
								More info
								<i class="fas fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
				</div>
				<!-- 상단 카드 빨주노초 -->

				<!-- 합체시도중 -->
				<div class="container-fluid">
					<section class="content" style="width: 100%; height: 500px; margin-left: 5px;">
						<form action="#" onsubmit="return update();">
							<div id="board" class="row col-12">
								<div class="card" style="width: 100%; height: 500px;">
									<div class="card-header d-flex p-0">
										<h3 class="card-title p-3">사용자 글 목록</h3>

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
															<td>
																<c:if test="${ b.bStatus eq 'Y'}">
																	<div class="btn-group btn-group-toggle" data-toggle="buttons">
																		<label class="btn btn-sm btn-secondary"> <input type="radio" name="options" id="option_b1" autocomplete="off" checked disabled="disabled"> Y
																		</label> <label class="btn btn-sm btn-secondary"> <input type="radio" name="options" id="option_b2" autocomplete="off" disabled="disabled"> N
																		</label>
																	</div>
																</c:if>
																<c:if test="${ b.bStatus eq 'N'}">
																	<div class="btn-group btn-group-toggle" data-toggle="buttons">
																		<label class="btn btn-sm btn-secondary"> <input type="radio" name="options" id="option_b1" autocomplete="off" disabled="disabled"> Y
																		</label> <label class="btn btn-sm btn-secondary"> <input type="radio" name="options" id="option_b2" autocomplete="off" checked disabled="disabled"> N
																		</label>
																	</div>
																</c:if>
															</td>
															<td>
																<c:set var="flag" value="false" />
																<c:forEach var="p" items="${ pList }">
																	<c:if test="${ !flag }">
																		<c:if test="${ b.bNo eq p.pBno and p.pStatus eq 'Y'}">
																		😈
																		<c:set var="flag" value="true" />
																		</c:if>


																	</c:if>
																</c:forEach>
															</td>
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
												<c:if test="${ bi.currentPageB <= 1 }">
													<li class="page-item">
														<a class="page-link">&laquo;</a>
												</c:if>
												<c:if test="${ bi.currentPageB > 1 }">
													<c:url var="before" value="adminPage.ad">
														<c:param name="pageB" value="${ bi.currentPageB - 1 }" />
													</c:url>
													<li class="page-item">
														<a href="${ before }" class="page-link">&laquo;</a>
												</c:if>

												<!-- 페이지 -->
												<c:forEach var="b" begin="${ bi.startPageB }" end="${ bi.endPageB }">
													<c:if test="${ b eq bi.currentPageB }">
														<li class="page-item">
															<a class="page-link" style="color: red;">${ b }</a>
													</c:if>

													<c:if test="${ b ne bi.currentPageB }">
														<c:url var="pagination" value="adminPage.ad">
															<c:param name="pageB" value="${ b }" />
														</c:url>
														<li class="page-item">
															<a href="${ pagination }" class="page-link">${ b }</a>
													</c:if>
												</c:forEach>

												<!-- [다음] -->
												<c:if test="${ bi.currentPageB >= bi.maxPageB }">
													<li class="page-item">
														<a class="page-link">&raquo;</a>
												</c:if>
												<c:if test="${ bi.currentPageB < bi.maxPageB }">
													<c:url var="after" value="adminPage.ad">
														<c:param name="pageB" value="${ bi.currentPageB + 1 }" />
													</c:url>
													<li class="page-item">
														<a href="${ after }" class="page-link">&raquo;</a>
												</c:if>
											</ul>
										</div>
									</div>
									<!-- /.card -->
								</div>

							</div>

						</form>
					</section>

					<br>

					<section class="content" style="width: 100%; height: 500px; margin-left: 5px;">
						<form action="#" onsubmit="return update();">

							<div id="user" class="row col-12">

								<div class="card" style="width: 100%; height: 500px;">
									<div class="card-header d-flex p-0">
										<h3 class="card-title p-3">회원 정보</h3>
									</div>
									<!-- /.card-header -->
									<div class="card-body table-responsive p-0">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>ID</th>
													<th>Nick</th>
													<th>이메일</th>
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
															<td>${ m.id }</td>
															<td>${ m.nickName }</td>
															<td>${ m.email }</td>
															<td>${ m.email }</td>
															<td>${ m.admin }</td>
															<td>
																<c:if test="${ m.status eq 'Y'}">
																	<div class="btn-group btn-group-toggle" data-toggle="buttons">
																		<label class="btn btn-sm btn-secondary"> <input type="radio" name="options" id="option_b1" autocomplete="off" checked disabled="disabled"> Y
																		</label> <label class="btn btn-sm btn-secondary"> <input type="radio" name="options" id="option_b2" autocomplete="off" disabled="disabled"> N
																		</label>
																	</div>
																</c:if>
																<c:if test="${ m.status eq 'N'}">
																	<div class="btn-group btn-group-toggle" data-toggle="buttons">
																		<label class="btn btn-sm btn-secondary"> <input type="radio" name="options" id="option_b1" autocomplete="off" disabled="disabled"> Y
																		</label> <label class="btn btn-sm btn-secondary"> <input type="radio" name="options" id="option_b2" autocomplete="off" checked disabled="disabled"> N
																		</label>
																	</div>
																</c:if>
															</td>
															<td>
																<c:set var="flag" value="false" />
																<c:forEach var="p" items="${ pList }">
																	<c:if test="${ !flag }">
																		<c:if test="${ m.id eq p.pReporter and p.pStatus eq 'Y'}">
																		💣
																		<c:set var="flag" value="true" />
																		</c:if>

																		<c:if test="${ m.id ne p.pReporter and p.pStatus eq 'N'}">
																		❤
																		<c:set var="flag" value="true" />
																		</c:if>
																	</c:if>
																</c:forEach>
															</td>
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
													<li class="page-item">
														<a class="page-link">&laquo;</a>
												</c:if>
												<c:if test="${ mi.currentPageM > 1 }">
													<c:url var="before" value="adminPage.ad">
														<c:param name="pageM" value="${ mi.currentPageM - 1 }" />
													</c:url>
													<li class="page-item">
														<a href="${ before }" class="page-link">&laquo;</a>
												</c:if>

												<!-- 페이지 -->
												<c:forEach var="m" begin="${ mi.startPageM }" end="${ mi.endPageM }">
													<c:if test="${ m eq mi.currentPageM }">
														<li class="page-item">
															<a class="page-link" style="color: red;">${ m }</a>
													</c:if>

													<c:if test="${ m ne mi.currentPageM }">
														<c:url var="pagination" value="adminPage.ad">
															<c:param name="pageM" value="${ m }" />
														</c:url>
														<li class="page-item">
															<a href="${ pagination }" class="page-link">${ m }</a>
													</c:if>
												</c:forEach>

												<!-- [다음] -->
												<c:if test="${ mi.currentPageM >= mi.maxPageM }">
													<li class="page-item">
														<a class="page-link">&raquo;</a>
												</c:if>
												<c:if test="${ mi.currentPageM < mi.maxPageM }">
													<c:url var="after" value="adminPage.ad">
														<c:param name="pageM" value="${ mi.currentPageM + 1 }" />
													</c:url>
													<li class="page-item">
														<a href="${ after }" class="page-link">&raquo;</a>
												</c:if>
											</ul>
										</div>
									</div>
									<!-- /.card -->
								</div>

							</div>
						</form>
					</section>
				</div>

				<br>

			</div>
			<!-- 컨테이너 필드 -->
		</section>

	</div>
	<!--         달력부분 -->



	<!-- 전체 섹션 -->
	<br>
	<!-- ./Content-wrapper 콘텐츠 레퍼 -->

	<!--  </div> -->
	<!-- wrapper all -->


	<!-- jQuery -->
	<script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/codemoa/resources/dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/codemoa/resources/dist/js/demo.js"></script>

</body>
</html>
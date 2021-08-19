<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<!-- summernote -->
<link rel="stylesheet"
	href="/codemoa/resources/plugins/summernote/summernote-bs4.min.css">
<!-- CodeMirror -->
<link rel="stylesheet"
	href="/codemoa/resources/plugins/codemirror/codemirror.css">
<link rel="stylesheet"
	href="/codemoa/resources/plugins/codemirror/theme/monokai.css">
<!-- SimpleMDE -->
<link rel="stylesheet"
	href="/codemoa/resources/plugins/simplemde/simplemde.min.css">
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
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2" style="margin-left: 1.25rem;">
						<div class="col-sm-7">
							<h1>구인/구직 상세보기</h1>
						</div>
						<div class="col-sm-4 btn float-sm-right">
							<button type="button" class="btn"
								onclick="location.href='editJob.bo'"
								style="font-size: 1rem; background-color: #f5df4d; color: #939597; font-weight: bold; line-height: 1.3rem;">수정하기</button>
							<button type="button" class="btn"
								onclick="location.href='editJob.bo'"
								style="font-size: 1rem; background-color: #f5df4d; color: #939597; font-weight: bold; line-height: 1.3rem;">삭제하기</button>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
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
												<td>#15923&nbsp;&nbsp;&nbsp;<span><button
															type="button" class="btn"
															style="font-size: 0.7rem; line-height: 1; background-color: #f5df4d; color: #939597;">oracle</button>&nbsp;</span><br>DB는
													타입이 다르면 값이 안들어가지는거 아닌가요???DB는 타입이 다르면 값이 안들어가지는거 아닌가요???
												</td>
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
								<div class="card-body">
									<textarea class="form-control"
										style="height: 500; resize: none; color: #939597;" readonly>자금세탁된 100억만 딱 통장에 꽂아주십쇼</textarea>
								</div>
								<div class="card-body table-responsive p-0">
									<table class="table table-hover text-nowrap"
										style="color: #939597;">
										<tbody>
											<tr>
											<td><textarea id="summernote">
                                       			훈수두면 훈이~
                                    </textarea></td>
												<td>
												<a href="#" style="underline: none;">선배도비</a><br>
												<span style="font-size: 0.7rem;">2021-09-16 16:24</span>
												<br><Br><span><i class="bi bi-hand-thumbs-up"></i>1</span></td>
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
			</section>
			<!-- /.content -->
		</div>
	</div>
	<!-- Summernote -->
	<script
		src="/codemoa/resources/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- CodeMirror -->
	<script src="/codemoa/resources/plugins/codemirror/codemirror.js"></script>
	<script src="/codemoa/resources/plugins/codemirror/mode/css/css.js"></script>
	<script src="/codemoa/resources/plugins/codemirror/mode/xml/xml.js"></script>
	<script
		src="/codemoa/resources/plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
	<script>
		$(function() {
			// Summernote
			$('#summernote').summernote({
				height : 200,
				disableResizeEditor : true

			});
			$('.note-statusbar').hide()
			// CodeMirror
			CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"),
					{
						mode : "htmlmixed",
						theme : "monokai"
					});
		})
	</script>
</body>
</html>

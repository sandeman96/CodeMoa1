<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<!-- Bootstrap 4 -->
<script
	src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
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
					<h1 style="text-align: center;">게시글 작성하기</h1>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content mt-4">
				<div class="col-md-12">
				<form action="" method="post" enctype="Multipart/form-data">
					<div class="card card-outline card-info">
						<!-- /.card-header -->
						<div class="card-body">
							<div class="col-sm-2" style="display: inline-block;">
								<select class="selectpicker form-control">
									<optgroup label="Tech">
										<option value="QnA">Q&amp;A</option>
										<option value="Tips">Tips</option>
									</optgroup>
									<optgroup label="Community">
										<option value="Study">Study</option>
										<option value="Job">Job</option>
									</optgroup>
								</select>
							</div>
							<div class="col-sm-9 mb-3" style="display: inline-block;">
								<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요">
							</div>
							<textarea id="summernote">내용</textarea>
                       </div>
						<div class="card-body">
							<input type="text" name="tags" class="form-control" placeholder="태그를 입력하세요">
						</div>
						<div class="row mb-2" style="justify-content:center;">
							<button type="button" class="btn btn-warning"
									style="font-size: 0.8rem; color: #939597; width: 7rem;" onclick="goWrite(this.form)">완료</button>
						</div>
					</div>
					</form>
				</div>
				<!-- /.col-->
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
			$('#summernote').summernote(
					{
						height : 500,
						disableResizeEditor : true,
						focus : true,
						toolbar : [
								// [groupName, [list of button]]
								[ 'fontname', [ 'fontname' ] ],
								[ 'fontsize', [ 'fontsize' ] ],
								[
										'style',
										[ 'bold', 'italic', 'underline',
												'strikethrough', 'clear' ] ],
								[ 'color', [ 'forecolor', 'color' ] ],
								[ 'table', [ 'table' ] ],
								[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
								[ 'height', [ 'height' ] ],
								[ 'insert', [ 'picture', 'link', 'video' ] ],
								[ 'view', [ 'fullscreen', 'help' ] ] ],
						fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
								'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림',
								'돋움체', '바탕체' ],
						fontSizes : [ '8', '9', '10', '11', '12', '14', '16',
								'18', '20', '22', '24', '28', '30', '36', '50',
								'72' ]
					});
			$('.note-statusbar').hide();
			// CodeMirror
			CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"),
					{
						mode : "htmlmixed",
						theme : "monokai"
					});
		});

		$('.selectpicker').selectpicker({});
	</script>
</body>
</html>

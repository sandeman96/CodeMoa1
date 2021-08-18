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
							<h1 style="text-align:center;">글 작성/수정폼</h1>
						</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content mt-4">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-outline card-info">
							<!-- /.card-header -->
							<div class="card-body">
							<input type="text" class="form-control" placeholder="제목을 입력하세요"><br>
								<textarea id="summernote">
                                       자금세탁된 100억만 딱 통장에 꽂아주십쇼
                                    </textarea>
							</div>
							<div class="card-body">
							<input type="text" class="form-control" placeholder="태그를 입력하세요">
							</div>
							<div class="row mb-2" style="margin-left: 1.25rem;">
						<div class="col-sm-11">
							<button type="button" class="btn btn-warning" onclick="location.href='javascript:history.go(-1);'"
								style="font-size: 0.8rem; color: #939597; line-height:0.7rem; width:7rem;">뒤로가기</button>
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn-warning"
								style="font-size: 0.8rem; color: #939597; line-height:0.7rem; width:7rem;">완료</button>
						</div>
					</div>
						</div>
					</div>
					<!-- /.col-->
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
            $(function () {
                // Summernote
                $('#summernote').summernote({
                	height: 500,
                	disableResizeEditor: true,
                	focus: true,
                	 toolbar: [
         			    // [groupName, [list of button]]
         			    ['fontname', ['fontname']],
         			    ['fontsize', ['fontsize']],
         			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
         			    ['color', ['forecolor','color']],
         			    ['table', ['table']],
         			    ['para', ['ul', 'ol', 'paragraph']],
         			    ['height', ['height']],
         			    ['insert',['picture','link','video']],
         			    ['view', ['fullscreen', 'help']]
         			  ],
         			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
         			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
    			});
    			$('.note-statusbar').hide();
                // CodeMirror
                CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
                    mode: "htmlmixed",
                    theme: "monokai"
                });
            })
        </script>
</body>
</html>

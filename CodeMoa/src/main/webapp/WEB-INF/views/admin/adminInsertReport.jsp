<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
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
<!-- Theme style -->
<link rel="stylesheet" href="/codemoa/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/codemoa/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
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
				<div class="container-fluid mb-3">
					<h1 style="text-align: center;">신고글 작성하기</h1>
				</div>
				<div class="container-fluid">
						<div class="card">
							<!-- /.card-header -->
							<div class="card-body table-responsive p-0">
								<table class="table table-hover" style="color: #939597;">
									<tr> 
										
									</tr>
									<tbody>
<%-- 											<c:url var="bdetail" value="boardDetail.bo"> --%>
<%-- 												<c:param name="bNo" value="${ b.bNo }" /> --%>
<%-- 												<c:param name="page" value="${ pi.currentPage }" /> --%>
<%-- 											</c:url> --%>

												
												<tr style="font-weight: bold;" >
													<td style=" color: black;">
														현제 신고하고 있는 게시글 :
													</td>
													<td style="color: blue;">
														제목: ${ param.bTitle }
													</td>
													<td style="color: blue;">
														닉네임: ${ param.nickName }
													</td>
<!-- 													<td> -->
<%-- 														${ param.bContent } --%>
<!-- 													</td> -->
													<td style="color: blue;">${ param.bDate }</td>
												
												</tr>
									</tbody>
								</table>
							</div>
						</div>
		
					</div>
				<!-- /.container-fluid -->
			</section>
<%-- 			<c:param name="bType" value="${ b.bType }">  --%>
						
<%-- 				${ b.bNo } +"," + ${ b.bWriter } --%>
						
<%-- 			</c:param> --%>
			<!-- Main content -->
			<section class="content">
				<div class="col-md-12">
				<form action="insertReport.ad" method="POST">
				<input type="hidden" name="pReceiver" value="${ loginUser.id }">
				<input type="hidden" name="pReporter" value="${ param.bWriter }">
				<input type="hidden" name="pBno" value="${ param.bNo }">
				<input type="hidden" name="pBpage" value="${ param.page }">
				<input type="hidden" name="bContent" value="${ param.bContent }">
				<input type="hidden" name="pMnick" value="${ param.nickName }">
				<input type="hidden" name="pBtype" value="${ param.bType }">
					<div class="card card-outline card-info">
						<!-- /.card-header -->
						<div class="card-body">
							<div class="col-sm-2" style="display: inline-block;">
								<select class="selectpicker form-control" name="pType">
									<optgroup label="사용자">
										<option value="1">부적절한 닉네임</option>
 										<option value="2">기타</option>
									</optgroup>
									<optgroup label="게시글">
										<option value="3">부적절한 내용</option>
										<option value="4">욕설 및 혐오 표현</option>
										<option value="5">광고글</option>
										<option value="6">기타</option>
									</optgroup>
								</select>
							</div>
							<div class="col-sm-9 mb-3" style="display: inline-block;">
								
								<input type="text" name="pTitle" class="form-control" placeholder="제목을 입력하세요">
							</div>
							<textarea id="summernote" name="pContent" placeholder="내용을 입력하세요">	
								
						</textarea>
                       </div>
<!-- 						<div class="card-body"> -->
<!-- 							<input type="text" name="bTags" class="form-control" placeholder="#태그를 입력하세요"> -->
<!-- 						</div> -->
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
	<!-- jQuery -->
   <script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
   <!-- Bootstrap 4 -->
   <script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- AdminLTE App -->
   <script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="/codemoa/resources/dist/js/demo.js"></script>
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
						lang: "ko-KR",
						height : 500,
						disableResizeEditor : true,
						focus : true,
						toolbar : [
								// [groupName, [list of button]]
								 ['style', ['style']],
								[ 'fontname', [ 'fontname' ] ],
								[ 'fontsize', [ 'fontsize' ] ],
								['style',
											[ 'bold', 'italic', 'underline',
												'strikethrough', 'clear' ] ],
								[ 'color', [ 'forecolor', 'color' ] ],
								[ 'table', [ 'table' ] ],
								[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
								[ 'height', [ 'height' ] ],
								[ 'insert', [ 'picture', 'link', 'video' ] ],
								[ 'view', [ 'fullscreen', 'codeview','help' ] ] ],
						fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
								'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림',
								'돋움체', '바탕체' ],
						fontSizes : [ '8', '9', '10', '11', '12', '14', '16',
								'18', '20', '22', '24', '28', '30', '36', '50',
								'72' ],
					  callbacks : { 				
						  onImageUpload : function(files, editor, welEditable) {
							  for (var i = files.length - 1; i >= 0; i--) {
						            uploadSummernoteImageFile(files[i], this);
						            }
						  		}	
					  		}
					});
			
			// CodeMirror
			CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"),
					{
						mode : "htmlmixed",
						theme : "monokai"
					});
		});
		$('.selectpicker').selectpicker();
		$('.note-statusbar').hide();
		
		
		
		//image 보내기
		  function uploadSummernoteImageFile(file, el) {
				data = new FormData();
				data.append("file", file);
				$.ajax({
					data : data,
					type : "POST",
					url : "uploadSummernoteImageFile.bo",
					contentType : false,
					enctype : 'multipart/form-data',
					processData : false,
					success : function(data) {
						$(el).summernote('editor.insertImage', data.url);
						
						console.log(data.url);
					}
				});
			}
	</script>
	
	<script>
function goWrite(frm) {
	var title = frm.pTitle.value;
	var content = frm.pContent.value;
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	
	success: 
		alert("신고가 완료되었습니다");
	frm.submit();
// 	frm.history.go(-2);
}
</script>	
</body>
</html>
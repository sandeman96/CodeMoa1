<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<!-- Amsify Plugin -->
<link rel="stylesheet" href="/codemoa/resources/dist/css/amsify.suggestags.css">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="/codemoa/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/codemoa/resources/dist/css/adminlte.min.css">
<!-- Bootstrap 4 -->
<script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- summernote -->
<link rel="stylesheet" href="/codemoa/resources/plugins/summernote/summernote-bs4.min.css">
<!-- SimpleMDE -->
<link rel="stylesheet" href="/codemoa/resources/plugins/simplemde/simplemde.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	<c:choose>
		<c:when test="${ loginUser != null && loginUser.admin == 'Y' }">
			<c:import url="../admin/adminSidebar.jsp" />
		</c:when>
		<c:otherwise>
			<c:import url="../common/menu.jsp" />
		</c:otherwise>
	</c:choose>
	
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid mb-3">
					<h1 style="text-align: center;">게시글 작성하기</h1>
				</div>
			</section>

			<section class="content">
				<div class="col-md-12">
				<form action="insertBoard.bo"  method="post">
				<input type="hidden" name="bFirst" id="bFirst" value="N">
					<div class="card card-outline card-warning">
						<div class="card-body">
							<div class="col-sm-2" style="display: inline-block;">
							<c:set var="boardName" value="${boardName}" />
								<select class="selectpicker form-control" id="bType" name="bType">
								<optgroup label="Tech">
									<option value="1" ${boardName == "Faq" ? 'selected' : ""}>Q&amp;A</option>
									<option value="2" ${boardName == "Tips" ? 'selected' : ""}>Tips</option>
								</optgroup>	
								<optgroup label="Community">
									<option value="3" ${boardName == "Study" ? 'selected' : ""}>Study</option>
								</optgroup>
								</select>
							</div>
							<div class="col-sm-9 mb-3" style="display: inline-block;">
								<input type="hidden" name="bWriter" value="${ loginUser.id }">
								<input type="text" id="bTitle" name="bTitle" class="form-control" placeholder="제목">
							</div>
							<textarea id="summernote" name="bContent"></textarea>
                       </div>
						<div class="card-body">
							<input type="text" id="tags" name="tags" class="form-control" placeholder="태그(최대 10개)">
						</div>
						<div class="row mt-5 mb-5" style="justify-content:center;">
							<button type="submit" class="btn btn-warning" id="insertBoardBtn"
									style="font-size: 0.8rem; color: #939597; width: 7rem;">완료</button>
						</div>
					</div>
					</form>
				</div>
			</section>
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
	<script src="/codemoa/resources/plugins/summernote/summernote-bs4.min.js"></script>
	<script src="/codemoa/resources/dist/js/jquery.amsify.suggestags.js"></script>
			<!-- sweetalert2 -->
	<script src="/codemoa/resources/plugins/sweetalert2.all.min.js"></script>
	<script>
	//배열 가져오기
	$(function() {
		$('input[name="tags"]').amsifySuggestags({
			type:'bootstrap'
			});

			// Summernote
			$('#summernote').summernote(
					{
						height : 500,
						disableResizeEditor : true,
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
			
			$('#insertBoardBtn').click(function() {
				var text = $('#summernote').summernote('code').replace(/<\/?[^>]+(>|$)/g, "");
				if (($.trim($('#bTitle').val())) == ''){
					Swal.fire({
						  icon: 'error',
						  title: '제목이 입력되지 않았습니다.',
						  text: '제목을 입력해주세요!'
						});
					$('#bTitle').focus();
					return false;
				} else if (text.trim() == ''){
					Swal.fire({
						  icon: 'error',
						  title: '내용이 입력되지 않았습니다.',
						  text: '내용을 입력해주세요!'
						});
					$('#summernote').summernote('focus');
					return false;
				}	
					return true;
					
			});
		});

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
					}
				});
			}
</script>
</body>
</html>

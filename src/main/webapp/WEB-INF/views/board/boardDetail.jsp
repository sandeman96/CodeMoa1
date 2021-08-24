<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/codemoa/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="/codemoa/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="/codemoa/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="/codemoa/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="/codemoa/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
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
<!-- SweetAlert2 -->
<link rel="stylesheet"
	href="../../plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
<!-- Toastr -->
<link rel="stylesheet" href="../../plugins/toastr/toastr.min.css">
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

	<c:url var="updateBoardForm" value="updateBoardForm.bo">
		<c:param name="bNo" value="${ b.bNo }" />
		<c:param name="page" value="${ page }" />
	</c:url>
	<c:url var="deleteBoard" value="deleteBoard.bo">
		<c:param name="bNo" value="${ b.bNo }" />
		<c:param name="bType" value="${ b.bType }" />
	</c:url>
	<c:choose>
		<c:when test="${b.bType eq 1 }">
			<c:url var="boardList" value="boardListFaq.bo">
				<c:param name="page" value="${ page }" />
			</c:url>
		</c:when>
		<c:when test="${b.bType eq 2}">
			<c:url var="boardList" value="boardListTips.bo">
				<c:param name="page" value="${ page }" />
			</c:url>
		</c:when>
		<c:otherwise>
			<c:url var="boardList" value="boardListStudy.bo">
				<c:param name="page" value="${ page }" />
			</c:url>
		</c:otherwise>
	</c:choose>
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid mb-3">
					<h1 style="text-align: center; margin-bottom: 3rem;">
						<c:choose>
							<c:when test="${b.bType eq 1 }">Q&amp;A</c:when>
							<c:when test="${b.bType eq 2}">Tips</c:when>
							<c:otherwise>Study</c:otherwise>
						</c:choose>
					</h1>
					<div class="col-sm-12 btn" style="text-align: right;">
						<button type="button" class="btn btn-warning"
							onclick="location.href='${boardList}'"
							style="font-size: 0.8rem; color: #939597; width: 7rem;">돌아가기</button>
						<c:if test="${ loginUser.id eq b.bWriter }">
							<button type="button" class="btn btn-warning"
								onclick="location.href='${updateBoardForm}'"
								style="font-size: 0.8rem; color: #939597; width: 7rem;">수정하기</button>
							<button type="button" id="checkDelete" class="btn btn-warning"
								data-toggle="modal" data-target="#modal-warning"
								style="font-size: 0.8rem; color: #939597; width: 7rem;">삭제하기</button>
						</c:if>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Modal -->
			<div class="modal fade" id="modal-warning">
				<div class="modal-dialog">
					<div class="modal-content bg-warning">
						<div class="modal-header mb-5" style="border-bottom: 1px #fff;">
							<h4 class="modal-title">정말 삭제하시겠습니까?</h4>
						</div>
						<div class="modal-footer justify-content-between"
							style="border-top: 1px #fff;">
							<button type="button" class="btn btn-outline-dark"
								data-dismiss="modal">아니오</button>
							<button type="button" class="btn btn-outline-dark"
								onclick="location.href='${deleteBoard}'">네</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="card">
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<table class="table table-hover" style="color: #939597;">
								<tbody>
									<c:url var="bdetail" value="boardDetail.bo">
										<c:param name="bNo" value="${ b.bNo }" />
										<c:param name="page" value="${ pi.currentPage }" />
									</c:url>
									<tr>
										<td
											style="vertical-align: middle; font-size: 1.3rem; font-weight: bold;"><span><button
													type="button" class="btn-tag">oracle</button>&nbsp;</span> <br>${ b.bTitle }</td>
										<c:url var="mypage" value="mypage.me">
											<c:param name="userId" value="${ b.bWriter }" />
										</c:url>
										<td style="vertical-align: middle;"><a href="${ mypage }">${ b.nickName }</a></td>
										<td style="vertical-align: middle;">${ b.bDate }</td>
										<td style="vertical-align: middle;"><span><i
												class="bi bi-hand-thumbs-up"></i>100</span></td>
										<td style="vertical-align: middle;"><span><i
												class="bi bi-eye"></i>${ b.bCount }</span></td>
										<td style="vertical-align: middle;"><span><i
												class="bi bi-chat"></i>100</span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="card-body">
							<textarea id="summernote" name="bContent" readonly>${b.bContent}</textarea>
						</div>


						<!-- 댓글 -->
						<!-- <div class="card-body table-responsive p-0">
							<table class="table table-hover noReplyTable"
								style="color: #939597;">
								댓글 없을 때
								<tr>
									<td style="text-align: center;">댓글이 없습니다.</td>
								</tr>
								<tr>
									<td style="text-align: center;"><button id="edit"
											class="btn btn-warning" onclick="addReply()" type="button"
											style="font-size: 0.8rem; color: #939597; width: 7rem;">댓글
											달기</button></td>
								</tr>
							</table>
							댓글 있을 때
							<table class="table table-hover replyTable"
								style="color: #939597;">
								<tr>
									<td><a href="#">개발자도비</a>&nbsp;&nbsp;<span><i
											class="bi bi-hand-thumbs-up"></i>100</span><br>
									<span>2021-09-16 16:24</span></td>
									<td>
										<button id="edit" class="btn btn-warning"
											onclick="editReply()" type="button"
											style="font-size: 0.8rem; color: #939597; width: 7rem;">댓글
											수정</button>
										<button id="save" class="btn btn-warning" onclick="cancle()"
											type="button"
											style="font-size: 0.8rem; color: #939597; width: 7rem;">취소</button>
											<button id="save" class="btn btn-warning" onclick="delete()"
											type="button"
											style="font-size: 0.8rem; color: #939597; width: 7rem;">댓글 삭제</button>
									</td>
									<td style="width: 60rem;">여기띄우겠지?</td>
									
								</tr>
							</table>
																
										<tr>
										<td style="width:60rem;">댓글 띄울 부분</td>
										<td><td id="summernote" style="display:none;"></td>
											
										</tr> 
								</table>





								<tr>
										<td id="summernote" style="width:50rem;">여기띄우겠지?</td>
										<td></td>
									</tr>

						</div> -->
					</div>
					<!-- /.card-body -->
				</div>
			</section>
			<!-- /.content -->
		</div>
	</div>
	<!-- jQuery -->
	<script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- SweetAlert2 -->
	<script src="../../plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- Toastr -->
	<script src="../../plugins/toastr/toastr.min.js"></script>
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
	<!-- 	<script>
	var a = $('#summernote'); 
	var addReply = function () { a.summernote({ focus: true}); };
	var editReply = function () { a.summernote({ focus: true }); };
	var save = function () { var markup = a.summernote('code');
	a.summernote('destroy'); };
	var cancle = function () {
	a.summernote('destroy'); };
	</script> -->
	<script>
		$(function() {
			// Summernote
			$('#summernote').summernote(
					{
						lang: "ko-KR",
						height : 1000,
						disableResizeEditor : true,
						/* focus : true, */
						disableDragAndDrop : true,
						toolbar : [],
								/* // [groupName, [list of button]]
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
								'72' ], */
					  callbacks : { 				
						  onImageUpload : function(files, editor, welEditable) {
							  for (var i = files.length - 1; i >= 0; i--) {
						            uploadSummernoteImageFile(files[i], this);
						            }
						  		}	
					  		}
					});
			$('#summernote').summernote('disable');
			// CodeMirror
			CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"),
					{
						mode : "htmlmixed",
						theme : "monokai"
					});
		});
		$('.selectpicker').selectpicker();
		$('.note-statusbar').hide();
		
		
		
	</script>
</body>
</html>

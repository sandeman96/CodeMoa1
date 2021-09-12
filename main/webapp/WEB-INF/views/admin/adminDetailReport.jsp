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

/* 신고 모달 */
.modalReport {

}
</style>
</head>
<body>
	<c:import url="../admin/adminSidebar.jsp"/>
	
	<c:url var="deleteReport" value="adminDeleteReport.ad">
			<c:param name="pNo" value="${ pNo }" />
	</c:url>

	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid mb-3">
					<h1 style="text-align: center; margin-bottom: 3rem;">
					</h1>
					<div class="col-sm-12 btn" style="text-align: right;">
					
						<button type="button" class="btn btn-warning"
							onclick="location.href='adminReportBoard.ad'"
							style="font-size: 0.8rem; color: #939597; width: 7rem;">돌아가기
						</button>
						
<!-- 						<form action="adminDeleteReport.ad" method="get"> -->
<%-- 							<input type="hidden" name="pNo" id="pNo" value="${ param.pNo }"> --%>
							<button type="button" id="checkDelete" class="btn btn-warning"
								data-toggle="modal" data-target="#modal-warning"
								style="font-size: 0.8rem; color: #939597; width: 7rem;">삭제하기</button>
<!-- 						</form> -->
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			
<!-- 			Modal -->
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
<!-- 						<button type="button" class="btn btn-outline-dark" -->
<%-- 							onclick="location.href='adminDeleteReport.ad?pNo=${param.pNo}'">네</button> --%>
						<form action="adminDeleteReport.ad" method="get">
							<input type="hidden" name="pNo" id="pNo" value="${ param.pNo }">
							<input type="submit" class="btn btn-outline-dark" value="네"
							onclick="location.href='adminDeleteReport.ad'">
							</form>
						</div>
					</div>
<!-- 					/.modal-content -->
				</div>
<!-- 				/.modal-dialog -->
			</div>
			
			<div class="container-fluid">
						<div class="card">
							<!-- /.card-header -->
							<div class="card-body table-responsive p-0">
								<table class="table table-hover" style="color: #939597;">
									<tr> 
										
									</tr>
									<tbody>
<%-- 										<c:url var="bdetail" value="boardDetail.bo"> --%>
<%-- 											<c:param name="bNo" value="${ b.bNo }" /> --%>
<%-- 											<c:param name="page" value="1" /> --%>
<%-- 										</c:url> --%>
									<c:if test="${ p.pType eq '1' or p.pType eq '2'}">
										<tr style="font-weight: bold;" >
											<td style=" color: black;">
												신고된 유저 :
											</td>
											<td style="color: blue;">
												닉네임: ${ param.pMnick }
											</td>
<!-- 											<td style="color: blue;"> -->
<%-- 												닉네임: ${ b.nickName } --%>
<!-- 											</td> -->
<!-- 											<td> -->
<%-- 												${ param.bContent } --%>
<!-- 											</td> -->
											<td style="color: blue;">${ p.pDate }</td>
												
										</tr>
									</c:if>
									
									<c:if test="${ p.pType eq '3' or p.pType eq '4' or p.pType eq '5' or p.pType eq '6'}">
										<tr style="font-weight: bold;" >
											<td style=" color: black;">
												신고된 게시판 :
											</td>
											<td style="color: blue;">
												닉네임: ${ p.pMnick }
											</td>
<!-- 											<td style="color: blue;"> -->
<%-- 												닉네임: ${ b.nickName } --%>
<!-- 											</td> -->
<!-- 											<td> -->
<%-- 												${ param.bContent } --%>
<!-- 											</td> -->
											<td style="color: blue;">신고한 날짜 : ${ p.pDate }</td>
												
										</tr>
									</c:if>
									</tbody>
								</table>
							</div>
						</div>
		
					</div>
				<!-- /.container-fluid -->

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="card">
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<table class="table table-hover" style="color: #939597;">
<%-- 							<c:url var="pList" value="adminReportBoard.ad"> --%>
<%-- 								<c:param name="pageP" value="${ pageP }"></c:param> --%>
<%-- 							</c:url> --%>
								<tbody>
<%-- 									<c:url var="reportDetail" value="adminDetailReport.ad"> --%>
<%-- 										<c:param name="pNo" value="${ param.pNo }" /> --%>
<%-- 										<c:param name="pBno" value="${ param.pBno }" /> --%>
<%-- 										<c:param name="pBpage" value="${ param.pBpage }"/> --%>
<%-- 										<c:param name="" value=""/> --%>
<%-- 										<c:param name="" value=""/> --%>
<%-- 										<c:param name="" value=""/> --%>
<%-- 										<c:param name="pageP" value="${ rpi.currentPageP }" /> --%>
<%-- 									</c:url> --%>
												
									
									<tr>
										<td
											style="vertical-align: middle; font-size: 1.3rem; font-weight: bold;"><span><button
													type="button" class="btn-tag">oracle</button>&nbsp;</span> <br>${ p.pTitle }</td>
										<c:url var="mypage" value="mypage.me">
											<c:param name="userId" value="${ p.pReceiver }" />
										</c:url>
										<td style="vertical-align: middle;"><a href="${ mypage }">신고자: ${ p.pReceiver }</a></td>
										<td style="vertical-align: middle;">보드번호 : ${ p.pBno }</td>

									</tr>
								</tbody>
							</table>
						</div>
						<div class="card-body"> 
<%-- 							번호: <c:out value="${ param.bNo }"></c:out>  --%>
							<textarea id="summernote" name="pContent" readonly>${p.pContent}</textarea>
						</div>
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
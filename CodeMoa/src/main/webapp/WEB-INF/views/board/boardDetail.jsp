<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet"
	href="/codemoa/resources/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="/codemoa/resources/dist/css/adminlte.min.css">
<script
	src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="/codemoa/resources/plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
	font-size: 0.8rem;
	line-height: 0.5;
	background-color: #f5df4d;
	color: black;
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
/*태그버튼*/
.btn-first-tag {
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
	font-size: 0.8rem;
	line-height: 0.5;
	background-color: #f5825f;
	color: black;
	cursor: default;
}

body {
	font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI",
		Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica,
		Arial, sans-serif;
}
/*태그버튼*/
.btn-second-tag {
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
	font-size: 0.8rem;
	line-height: 0.5;
	background-color: #4DB7F5;
	color: black;
}
</style>
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
					<h1 style="text-align: center; margin-bottom: 3rem;">
						<c:choose>
							<c:when test="${b.bType eq 1 }">
							&#128587;Q&amp;A
							<c:set var="boardName" value="Faq"/>
							<c:set var="tagName" value="Q&A"/>
							</c:when>
							<c:when test="${b.bType eq 2}">
							&#129488;Tips
							<c:set var="boardName" value="Tips"/>
							<c:set var="tagName" value="Tips"/>
							</c:when>
							<c:otherwise>
							&#128488;Study
							<c:set var="boardName" value="Study"/>
							<c:set var="tagName" value="Study"/>
							</c:otherwise>
						</c:choose>
					</h1>
					<div class="col-sm-12 btn" style="text-align: right;">
					
					
					<c:if test="${loginUser == null and b.bFirst == 'N' }">
						<button type="button" class="btn btn-warning" onclick="location.href='loginForm.me'"
							style="font-size: 0.8rem; color: #939597; width: 7rem;">
								신고하기
							</button>
					</c:if>
                      <c:if test="${ loginUser != null and b.bFirst =='N' }">
        		        	<button type="button" class="btn btn-warning" onclick="location.href='adminInsertReport.ad?bNo=${b.bNo}&bType=${b.bType }&bWriter=${b.bWriter}&bTitle=${b.bTitle}&nickName=${b.nickName}&bDate=${b.bDate}&page=${page}'"
							 style="font-size: 0.8rem; color: #939597; width: 7rem;">신고하기</button>
						</c:if>
						<c:if test="${ loginUser.id eq b.bWriter }">
							<button type="button" class="btn btn-warning"
								onclick="location.href='updateBoardForm.bo?page=${page}&bNo=${b.bNo}&boardName=${boardName}'"
								style="font-size: 0.8rem; color: #939597; width: 7rem;">수정하기</button>
							<button type="button" id="checkDelete" class="btn btn-warning"
								style="font-size: 0.8rem; color: #939597; width: 7rem;">삭제하기</button>
						</c:if>
					</div>
				</div>
			</section>

			<section class="content">
				<div class="container-fluid">
					<div class="card">
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<table class="table table-hover" style="color: #939597;">
								<tbody>
									<c:if test="${b.bFirst eq 'Y' }">
										<tr style="font-weight: bold;">
											<td style="width: 50rem;"><span>
													<button type="button" class="btn-second-tag">공지</button>&nbsp;
													<button type="button" class="btn-first-tag">${tagName}</button>&nbsp;
											</span> <c:if test="${ b.bTags ne null}">
													<c:forTokens var="tag" items="${ b.bTags }" delims=",">
														<span>
															<button type="button" class="btn-tag">
																<c:out value="${tag}" />
															</button>&nbsp;
														</span>
													</c:forTokens>
												</c:if> <br> <span
												style="font-size: 1.5rem; color: black; font-weight: 500;">${ b.bTitle }</span></td>
											<td><a href="mypage.me?userId=${b.bWriter}"
												style="color: black;">${ b.nickName }</a></td>
											<td style="color: black;">${ b.bDate }</td>
											<td style="color: black;"><c:choose>
													<c:when
														test="${ !empty loginUser && loginUser.id eq likey.lId }">
														<a href="javascript: likeFunc();"> <i
															class="like bi bi-hand-thumbs-up-fill"
															style="color: #1e8bc3">${ b.lCount }</i>
														</a>
													</c:when>
													<c:when test="${ empty loginUser }">
														<i class="bi bi-hand-thumbs-up">${ b.lCount }</i>
													</c:when>
													<c:otherwise>
														<a href="javascript: likeFunc();"> <i
															class="like bi bi-hand-thumbs-up">${ b.lCount }</i>
														</a>
													</c:otherwise>
												</c:choose></td>
											<td style="color: black;"><span><i
													class="bi bi-eye"></i>${ b.bCount }</span></td>
											<td style="color: black;"><span><i
													class="bi bi-chat"></i>${ b.rCount }</span></td>
										</tr>
									</c:if>
									<c:if test="${b.bFirst ne 'Y' }">
										<tr>
											<td><span>
													<button type="button" class="btn-first-tag">${tagName}</button>&nbsp;
											</span> <c:if test="${ b.bTags ne null}">
													<c:forTokens var="tag" items="${ b.bTags }" delims=",">
														<span>
															<button type="button" class="btn-tag">
																<c:out value="${tag}" />
															</button>&nbsp;
														</span>
													</c:forTokens>
												</c:if> <br> <span
												style="font-size: 1.5rem; color: black; font-weight: 500;">${ b.bTitle }</span></td>
											<td><a href="mypage.me?userId=${b.bWriter}">${ b.nickName }</a></td>
											<td>${ b.bDate }</td>
											<td><c:choose>
													<c:when
														test="${ !empty loginUser && loginUser.id eq likey.lId }">
														<a href="javascript: likeFunc();"> <i
															class="like bi bi-hand-thumbs-up-fill"
															style="color: #1e8bc3">${ b.lCount }</i>
														</a>
													</c:when>
													<c:when test="${ empty loginUser }">
														<i class="bi bi-hand-thumbs-up">${ b.lCount }</i>
													</c:when>
													<c:otherwise>
														<a href="javascript: likeFunc();"> <i
															class="like bi bi-hand-thumbs-up">${ b.lCount }</i>
														</a>
													</c:otherwise>
												</c:choose></td>
											<td><span><i class="bi bi-eye"></i>${ b.bCount }</span></td>
											<td><span><i class="bi bi-chat"></i>${ b.rCount }</span></td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>



						<div class="card-body">
							<div class="summernoteContent" name="bContent">${b.bContent}</div>
						</div>


						<div class="card-body table-responsive p-0">
							<table class="table table-hover" style="color: #939597;">
								<tbody>
									<tr>
										<c:if test="${ !empty loginUser }">
											<td>
												<div>
													<button id="insertReply" class="btn btn-warning"
														type="button"
														style="font-size: 0.8rem; color: #939597; width: 7rem;">댓글
														달기</button>
												</div>
											</td>
										</c:if>
										<td><c:if test="${ b.rCount == 0 }">
												<div style="display: none;" id="beforeClick">댓글이 없습니다.</div>
											</c:if>
											<div style="display: none;" id="afterClick">
												<button id="saveReply" class="btn btn-warning" type="button"
													style="font-size: 0.8rem; color: #939597; width: 7rem;">작성
													완료</button>
												<button id="cancelReply" class="btn btn-warning"
													type="button"
													style="font-size: 0.8rem; color: #939597; width: 7rem;">취소</button>
												<textarea id="summernoteReply"></textarea>
											</div></td>
									</tr>
								</tbody>
							</table>

							<table id="replyHere" class="table table-hover"
								style="color: #939597;">
								<tbody></tbody>
							</table>
						</div>
					</div>
					<!-- /.card-body -->
				</div>
			</section>
			<!-- /.content -->
		</div>
	</div>
	<script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
	<script
		src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
	<script src="/codemoa/resources/dist/js/demo.js"></script>
	<script
		src="/codemoa/resources/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- sweetalert2 -->
	<script src="/codemoa/resources/plugins/sweetalert2.all.min.js"></script>
	<script>
		$(function() {
			getReplyList();

			// Board Content부분
			$('.summernoteContent').summernote({
				height : 500,
				disableResizeEditor : true,
				disableDragAndDrop : true,
				toolbar : []
			});
			$('.summernoteContent').summernote('disable');
		});

		//좋아요기능
		function likeFunc() {
			$.ajax({
				url : 'like.bo',
				data : {
					bno : '${ b.bNo }',
					userId : '${ loginUser.id }'
				},
				success : function(data) {
					console.log(data);

					var num = Number($('.like').text());

					if (data == 'plus') {
						$('.like').addClass('bi-hand-thumbs-up-fill').removeClass('bi-hand-thumbs-up').css('color', '#1e8bc3');
						$('.like').text(num + 1);
					} else {
						$('.like').addClass('bi-hand-thumbs-up').removeClass('bi-hand-thumbs-up-fill').css('color', 'inhreit');
						$('.like').text(num - 1);

					}
				}
			});

		}

		//댓글 달기 버튼 누르면
		$('#insertReply').click(function() {
			if ($('#afterClick').hide()) {
				$('#afterClick').show();
				$('#insertReply').hide();
				$('#beforeClick').hide();
			}	
		
		$('#summernoteReply').summernote({				
			height : 250,
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

	});							
									
											
	//댓글 작성 완료 버튼 누르면
	$('#saveReply').click(function() {
		var text = $('#summernoteReply').summernote('code').replace(/<\/?[^>]+(>|$)/g, "");
		var rContent = $('#summernoteReply').summernote('code');
		if(text.trim() == '') {
			Swal.fire({
				  icon: 'error',
				  title: '댓글이 입력되지 않았습니다.',
				  text: '댓글을 입력해주세요!'
				});
			$('#summernoteReply').summernote('focus');
			return false;
		} else {
		$.ajax({
				url : 'insertReply.bo',
				data : {
					bno : '${ b.bNo }',
					userId : '${ loginUser.id }',
					rContent : rContent
				},
				success : function(data) {
					Swal.fire({
						  position: 'middle',
						  icon: 'success',
						  title: '댓글이 작성되었습니다.',
						  showConfirmButton: false,
						  timer: 1000
						})
					
					setTimeout(saved, 1000);
					
					function saved(){
						location.reload();
					}
					
				}
			});
		}
		});

		//댓글 달기 취소 버튼 누르면
		$('#cancelReply').click(function() {
			if ($('#insertReply').hide()) {
				$('#insertReply').show();
				$('#afterClick').hide();
				$('#beforeClick').show();
			}	
			$('#summernoteReply').summernote('destroy');
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

		//댓글 목록 가져오기
		function getReplyList() {
			$.ajax({
						url : 'rList.bo',
						data : {
							bno : '${ b.bNo }'
						},
						success : function(data) {
							var $tableBody = $('#replyHere tbody');
							$tableBody.html('');
							
							if (data.length > 0) {
								for ( var i in data) {
									var $input = $('<input type="hidden" value="'+ data[i].rNo +'">');
									var $content = $('<div id="replyContent'+i+'">').html(data[i].rContent);
									var $tdContent = $('<td id="tdContentId'+ i +'" style="width:60rem;">');
									var $tr = $('<tr style="height:10rem;" id="trId'+ i +'">');
									var $move = $('<a href="mypage.me?userId='+data[i].rWriter+'">').html(data[i].nickName);
									var $writer = $('<td style="width:20rem;">');
									var $date = $('<td style="width:10rem;">' ).text(data[i].rDate);
									var $tdBtn = $('<td id="replyBtnArea'+i+'" style="width:20rem;">');
									var $updateReplyBtn = $('<button id="updateReplyBtn'+i+'" class="btn btn-warning updateReplyBtn" type="button" style="font-size: 0.8rem; color: #939597; width: 7rem;">').text('수정하기');
									var $deleteReplyBtn = $('<button id="deleteReplyBtn'+i+'" class="btn btn-warning deleteReplyBtn ml-2" type="button" style="font-size: 0.8rem; color: #939597; width: 7rem;">').text('삭제하기');
									var $updateDoneBtn = $('<button id="updateDoneBtn'+i+'" class="btn btn-warning updateDoneBtn" type="button" style="font-size: 0.8rem; color: #939597; width: 7rem;">').text('수정 완료').hide();
									var $cancelUpdateBtn = $('<button id="cancelUpdateBtn'+i+'" class="btn btn-warning cancelUpdateBtn ml-2" type="button" style="font-size: 0.8rem; color: #939597; width: 7rem;">').text('수정 취소').hide();
									
									
									$content.append($input);
									$tdContent.append($content);
									
									$tdBtn.append($updateReplyBtn);
									$tdBtn.append($deleteReplyBtn);
									$tdBtn.append($updateDoneBtn);
									$tdBtn.append($cancelUpdateBtn);
									
									$writer.append($move);
									$tr.append($tdContent);
									$tr.append($writer);
									$tr.append($date);
									$tr.append($tdBtn);

									if (data[i].rWriter != '${loginUser.id}'
										|| '${loginUser.id}' == null) {
										$tdBtn.css('display', 'none');
								}
									
									$tableBody.append($tr);
								}
								
								//댓글 수정하기 버튼 클릭시
								$("[id^=updateReplyBtn]").on('click', function() {
									var num1 = $(this).parent().attr('id');
									var dataNo1 = num1.substr(12, num1.length - 1);
									$('#updateReplyBtn'+dataNo1).hide();
									$('#deleteReplyBtn'+dataNo1).hide();
									$('#updateDoneBtn'+dataNo1).show();
									$('#cancelUpdateBtn'+dataNo1).show();
									$('#replyContent'+dataNo1).attr('class', 'summernote');		
									
									$('#replyContent'+dataNo1).summernote({				
										height : 250,
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
								});	
								
								//댓글 수정완료 버튼 클릭시
								$('[id^=updateDoneBtn]').on('click', function() {
									var num2 = $(this).parent().attr('id');
									var dataNo2 = num2.substr(12, num2.length - 1);
									var rContent = $('#replyContent'+dataNo2).summernote('code');
									var rNo = $('#replyContent'+dataNo2).children('input').val();
									if(rContent.replace(/<\/?[^>]+(>|$)/g, "") == '') {
										Swal.fire({
											  icon: 'error',
											  title: '댓글이 입력되지 않았습니다.',
											  text: '댓글을 입력해주세요!'
											});
										return false;
									} else {
									$.ajax({
										url: 'updateReply.bo', 
										data:{
											rNo: rNo,
											userId:'${ loginUser.id }',
											rContent: rContent
										},
										type : "POST",
										success:function(data){
												Swal.fire({
													  position: 'middle',
													  icon: 'success',
													  title: '댓글이 수정되었습니다.',
													  showConfirmButton: false,
													  timer: 1000
													})
												
												setTimeout(saved, 1000);
												
												function saved(){
													$('#replyContent'+dataNo2).removeClass('summernote');
													$('#updateReplyBtn'+dataNo2).show();
													$('#deleteReplyBtn'+dataNo2).show();
													$('#updateDoneBtn'+dataNo2).hide();
													$('#cancelUpdateBtn'+dataNo2).hide();			
													getReplyList();
												}
												
											}
											
									});
									}
								});	
								
								//댓글 수정취소 버튼 클릭시
								$('[id^=cancelUpdateBtn]').on('click', function() {
									var num3 = $(this).parent().attr('id');
									var dataNo3 = num3.substr(12, num3.length - 1);
									$('#replyContent'+dataNo3).removeClass('summernote');
									$('#updateReplyBtn'+dataNo3).show();
									$('#deleteReplyBtn'+dataNo3).show();
									$('#updateDoneBtn'+dataNo3).hide();
									$('#cancelUpdateBtn'+dataNo3).hide();
									getReplyList();
								});
								
								//댓글 삭제버튼 클릭시
								$("[id^=deleteReplyBtn]").on('click', function() {
									var num4 = $(this).parent().attr('id');
									var dataNo4 = num4.substr(12, num4.length - 1);
									var rNo = $('#replyContent'+dataNo4).children('input').val();		
									Swal.fire({
										  title: '정말 삭제하시겠습니까?',
										  text: "삭제 이후엔 복구할 수 없습니다.",
										  icon: 'warning',
										  showCancelButton: true,
										  confirmButtonColor: '#3085d6',
										  cancelButtonColor: '#d33',
										  cancelButtonText: '취소',
										  confirmButtonText: '삭제'
										}).then((result) => {
										  if (result.isConfirmed) {
											  $.ajax({
													url: 'deleteReply.bo', 
													data:{
														rNo: rNo
													},
													type : "POST",
													success:function(data){
														Swal.fire({
															  position: 'middle',
															  icon: 'success',
															  title: '댓글이 삭제되었습니다.',
															  showConfirmButton: false,
															  timer: 1000
															})
														
														setTimeout(saved, 1000);
														
														function saved(){
															location.reload();
														}
													
														}
													});
										  }
										});
								});										
							} else {
								$('#beforeClick').css('display', 'block');
							}
						}
					});
		}
		
		//삭제하기 버튼 클릭시
		$('#checkDelete').click(function() {
			Swal.fire({
				  title: '정말 삭제하시겠습니까?',
				  text: "삭제 이후엔 복구할 수 없습니다.",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  cancelButtonText: '취소',
				  confirmButtonText: '삭제'
				}).then((result) => {
				  if (result.isConfirmed) {
						Swal.fire({
							  position: 'middle',
							  icon: 'success',
							  title: '게시글이 삭제되었습니다.',
							  showConfirmButton: false,
							  timer: 1000
							})
							setTimeout(saved, 1000);
						
						function saved(){
							 location.href="deleteBoard.bo?bNo=${b.bNo}&bType=${b.bType}"
						}	
					 
				  }
				});

		});	
	</script>
</body>
</html>

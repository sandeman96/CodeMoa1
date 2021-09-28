<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet" href="/codemoa/resources/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/codemoa/resources/dist/css/adminlte.min.css">

<style>
.modify {
	display: none;
}

.modify textarea {
	width: 100%;
	height: 50px;
	resize: none;
}

.rcontent {
	/* 	height: 25px; */
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.box {
	height: 35rem;
	padding: 10px;
	overflow-y: scroll;
}

.box::-webkit-scrollbar { /* 스크롤바 막대 너비 설정 */
	width: 6px;
} /* 스크롤바 막대 설정*/
.box::-webkit-scrollbar-thumb { /* 스크롤바 막대 높이 설정 */
	height: 10px;
	background-color: #f5df4d; /* 스크롤바 둥글게 설정 */
	border-radius: 10px;
} /* 스크롤바 뒷 배경 설정*/
.box::-webkit-scrollbar-track {
	background-color: rgba(0, 0, 0, 0);
}

.posting {
	color: #666;
	margin-bottom: 10x;
	padding-bottom: 10px;
}

.posting:not (:first-child ) .title {
	border-top: 1px solid #adb5bd;
}

.feedback {
	display: none;
	line-height: 38px;
}

#userProfile {
	display: inline-block;
	height: 170px;
	width: 170px;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	overflow: hidden;
	word-break:break-all;
}
/*a태그 밑줄x/글씨색변화x*/
a:link, a:visited {
	color: #939597;
	text-decoration: none;
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



	<c:if test="${ user.status == 'N' }">
		<div class="content-wrapper">

			<section class="content mt-5">
				<div class="error-page">
					<div class="error-content">
						<h3>
							<i class="fas fa-exclamation-triangle text-danger"></i>
							존재하지 않는 회원입니다.
						</h3>
					</div>
				</div>
			</section>

		</div>
	</c:if>
	
	<c:if test="${ user.status == 'Y' }">

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="mb-2 mt-2">
						<div class="col-sm-6">
							<h1 >${ user.nickName }님의 페이지 📌</h1>
						</div>

					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-3" style="max-width: 315px;">

							<div class="text-center mb-2">
								<%-- <img class="img-circle elevation-2" src="/codemoa/resources/userProfile/${user.id }.jpg" style="width: 170px; height:170px;"> --%>
								<div id="userProfile" class="img-circle elevation-2 userImg">
									<h3 style="line-height: 170px;">
										<b>${ user.nickName }</b>
									</h3>
								</div>
							</div>
							<c:if test="${ loginUser.id eq user.id }">
								<button type="button" class="float-right btn btn-default" data-toggle="dropdown" aria-expanded="false">🎨</button>
								<div class="dropdown-menu" style="">
								
									<form id="upload" action="uploadImg.me" method="post" enctype="multipart/form-data">
										<div class="dropdown-item btn btn-default btn-file">
												upload photo <input type="file" id="profileImg" name="profileImg" onchange="LoadImg(this)">
										</div>
									</form>
							
									<c:if test="${ userImg != 'none' }">
										<c:url var="deleteUserImg" value="deleteImg.me">
											<c:param name="userImg" value="${ userImg }" />
										</c:url>
										<a class="dropdown-item" href="${ deleteUserImg }">remove photo</a>
									</c:if>
								</div>
							</c:if>

							<h3 class="profile-username">
								<b>${ user.nickName }</b>
							</h3>

							<!-- <p class="text-muted text-center">Software Engineer</p> -->
							<p class="text-muted">${ user.email }</p>

							<input type="hidden" name="userId" value="${ user.id }">

							<c:if test="${loginUser != null && loginUser.id ne user.id }">
								<div class="btnArea text-center">

									<c:url var="sendMsg" value="messageBox.ms">
										<c:param name="receiver" value="${ user.nickName }" />
									</c:url>

									<button type="button" class="btn btn-default btn-block mb-2" onclick="location.href='${ sendMsg }'">쪽지 보내기</button>
								</div>
							</c:if>

							<!-- About Me Box -->
							<div class="card card-warning mt-2">
								<div class="card-header clearfix">
									<h3 class="card-title">About Me</h3>
									<c:if test="${ loginUser.id eq user.id }">
										<span id="aboutEdit" class="float-right">
											<i class="fas fa-edit"></i>
										</span>
										<span id="aboutSave" class="float-right modify">
											<i class="fas fa-check"></i>
										</span>
									</c:if>
								</div>
								<!-- /.card-header -->
								<div class="card-body">

									<strong>📚 Education</strong>
									<p class="text-muted aboutme">${ user.education }</p>
									<div class="about modify text-center">
										<textarea name="education" id="education" class="form-control">${ user.education }</textarea>
									</div>

									<hr>

									<strong>📍 Location</strong>
									<p class="text-muted aboutme">${ user.location }</p>
									<div class="about modify text-center">
										<textarea name="location" id="location" class="form-control">${ user.location }</textarea>
									</div>

									<hr>

									<strong>✏ Skills</strong>
									<p class="text-muted aboutme">${ user.skill }</p>
									<div class="about modify text-center">
										<textarea name="skill" id="skill" class="form-control">${ user.skill }</textarea>
									</div>

									<hr>

									<strong>📝 Notes</strong>
									<p class="text-muted aboutme">${ user.note }</p>
									<div class="about modify text-center">
										<textarea name="note" id="note" class="form-control">${ user.note }</textarea>
									</div>

								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->

						<div class="col-md-9">
							<div class="card">

								<div class="card-header p-2">
									<ul class="nav nav-pills">
										<li class="nav-item">
											<a class="nav-link active" href="#myBoard" data-toggle="tab">게시글 활동</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="#myReply" data-toggle="tab">댓글 활동</a>
										</li>
										<c:if test="${ loginUser.id eq user.id }">
											<li class="nav-item">
												<a class="nav-link" href="#settings" data-toggle="tab">내정보 수정</a>
											</li>
										</c:if>
									</ul>
								</div>
								<!-- /.card-header -->


								<div class="card-body">
									<div class="tab-content">

										<!-- //////////////////Board///////////////// -->
										<div class="active tab-pane" id="myBoard">
										
										<c:if test="${ loginUser.id eq user.id }">
											<div class="custom-control custom-checkbox text-right">
												<input class="bbox-toggle custom-control-input custom-control-input-danger custom-control-input-outline" type="checkbox" id="bSelectAll"> <label for="bSelectAll" class="custom-control-label">전체선택</label>
											</div>
										</c:if>

											<div class="box">
												<c:if test="${bList.isEmpty()}">
													<h5 style="text-align: center;">작성하신 게시물이 존재하지 않습니다.</h5>
												</c:if>

												<c:if test="${!bList.isEmpty()}">

													<c:forEach var="b" items="${ bList }">

														<c:url var="bdetail" value="boardDetail.bo">
															<c:param name="bNo" value="${ b.bNo }" />
															<c:param name="page" value="1" />
														</c:url>

														<c:choose>
															<c:when test="${b.bType eq 1 }">
																<c:set var="type" value="Q&A" />
															</c:when>
															<c:when test="${b.bType eq 2}">
																<c:set var="type" value="Tips" />
															</c:when>
															<c:otherwise>
																<c:set var="type" value="Study" />
															</c:otherwise>
														</c:choose>

														<!-- Post -->
														<div class="post">
															<div class="row">
																<h5 class="title col-11">
																	[${ type }]
																	<a href="${ bdetail }" class="font-weight-bold"> ${ b.bTitle }</a>
																</h5>
																<div class="custom-control custom-checkbox text-right col-1">
																	<input class="custom-control-input custom-control-input-danger boardCheck" type="checkbox" id="${ b.bNo }"> <label for="${ b.bNo }" class="custom-control-label"></label>
																</div>
															</div>

															<span class="description text-sm">${ b.bDate }</span>
															<span class="float-right text-sm mr-2"> 💬 ${ b.rCount } </span>
															<span class="float-right text-sm mr-2"> 👁 ${ b.bCount } </span>
															<span class="float-right text-sm mr-2"> 👍 ${ b.lCount } </span>
														</div>
														<!-- /.post -->

													</c:forEach>

												</c:if>

											</div>
											
											
											<c:if test="${ loginUser.id eq user.id }">
											<div class="mt-2 text-right">
												<button type="button" class="btn btn-default btn-sm" onclick="deleteBoard();">
													<i class="far fa-trash-alt"></i>
												</button>
											</div>
											</c:if>
											
										</div>


										<!-- //////////////////Reply///////////////// -->
										<div class="tab-pane" id="myReply">
										
										<c:if test="${ loginUser.id eq user.id }">
											<div class="custom-control custom-checkbox text-right">
												<input class="rbox-toggle custom-control-input custom-control-input-danger custom-control-input-outline" type="checkbox" id="rSelectAll"> <label for="rSelectAll" class="custom-control-label">전체선택</label>
											</div>
										</c:if>


											<div class="box">
												<c:if test="${rList.isEmpty()}">
													<h5 style="text-align: center;">작성하신 댓글이 존재하지 않습니다.</h5>
												</c:if>

												<c:if test="${!rList.isEmpty()}">

													<c:forEach var="r" items="${ rList }" varStatus="status">

														<c:url var="rdetail" value="boardDetail.bo">
															<c:param name="bNo" value="${ r.rBNo }" />
															<c:param name="page" value="1" />
														</c:url>

														<c:set var="bBoard" value="${rList[status.index - 1].rBNo}" />
														<c:set var="nBoard" value="${rList[status.index].rBNo}" />
														<c:set var="aBoard" value="${rList[status.index + 1].rBNo}" />


														<c:if test="${ nBoard != bBoard }">
															<c:out value='<div class="card mb-3">' escapeXml="false" />
														</c:if>

														<c:if test="${ nBoard !=  bBoard}">
															<div class="card-header font-weight-bold">
																<h5>
																	<a href="${ rdetail }">${ r.bTitle }</a>
																</h5>
															</div>
														</c:if>

														<div class="card-body row">
															<div class="card-text rcontent col-9">
																👉
																<c:out value='${ r.rContent.replaceAll("\\\<.*?\\\>","") }' escapeXml="false" />
															</div>
															<div class="description text-sm col-2 text-right">${ r.rDate }</div>
															<div class="form-check col-1 text-right">
																<input id="${ r.rNo }" class="form-check-input replyCheck" type="checkbox">
															</div>

														</div>

														<c:if test="${ nBoard != aBoard }">
															<c:out value='</div>' escapeXml="false" />
														</c:if>

														<!-- </div> -->

													</c:forEach>
												</c:if>

											</div>
											
											<c:if test="${ loginUser.id eq user.id }">
											<div class="mt-2 text-right">
												<button type="button" class="btn btn-default btn-sm" onclick="deleteReply();">
													<i class="far fa-trash-alt"></i>
												</button>
											</div>
											</c:if>

										</div>
										<!-- /.tab-pane -->


										<!-- //////////////////Setting///////////////// -->
										<c:if test="${ loginUser.id eq user.id }">
											<div class="tab-pane" id="settings">

												<div class="box">

													<form action="mUpdate.me" method="post" id="mupdate">

														<div class="form-group row">
															<label for="name" class="col-2 col-form-label">ID</label>
															<div class="col-6">
																<input type="text" class="form-control" id="id" name="id" placeholder="Name" value="${ user.id }" readonly>
															</div>
														</div>

														<div class="form-group row">
															<label for="email" class="col-2 col-form-label">Email</label>
															<div class="col-6 input-group">
																<input type="email" class="form-control" id="email" name="email" placeholder="Email" value="${ user.email }">
																<div class="input-group-append">
																	<div class="input-group-text">
																		<a href='javascript:sendEmail();' class="fas fa-envelope"></a>
																	</div>
																</div>
															</div>
															<div class="col-sm-4 feedback dupEmail text-sm">사용 불가능한 이메일입니다.</div>
														</div>

														<div id="emailNumInput" class="form-group row">
															<label for="nickName" class="col-2 col-form-label">인증번호</label>
															<div class="col-6">
																<input type="text" class="form-control" id="emailNum">
															</div>
															<div class="col-4 feedback emailNum text-sm">인증번호</div>
														</div>
														
														<div class="form-group row">
															<label for="nickName" class="col-2 col-form-label">NickName</label>
															<div class="col-6">
																<input type="text" class="form-control" id="nickName" name="nickName" placeholder="NickName" value="${ user.nickName }">
															</div>
															<div class="col-4 feedback dupNick text-sm">이미 사용중인 닉네임입니다.</div>
														</div>


														<div class="form-group row">
															<div class="offset-sm-2 col-sm-10">
																<c:url var="mypage" value="mypage.me">
																	<c:param name="userId" value="${ loginUser.id }" />
																</c:url>

																<button type="submit" id="mupdateBtn" class="btn btn-secondary">Save</button>


																<button type="reset" class="btn btn-warning" onclick="location.href='${mypage}'">Cancle</button>

																<button type="button" class="btn btn-danger float-right" data-toggle="modal" data-target="#modal-sm">Leave</button>
															</div>
														</div>

													</form>

													<h6>
														<i id="pwdModify" class="fas fa-chevron-down mt-5"> 비밀번호 수정</i>
													</h6>

													<form action="mpwdupdate.me" method="post" id="mpwdupdate">

														<div class="modify pwdMod">
															<div class="form-group row">
																<label for="pwd" class="col-2 col-form-label">Password</label>
																<div class="col-6">
																	<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" required>
																</div>
															</div>

															<div class="form-group row">
																<label for="newPwd" class="col-2 col-f=orm-label">New Pwd</label>
																<div class="col-6">
																	<input type="password" class="form-control" id="newPwd" name="newPwd" placeholder="Password">
																</div>
																<br>
																<div class="col-8 feedback pwdreg text-sm text-right">비밀번호는 8-12자리,영문 대·소문자,숫자,특수문자를 사용하세요.</div>
															</div>

															<div class="form-group row">
																<label for="newPwd2" class="col-2 col-form-label">New Pwd</label>
																<div class="col-6">
																	<input type="password" class="form-control" id="newPwd2" name="newPwd2" placeholder="Password">
																</div>
																<div class="col-sm-4 feedback repwd text-sm">비밀번호가 일치하지 않습니다.</div>
															</div>

															<div class="form-group row">
																<div class="offset-sm-2 col-sm-10">
																	<button type="submit" class="btn btn-secondary" id="mpwdupdateBtn">Save</button>
																	<button type="button" class="btn btn-warning" onclick="location.href='${mypage}'">Cancle</button>
																</div>
															</div>
														</div>

													</form>
												</div>
											</div>
											<!-- /.tab-pane -->
										</c:if>


									</div>
									<!-- /.tab-content -->
								</div>
								<!-- /.card-body -->

							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<div class="modal fade" id="modal-sm" style="display: none;" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">탈퇴하시겠습니까?</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<p>탈퇴 후 자동으로 로그아웃 됩니다.</p>
					</div>

					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-default" data-dismiss="modal" value="false">닫기</button>

						<c:url var="mdelete" value="mdelete.me">
							<c:param name="dUser" value="${ loginUser.id }" />
						</c:url>

						<button type="button" class="btn btn-primary" value="true" onclick="location.href='${ mdelete }'">확인</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>


	</c:if>
	<!-- jQuery -->
   <script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
   <!-- Bootstrap 4 -->
   <script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- AdminLTE App -->
   <script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="/codemoa/resources/dist/js/demo.js"></script>
<!-- jQuery UI -->
<script src="/codemoa/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		$(function() {
			line();
			// random();
			
			$('#emailNumInput').hide();

			if ('${userImg}' != 'none') {
				$("#userProfile h3").text("");
				$("#userProfile").css({"background-image" : "url(/codemoa/resources/userProfile/${userImg})"});
			}
		});

		var id = $('#id').val();

		$('#pwdModify').on(
				'click',
				function() {
					$('.pwdMod').fadeToggle();

					var toggle = $(this).attr('class').indexOf('down');

					if (toggle > 0) {
						$(this).removeClass('fa-chevron-down').addClass(
								'fa-chevron-up');
					} else {
						$(this).removeClass('fa-chevron-up').addClass(
								'fa-chevron-down');
					}

				});

		$("#aboutEdit").on('click', function() {
			$('.about').show();
			$(this).hide();
			$("#aboutSave").show();
			$('.aboutme').hide();
		});

		$('#aboutSave').on('click', function() {
			$('.about').hide();
			$(this).hide();
			$("#aboutEdit").show();

			$.ajax({
				url : 'introduce.me',
				type : 'post',
				data : {
					id : $('#id').val(),
					education : $('#education').val(),
					location : $('#location').val(),
					skill : $('#skill').val(),
					note : $('#note').val()
				},
				success : function(data) {
					profile();
				}
			});
			$('.aboutme').show();
		});

		function profile() {

			$.ajax({
				url : 'profile.me',
				data : {
					id : id
				},
				success : function(data) {
					$('#education').val(data.education);
					$('#location').val(data.location);
					$('#skill').val(data.skill);
					$('#note').val(data.note);
					line();
				}
			});

		}

		function line() {
			$('#education').parent().prev().html($('#education').val().replace(/\n/g, '<br>'));
			$('#location').parent().prev().html($('#location').val().replace(/\n/g, '<br>'));
			$('#skill').parent().prev().html($('#skill').val().replace(/\n/g, '<br>'));
			$('#note').parent().prev().html($('#note').val().replace(/\n/g, '<br>'));
		}

		var emailStatus = true;
		var nickStatus = true;

		$('#nickName').on('keyup blur', function() {
			$('.dupNick').hide().text('').css('color', 'inherit');
			var words = ["시발", "병신", "지랄", "버러지", "씹새"];
			for (var n = 0; n < words.length; n++) { 
			var nick = $(this).val();
				if (nick.indexOf(words[n]) != -1) {
					$(this).val('');
					
					Swal.fire({
						  icon: 'error',
						  title: 'Oops...',
						  text: '비속어는 사용할 수 없습니다.',
					})
					
					nickStatus = false;
				} else{
								
					if ($(this).val() != '${ user.nickName }' && $(this).val().trim() != '') {
						$.ajax({
							url : 'nickNameCheck.me',
							data : {
								nickName : $('#nickName').val()
							}, success : function(data) {
								// console.log(data);
								if (data == 0) {
									$('.dupNick').show().text('사용 가능한 닉네임입니다.').css('color', 'green');
									nickStatus = true;
								} else if (data == 1) {
									$('.dupNick').show().text('이미 사용중인 닉네임 입니다.').css('color', 'red');
									nickStatus = false;
								}
							}
						});
					} else {
						nickStatus = false;
					}
				}
			}

		});
		
		function sendEmail(){
			$('#emailNumInput').show();

			$.ajax({
				url : 'sendemail.me',
				data : {
					mail : $('#email').val(),
					what : '이메일 변경'
				},
				success : function(data) {
					console.log('인증번호 : '+data);
					$('#emailNum').on('keyup blur', function(){
						if(data == $(this).val()){
							$('#email').attr('readonly', true); // 이메일인증이 완료되면 readonly로 변경하여 수정 X
							$('#emailNum').hide();
						}
					});
				}
			});
		}
		

		$('#email').on('keyup blur', function() {
			var emailRegExp = /^[a-zA-Z0-9]+([-_\.]?[0-9a-zA-Z]+[-_\.])*@[a-zA-Z]+\.[a-zA-Z]+$/;

			var email = $(this).val();

			console.log(emailRegExp.test(email));

			if (!emailRegExp.test(email) || email.trim() == '') {
				$('.dupEmail').show().text('이메일 형식이 올바르지 않습니다.').css('color', 'red');
				emailStatus = false;
			} else {
				$('.dupEmail').hide().text('').css('color', 'inherit');
					if (email != '${ user.email }' && email.trim() != '') {
						$.ajax({
							url : 'emailCheck.me',
							data : {
								email : email
							},
							success : function(data) {
								console.log(data);
								if (data == 0) {
									$('.dupEmail').show().text('사용 가능한 이메일입니다.').css('color', 'green');
									emailStatus = true;
								} else if (data == 1) {
									$('.dupEmail').show().text('사용 불가능한 이메일 입니다.').css('color', 'red');
									emailStatus = false;
								}
							}

					});
				}
			}
		});

		
		$('#mupdate').on('keyup blur', function() {
			if (emailStatus == true && nickStatus == true) {
				$('#mupdateBtn').removeAttr('disabled');
			} else {
				$('#mupdateBtn').attr('disabled', true);
			}
		});
		
		var pwdStatus = false;
		var pwdCheckStatus = false;
		
		$('#newPwd').on('keyup blur', function(){
			var pwdRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
			var pwd = $(this).val();
			
			if (pwdRegExp.test(pwd) && pwd.trim() != '') {
				pwdStatus = true;
				$('.pwdreg').hide();
			} else {
				$('.pwdreg').show().css('color', 'red');				
			}
			
		});
		
		$('#newPwd2').on('keyup blur', function(){
			var pwd = $(this).val();
			
			if(pwd == $('#newPwd').val() && pwd.trim() != ''){
				pwdCheckStatus = true;
				$('.repwd').hide();
			} else {
				$('.repwd').show().css('color', 'red');	
			}
			
		});
		
		$('#mpwdupdate').on('change click', function() {
			if (pwdStatus == true && pwdCheckStatus == true) {
				$('#mpwdupdateBtn').removeAttr('disabled');
			} else {
				$('#mpwdupdateBtn').attr('disabled', true);
	
			}
		});


		// 댓글 선택 삭제
		$(function() {
			//Enable check and uncheck all functionality
			$('.rbox-toggle').click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					//Uncheck all checkboxes
					console.log('전체체크');
					$('.replyCheck').prop('checked', false)
				} else {
					//Check all checkboxes
					$('.replyCheck').prop('checked', true)
				}
				$(this).data('clicks', !clicks)
			})

		})
		
		// 게시글 선택 삭제
		$(function() {
			//Enable check and uncheck all functionality
			$('.bbox-toggle').click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					//Uncheck all checkboxes
					console.log('전체체크');
					$('.boardCheck').prop('checked', false)
				} else {
					//Check all checkboxes
					$('.boardCheck').prop('checked', true)
				}
				$(this).data('clicks', !clicks)
			})

		})

		function deleteBoard() {
			var no = new Array();
			$('.boardCheck:checked').each(function(i) {
				no[i] = $(this).attr("id")
			});
			console.log(no);

			$.ajax({
				url : 'deleteBoard.me',
				traditional : true,
				data : {
					'no' : no
				},
				success : function(data) {
					console.log(data);
					if (data == 'success') {
						location.reload();
					}
				}
			});
		}

		function deleteReply() {
			var no = new Array();
			$('.replyCheck:checked').each(function(i) {
				no[i] = $(this).attr("id")
			});
			console.log(no);

			$.ajax({
				url : 'deleteReply.me',
				traditional : true,
				data : {
					'no' : no
				},
				success : function(data) {
					console.log(data);
					if (data == 'success') {
						location.reload();
					}
				}
			});
		}

		function LoadImg(value) {

			if (value.files && value.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {

					Swal.fire({
						title : '이미지 미리보기',
						text : '업로드할 이미지를 확인해주세요',
						imageUrl : e.target.result,
						imageWidth : 170,
						imageHeight : 170,
						imageAlt : 'Profile Image',
						showCancelButton : true,
						confirmButtonColor : '#3085d6',
						cancelButtonColor : '#d33',
						confirmButtonText : 'save'
					}).then(function(result) {
						if (result.isConfirmed) {
							Swal.fire('이미지 변경 성공!')
							$('#upload').submit();
						}
					});
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
	<!-- jQuery -->
   <script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
   <!-- Bootstrap 4 -->
   <script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- jQuery UI -->
   <script src="/codemoa/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</style>

</head>
<body>

	<c:import url="../common/menu.jsp" />

	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>My Page</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<a href="#">Home</a>
							</li>
							<li class="breadcrumb-item active">User Profile</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3">

						<!-- Profile Image -->
						<div class="card card-warning card-outline">
							<div class="card-body box-profile">
								<div class="text-center">
									<!-- <img class="profile-user-img img-fluid img-circle" src="../../dist/img/user4-128x128.jpg"
                      alt="User profile picture"> -->
								</div>

								<h3 class="profile-username text-center">${ user.nickName }</h3>

								<!-- <p class="text-muted text-center">Software Engineer</p> -->
								<p class="text-muted text-center"></p>

								<input type="hidden" name="userId" value="${ user.id }">

								<ul class="list-group list-group-unbordered mb-3">
									<li class="list-group-item">
										<b>내가 쓴 글</b>
										<a class="float-right">1,322</a>
									</li>
									<li class="list-group-item">
										<b>내가 쓴 댓글</b>
										<a class="float-right">543</a>
									</li>
								</ul>
								<div class="btnArea text-center">
									<a href="#" class="btn btn-warning mb-1">
										<b>Follow</b>
									</a>
									<a href="#" class="btn btn-warning mb-1">
										<b>Message</b>
									</a>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->

						<!-- About Me Box -->
						<div class="card card-warning">
							<div class="card-header clearfix">
								<h3 class="card-title">About Me</h3>
								<c:if test="${ loginUser.id eq user.id }">
									<span id="aboutEdit" class="float-right"><i class="fas fa-edit"></i></span>
									<span id="aboutSave" class="float-right modify"><i class="fas fa-check"></i></span>
								</c:if>
							</div>
							<!-- /.card-header -->
							<div class="card-body">

								<strong><i class="fas fa-book mr-1"></i> Education</strong>
								<p class="text-muted aboutme">${ user.education }</p>
								<div class="about modify text-center">
									<textarea name="education" id="education" class="form-control">${ user.education }</textarea>
								</div>

								<hr>

								<strong><i class="fas fa-map-marker-alt mr-1"></i> Location</strong>
								<p class="text-muted aboutme">${ user.location }</p>
								<div class="about modify text-center">
									<textarea name="location" id="location" class="form-control">${ user.location }</textarea>
								</div>

								<hr>

								<strong><i class="fas fa-pencil-alt mr-1"></i> Skills</strong>
								<p class="text-muted aboutme">${ user.skill }</p>
								<div class="about modify text-center">
									<textarea name="skill" id="skill" class="form-control">${ user.skill }</textarea>
								</div>

								<hr>

								<strong><i class="far fa-file-alt mr-1"></i> Notes</strong>
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
										<a class="nav-link active" href="#activity" data-toggle="tab">Activity</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#timeline" data-toggle="tab">Timeline</a>
									</li>
									<c:if test="${ loginUser.id eq user.id }">
										<li class="nav-item">
											<a class="nav-link" href="#settings" data-toggle="tab">Settings</a>
										</li>
									</c:if>
								</ul>
							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<div class="tab-content">

									<!-- /////////////////////////////////// -->
									<div class="active tab-pane" id="activity">

										<!-- Post -->
										<div class="post">

											<h5 class="title">
												<a href="#">Jonathan Burke Jr.</a>
											</h5>
											<span class="description text-sm">Shared publicly - 7:30 PM today</span> <span class="float-right text-sm"><i class="far fa-comments mr-1"></i> Comments (5)</span>

										</div>
										<!-- /.post -->

									</div>


									<!-- /////////////////////////////////// -->
									<div class="tab-pane" id="timeline">
										<!-- The timeline -->
									</div>
									<!-- /.tab-pane -->


									<!-- /////////////////////////////////// -->
									<c:if test="${ loginUser.id eq user.id }">
										<div class="tab-pane" id="settings">

											<form action="mUpdate.me" method="post">

												<div class="form-group row">
													<label for="name" class="col-sm-2 col-form-label">ID</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="id" name="id" placeholder="Name" value="${ user.id }" readonly>
													</div>
												</div>

												<div class="form-group row">
													<label for="email" class="col-sm-2 col-form-label">Email</label>
													<div class="col-sm-10">
														<input type="email" class="form-control" id="email" name="email" placeholder="Email" value="${ user.email }">
													</div>
												</div>

												<div class="form-group row">
													<label for="nickName" class="col-sm-2 col-form-label">NickName</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="nickName" name="nickName" placeholder="NickName" value="${ user.nickName }">
													</div>
												</div>


												<div class="form-group row">
													<div class="offset-sm-2 col-sm-10">
														<c:url var="mypage" value="mypage.me">
															<c:param name="userId" value="${ loginUser.id }" />
														</c:url>

														<button type="submit" class="btn btn-secondary">Save</button>


														<button type="button" class="btn btn-warning" onclick="location.href='${mypage}'">Cancle</button>

														<button type="button" class="btn btn-danger float-right" data-toggle="modal" data-target="#modal-sm" onclick="leave();">Leave</button>
													</div>
												</div>

											</form>

											<h6>
												<i id="pwdModify" class="fas fa-chevron-down"> 비밀번호 수정</i>
											</h6>

											<form action="mpwdupdate.me" method="post">

												<div class="modify pwdMod">
													<div class="form-group row">
														<label for="pwd" class="col-sm-2 col-form-label">Password</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="pwd" name="pwd" placeholder="Password">
														</div>
													</div>

													<div class="form-group row">
														<label for="newPwd" class="col-sm-2 col-form-label">New Pwd</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="newPwd" name="newPwd" placeholder="Password">
														</div>
													</div>

													<div class="form-group row">
														<label for="newPwd2" class="col-sm-2 col-form-label">New Pwd</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="newPwd2" name="newPwd2" placeholder="Password">
														</div>
													</div>

													<div class="form-group row">
														<div class="offset-sm-2 col-sm-10">
															<button type="submit" class="btn btn-secondary">Save</button>
															<button type="button" class="btn btn-warning" onclick="location.href='${mypage}'">Cancle</button>
														</div>
													</div>
												</div>

											</form>
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



	<!-- jQuery -->
	<script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/codemoa/resources/dist/js/demo.js"></script>

	<script>
 $(function(){
	 line();
	});  
	var id = $('#id').val();
	
		$('#pwdModify').on('click', function() {
			$('.pwdMod').fadeToggle();
	
			var toggle = $(this).attr('class').indexOf('down');
	
			if (toggle > 0) {
				$(this).removeClass('fa-chevron-down').addClass('fa-chevron-up');
			} else {
				$(this).removeClass('fa-chevron-up').addClass('fa-chevron-down');
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
				type:'post',
				data : { 
					id : $('#id').val(),
					education: $('#education').val(),
					location: $('#location').val(),
					skill: $('#skill').val(),
					note: $('#note').val()
				},
				success : function(data) {
					profile();
				}
			});
			$('.aboutme').show();
		});

				
		function profile(){
		
			$.ajax({
				url : 'profile.me',
				data : { id : id },
				success : function(data){
					$('#education').val(data.education);
					$('#location').val(data.location);
					$('#skill').val(data.skill);
					$('#note').val(data.note);
					line();
				}
			});
			
		}
		
		function line(){
			$('#education').parent().prev().html($('#education').val().replace(/\n/g, '<br>'));
			$('#location').parent().prev().html($('#location').val().replace(/\n/g, '<br>'));
			$('#skill').parent().prev().html($('#skill').val().replace(/\n/g, '<br>'));
			$('#note').parent().prev().html($('#note').val().replace(/\n/g, '<br>'));
		}
		
		
	</script>

</body>
</html>
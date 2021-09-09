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
<link rel="stylesheet" href="/codemoa/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<style>
.mailbox-star {
	z-index: 999;
}

/* .mailbox-subject {
	width: 450px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
} */
</style>

</head>
<body>

	<c:import url="../common/menu.jsp" />

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>쪽지함📫</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item">
								<a href="#">Home</a>
							</li>
							<li class="breadcrumb-item active">쪽지</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-3">
					<div class="card card-info">
						<div class="card-header">
							<h3 class="card-title">쪽지 보내기</h3>
						</div>

						<form action="sendMessage.ms" method="post">
							<input type="hidden" name="mgSender" value="${ loginUser.id }">
							<div class="card-body">
								<div class="form-group">
									<label for="mgReceiver">받는사람</label> 
									<input type="text"class="form-control" name="mgReceiver" value="${ receiver }"placeholder="받는이 닉네임" required>
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control"name="mgContent" rows="3" required style="margin-top: 0px; margin-bottom: 0px; height: 91px;"></textarea>
								</div>
							</div>
							<!-- /.card-body -->
							<div class="card-footer">
								<button type="submit" class="btn btn-info">보내기</button>
								<button type="reset" class="btn btn-default float-right">취소</button>
							</div>
							<!-- /.card-footer -->
						</form>
					</div>


				</div>
				<!-- /.col -->
				<div class="col-md-9">
					<div class="card card-warning card-outline">
						<div class="card-header">
							<div class="card-title">
								<select id="type" class="form-control">
									<option value="message" ${ type eq "receive" ? "selected":"" }>받은 쪽지함</option>
									<option value="send" ${ type eq "send" ? "selected":"" }>보낸 쪽지함</option>
								</select>
							</div>

							<div class="card-tools">
								<div class="input-group input-group-sm">
									<input type="text" class="form-control" placeholder="Search Mail">
									<div class="input-group-append">
										<div class="btn btn-warning">
											<i class="fas fa-search"></i>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-tools -->
						</div>
						<!-- /.card-header -->
						<div class="card-body p-0">
							<div class="mailbox-controls">
								<!-- Check all button -->
								<button type="button" class="btn btn-default btn-sm checkbox-toggle">
									<i class="far fa-square"></i>
								</button>
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm" onclick="deleteMsg();">
										<i class="far fa-trash-alt"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-reply"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-share"></i>
									</button>
								</div>
								<!-- /.btn-group -->
								<button type="button" class="btn btn-default btn-sm">
									<i class="fas fa-sync-alt"></i>
								</button>
								<div class="float-right">
									1-10/200
									<div class="btn-group">
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-chevron-left"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-chevron-right"></i>
										</button>
									</div>
									<!-- /.btn-group -->
								</div>
								<!-- /.float-right -->
							</div>
							<div class="table-responsive mailbox-messages">
								<table class="table table-hover table-striped">
									<tbody>
									<c:if test="${ type eq 'receive'}">
										<c:set var = "list" value="${ mList }"/>
										<c:set var = "person" value="${ m.mgSender }"/>
										
									</c:if>
									<c:if test="${ type eq 'send'}">
										<c:set var = "list" value="${ sList }"/>
										<c:set var = "person" value="${ m.mgReceiver }"/>
									</c:if>

										<c:if test="${ list.isEmpty() }">
											<h5 style="text-align: center;">쪽지가 없습니다.</h5>
										</c:if>
										
										<c:if test="${ !list.isEmpty() }">

											<c:forEach var="m" items="${ list }">

												<tr class="msgTr" data-widget="expandable-table" aria-expanded="false">
													<td class="col-1">
														<div class="icheck-danger">
															<input type="checkbox" value="" id="${ m.mgNo }" class="check"> <label for="${ m.mgNo }"></label>
														</div>
													</td>

													<td class="mailbox-name col-2">
													<c:set var = "person" value="${ type eq 'receive' ? m.mgSender :  m.mgReceiver}"/>
														<c:url var="mypage" value="mypage.me">
															<c:param name="userId" value="${ person }" />
														</c:url>
														<a href="${ mypage }">${ person }</a>
													</td>
													<td class="mailbox-subject col-5">${ m.mgContent }</td>
													<td class="mailbox-date col-2">${ m.mgDate }</td>
													<td id="open-${ m.mgNo }" class="mailbox-date read text-sm text-right col-2">${ m.mgOpen eq "Y" ? "안읽음" : "읽음" }</td>
												</tr>
												<tr id="${ m.mgNo }-msg" class="expandable-body">
													<td colspan="4">
														<p>${ m.mgContent }</p>
													</td>
												</tr>
												
											</c:forEach>

										</c:if>
									</tbody>
								</table>
								<!-- /.table -->
							</div>
							<!-- /.mail-box-messages -->
						</div>
						<!-- /.card-body -->
						<div class="card-footer p-0">
							<div class="mailbox-controls">
								<!-- Check all button -->
								<button type="button" class="btn btn-default btn-sm checkbox-toggle">
									<i class="far fa-square"></i>
								</button>
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm" onclick="deleteMsg();">
										<i class="far fa-trash-alt"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-reply"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-share"></i>
									</button>
								</div>
								<!-- /.btn-group -->
								<button type="button" class="btn btn-default btn-sm">
									<i class="fas fa-sync-alt"></i>
								</button>
								<div class="float-right">
									1-10/200
									<div class="btn-group">
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-chevron-left"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-chevron-right"></i>
										</button>
									</div>
									<!-- /.btn-group -->
								</div>
								<!-- /.float-right -->
							</div>
						</div>
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->


	<!-- jQuery -->
	<script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/codemoa/resources/dist/js/demo.js"></script>

	<script>
		$('#type').on('change', function() {
			var type = $(this).val();
			var url = type + 'Box.ms';
			console.log(url);
			location.href = url;
		})
		
		$('.msgTr').on('click', function(){
			var readStatus = $(this).find('.read').text();
	
			if(readStatus == '안읽음' && '${ type }' == 'receive'){
				if($(this).next().attr('class').indexOf('d-none')){
					var idStr = $(this).next().attr('id');
					var num = idStr.substr(0, idStr.indexOf('-'));
					
					$.ajax({
						url:'msgRead.ms', 
						data: {
							mgNo : num,
							mgReceiver: '${ loginUser.id }'
						},
						success:function(data){
							console.log(data);
							console.log($('#open-'+num).text());
							$('#open-'+num).text("읽음");
						}
						
					});
				}
				
			}
			
		});
		
		function deleteMsg(){
			var no= new Array();
			$('.check:checked').each(function(i){
				no[i] = $(this).attr("id")
			});
			console.log(no);
			
			$.ajax({
				url:'deleteMessage.ms', 
				traditional :true, 
				data:{
					'no' : no,
					type: '${type}'
				}, success:function(data){
					console.log(data);
				}
			});
		}
		

		$(function() {
			//Enable check and uncheck all functionality
			$('.checkbox-toggle').click(
					function() {
						var clicks = $(this).data('clicks')
						if (clicks) {
							//Uncheck all checkboxes
							$('.mailbox-messages input[type=\'checkbox\']')
									.prop('checked', false)
							$('.checkbox-toggle .far.fa-check-square')
									.removeClass('fa-check-square').addClass(
											'fa-square')
						} else {
							//Check all checkboxes
							$('.mailbox-messages input[type=\'checkbox\']')
									.prop('checked', true)
							$('.checkbox-toggle .far.fa-square').removeClass(
									'fa-square').addClass('fa-check-square')
						}
						$(this).data('clicks', !clicks)
					})

			//Handle starring for font awesome
			$('.mailbox-star').click(function(e) {
				e.preventDefault()
				//detect type
				var $this = $(this).find('a > i')
				var fa = $this.hasClass('fa')

				//Switch states
				if (fa) {
					$this.toggleClass('fa-star')
					$this.toggleClass('fa-star-o')
				}
			})
		})
	</script>

</body>
</html>
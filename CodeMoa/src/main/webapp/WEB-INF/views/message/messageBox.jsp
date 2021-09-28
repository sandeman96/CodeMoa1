<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet" href="/codemoa/resources/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/codemoa/resources/dist/css/adminlte.min.css">
<link rel="stylesheet" href="/codemoa/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<style>

.mailbox-subject {
	max-width: 310px; 
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
} 
#msgTable {
	max-height: 610.5px;
	overflow-y: scroll;
}

#msgTable::-webkit-scrollbar { /* 스크롤바 막대 너비 설정 */
	width: 6px;
} /* 스크롤바 막대 설정*/
#msgTable::-webkit-scrollbar-thumb { /* 스크롤바 막대 높이 설정 */
	height: 10px;
	background-color: #f5df4d; /* 스크롤바 둥글게 설정 */
	border-radius: 10px;
} /* 스크롤바 뒷 배경 설정*/
#msgTable::-webkit-scrollbar-track {
	background-color: #f2f2f2;
}

/*a태그 밑줄x/글씨색변화x*/
a:link, a:visited {
	color: #939597;
	text-decoration: none;
}
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

				<div class="col-4" style="max-width: 315px;">
				
					<div class="card">
			            <div class="card-header">
			              <h3 class="card-title">${ loginUser.nickName }의 쪽지함</h3>
			            </div>
			            <div class="card-body p-0">
			              <ul class="nav nav-pills flex-column">
			                <li class="nav-item active">
			                  <a href="messageBox.ms" class="nav-link">
			                    <i class="fas fa-inbox"></i> 받은 쪽지함
			                  </a>
			                </li>
			                <li class="nav-item">
			                  <a href="sendBox.ms" class="nav-link">
			                    <i class="far fa-envelope"></i> 보낸 쪽지함
			                  </a>
			                </li>
			
			                <!-- <li class="nav-item">
			                  <a href="#" class="nav-link">
			                    <i class="far fa-trash-alt"></i> Trash
			                  </a>
			                </li> -->
			              </ul>
			            </div>
			            <!-- /.card-body -->
			          </div>

					<div class="card card-info">
						<div class="card-header">
							<h3 class="card-title">쪽지 보내기</h3>
						</div>

						<form action="sendMessage.ms" method="post">
							<input type="hidden" name="mgSender" value="${ loginUser.id }">
							<div class="card-body">
								<div class="form-group">
									<label for="mgReceiver">받는사람</label> <input type="text" class="form-control" name="mgNick" id="mgNick" value="${ receiver }" placeholder="받는이 닉네임" required>
									<span id="mgFeed" class="text-sm"></span>
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" name="mgContent" rows="3" required style="margin-top: 0px; margin-bottom: 0px; height: 91px;"></textarea>
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
				<div class="col-md-8">
					<div class="card card-warning card-outline">
						<div class="card-header">
							<div class="card-title">
								<select id="type" class="form-control">
									<option value="message" ${ type eq "receive" ? "selected":"" }>받은 쪽지함</option>
									<option value="send" ${ type eq "send" ? "selected":"" }>보낸 쪽지함</option>
								</select>
							</div>

							<div class="card-tools mt-2">

								<c:url var="search" value="searchMessage.ms">
									<c:param name="type" value="${ type }" />
									<c:param name="id" value="${ loginUser.id }" />
								</c:url>

								<form action="${ search }" method="post">
									<div class="input-group input-group-sm">
										<input type="text" class="form-control" name="keyword" placeholder="Search Message" required="required">
										<div class="input-group-append">
											<button type="submit" id="searchMessage" class="btn btn-warning">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								</form>

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
								<button type="button" class="btn btn-default btn-sm" onclick="reloding();">
									<i class="fas fa-sync-alt"></i>
								</button>

								<div class="float-right">
									${ pi.currentPage }/${ pi.maxPage }
									<div class="btn-group">
										<c:if test="${ pi.currentPage <= 1 }">
											<button type="button" class="btn btn-default btn-sm">
												<i class="fas fa-chevron-left"></i>
											</button>
										</c:if>
										<c:if test="${ pi.currentPage > 1 }">
											<c:url var="before" value="${ type eq 'receive' ? 'messageBox.ms' : 'sendBox.ms'}">
												<c:param name="page" value="${ pi.currentPage - 1 }" />
											</c:url>
											<c:set var="before" value="${ type eq 'receive' ? 'messageBox.ms' : 'sendBox.ms'}" />
											<button type="button" class="btn btn-default btn-sm" onclick="location.href='${before}'">
												<i class="fas fa-chevron-left"></i>
											</button>
										</c:if>



										<c:if test="${ pi.currentPage >= pi.maxPage }">
											<button type="button" class="btn btn-default btn-sm">
												<i class="fas fa-chevron-right"></i>
											</button>
										</c:if>
										<c:if test="${ pi.currentPage < pi.maxPage }">
											<c:url var="after" value="${ type eq 'receive' ? 'messageBox.ms' : 'sendBox.ms'}">
												<c:param name="page" value="${ pi.currentPage + 1 }" />
											</c:url>
											<button type="button" class="btn btn-default btn-sm" onclick="location.href='${after}'">
												<i class="fas fa-chevron-right"></i>
											</button>
										</c:if>

									</div>
									<!-- /.btn-group -->
								</div>
								<!-- /.float-right -->
							</div>
							<div id="msgTable" class="table-responsive mailbox-messages">
								<table class="table table-hover table-striped col-12" style="table-layout:fixed;">
									<tbody>

										<c:if test="${ type eq 'receive'}">
											<c:set var="list" value="${ mList }" />
										</c:if>

										<c:if test="${ type eq 'send'}">
											<c:set var="list" value="${ sList }" />
										</c:if>

										<c:if test="${ list.isEmpty() }">
											<h5 style="text-align: center;">쪽지가 없습니다.</h5>
										</c:if>


										<c:if test="${ !list.isEmpty() }">

											<c:forEach var="m" items="${ list }">

												<tr class="msgTr col-12" data-widget="expandable-table" aria-expanded="false" style="height: 61px;">
													<td class="col-1">
														<div class="icheck-danger">
															<input type="checkbox" value="" id="${ m.mgNo }" class="check"> <label for="${ m.mgNo }"></label>
														</div>
													</td>

													<td class="mailbox-name col-2">
														<c:url var="mypage" value="mypage.me">
															<c:param name="userId" value="${ type eq 'receive' ? m.mgSender : m.mgReceiver }" />
														</c:url>
														<a href="${ mypage }">${ m.mgNick }</a>
													</td>
													<td class="mailbox-subject col-4" >${ m.mgContent }</td>
													<td class="mailbox-date col-3 text-center">${ m.mgDate }</td>
													<td id="open-${ m.mgNo }" class="mailbox-date read text-sm text-right col-2">${ m.mgOpen eq "Y" ? "안읽음" : "읽음" }</td>
												</tr>
												<tr id="${ m.mgNo }-msg" class="expandable-body col-12">
													<td colspan="4">
														<p>
														${fn:replace(m.mgContent, newLineChar, "<br/>")}
														</p>
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
								<button type="button" class="btn btn-default btn-sm" onclick="reloding();">
									<i class="fas fa-sync-alt"></i>
								</button>

								<div class="float-right">
									${ pi.currentPage }/${ pi.maxPage }
									<div class="btn-group">
										<c:if test="${ pi.currentPage <= 1 }">
											<button type="button" class="btn btn-default btn-sm">
												<i class="fas fa-chevron-left"></i>
											</button>
										</c:if>
										<c:if test="${ pi.currentPage > 1 }">
											<c:url var="before" value="${ type eq 'receive' ? 'messageBox.ms' : 'sendBox.ms'}">
												<c:param name="page" value="${ pi.currentPage - 1 }" />
											</c:url>
											<c:set var="before" value="${ type eq 'receive' ? 'messageBox.ms' : 'sendBox.ms'}" />
											<button type="button" class="btn btn-default btn-sm" onclick="location.href='${before}'">
												<i class="fas fa-chevron-left"></i>
											</button>
										</c:if>

										<c:if test="${ pi.currentPage >= pi.maxPage }">
											<button type="button" class="btn btn-default btn-sm">
												<i class="fas fa-chevron-right"></i>
											</button>
										</c:if>
										<c:if test="${ pi.currentPage < pi.maxPage }">
											<c:url var="after" value="${ type eq 'receive' ? 'messageBox.ms' : 'sendBox.ms'}">
												<c:param name="page" value="${ pi.currentPage + 1 }" />
											</c:url>
											<button type="button" class="btn btn-default btn-sm" onclick="location.href='${after}'">
												<i class="fas fa-chevron-right"></i>
											</button>
										</c:if>

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

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	
	<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()
  });
</script>



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
		
		$('#mgNick').on('blur', function(){
			$.ajax({
				url:'nickCheck.ms',
				data: {nick:$('#mgNick').val()},
				success:function(data){
					console.log(data);
					if(data == 'No'){
						$('#mgFeed').text('존재하지 않는 닉네임 입니다.').css('color', 'red');
					} else {
						$('#mgFeed').text('');
					}
				}
			});
		});
		
		

		$('#mgNick').autocomplete({
			source : nickList(),
			select : function(event, ui) { // item 선택 시 이벤트
	            console.log(ui.item);
	        },
	        focus : function(event, ui) { // 포커스 시 이벤트
	            return false;
	        },
			minLength : 1, 
			autoFocus : true,
			classes : {
	            'ui-autocomplete': 'highlight'
	        },
			close : function(event) {
	            console.log(event);
	        }
		});	
		
		function nickList(){
			var nick = new Array();
			$.ajax({
				url:'nickList.ms',
				success:function(data){
					for(var i in data){
						nick[i] = data[i];
					}
				}
			});
			return nick;
		}
		
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
					if(data == 'success'){
						location.reload();
					}
				}
			});
		}
		
		
		function reloding(){
			location.reload();
		}
		

		$(function() {
			//Enable check and uncheck all functionality
			$('.checkbox-toggle').click(function() {
				var clicks = $(this).data('clicks')
				if (clicks) {
					//Uncheck all checkboxes
					$('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
					$('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
				} else {
					//Check all checkboxes
					$('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
					$('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
				}
				$(this).data('clicks', !clicks)
			})

		})
	</script>

</body>
</html>
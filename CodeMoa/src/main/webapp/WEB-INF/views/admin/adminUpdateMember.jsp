<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Codemoa</title>

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
<!-- JQVMap -->
<link rel="stylesheet" href="/codemoa/resources/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/codemoa/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/codemoa/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="/codemoa/resources/plugins/daterangepicker/daterangepicker.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
body {
  font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<c:import url="../admin/adminSidebar.jsp"/>
	
	<c:if test="${ loginUser == null }">
		<div class="content-wrapper">
			<section class="content mt-5">
				<div class="error-page">
					<div class="error-content">
						<h3>
							<i class="fas fa-exclamation-triangle text-danger"></i>
							로그인 해주세요.
						</h3>
					</div>
				</div>
				<!-- /.error-page -->
			</section>
		</div>
	</c:if>
	
	<c:if test='${ loginUser != null && loginUser.admin eq "Y" }'>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="text-center p-3">
					<h1>🧐 사용자 관리</h1>
				</div>
			</div><!-- /.container-fluid -->
		</section>
    	
		<section class="content">
			<form action="adminUpdateMemberSearch.ad" id="adminUpdateMember" onsubmit="return search();">
				<div class="container-fluid" style="padding-left: 20px; padding-right: 20px;">
					<div class="row">
						<div class="col-12 m-1">
							<div>
								<div class="row card-header d-flex p-2">
									<div class="col-3 btn-group">
				                        <button type="button" class="btn btn-default btn-sm" onclick="location.href='adminUpdateMember.ad'" style="width: 5rem;">전체</button>
				                        <button type="button" class="btn btn-default btn-sm" onclick="location.href='adminUpdateMemberOut.ad'" style="width: 5rem;">탈퇴</button>
				                        <button type="button" class="btn btn-default btn-sm" onclick="location.href='adminUpdateMemberUser.ad'" style="width: 5rem;">회원</button>
				                        <button type="button" class="btn btn-default btn-sm" onclick="location.href='adminUpdateMemberAdmin.ad'" style="width: 5rem;">운영자</button>
				                    </div>
				                    <div class="col-6"></div>
			                           <div class="input-group input-group-sm col-2" style="width: 200px;">
			                              <input type="text" name="table_search" class="form-control float-right" placeholder="Search">
			                              <div class="input-group-append">
			                                 <button type="submit" class="btn btn-default">
			                                	 <i class="fas fa-search"></i>
			                             	 </button>
			                              </div>
			                           </div>
									<button type="button" class="btn bg-gradient-warning btn-sm col-1" 
										onclick="location.href='adminMember.ad'"
										style="display: inline-block; width: 7rem;">수정 완료</button>
								</div>
								<!-- /.card-header -->
								<c:if test="${ mList.isEmpty() }">
									<h3 style="text-align: center; margin-top: 3rem; margin-bottom: 3rem;">
										조회된 사용자가 없습니다.
									</h3>
								</c:if>
								<c:if test="${ !mList.isEmpty() }">
								<div class="card-body table-responsive p-0">
									<table class="table text-nowrap">
										<thead>
											<tr>
												<th>ID</th>
												<th>email</th>
												<th>닉네임</th>
												<th>권한</th>
												<th></th>
												<th>탈퇴</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="m" items="${ mList }">
												
												<tr>
													<td class="id">${ m.id }</td>
													<td>${ m.email }</td>												
													<td>${ m.nickName }</td>
													<td style="width: 25px">
														<c:choose>
															<c:when test="${ m.id eq loginUser.id }">
																<c:if test="${ m.admin eq 'N' }">회원</c:if>
																<c:if test="${ m.admin eq 'Y' }">운영자</c:if>
																<span style="color: red">(로그인)</span>
															</c:when>
															<c:otherwise>
																<c:choose>
																	<c:when test="${ !empty loginUser }">
																		<div class="btn-group btn-group-toggle" data-toggle="buttons">
														                  <label class="btn btn-outline-warning btn-sm">
														                    <input type="radio" class="Admin" <c:if test="${ m.admin eq 'Y' }" >checked</c:if> value="Y">운영자
														                  </label>
														                  <label class="btn btn-outline-warning btn-sm">
														                    <input type="radio" class="Admin"<c:if test="${ m.admin eq 'N' }">checked</c:if> value="N">회원
														                  </label>
														                </div>
													                 </c:when>
														            <c:otherwise>${ m.admin }</c:otherwise>
													            </c:choose>
													         </c:otherwise>
												        </c:choose>
													</td>
													<td></td>
													<td>
														<c:choose>
															<c:when test="${ m.id eq loginUser.id }">
																<c:if test="${ m.status eq 'N' }">Yes</c:if>
																<c:if test="${ m.status eq 'Y' }">No</c:if>
															</c:when>
															<c:otherwise>
																<c:choose>
																	<c:when test="${ !empty loginUser }">
																		<div class="btn-group btn-group-toggle" data-toggle="buttons">
														                  <label class="btn btn-outline-warning btn-sm">
														                    <input type="radio" class="Status" <c:if test="${ m.status eq 'N' }">checked</c:if> value="N">Yes
														                  </label>
														                  <label class="btn btn-outline-warning btn-sm">
														                    <input type="radio" class="Status" <c:if test="${ m.status eq 'Y' }">checked</c:if> value="Y">No
														                  </label>
														                </div>
													                </c:when>
														            <c:otherwise>${ m.status }</c:otherwise>
														        </c:choose>
													        </c:otherwise>
												        </c:choose>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								</c:if>
								<!-- /.card-body -->
								<div class="pagination-margin mt-5 mb-5">
									<nav aria-label="Page navigation example">
										<ul class="pagination" style="justify-content: center;">
											<!-- [이전] -->
											<c:if test="${ mi.currentPageM <= 1 }">
												<li class="page-item disabled">
													<a class="page-link" aria-label="Previous">
														<span aria-hidden="true">&laquo;</span>
													</a>
												</li>
											</c:if>
											<c:if test="${ mi.currentPageM > 1 }">
												<li class="page-item">
													<c:choose>
														<c:when test="${ table_search eq null }">
															<a class="page-link" href="adminUpdateMember${memberType}.ad?page=${ mi.currentPageM - 1 }" aria-label="Previous">
																<span aria-hidden="true">&laquo;</span>
															</a>
														</c:when>
														<c:otherwise>
															<a class="page-link" href="adminUpdateMember${memberType}.ad?table_search=${ table_search }&page=${ mi.currentPageM - 1 }" aria-label="Previous">
																<span aria-hidden="true">&laquo;</span>
															</a>
														</c:otherwise>
													</c:choose>
													
												</li>
											</c:if>
			
											<!-- 페이지 -->
											<c:forEach var="m" begin="${ mi.startPageM }" end="${ mi.endPageM }">
												<c:if test="${ m eq mi.currentPageM }">
													<li class="page-item disabled">
														<a class="page-link">${ m }</a>
													</li>
												</c:if>
												<c:if test="${ m ne mi.currentPageM }">
													<c:choose>
														<c:when test="${ table_search eq null }">
															<a class="page-link" href="adminUpdateMember${memberType}.ad?page=${m}">${ m }</a>
														</c:when>
														<c:otherwise>
															<a class="page-link" href="adminUpdateMember${memberType}.ad?table_search=${ table_search }&page=${m}">${ m }</a>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach>
											
											<!-- [다음] -->
											<c:if test="${ mi.currentPageM >= mi.maxPageM }">
												<li class="page-item disabled">
													<a class="page-link" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
													</a>
												</li>
											</c:if>
											<c:if test="${ mi.currentPageM < mi.maxPageM }">
												<li class="page-item">
													<c:choose>
														<c:when test="${ table_search eq null }">
															<a class="page-link" href="adminUpdateMember${memberType}.ad?page=${ mi.currentPageM + 1 }" aria-label="Next">
																<span aria-hidden="true">&raquo;</span>
															</a>
														</c:when>
														<c:otherwise>
															<a class="page-link" href="adminUpdateMember${memberType}.ad?table_search=${ table_search }&page=${ mi.currentPageM + 1 }" aria-label="Next">
																<span aria-hidden="true">&raquo;</span>
															</a>
														</c:otherwise>
													</c:choose>
												</li>
											</c:if>			
										</ul>
									</nav>
								</div>
							<!-- /.card -->
							</div>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div> 
	</c:if>
	
	<!-- 검색어 없으면 넘어가지 않음 -->
	<script>
		function search(){
			var search = $('#adminUpdateMember [name="table_search"]').val()
			
			if(search.trim() == ""){
				Swal.fire({
					  position: 'middle',
					  icon: 'warning',
					  title: '검색어를 입력해주세요.',
					  timer: 1300
					})
				return false;
			} else return true
		}
		
		$('.Admin').click(function() {	
			var id = $(this).parents('td').siblings('.id').text();
			var admin = $(this).val();

			$.ajax({
				url : "updateAdminMember.ad",
				data: { id : id, admin : admin },
				type : "POST",
				success : function(data) {
					Swal.fire({
						  position: 'middle',
						  icon: 'success',
						  title: 'Admin이 수정되었습니다.',
						  showConfirmButton: false,
						  timer: 1000
						})
						setTimeout(saved, 1000);
					
					function saved(){
						location.reload();
					}
				}
			});
		});
		
		$('.Status').click(function() {	
			var id = $(this).parents('td').siblings('.id').text();
			var status = $(this).val();
			
			$.ajax({
				url : "updateStatusMember.ad",
				data: { id : id, status : status },
				type : "POST",
				success : function(data) {
					Swal.fire({
						  position: 'middle',
						  icon: 'success',
						  title: 'Status가 수정되었습니다.',
						  showConfirmButton: false,
						  timer: 1000
						})
						setTimeout(saved, 1000);
					
					function saved(){
						location.reload();
					}
				}
			});
		});
		
	</script>
	
	<!-- jQuery -->
   <script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
   <!-- Bootstrap 4 -->
   <script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- AdminLTE App -->
   <script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="/codemoa/resources/dist/js/demo.js"></script>
</body>
</html>
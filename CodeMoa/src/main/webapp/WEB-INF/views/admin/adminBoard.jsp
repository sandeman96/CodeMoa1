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
	
	<%-- <c:if test="${ msg != null }">
	  	<script>
	  		alert('${ msg }');
	  	</script>
	</c:if> --%>
	
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
					<h1>&#128451; 게시글 관리</h1>
				</div>
			</div><!-- /.container-fluid -->
		</section>
    
		<section class="content">
			<div class="container-fluid" style="padding-left: 20px; padding-right: 20px;">
				<div class="row">
					<div class="col-12">
						<!-- <div class="card"> -->
						<div>
							<form action="adminBoardSearch.ad" id="adminBoard" onsubmit="return search();">
								<div class="row card-header p-2">
									<div class="col-3 btn-group">
				                        <button type="button" class="btn btn-default btn-sm" onclick="location.href='adminBoard.ad'" style="width: 4rem;">전체</button>
				                        <button type="button" class="btn btn-default btn-sm" onclick="location.href='adminBoardQA.ad'" style="width: 4rem;">Q&A</button>
				                        <button type="button" class="btn btn-default btn-sm" onclick="location.href='adminBoardTips.ad'" style="width: 4rem;">Tips</button>
				                        <button type="button" class="btn btn-default btn-sm" onclick="location.href='adminBoardStudy.ad'" style="width: 4rem;">Study</button>
				                    </div>
				                    <div class="col-7"></div>      
		                           <div class="input-group input-group-sm col-2" style="width: 200px;">
		                              <input type="text" name="table_search" class="form-control" placeholder="Search">
		                              <div class="input-group-append">
		                                 <button type="submit" class="btn btn-default">
		                                 <i class="fas fa-search"></i>
		                              </button>
		                              </div>
		                           </div>
								</div>
								<!-- /.card-header -->
								
								<c:if test="${ bList.isEmpty() }">
									<h3 style="text-align: center; margin-top: 3rem; margin-bottom: 3rem;">
										조회된 게시글이 없습니다.
									</h3>
								</c:if>
								<c:if test="${ !bList.isEmpty() }">
								<div class="card-body table-responsive p-0">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>NO</th>
												<th>Type</th>
												<th>작성자</th>
												<th>제목</th>
												<th>작성일</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="b" items="${ bList }">
												<c:url var="bdetail" value="boardDetail.bo">
													<c:param name="bNo" value="${ b.bNo }" />
													<c:param name="page" value="1" />
												</c:url>
												<tr <c:if test="${ b.bStatus eq 'N' }">class="alert"</c:if>>
													<td class="bNo" <c:if test="${ b.bStatus eq 'Y' }">class="detail" data-href='${bdetail}'</c:if>>${ b.bNo }</td>
													<td <c:if test="${ b.bStatus eq 'Y' }">class="detail" data-href='${bdetail}'</c:if>>
														<c:if test="${ b.bType == 1 }">Q&A</c:if>
														<c:if test="${ b.bType == 2 }">Tips</c:if>
														<c:if test="${ b.bType == 3 }">Study</c:if>
													</td>
													<td <c:if test="${ b.bStatus eq 'Y' }">class="detail" data-href='${bdetail}'</c:if>>${ b.bWriter }</td>
													<td <c:if test="${ b.bStatus eq 'Y' }">class="detail" data-href='${bdetail}'</c:if>>${ b.bTitle }</td>
													<td <c:if test="${ b.bStatus eq 'Y' }">class="detail" data-href='${bdetail}'</c:if>>${ b.bDate }</td>
													<td>
													<c:choose>
														<c:when test="${ !empty loginUser }">
															<div class="btn-group btn-group-toggle" data-toggle="buttons">
												                <label class="btn btn-outline-warning btn-sm">
												                  <input type="radio" class="Status" <c:if test="${ b.bStatus eq 'Y' }">checked</c:if> value="Y">Y 
												                </label>
												                <label class="btn btn-outline-warning btn-sm">
												                  <input type="radio" class="Status" <c:if test="${ b.bStatus eq 'N' }">checked</c:if> value="N">N
												                </label>
											               </div>
										               </c:when>
										               <c:otherwise>${ b.bStatus }</c:otherwise>
										               </c:choose>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								</c:if>
								</form>
								<!-- /.card-body -->
								<!-- <div class="card-footer clearfix"> -->
								<div class="pagination-margin mt-5 mb-5">
									<nav aria-label="Page navigation example">
										<ul class="pagination" style="justify-content: center;">
											<!-- [이전] -->
											<c:if test="${ bi.currentPageB <= 1 }">
												<li class="page-item disabled">
													<a class="page-link" aria-label="Previous">
														<span aria-hidden="true">&laquo;</span>
													</a>
												</li>
											</c:if>
											<c:if test="${ bi.currentPageB > 1 }">
												<li class="page-item">
												<c:choose>
													<c:when test="${ table_search eq null }">
														<a class="page-link" href="adminBoard${boardType}.ad?page=${ bi.currentPageB - 1 }" aria-label="Previous">
															<span aria-hidden="true">&laquo;</span>
														</a>
													</c:when>
													<c:otherwise>
														<a class="page-link" href="adminBoard${boardType}.ad?table_search=${ table_search }&page=${ bi.currentPageB - 1 }" aria-label="Previous">
															<span aria-hidden="true">&laquo;</span>
														</a>
													</c:otherwise>
												</c:choose>
												</li>
											</c:if>
			
											<!-- 페이지 -->
											<c:forEach var="b" begin="${ bi.startPageB }" end="${ bi.endPageB }">
												<c:if test="${ b eq bi.currentPageB }">
													<li class="page-item disabled">
														<a class="page-link">${ b }</a>
													</li>
												</c:if>
												<c:if test="${ b ne bi.currentPageB }">
													<li class="page-item">
													<c:choose>
														<c:when test="${ table_search eq null }">
															<a class="page-link" href="adminBoard${boardType}.ad?page=${b}">${ b }</a>
														</c:when>
														<c:otherwise>
															<a class="page-link" href="adminBoard${boardType}.ad?table_search=${ table_search }&page=${b}">${ b }</a>
														</c:otherwise>
													</c:choose>
													</li>
												</c:if>
											</c:forEach>
			
											<!-- [다음] -->
											<c:if test="${ bi.currentPageB >= bi.maxPageB }">
												<li class="page-item disabled">
													<a class="page-link" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
													</a>
												</li>
											</c:if>
											<c:if test="${ bi.currentPageB < bi.maxPageB }">
												<li class="page-item">
												<c:choose>
												<c:when test="${ table_search eq null }">
													<a class="page-link" href="adminBoard${boardType}.ad?page=${ bi.currentPageB + 1 }" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
													</a>
												</c:when>
												<c:otherwise>
													<a class="page-link" href="adminBoard${boardType}.ad?table_search=${ table_search }&page=${ bi.currentPageB + 1 }" aria-label="Next">
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
		</section>
	</div>
	</c:if>
	<br>
	<script>
		/* 디테일 들어가기 */
		$(".detail").click(function() {
		    window.location = $(this).data("href");
		});
		
		$(".alert").click(function(){
			Swal.fire({
				  position: 'middle',
				  icon: 'warning',
				  title: '삭제된 게시글입니다.',
				  timer: 1300
				})
		});
		
		$('.Status').click(function() {	
			var bNo = $(this).parents('td').siblings('.bNo').text();
			var bStatus = $(this).val();
			
			$.ajax({
				type : "POST",
				url : "adminUpdateBoard.ad",
				data: { bNo : bNo, bStatus : bStatus },
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
		
		function search(){
			var search = $('#adminBoard [name="table_search"]').val()
			
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
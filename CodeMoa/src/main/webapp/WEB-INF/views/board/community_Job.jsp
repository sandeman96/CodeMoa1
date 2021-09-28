<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
<title>👩‍💻Job👨‍💻</title>
<!-- Select2 -->
  <link rel="stylesheet" href="/codemoa/resources/plugins/select2/css/select2.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.wrapper {
	position: absolute;
	display: inline;
}

.pagination li a {
	color: #939597;
}

.pagination li a:hover {
	color: #f5df4d;
}

a:link, a:visited {
	color: #939597;
	text-decoration: none;
}

button.info {font-size: 0.8rem; background-color: #f5df4d; color: #939597; border-color: #f5df4d; line-height: 1; line-height: 0.8;}
button.si {font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;}
button.fulltime {font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;}
button.finance {font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;}
button.pm {font-size: 0.7rem; line-height: 0.8; background-color: #f5df4d; color: #939597;}
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
 	<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2" style="margin-left: 1.25rem;">
						<div class="col-sm-7">
							<h1>👩‍💻Job👨‍💻</h1>
						</div>
						<div class="col-sm-4 btn float-sm-right">
							<button type="button" class="btn" id="jobPage"
								onclick="jobPage()"
								style="font-size: 1rem; background-color: #f5df4d; color: #939597; font-weight: bold; line-height: 1.3rem;">공고 더 보기</button>&nbsp;
								<button type="button" class="btn"
								onclick="location.href='crawling.bo'"
								style="font-size: 1rem; background-color: #f5df4d; color: #939597; font-weight: bold; line-height: 1.3rem;">채용공고 GET🧙‍♂️</button>
						</div>
					</div>
				</div>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<!-- /.row -->
					<div class="row">
						<div class="col-11">
							<div class="card">
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table class="table table-hover text-nowrap" style="color: #939597;">
										<tbody>
										<c:forEach var="dto" items="${list }">
											<tr>
												<td>
													<span><button type="button" class="btn techs si">IT직무</button>&nbsp;</span>
													<br />
													<a href="<c:out value='${dto.linker }' />" target="_blank"><c:out value="${dto.title}"/></a>
												</td>
												<td>
													<button type="button" class="btn btn-secondary info"
															data-toggle="popover" data-placement="left"
															data-content="<c:out value='${dto.title}' />"
															data-html="true">
															간략정보</button>
													<br />
													<c:out value="${dto.position }" />
													
												</td>
												<td>
													<a href="<c:out value='${dto.href }' />" target="_blank"><c:out value="${dto.company}"/></a>
												</td>
												<td>
													마감 <c:out value="${dto.closeDay}"/>일전
												</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<div class="col-2"></div>
						<!-- /.card -->
					</div>
					<!-- /.card-body -->
				</div>
				<div style="margin-top: 1.5rem;">
					<nav aria-label="Page navigation example">
						<ul class="pagination" style="justify-content: center;">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="crawling.bo">1</a></li>
							<li class="page-item"><a class="page-link" href="crawling2.bo">2</a></li>
							<li class="page-item"><a class="page-link" href="crawling3.bo">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">6</a></li>
							<li class="page-item"><a class="page-link" href="#">7</a></li>
							<li class="page-item"><a class="page-link" href="#">8</a></li>
							<li class="page-item"><a class="page-link" href="#">9</a></li>
							<li class="page-item"><a class="page-link" href="#">10</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<!-- /.content -->
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
   	<!-- Select2 -->
<script src="/codemoa/resources/plugins/select2/js/select2.full.min.js"></script>
<script>
		$(function() {
			$('[data-toggle="popover"]').popover()
		});
	</script>
	<script>
    $(function () {
      $('.select2').select2()
    });
</script>

<script>
$('#jobPage').on('click', function(){
	Swal.fire({
		  title: '<a href="https://www.jobplanet.co.kr/welcome/index"> 잡플래닛 ◼️</a> <a href="https://www.jobkorea.co.kr/">잡코리아 ◼️</a> <a href="https://www.saramin.co.kr/">사람인 </a>',
		  width: 600,
		  padding: '3em',
		  background: '#fff url(/images/trees.png)',
		  backdrop: `
			    rgba(0,0,123,0.4)
			    url("https://media.giphy.com/media/8vqF2nBJc24Merhx2R/giphy.gif?cid=790b7611hexgeiqery91v9nx3zfu07nk3g753mb8xnu3n7qs&rid=giphy.gif&ct=s")
			    left top
			    no-repeat
			  `
		});
	});
</script>
</body>
</html>
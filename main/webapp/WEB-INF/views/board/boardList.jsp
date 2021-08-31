<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
	
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid mb-3">
					<h1 style="text-align: center; margin-bottom: 3rem;">
						<c:set var="standard1" value="bNo"/>
						<c:set var="standard2" value="lCount"/>
						<c:set var="standard3" value="rCount"/>
						<c:set var="standard4" value="bCount"/>
						<c:choose>
							<c:when test="${bType eq 1}">
							Q&amp;A
							<c:set var="boardName" value="Faq"/>
							</c:when>
							<c:when test="${bType eq 2}">
							Tips
							<c:set var="Tips" value="Tips"/>
							</c:when>
							<c:otherwise>
							Study
							<c:set var="Study" value="Study"/>
							</c:otherwise>
						</c:choose>
					</h1>
					<div class="col-sm-3 btn-group mt-3">
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='boardList${boardName}.bo?bType=${bType}&standard=${ standard1 }'" style="font-size: 0.8rem;">최신순</button>
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='boardList${boardName}.bo?bType=${bType}&standard=${ standard2 }'" style="font-size: 0.8rem;">추천순</button>
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='boardList${boardName}.bo?bType=${bType}&standard=${ standard3 }'" style="font-size: 0.8rem;">댓글순</button>
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='boardList${boardName}.bo?bType=${bType}&standard=${ standard4 }'" style="font-size: 0.8rem;">조회순</button>
					</div>
					<div class="col-sm-2 btn float-sm-right">
						<c:if test="${ !empty loginUser }">
							<button type="button" class="btn btn-warning" onclick="location.href='insertBoardForm.bo'" style="font-size: 0.8rem; color: #939597; width: 7rem;">글 쓰기</button>
						</c:if>
					</div>
				</div>
			</section>

			<c:if test="${ list.isEmpty() }">
				<h3 style="text-align: center; margin-top: 3rem; margin-bottom: 3rem;">등록된 게시물이 없습니다.</h3>
			</c:if>
			<c:if test="${ !list.isEmpty()}">
				<section class="content">
					<div class="container-fluid">
						<div class="card">
							<!-- /.card-header -->
							<div class="card-body table-responsive p-0">
								<table class="table table-hover" style="color: #939597;">
									<tbody>
										<c:forEach var="b" items="${ list }">
											<c:url var="bdetail" value="boardDetail.bo">
												<c:param name="bNo" value="${ b.bNo }" />
												<c:param name="page" value="${ pi.currentPage }" />
											</c:url>

											<c:if test="${b.bFirst eq 'Y' }">
												<tr style="font-weight: bold;">
													<td style="width: 50rem;">
														<span>
															<button type="button" class="btn-tag">oracle</button>&nbsp;
														</span>
														<br>
														<a href="${bdetail}" style="color: #f5825f;">${ b.bTitle }</a>
													</td>
													<td>
														<a href="mypage.me?userId=${b.bWriter}" style="color: #f5825f;">${ b.nickName }</a>
													</td>
													<td style="color: #f5825f;">${ b.bDate }</td>
													<td style="color: #f5825f;">
														<span><i class="bi bi-hand-thumbs-up"></i>${ b.lCount }</span>
													</td>
													<td style="color: #f5825f;">
														<span><i class="bi bi-eye"></i>${ b.bCount }</span>
													</td>
													<td style="color: #f5825f;">
														<span><i class="bi bi-chat"></i>${ b.rCount }</span>
													</td>
												</tr>
											</c:if>
											<c:if test="${b.bFirst ne 'Y' }">
												<tr>
													<td style="width: 50rem;">
														<%-- <c:forEach var="tags" items="${ b.tags }"> --%>
														<span>
															<button type="button" class="btn-tag">oracle</button>
															&nbsp;
														</span>
														<%-- </c:forEach> --%>
														<br>
														<a href="${bdetail}">${ b.bTitle }</a>
													</td>
													<td>
														<a href="mypage.me?userId=${b.bWriter}">${ b.nickName }</a>
													</td>
													<td>${ b.bDate }</td>
													<td>
														<span><i class="bi bi-hand-thumbs-up"></i>${ b.lCount }</span>
													</td>
													<td>
														<span><i class="bi bi-eye"></i>${ b.bCount }</span>
													</td>
													<td>
														<span><i class="bi bi-chat"></i>${ b.rCount}</span>
													</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
		
					</div>
					<div class="pagination-margin mt-5 mb-5">
						<nav aria-label="Page navigation example">
							<ul class="pagination" style="justify-content: center;">							
								<!-- 첫페이지로 -->
								<c:if test="${ pi.currentPage <= 1 }">
									<li class="page-item disabled">
										<a class="page-link" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<li class="page-item">
										<a class="page-link" href="boardList${boardName}.bo?page=1" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>

								<!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									<li class="page-item disabled">
										<a class="page-link" aria-label="Previous">
											<span aria-hidden="true">&lt;</span>
										</a>
									</li>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<li class="page-item">
										<a class="page-link" href="boardList${boardName}.bo?page=${ pi.currentPage - 1 }" aria-label="Previous">
											<span aria-hidden="true">&lt;</span>
										</a>
									</li>
								</c:if>

								<!-- 페이지 -->
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<li class="page-item disabled">
											<a class="page-link">${ p }</a>
										</li>
									</c:if>
									<c:if test="${ p ne pi.currentPage }">
										<li class="page-item">
											<a class="page-link" href="boardList${boardName}.bo?page=${p}">${ p }</a>
										</li>
									</c:if>
								</c:forEach>

								<!-- [다음] -->
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									<li class="page-item disabled">
										<a class="page-link" aria-label="Next">
											<span aria-hidden="true">&gt;</span>
										</a>
									</li>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<li class="page-item">
										<a class="page-link" href="boardList${boardName}.bo?page=${ pi.currentPage + 1 }" aria-label="Next">
											<span aria-hidden="true">&gt;</span>
										</a>
									</li>
								</c:if>

								<!-- [마지막페이지로] -->
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									<li class="page-item disabled">
										<a class="page-link" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<li class="page-item">
										<a class="page-link" href="boardList${boardName}.bo?page=${pi.maxPage}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
							</ul>
						</nav>
					</div>
				</section>
			</c:if>
		</div>
	</div>
	<!-- jQuery -->
	<script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
</body>
</html>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
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
.col-3 {
	display: inline-block;
} /* necessary to give position: relative to parent. */
input[type="text"] {
	color: black;
	width: 100%;
	font-size: 0.7rem;
	box-sizing: border-box;
	border-radius: 1rem;
	letter-spacing: 1px;
	box-sizing: border-box;
}

input[type="text"]:focus {
	outline: none;
}

.effect-8 {
	border: 1px solid #ccc;
	padding: 7px 14px 9px;
	transition: 0.3s;
}

.effect-8:focus {
	border: 0px solid #ccc;
	padding: 7px 14px 9px;
	transition: 0.3s;
}

.effect-8 ~ .focus-border:before, .effect-8 ~ .focus-border:after {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 0;
	height: 2px;
	background-color: #f5df4d;
	transition: 0.3s;
}

.effect-8 ~ .focus-border:after {
	top: auto;
	bottom: 0;
	left: auto;
	right: 0;
}

.effect-8 ~ .focus-border i:before, .effect-8 ~ .focus-border i:after {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 2px;
	height: 0;
	background-color: #f5df4d;
	transition: 0.3s;
}

.effect-8 ~ .focus-border i:after {
	left: auto;
	right: 0;
	top: auto;
	bottom: 0;
}

.effect-8:focus ~ .focus-border:before, .effect-8:focus ~ .focus-border:after
	{
	width: 100%;
	transition: 0.3s;
}

.effect-8:focus ~ .focus-border i:before, .effect-8:focus ~
	.focus-border i:after {
	height: 100%;
	transition: 0.3s;
}

input:focus::-webkit-input-placeholder {
	color: transparent;
}
body {
  font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
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
					<div class="card-header mb-4">
						<h1 style="text-align: center; margin-bottom: 3rem;">
							<c:set var="standard1" value="bNo" />
							<c:set var="standard2" value="lCount" />
							<c:set var="standard3" value="rCount" />
							<c:set var="standard4" value="bCount" />
							<c:choose>
								<c:when test="${bType eq 1}">
							<span onclick="location.href='boardList${boardName}.bo'" style="cursor:pointer;">&#128587;Q&amp;A</span>
							<c:set var="boardName" value="Faq" />
									<c:set var="tagName" value="Q&A" />
								</c:when>
								<c:when test="${bType eq 2}">
						<span onclick="location.href='boardList${boardName}.bo'" style="cursor:pointer;">&#129488;Tips</span>
							<c:set var="boardName" value="Tips" />
									<c:set var="tagName" value="Tips" />
								</c:when>
								<c:otherwise>
							<span onclick="location.href='boardList${boardName}.bo'" style="cursor:pointer;">&#128488;Study</span>
							<c:set var="boardName" value="Study" />
									<c:set var="tagName" value="Study" />
								</c:otherwise>
							</c:choose>
						</h1>
						<form method="get" id="searchForm">
						<div class="col-1" style="display: inline-block; float: right;">
							<button type="submit" class="btn btn-warning float-right"
								id="searchBtn"
								style="font-size: 0.8rem; display: inline-block; color: #939597; width: 7rem;">검색</button>
						</div>
						<div class="col-3 mb-3"
							style="display: inline-block; float: right;">
							<div>
								<input class="effect-8" type="text" id="search" name="search"
									placeholder="검색어를 입력해주세요" value="${search}"> <span class="focus-border">
									<i></i>
								</span>
							</div>
						</div>
					</form>
					</div>
					<div class="col-sm-2 btn float-sm-right mt-1">
						<c:if test="${ loginUser != null and loginUser.admin =='Y' }">
						<button type="button" class="btn btn-warning" onclick="location.href='insertFirstBoardForm.bo?boardName=${boardName}'" style="font-size: 0.8rem; color: #939597; width: 7rem;">공지글 쓰기</button>
					</c:if>
						<c:if test="${ !empty loginUser }">
							<button type="button" class="btn btn-warning"
								onclick="location.href='insertBoardForm.bo?boardName=${boardName}'"
								style="font-size: 0.8rem; color: #939597; width: 7rem;">글
								쓰기</button>
						</c:if>
					</div>
					<div class="col-sm-3 btn-group mt-3">
						<button type="button" class="btn btn-outline-secondary"
							onclick="location.href='boardList${boardName}.bo?bType=${bType}&standard=${standard1}'"
							style="font-size: 0.8rem;">최신순</button>
						<button type="button" class="btn btn-outline-secondary"
							onclick="location.href='boardList${boardName}.bo?bType=${bType}&standard=${standard2}'"
							style="font-size: 0.8rem;">추천순</button>
						<button type="button" class="btn btn-outline-secondary"
							onclick="location.href='boardList${boardName}.bo?bType=${bType}&standard=${standard3}'"
							style="font-size: 0.8rem;">댓글순</button>
						<button type="button" class="btn btn-outline-secondary"
							onclick="location.href='boardList${boardName}.bo?bType=${bType}&standard=${standard4}'"
							style="font-size: 0.8rem;">조회순</button>
					</div>
				</div>
			</section>

			<c:if test="${ list.isEmpty() }">
				<h3
					style="text-align: center; margin-top: 3rem; margin-bottom: 3rem;">등록된
					게시물이 없습니다.</h3>
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
													<td style="width: 50rem;"><span>
															<button type="button" class="btn-second-tag"
													onclick="location.href='boardList${boardName}.bo?bFirst=${b.bFirst}'">공지</button>&nbsp;
															<button type="button" class="btn-first-tag"
																onclick="location.href='boardList${boardName}.bo'">${tagName}</button>&nbsp;
													</span> <c:if test="${ b.bTags ne null}">
															<c:forTokens var="tag" items="${ b.bTags }" delims=",">
																<span>
																	<button type=button class="btn-tag" onclick="location.href='boardList${boardName}.bo?bType=${bType}&standard=${standard1}&search=${search}&tagSearch=${tag}'">
																		<c:out value="${tag}" />
																	</button>&nbsp;
																</span>
															</c:forTokens>
														</c:if> <br> <a href="${bdetail}" style="color: black;">${ b.bTitle }</a>
													</td>
													<td><a href="mypage.me?userId=${b.bWriter}"
														style="color: black;">${ b.nickName }</a></td>
													<td style="color: black;">${ b.bDate }</td>
													<td style="color: black;"><span><i
															class="bi bi-hand-thumbs-up"></i>${ b.lCount }</span></td>
													<td style="color: black;"><span><i
															class="bi bi-eye"></i>${ b.bCount }</span></td>
													<td style="color: black;"><span><i
															class="bi bi-chat"></i>${ b.rCount }</span></td>
												</tr>
											</c:if>
											<c:if test="${b.bFirst ne 'Y' }">
												<tr>
													<td style="width: 50rem;"><span>
															<button type="button" class="btn-first-tag"
																onclick="location.href='boardList${boardName}.bo'">${tagName}</button>&nbsp;
													</span> <c:if test="${ b.bTags ne null}">
															<c:forTokens var="tag" items="${ b.bTags }" delims=", ">
																<span>
																	<button type="button" class="btn-tag" onclick="location.href='boardList${boardName}.bo?bType=${bType}&standard=${standard1}&search=${search}&tagSearch=${tag}'">
																		<c:out value="${tag}" />
																	</button>&nbsp;
																</span>
															</c:forTokens>
														</c:if> <br> <a href="${bdetail}">${ b.bTitle }</a></td>
													<td><a href="mypage.me?userId=${b.bWriter}">${ b.nickName }</a>
													</td>
													<td>${ b.bDate }</td>
													<td><span><i class="bi bi-hand-thumbs-up"></i>${ b.lCount }</span>
													</td>
													<td><span><i class="bi bi-eye"></i>${ b.bCount }</span>
													</td>
													<td><span><i class="bi bi-chat"></i>${ b.rCount}</span>
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
									<li class="page-item disabled"><a class="page-link"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<li class="page-item"><a class="page-link"
										href="boardList${boardName}.bo?page=1" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>

								<!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									<li class="page-item disabled"><a class="page-link"
										aria-label="Previous"> <span aria-hidden="true">&lt;</span>
									</a></li>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<li class="page-item"><a class="page-link"
										href="boardList${boardName}.bo?page=${ pi.currentPage - 1 }"
										aria-label="Previous"> <span aria-hidden="true">&lt;</span>
									</a></li>
								</c:if>

								<!-- 페이지 -->
								<c:forEach var="p" begin="${ pi.startPage }"
									end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<li class="page-item disabled"><a class="page-link">${ p }</a>
										</li>
									</c:if>
									<c:if test="${ p ne pi.currentPage }">
										<li class="page-item"><a class="page-link"
											href="boardList${boardName}.bo?page=${p}">${ p }</a></li>
									</c:if>
								</c:forEach>

								<!-- [다음] -->
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										aria-label="Next"> <span aria-hidden="true">&gt;</span>
									</a></li>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<li class="page-item"><a class="page-link"
										href="boardList${boardName}.bo?page=${ pi.currentPage + 1 }"
										aria-label="Next"> <span aria-hidden="true">&gt;</span>
									</a></li>
								</c:if>

								<!-- [마지막페이지로] -->
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<li class="page-item"><a class="page-link"
										href="boardList${boardName}.bo?page=${pi.maxPage}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
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
	<script
		src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
		<!-- sweetalert2 -->
	<script src="/codemoa/resources/plugins/sweetalert2.all.min.js"></script>
	<script>
		$(function() {		
			$('#searchBtn').click(function() {
				if (($.trim($('#search').val())) == '') {
					Swal.fire({
						  icon: 'error',
						  title: '검색어가 입력되지 않았습니다.',
						  text: '검색어를 입력해주세요!'
						})
					$('#search').focus();
					return false;
				}
				
					$('#searchForm').attr("action", "boardList${boardName}.bo?search=${search}");
					return true;
			});
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title>

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
<style>
input[type=radio]:checked + label {color:white; background-color:gray;}
input[type=radio]{display:none;}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<c:import url="../admin/adminSidebar.jsp"/>
	
	
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>게시판 관리</h1>
					</div>
				</div>
			</div><!-- /.container-fluid -->
		</section>
    
		<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header d-flex p-0 align-items-center">
									<h3 class="col-4 card-title p-3">신고된 사용자 리스트</h3>
<!-- 									<ul class="nav nav-pills ml-auto p-2"> -->
<!-- 										<li class="nav-item"> -->
<!-- 											<div class="btn-group"> -->
<!-- 						                        <button type="button" class="btn btn-default btn-sm">전체</button> -->
<!-- 						                        <button type="button" class="btn btn-default btn-sm">Tech</button> -->
<!-- 						                        <button type="button" class="btn btn-default btn-sm">Community</button> -->
<!-- 						                        <button type="button" class="btn btn-default btn-sm">Git Trending</button> -->
<!-- 						                    </div> -->
<!-- 										</li> -->
<!-- 										<li>&ensp;</li> -->
<!-- 										<li class="nav-item"> -->
<!-- 											<div class="card-tools">          -->
<!-- 					                           <div class="input-group input-group-sm" style="width: 150px;"> -->
<!-- 					                              <input type="text" class="form-control float-right" placeholder="Search"> -->
<!-- 					                              <div class="input-group-append"> -->
<!-- 					                                 <button type="submit" class="btn btn-default"> -->
<!-- 					                                 <i class="fas fa-search"></i> -->
<!-- 					                              </button> -->
<!-- 					                              </div> -->
<!-- 					                           </div> -->
<!-- 					                        </div> -->
<!-- 					                	</li> -->
					                	
<!-- 									</ul> -->
					                	<div class="col-2 text-center" >
											<button type="button" class="btn btn-warning btn-sm"
											 onclick="updateUser()">선택된유저 제한</button>
										</div>
										<div class="col-6 text-right">
											<button type="button" class="btn btn-warning btn-sm mr-4"
											 onclick="deleteValue();">선택된글 삭제</button>
										</div>				
								</div>
								
								
								
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>NO</th>
												<th>신고종류</th>
												<th>신고된 닉네임</th> 
												<th style="border-right: 1px solid #dee2e6;">
													<input type="checkbox" id="allCheck" name="allCheck2">
												</th>
												<th>신고자</th>
												<th>제목</th>
												<th>내용</th>
												<th>신고일</th>
												<th>
													<input type="checkbox" id="allCheck" name="allCheck">
												</th>
											</tr>
										</thead>
										
										<tbody>
											<c:forEach var="p" items="${ pList }">							
											<tr>
												<td>${ p.pNo }</td>
												<c:choose>
													<c:when test="${ p.pType =='1' }">
														<td>부적절한 닉네임</td>
													</c:when>
													<c:otherwise>
														<td>기타</td>
													</c:otherwise>
												</c:choose>
												<c:url var="mypage" value="mypage.me">
													<c:param name="userId" value="${ p.pReporter }" />
												</c:url>
												<td>
												<c:set var="flag" value="false"/>
														<c:forEach var="m" items="${ mList }">
															<c:if test="${ !flag }">
<%-- 																<c:if test="${ p.pMnick eq m.nickName}"> --%>
											<c:if test="${ p.pReporter eq m.id and m.enable =='0'}">
                                                <a href="${ mypage }" style="color: blue;">${ p.pMnick }</a>(처리전)
                                                      <c:set var="flag" value="true"/>
                                                </c:if>
                                                
                                                <c:if test="${ p.pReporter eq m.id and m.enable =='1'}">
                                                      <a href="${ mypage }" style="color: red;">${ p.pMnick }</a> (제한완료)
                                                      <c:set var="flag" value="true"/>   
                                                </c:if>
                                                
                                                <c:if test="${ p.pReporter eq m.id and p.pMnick ne m.nickName and m.enable =='0'}">
                                                     -> <a style="color: red;">${ m.nickName }</a>(변경됨)
                                                      <c:set var="flag" value="true"/>   
                                                </c:if>
                                             </c:if>
                                          </c:forEach>
                                    </td>
                                    <td style="border-right: 1px solid #dee2e6;">
                                    <c:set var="flag2" value="false"/>
                                       <c:forEach var="m" items="${ mList }">
                                       <c:if test="${ !flag2 }">
                                          <c:if test="${ p.pReporter eq m.id }">
                                             <input type="checkbox" name="RowCheck2" value="${ m.id }" > 
                                             <c:set var="flag2" value="true"/> 
                                          </c:if>
                                       </c:if>
                                       </c:forEach>
												<c:url var="mypage" value="mypage.me">
													<c:param name="userId" value="${ p.pReceiver }" />
												</c:url>
												
												<td><a href="${ mypage }">${ p.pReceiver }</a></td>
												
												<c:url var="reportDetail" value="adminDetailReport.ad">
													<c:param name="pNo" value="${ p.pNo }" />
													<c:param name="pageP" value="${ rpi.currentPageP }" />
												</c:url>
												<td style="max-width: 150px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
													<a href="${reportDetail}" style="color: #f5825f;">${ p.pTitle }</a>
												</td>
												<td style="max-width: 150px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
												${ p.pContent }</td>
												<td>${ p.pDate }</td>
												<td>
													<input type="checkbox" name="RowCheck" value="${ p.pNo }" >  
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								
								<c:url var="deleteReport" value="adminDeleteReport.ad">
									<c:param name="pNo" value="${ p.pNo }" />
								</c:url>
								  
								<!-- /.card-body -->
								<div class="card-footer clearfix">
									<div class="card-tools d-flex justify-content-center">
										<ul class="pagination pagination-sm m-0">
											<!-- [이전] -->
											<c:if test="${ rpi.currentPageP <= 1 }">
												<li class="page-item"><a class="page-link">&laquo;</a>
											</c:if>
											<c:if test="${ rpi.currentPageP > 1 }">
												<c:url var="before" value="adminReportBoard.ad">
													<c:param name="pageP" value="${ rpi.currentPageP - 1 }"/>
												</c:url>
												<li class="page-item"><a href="${ before }" class="page-link">&laquo;</a>
											</c:if>
														
											<!-- 페이지 -->
											<c:forEach var="rp" begin="${ rpi.startPageP }" end="${ rpi.endPageP }">
												<c:if test="${ rp eq rpi.currentPageP }">
													<li class="page-item"><a class="page-link" style="color: red;">${ rp }</a>
												</c:if>
														
												<c:if test="${ rp ne rpi.currentPageP }">
													<c:url var="pagination" value="adminReportBoard.ad">
														<c:param name="pageP" value="${ rp }"/>
													</c:url>
													<li class="page-item"><a href="${ pagination }" class="page-link">${ rp }</a>
												</c:if>	
											</c:forEach>
													
											<!-- [다음] -->
											<c:if test="${ rpi.currentPageP >= rpi.maxPageP }">
												<li class="page-item"><a class="page-link">&raquo;</a>
											</c:if>
											<c:if test="${ rpi.currentPageP < rpi.maxPageP }">
												<c:url var="after" value="adminReportBoard.ad">
													<c:param name="pageP" value="${ rpi.currentPageP + 1 }"/>
												</c:url> 
												<li class="page-item"><a href="${ after }" class="page-link">&raquo;</a>
											</c:if>				
										</ul>
									</div>
								</div>
							<!-- /.card -->
							</div>
						</div>
					</div>
				</div>
				<c:if test="${ pList.isEmpty() }">
						<h3 style="text-align: center; margin-top: 3rem; margin-bottom: 3rem;">등록된 신고가 없습니다.</h3>
				</c:if>
		</section>
	</div> 
   
   <!-- jQuery -->
   <script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
   <!-- Bootstrap 4 -->
   <script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- AdminLTE App -->
   <script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="/codemoa/resources/dist/js/demo.js"></script>
<!-- 신고글 삭제  -->
<script type="text/javascript">
	$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for (var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			} else {
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	function deleteValue(){
		var url = "adminDeleteReportCheck.ad";
		var valueArr = new Array();
		var pList = $("input[name='RowCheck']");
		for(var i = 0; i < pList.length; i++){
			if(pList[i].checked){
				valueArr.push(pList[i].value);
			}
		}
		if(valueArr.length == 0) {
			alert("선택된 글이 없습니다.");
		}else if(confirm("정말 삭제하시겠습니까?") == false){
			alert('삭제 취소')
			return;
		}else {
			var chk
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr
				},
				success: function(jdata){
					if(jdata = 1){
						alert("삭제 성공");
						 location.href = "adminReportMember.ad";
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	
	}
	
</script>

<!-- 보드 글 삭제 -->  
<script type="text/javascript">
	$(function(){
		var chkObj = document.getElementsByName("RowCheck2");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck2']").click(function(){
			var chk_listArr = $("input[name='RowCheck2']");
			for (var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck2']").click(function(){
			if($("input[name='RowCheck2']:checked").length == rowCnt){
				$("input[name='allCheck2']")[0].checked = true;
			} else {
				$("input[name='allCheck2']")[0].checked = false;
			}
		});
	});
	function updateUser(){
		var url = "userCheckEnable.ad";
		var valueArr = new Array();
		var mList = $("input[name='RowCheck2']");
		for(var i = 0; i < mList.length; i++){
			if(mList[i].checked){
				valueArr.push(mList[i].value);
			}
		}
		if(valueArr.length == 0) {
			alert("선택된 유저가 없습니다.");
		}else if(confirm("유저 상태를 변경 하시겠습니까?") == false){
			alert('삭제 취소')
			return;
		}else {
			var chk
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr
				},
				success: function(jdata){
					if(jdata = 1){
						alert("변경 완료");
						 location.href = "adminReportMember.ad";
					} else {
						alert("변경 실패");
					}
				}
			});
		}
	}
	
</script>
</body>
</html>
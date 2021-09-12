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
								<div class="card-header d-flex p-0">
									<h3 class="card-title p-3">신고된 게시판 리스트</h3>
									<ul class="nav nav-pills ml-auto p-2">
										<li class="nav-item">
<!-- 											<div class="btn-group"> -->
<!-- 						                        <button type="button" class="btn btn-default btn-sm">전체</button> -->
<!-- 						                        <button type="button" class="btn btn-default btn-sm">Tech</button> -->
<!-- 						                        <button type="button" class="btn btn-default btn-sm">Community</button> -->
<!-- 						                        <button type="button" class="btn btn-default btn-sm">Git Trending</button> -->
<!-- 						                    </div> -->
										</li>
										<li>&ensp;</li>
										<li class="nav-item">
											<div class="card-tools">         
					                           <div class="input-group input-group-sm" style="width: 150px;">
					                              <input type="text" class="form-control float-right" placeholder="Search">
					                              <div class="input-group-append">
					                                 <button type="submit" class="btn btn-default">
					                                 <i class="fas fa-search"></i>
					                              </button>
					                              </div>
					                           </div>
					                        </div>
					                	</li>
					                	<li>&ensp;</li>
										<li class="nav-item">
											<input type="button" class="btn btn-block btn-warning btn-sm"
											style=""  value="선택된글 삭제" onclick="deleteValue();">
										</li>				
									</ul>
								</div>
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>NO</th>
												<th>신고종류</th>
												<th>신고된 보드 번호</th> 
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
											<c:url var="pdetail" value="adminDetailReport.ad">
													<c:param name="pNo" value="${ p.pNo }" />
													<c:param name="page" value="1" />
											</c:url>							
											<tr>
												<td>${ p.pNo }</td>
												<c:choose>
													<c:when test="${ p.pType =='3' }">
														<td>부적절한 내용</td>
													</c:when>
													<c:when test="${ p.pType =='4' }">
														<td>욕설 및 혐오 표현</td>
													</c:when>
													<c:when test="${ p.pType =='5' }">
														<td>광고글</td>
													</c:when>
													<c:otherwise>
														<td>기타</td>
													</c:otherwise>
												</c:choose>
												<td>
<%-- 													<button onclick="test();" style="color: #f5825f;">${ p.pBno } 번</button> --%>
<%-- 													<a href="boardDetail.bo?bNo=${ p.pBno }&page=${p.pBpage}">${ p.pBno } 번</a> --%>
													
<%-- 													<c:set var="flag" value="false"/> --%>
														<c:forEach var="b" items="${ bList }">
<%-- 															<c:if test="${ !flag }"> --%>
															
																<c:if test="${b.bNo eq p.pBno and b.bStatus =='N'}">
																	<a onclick="test();">${ b.bNo } 번</a>
<%-- 																		<c:set var="flag" value="true"/>	 --%>
															
																</c:if>
																<c:if test="${b.bNo eq p.pBno and b.bStatus =='Y'}">
																		<a href="boardDetail.bo?bNo=${ p.pBno }&page=${p.pBpage}">${ p.pBno } 번 </a>
<%-- 																		<c:set var="flag" value="true"/>	 --%>
																</c:if>
																
<%-- 															</c:if> --%>
														</c:forEach>
														<script> 
			 												function test(){
// 																if(${b.bNo} == ${p.pBno} && ${b.bStatus == 'N'}) {
			 														alert("이미 삭제된 게시글입니다");
// 																}
			 												}
			 											</script>
 												
												</td>
												
												<c:url var="mypage" value="mypage.me">
													<c:param name="userId" value="${ p.pReceiver }" />
												</c:url>
												
												<td><a href="${ mypage }">${ p.pReceiver }</a></td>
												
												<c:url var="reportDetail" value="adminDetailReport.ad">
													<c:param name="pNo" value="${ p.pNo }" />
													<c:param name="pageP" value="${ rpi.currentPageP }" />
												</c:url>
												<td>
													<a href="${reportDetail}" style="color: #f5825f;">${ p.pTitle }</a>
												</td>
												<td>${ p.pContent }</td>
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
		</section>
	</div> 


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
			alert("선택된 글이 없습니다.")
		}else {
			var chk = confirm("정말 삭제하시겠습니까?");
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
						 location.href = "adminReportBoard.ad";
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	}
	
</script>

<!-- <script>
$("#allCheck").click(function(){
 var chk = $("#allCheck").prop("checked");
 if(chk) {
  $(".chBox").prop("checked", true);
 } else {
  $(".chBox").prop("checked", false);
 }
});
</script>

<script>
 $(".chBox").click(function(){
  $("#allCheck").prop("checked", false);
 });
</script>

<script>
 $(".selectDelete_btn").click(function(){
  var confirm_val = confirm("정말 삭제하시겠습니까?");
  
  if(confirm_val) {
   var checkArr = new Array();
   
   $("input[class='chBox']:checked").each(function(){
    checkArr.push($(this).attr("data-cartNum"));
   });
    
   $.ajax({
    url : "/shop/deleteCart",
    type : "post",
    data : { chbox : checkArr },
    success : function(){
     location.href = "/shop/cartList";
    }
   });
  } 
 });
</script> -->
   
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
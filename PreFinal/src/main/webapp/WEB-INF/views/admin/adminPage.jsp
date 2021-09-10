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
<link rel="stylesheet" href="${contextPath}/codemoa/resources/css/admin.css" type="text/css">
<!-- <link rel="stylesheet" href="/codemoa/resources/dist/css/admin.css"> -->
<link rel="stylesheet" href="/codemoa/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/codemoa/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="/codemoa/resources/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="/codemoa/resources/plugins/summernote/summernote-bs4.min.css">
 <!-- fullCalendar -->
  <link rel="stylesheet" href="/codemoa/resources/plugins/fullcalendar/main.css">


<style>
/* css작동 안해서 여기서 작성 */
/* 사용자 상태  */
#userStatus{
	width: 1500px;
	height: 500px;
	border: 1px solid black;
	margin-left: 15px;
/* 	background-color: white; */
}

.crd-body {
    min-height: 1px;
    padding: 1.25rem;
	width: 1500px;
}

/* .jsgrid-row100 { */
/* 	width: 1200px; */
/* } */

/* .jsgrid-pager-container{ */
/* 	width: 1200px;	 */
/* } */

/* 게시글 상태 */
#userBoard{
	width: 1500px;
	height: 500px;
	border: 1px solid black;
	margin-left: 15px;
	background-color: white;
}

/* 달력 */
.adminCalender {
	
/* 	background-color: white; */
	width: 1600px;
	height: 580px;
/* 	border: 1px solid black; */
	margin-left: 5px;
/* 	margin-left: 750px; */
}


.cal-md-9 {
    width: 780px;
	height: 580px;
 }
.card {
   	width: 780px;
	height: 585px;
   }
   
.card {
    /* box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%); */
    margin-bottom: 1rem;
}
.card {
    position: relative;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: 0.25rem;
}
/* #calendar{ */
/* 	width: 780px; */
/* 	height: 580px; */
/* } */
#calendar{
	width: 1500px;
	height: 580px;
}
/* 로그아웃 */
#logoutBtn {
	position: absolute;
	bottom: 10px;
	font-weight: bold;
}
#logoutBtn:hover {
	background-color: rgba(255, 255, 255, .1);
	color: #fff;
}
#dark i {
	color: #f5df4d;
}
#chatbox {
	position: absolute;
	top: 58;
	right: 15px;
}

/* 상태체크박스 */
input[type=radio]:checked + label {color:white; background-color:gray;}
input[type=radio]{display:none;}
</style>

</head>
<body>
<%-- <c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" /> --%>
   <c:import url="../admin/adminSidebar.jsp" />
      
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
	      	<div class="container-fluid">
	        	<div class="row mb-2">
		          	<div class="col-sm-6">
		            	<h1 class="m-0">관리자 메인페이지</h1>
		          	</div><!-- /.col -->
	        	</div><!-- /.row -->
	      	</div>
      	<!-- /.container-fluid -->
    	</div>
    	<!-- /.content-header -->
    	
	<section class="content">
      <div class="container-fluid">
        <div class="row">
        <!-- Small boxes (Stat box) -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>총 회원수</h3>

                <p>${ mi.listCountM } 명</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="adminMember.ad" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>총 게시물 수</h3>
                <p> ${ bi.listCountB } 개</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="adminBoard.ad" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>캘린더 일정</h3>

                <p>User Registrations</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="adminCalendar.ad" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>광고수</h3>
                <p>개</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
         </div>
         <!-- 상단 카드 빨주노초 -->
        
        <iframe src="adminMember.ad" scrolling="auto" width="100%" height="610px;" class="border"></iframe>
         
        <br><hr><br>
        
         <iframe src="adminBoard.ad" scrolling="auto" width="100%" height="660px;" class="border"></iframe>
  
 		 <br><hr><br>
       	
       	<iframe src="adminCalendar.ad" scrolling="auto" width="100%" height="850px;" class="border"></iframe>
       	
       	<br><br>
       </div>
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

</body>
</html>
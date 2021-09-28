<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
	<title>Home</title>
	
	<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/codemoa/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="/codemoa/resources/plugins/fullcalendar/main.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/codemoa/resources/dist/css/adminlte.min.css">
	
	
</head>
<style>
/*a태그 밑줄x/글씨색변화x*/
a:link, a:visited {
	color: #939597;
	text-decoration: none;
}
</style>
<body>

	<!-- countList : ${countList } -->
	<!-- likeList : ${likeList } -->
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>👩‍💻🧙‍♂️</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="">Home</a></li>
              <li class="breadcrumb-item active">CodeMoa</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
	

<!-- Main Content -->
<section class="content">
<div class="container-fluid">
    <div class="row">
		<!-- 전체 게시판 글의 조회순  -->
        <div class="col-md-6">
        	<div class="card">
              <div class="card-header">
                <h3 class="card-title">👀Top Click</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 5rem;">no</th>
                      <th style="width: 80rem;">Title</th>
                      <th style="width: 10rem;">&nbsp&nbsp&nbsp  Date</th>
                      <th style="width: 30rem;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Nick</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="count" items="${countList }">
                   <tr>
                      <td>${count.rnum }</td>
                      <td style="max-width: 200px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                      	<span class="badge bg-warning">${count.b_type }</span> <br>
                      	<a href="${contextPath }/boardDetail.bo?bNo=${count.b_no }&page=1">${count.b_title }</a>
                      </td>
                      <td><span class="badge bg-warning">${count.b_date }</span></td>
                      <td style="max-width: 60px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                      	<a href="mypage.me?userId=${count.b_writer}">${count.m_nick }</a>
                      </td>
                    </tr>
                </c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        
        <div class="col-md-6">
        	<div class="card">
              <div class="card-header">
              	<!-- 전체 게시판 글의 좋아요순 -->
                <h3 class="card-title">🥇🥈🥉Top Likey</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 5rem;">no</th>
                      <th style="width: 80rem;">Title</th>
                 <th style="width: 10rem;">&nbsp&nbsp&nbsp  Date</th>
                      <th style="width: 30rem;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Nick</th>
                       </tr>
                  </thead>
                  <tbody>
                  
                    
                <c:forEach var="like" items="${likeList }">
                   <tr>
                      <td>${like.rnum }</td>
                      <td style="max-width: 200px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                      	<span class="badge bg-warning">${like.b_type }</span><br>
                      	<a href="${contextPath }/boardDetail.bo?bNo=${like.b_no }&page=1">${like.b_title }</a>
                      </td>
                      <td><span class="badge bg-warning">${like.b_date }</span></td>
                      <td style="max-width: 60px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                      	<a href="mypage.me?userId=${like.b_writer}">${like.b_writer }</a>
                      </td>
                    </tr>
                </c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        
      </div>
      	<!-- /.row -->
      	
      	<!-- 광고.. 구글광고!? -->
      	<h5 class="mb-2">💲 Main Sponsor💲</h5>
        <div class="card card-success">
          <div class="card-body">
            <div class="row">
              <div class="col-md-12 col-lg-6 col-xl-4">
                <div class="card mb-2 bg-gradient-dark">
                  <img class="card-img-top" src="resources/dist/img/khad.jpg" alt="Dist Photo 1">
                  <div class="card-img-overlay d-flex flex-column justify-content-end">
                    <h5 class="card-title text-primary text-primary"></h5>
                    <p class="card-text text-white pb-2 pt-1"></p>
                    <a href="https://www.iei.or.kr/main/main.kh" class="text-white">www.iei.or.kr</a>
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-lg-6 col-xl-4">
                <div class="card mb-2 bg-gradient-dark">
                  <img class="card-img-top" src="resources/dist/img/gatherTown.png" alt="Dist Photo 2">
                  <div class="card-img-overlay d-flex flex-column justify-content-end">
                    <h5 class="card-title text-primary text-white">@gatherTown</h5>
                    <p class="card-text text-white pb-2 pt-1"><br>줌에 지친 여러분! 8비트의 개더타운에서 만나요!  </p>
                    <a href="https://www.gather.town/" class="text-white">www.gather.town</a>
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-lg-6 col-xl-4">
                <div class="card mb-2 bg-gradient-dark">
                  <img class="card-img-top" src="resources/dist/img/sufit.jpg" alt="Dist Photo 3">
                  <div class="card-img-overlay d-flex flex-column justify-content-end">
                    <h5 class="card-title text-primary"></h5>
                    <p class="card-text text-primary pb-2 pt-1"></p>
                    <a href="https://www.surfit.io/" class="text-danger">www.surfit.io</a>
                  </div>
                </div>
              </div>
            </div>
                  	<a href="https://docs.google.com/forms/d/e/1FAIpQLSf3rXg79S20edtANx93GOkaOr-eYN-3VwqLgDe1g1kN32wM6w/viewform?vc=0&c=0&w=1&flr=0" class="float-right">sponsor</a>
          </div>
        </div>
   
     
      	<!-- 달력..!! 잡코리아 고마워.. -->
      	<h5 class="mb-2 mt-4">🏃‍♀️ Calendar🏃‍♂️</h5>
  
          <div class="text-center">
                <!-- THE CALENDAR -->
                <!-- iframe -->
			<iframe id="pageFrame" name="pageFrame" src="http://www.jobkorea.co.kr/Starter/calendar/sub/month" frameborder="0"
			class="col-10" height="1300px" scrolling="auto"></iframe>

          </div>
          <!-- /.col -->

          </div>
          </section>
          </div>
         
		
	<!-- jQuery -->
<script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jQuery UI -->
<script src="/codemoa/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- AdminLTE App -->
<script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="/codemoa/resources/plugins/moment/moment.min.js"></script>
<script src="/codemoa/resources/plugins/fullcalendar/main.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/codemoa/resources/dist/js/demo.js"></script>
<!-- Page specific script -->

	
</body>
</html>

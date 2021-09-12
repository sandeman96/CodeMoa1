<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

</head>
<body>
	<!-- countList : ${countList } -->
	<!-- likeList : ${likeList } -->
	<c:import url="common/menu.jsp">
		<c:param name="countList" value="${countList }" />
		<c:param name="likeList" value="${likeList }" />
	</c:import>
	
<div class="wrapper">
		
	<c:import url="home.jsp"/>
        
<!-- Main Footer -->
  <footer class="main-footer">
    <strong>Copyright &copy; <a href="https://adminlte.io">CodeMoA.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.1.0
    </div>
  </footer>
</div>
<!-- /.wrapper -->


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
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
	<c:import url="WEB-INF/views/common/menu.jsp"/>
	
	<div class="wrapper">
		  <c:import url="WEB-INF/views/home.jsp"/>
		  
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

</body>
</html>
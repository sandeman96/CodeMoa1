<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Codemoa</title>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- kakao JavaScript SDK -->
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <!-- js-cookie -->
  <script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.0/dist/js.cookie.min.js"></script>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/dist/css/adminlte.min.css">
  
  <style>
  	.kakao-login-btn:hover{filter: brightness(80%); }
  </style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
  
  <c:if test="${ msg != null}">
 <script>
    alert('${msg}');
//     location.href='<c:out value="${pageContext.request.contextPath}"/>${url}';
</script>
  </c:if>
  
    <div class="card-header text-center">
      <a href="logout.me" class="h1"><b>Codemoa</b></a>
    </div>
    
    <div class="card-body">
      <p class="login-box-msg"></p>
      
      <form action="nickUpdate.me" method="post">
        <div class="input-group mb-3">
         <div class="input-group-append">
            <div class="input-group-text">
               	현재 닉네임 : 
            </div>
          </div>
<%--           <input type="text" name="nickName" class="form-control" placeholder="${ loginUser.nickName }" id="nickName" readonly="readonly" --%>
<!--           	style="color: black;"> -->
         	<input type="text"class="form-control" placeholder="${loginUser.nickName}" readonly
          	id="nickName2" name="nickName2" style="color: black;">
        </div>
        <div class="input-group mb-3">
         <div class="input-group-append">
            <div class="input-group-text">
               	바꿀 닉네임 : 
            </div>
          </div>
          <input type="hidden" name="id" id="id" value="${ loginUser.id }">
          
<%--           <input type="text" name="nickName" class="form-control" placeholder="" id="nickName" value="${ loginUser.nickName }"style="color: black;"> --%>
          <input type="text" name="nickName" class="form-control" id="nickName" placeholder="새로운 닉네임을 입력해주세요">
          
          
          
        </div>
        
         <div class="social-auth-links text-center mt-2 mb-3">
	    	<div class="col-4">
	        	<button type="submit" class="btn btn-primary btn-block" style="width: 300px; margin-bottom: 10px;" id="nickChenge">수정하기</button>
	        	          
		          	<input type="hidden" name="enable" id="enable" value="0">

	        </div>
     	</div>
      </form>
      <!-- /.social-auth-links -->
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="resources/plugins/jquery/jquery.min.js"></script>
<script>
$(function(){
         $('#nickChenge').click(function() {
            var before = '${loginUser.nickName}';
            var after = $('#nickName').val();
            
            if (after.trim() == before){
               alert('다른 닉네임으로 변경해주세요');
               $('#nickName').val('');
               $('#nickName').focus();
               return false;
            }   
               alert('변경완료, 다시로그인 해주세요')
               return true;
         });
});   
</script>


<!-- Bootstrap 4 -->
<script src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="resources/dist/js/adminlte.min.js"></script>
</body>
</html>
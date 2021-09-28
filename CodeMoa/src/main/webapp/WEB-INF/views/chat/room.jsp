<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Codemoa</title>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet" href="resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="resources/dist/css/adminlte.min.css">

<style>
	html {overflow: hidden; resize: none;}	
	.card-body{height: 270px;}
</style>
</head>
<body>
	<div class="card card-warning direct-chat direct-chat-warning" style="width: 25rem;">
		<div class="card-header">
			<h2 class="card-title">&#128682;&#127939;</h2>
			<div class="card-tools">
			</div>
		</div>
		<!-- /.card-header -->
		<div class="card-body">
			<div class="direct-chat-messages">
				<ul class="contacts-list" id="roomList"></ul>
			</div>
		</div>
		<!-- /.card-body -->
		<div class="card-footer">
				<div class="input-group">
					<input type="text" id="roomName" name="roomName" placeholder="생성할 채팅방 이름을 입력하세요" class="form-control" onkeyup="">
					<span class="input-group-append">
						<button id="createRoom" type="submit" class="btn btn-warning" onclick="createRoom();">생성</button>
					</span>
				</div>
		</div>
		<!-- /.card-footer-->
		
		<input type="hidden" id="maker" value="${ loginUser.id }">
	</div>
	<!--/.direct-chat -->
			
	
<script>
	window.onload = function(){
		// 방 목록 가져오기
		$.ajax({
			url: 'getRoom.ch',
			success: function(data){
				createChattingRoom(data);
			}
		});
	}
	
	function createRoom(){
		
		if($('#roomName').val().trim() == ''){
			Swal.fire('텍스트를 입력해주세요');
		} else {
			Swal.fire({
				title: '비밀번호를 입력하세요',
				showCancelButton: true,
				input: 'password'
			}).then((result) => {
				if (result.isConfirmed) {
					var pwd = result.value;
					
					if(pwd.trim() == ''){
						Swal.fire('비밀번호를 입력하세요');
					} else {
						var msg = {	crTitle : $('#roomName').val(), crMaker : $('#maker').val(), crPwd : pwd };
						
						$.ajax({
							url: 'createRoom.ch',
							data: msg,
							success: function(data){
								createChattingRoom(data);
							}
						});
					}
					$("#roomName").val("");
				}
			});
		}
	}
	
	function createChattingRoom(data){
		if(data != null){
			var tag = "";
			data.forEach(function(data){
				var str = data.crDate.split(",");
				var date = str[1] + "년 " + str[0] + "일";
				
				tag += "<li class='room' style='' value='" + data.crNo + "'>" +
						 "<div>" +
						   "<input class='title' type='hidden' value='" + data.crTitle + "'>" +
						   "<span class='contacts-list-name' style='color: black;'>" +
						      "<span>" + data.crTitle + "</span>" + "<small class='contacts-list-date float-right' style='color: black;'>" + date + "</small>" + 
						   "</span>" +
						   "<span class='contacts-list-msg' style='color:black;'>" + "<span>" + data.crMaker + "</span>" + "</span>" +
						 "</div>" + 
					  "</li>";
			}); 
			$("#roomList").empty().append(tag);
		}
	}
	
	$(document).on('mouseover','.room', function(){
		$('.room').on('mouseover',function(){
			$(this).css({'background':'#FAFAFA', 'cursor':'pointer'});
		}).mouseout(function(){
			$(this).css('background', 'white');
		});
	});
	
	$(document).on('click', '.room' , function(){
		
		var crTitle = $(this).children().find('input').val();
		var crNo = $(this).val();
		
		Swal.fire({
			title: '비밀번호를 입력하세요',
			showCancelButton: true,
			input: 'password'
		}).then((result) => {
			if (result.isConfirmed) {
				var pwd = result.value;
				
				$.ajax({
					url: 'pwdCheck.ch',
					data: { crPwd : pwd, crNo : crNo},
					success: function(data){
						
						if(data == "true"){
							location.href="chat.ch?crNo=" + crNo + "&crTitle=" + crTitle;
						} else {
							Swal.fire('비밀번호 확인해주세요!', '', 'info');
						}
					}
				});
			}
		});
	});

	$(document).ready(function enter(){
		$('#roomName').keypress(function (e) {
			 if (e.which == 13){ // 엔터 키
				createRoom();
     		 }
		});
	});
	

</script>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>
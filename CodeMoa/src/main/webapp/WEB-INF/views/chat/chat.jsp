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
	.card-body{height: 267px; overflow-y: auto;}
	#chat_div{
		overflow-y: auto;
		
	}
</style>
</head>
<body>
	<div class="card card-warning direct-chat direct-chat-warning" style="width: 25rem;" id="m">
		<div class="card-header">
			<h3 class="card-title">&#128231;&#9997;&nbsp${crTitle} 채팅방</h3>
			<div class="card-tools">
				<button type="button" class="btn btn-tool" title="Out" data-widget="chat-pane-toggle" onclick="goRoom();">
					<ion-icon name="log-out-outline" style="color: black;"></ion-icon>
				</button>
			</div>
		</div>
		<!-- /.card-header -->
		<div class="card-body" id="chatDiv">
			<div class="direct-chat-messages" id="messageList"></div>
		</div>
		<!-- /.card-body -->
		<div class="card-footer">
			<div class="input-group">
				<input type="text" id="chatting" name="chatting" placeholder="메세지를 입력하세요" class="form-control">
				<span class="input-group-append">
					<button type="button" class="btn btn-warning" onclick="send();">보내기</button>
				</span>
			</div>
		</div>
		<!-- /.card-footer-->
		
		<input type="hidden" id="crTitle" name="crTitle" value="${ crTitle }">
		<input type="hidden" id="crNo" name="crNo" value="${ crNo }">
		<input type="hidden" id="nickName" name="nickName" value="${ loginUser.nickName }">
		<input type="hidden" id="id" name="id" value="${ loginUser.id }">
		<input type="hidden" id="sessionId" value="">
	</div>
	<!--/.direct-chat -->
	
<script>
	var date = new Date();
	var hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
	var min = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
	var time = hour + ":" + min;

	function goRoom(){
		location.href="goRoom.ch";
	}
	
	var ws;
	
	window.onload = function wsOpen(){
		// 웹소켓 전송시 방 번호를 넘김
		ws = new WebSocket("ws://" + location.host + "/codemoa/chatting/"+$("#crNo").val());
		wsEvt();
		
		deleteBtn();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			// 소켓이 열리면 동작
			$.ajax({
				url: 'getChatting.ch',
				data: { crNo : $('#crNo').val() },
				success: function(data){
					
					if(data != null){
						for( key in data ){
							var time = data[key].cDate.split(" ");
							
							if(data[key].cSender == $('#nickName').val()){
								var tag = "<div class='direct-chat-msg right'>" +
											"<div class='direct-chat-infos clearfix'>" +
												"<span class='direct-chat-name float-right'>" + data[key].cSender + "</span>" +
												"<span class='direct-chat-timestamp float-left'>" + time[1] + "</span>" +
											"</div>" +
										  	"<div class='direct-chat-text'>" + data[key].cChat + "</div>" + 
										  "</div>";
									
								$("#messageList").append(tag);
							} else {
								var tag = "<div class='direct-chat-msg'>" +
											"<div class='direct-chat-infos clearfix'>" +
												"<span class='direct-chat-name float-left'>" + data[key].cSender + "</span>" +
												"<span class='direct-chat-timestamp float-right'>" + time[1] + "</span>" +
											"</div>" +
										  	"<div class='direct-chat-text'>" + data[key].cChat + "</div>" + 
										  "</div>";
										  
								$("#messageList").append(tag);
							}
						}
					}
				}
			});
		}
		
		ws.onmessage = function(data) {
			// 메시지를 받으면 동작
			var msg = data.data;
			console.log(data);
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						var tag = "<div class='direct-chat-msg right'>" +
									"<div class='direct-chat-infos clearfix'>" +
										"<span class='direct-chat-name float-right'>" + $('#nickName').val() + "</span>" +
										"<span class='direct-chat-timestamp float-left'>" + time + "</span>" +
									"</div>" +
								  	"<div class='direct-chat-text'>" + d.msg + "</div>" + 
								  "</div>";
										
						$("#messageList").append(tag);
					}else{
						var tag = "<div class='direct-chat-msg'>" +
									"<div class='direct-chat-infos clearfix'>" +
										"<span class='direct-chat-name float-left'>" + d.nickName + "</span>" +
										"<span class='direct-chat-timestamp float-right'>" + time + "</span>" +
									"</div>" +
								  	"<div class='direct-chat-text'>" + d.msg + "</div>" + 
								  "</div>";
								  
						$("#messageList").append(tag);
					}	
				}else{
					console.warn("unknown type!");
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ // 엔터 키
				send();
			}
		});
	}

	// 메시지 보내기
	function send() {
		
		if($('#chatting').val().trim() == ''){
			$(this).focus();
		} else {
			var msg = filter($("#chatting").val());
			
			var option ={
				type: "message",
				crNo: $('#crNo').val(),
				sessionId : $("#sessionId").val(),
				id : $("#id").val(),
				msg : msg
			}
			
			ws.send(JSON.stringify(option));
			$('#chatting').val("");
			
		}
		
	}
	
	// 채팅방 삭제 버튼
	function deleteBtn(){
		$.ajax({
			url: 'makerCheck.ch',
			data: { id : $('#id').val() },
			success: function(data){
				
				if(data == "true"){
					var tag = "<button type='button' class='btn btn-tool' title='Delete' data-widget='chat-pane-toggle' onclick='deleteRoom();'>" +
								"<ion-icon name='trash-outline' style='color: black;'></ion-icon>" + 
							  "</button>";
					
					$('.card-tools').prepend(tag);
				}
			}
		});
	}

	// 채팅방 삭제
	function deleteRoom(){

		Swal.fire({
			title: '정말 삭제하시겠습니까?',
			text: "다시 되돌릴 수 없습니다",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33'
		}).then((result) => {
			if (result.isConfirmed) {
				
				$.ajax({
	 				url: 'deleteRoom.ch',
	 				data: { crNo : $('#crNo').val() },
	 				success: function(data){
						
	 					if(data == "true"){
	 						goRoom();
	 						
	 					} else {
	 						window.close();
	 					}
	 				}
	 			});
			}
		});
		
	}
	
	// 비속어 처리
	function filter(str){
		
		var words = ["시발", "병신", "지랄", "버러지", "씹새", "씨발", "존나", "개새끼",
					 "미친놈"];
		
		for (var n = 0; n < words.length; n++) {
			var words2 = str.replace(/[^a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/gi,"");
				
			if (words2.indexOf(words[n]) != -1) {
				str = "*" + words[n].substr(1);
				break;
			}
		}
		return str;
	}
	
</script>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>
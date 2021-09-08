<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>

<style>

	    video {
        width: 400px;
        height: 230px;
        background: black;
      }
      .section {
        margin: 15px;
      }
    
</style>

</head>
<body>

	<div class="section">
      <video id="video-output"></video>
      <br>
      <button id="start-btn">녹화 시작</button>
      <button id="finish-btn">녹화 종료</button>
    </div>
    
    <div class="section">
      <video id="recorded-video" controls=""></video>
      <br>
      <button id="download-btn">다운로드</button>
    </div>
    
    <script>
      const videoOutput = document.getElementById('video-output');
      const startBtn = document.getElementById('start-btn');
      const downloadBtn = document.getElementById('download-btn');
      const finishBtn = document.getElementById('finish-btn');
      const recordedVideo = document.getElementById('recorded-video');

      let mediaStream = null;
      let mediaRecorder = null;
      let recordedMediaURL = null;

      // 유저의 카메라로 부터 입력을 사용할 수 있도록 요청
      navigator.mediaDevices
        .getUserMedia({ video: true })
        .then(function (newMediaStream) {
          mediaStream = newMediaStream;

          // 카메라의 입력을 실시간으로 비디오 태그에서 확인
          videoOutput.srcObject = mediaStream;
          videoOutput.onloadedmetadata = function (e) {
            videoOutput.play();
          };
        });

      // 녹화 시작 버튼 클릭 시 빌생하는 이벤트 핸들러 등록
      startBtn.addEventListener('click', function () {
        let recordedChunks = [];
        // 1.MediaStream을 매개변수로 MediaRecorder 생성자를 호출
        mediaRecorder = new MediaRecorder(mediaStream, {
          mimeType: 'video/webm;',
        });

        // 2. 전달받는 데이터를 처리하는 이벤트 핸들러 등록
        mediaRecorder.ondataavailable = function (event) {
          if (event.data && event.data.size > 0) {
            console.log('ondataavailable');
            recordedChunks.push(event.data);
          }
        };

        // 3. 녹화 중지 이벤트 핸들러 등록
        mediaRecorder.onstop = function () {
          // createObjectURL로 생성한 url을 사용하지 않으면 revokeObjectURL 함수로 지워줌
          // 안하면 메모리 누수.
          if (recordedMediaURL) {
            URL.revokeObjectURL(recordedMediaURL);
          }

          const blob = new Blob(recordedChunks, { type: 'video/webm;' });
          recordedMediaURL = URL.createObjectURL(blob);
          recordedVideo.src = recordedMediaURL;
        };

        mediaRecorder.start();
      });

      // 녹화 종료 버튼 클릭 시 빌생하는 이벤트 핸들러 등록
      finishBtn.addEventListener('click', function () {
        if (mediaRecorder) {
          // 5. 녹화 중지
          mediaRecorder.stop();
        }
      });

      // 다운로드 버튼 클릭 시 발생하는 이벤트 핸들러 등록
      downloadBtn.addEventListener('click', function () {
        console.log('recordedMediaURL : ', recordedMediaURL);
        if (recordedMediaURL) {
          const link = document.createElement('a');
          document.body.appendChild(link);
          link.href = recordedMediaURL;
          link.download = 'video.webm';
          link.click();
          document.body.removeChild(link);
        }
      });
    </script>
</body>
</html>
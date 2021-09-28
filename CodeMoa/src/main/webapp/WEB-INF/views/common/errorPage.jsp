<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="text-align: center;">
		<div class="row">
			<div class="col-12">
				<img src="resources\img\errorPage_img.png"  style="width:100%; display: block; margin: 0px auto; ">
					<div class="row">
						<div class="col-12" style="margin-top:-130px;">
							<h4 align="center" style="color:#2E75C7; font-weight: bold; ">${ requestScope['javax.servlet.error.message'] }</h4>
							<div align="center" style="margin-top:20px; margin-left:10px;">
								<button class="button1" style="margin-left:-5px;" onclick="history.back();">이전 페이지</button>
								<button class="button1" style="margin-left:10px;" onclick="location.href='<%=request.getContextPath()%>'">홈으로 가기</button>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</body>
</html>
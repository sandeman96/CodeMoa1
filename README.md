# CodeMoa1
👨‍💻👨‍💻👨‍💻👨‍💻👨‍💻👨‍💻

main 폴더도 한번에 올리기는 했는데, 게시판 관련된 코드들에 검색 기능 부분 작성하면서 수정된 부분들이 있습니다. 


--------------------------------------------------------------------
Job페이지(크롤링)

1. dto 폴더 --> src/main/java/com.study.codemoa 에 위치

2. BoardController --> 260행의 

/*board community_Job 이동*/
  
  부터 466행의 } 까지 추가
  
3. views/board 에 community_job.jsp 추가
4. menu.jsp 에 job 부분 href에 job.bo 
5. pom.xml에 
<!-- 크롤링__https://mvnrepository.com/artifact/org.jsoup/jsoup -->
	<dependency>
		<groupId>org.jsoup</groupId>
		<artifactId>jsoup</artifactId>
		<version>1.13.1</version>
	</dependency>
  추가

실행 시 community_Job 페이지 우측 상단의
![잡마법사](./images/jobWizard.png) 클릭 하시면 됩니다.

--------------------------------------------------------------------
메인페이지(인덱스)

1. BoardController 552행 @RequestMapping("main.do")부분 추가
2. BoardServiceImpl 105행 부터 113행까지 추가
3. BoardService에 List<BoardDTO> getBoardCountList(); List<BoardDTO> getBoardLikeList(); 추가
4. BoardDAO 78 ~ 84 추가
5. index.jsp,home.jsp 업데이트. index.jsp를 views 폴더 안에 위치시켜주세요! (home.jsp와 동일한 위치) 
6. index2.jsp  views에 추가
7. resources dist img 에 images폴더에 있는 gatherTown.png , khad.jpg, sufit.jpg 추가

--------------------------------------------------------------------






-- saveVideo.jsp --

어쩌다 소스를 찾아서 만들게된 생각보다 간단한 비디오 저장 방법..!!
혹시나 활용할 방법이 생각나시면 알려주세요!
제 HomeController 파일에 코드 있으니 이용해서 한번 써보세요!


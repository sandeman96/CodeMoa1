# CodeMoa1
👨‍💻👨‍💻👨‍💻👨‍💻👨‍💻👨‍💻

main 폴더도 한번에 올리기는 했는데, 게시판 관련된 코드들에 검색 기능 부분 작성하면서 임의로 수정된 부분들이 있습니다.
왠만하면 밑에 표시되어있는 부분들만 수정하시는게 좋습니다!


--------------------------------------------------------------------
<<Job페이지(크롤링)>>

전에 추가하셨던 분들은 
DTO폴더의 CodeMoaDTO와 views/board의 community_Job.jsp를 새로 덮어쓰기 해주시고, 
BoardController 260행부터 435행까지(job.bo, crawling.bo, crawling2.bo, crawling3.bo) 덮어쓰기 해주시고 메인페이지 부분 해주시면 됩니다!
--------------------------------------------------------------------------------------------------------------

--- 처음 추가하신다면 ---
1. dto 폴더 --> src/main/java/com.study.codemoa 에 위치

2. BoardController --> 260행의 

/*board community_Job 이동*/
  
  부터 435행의 } 까지 추가
  
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
  
6. mybatis-config.xml에
typeAlias type="com.study.codemoa.dto.BoardDTO" alias="boardDTO" 

실행 시 community_Job 페이지 우측 상단의
![잡마법사](./images/jobWizard.png) 클릭 하시면 됩니다.

--------------------------------------------------------------------
<<메인페이지(인덱스)>>

1. BoardController 최하단의  @RequestMapping("main.do")부분 추가
2. BoardServiceImpl 105행 부터 113행까지 추가
3. BoardService에 List<BoardDTO> getBoardCountList(); List<BoardDTO> getBoardLikeList(); 추가
4. BoardDAO 78 ~ 84 추가
5. index.jsp,home.jsp 업데이트. index.jsp를 views 폴더 안에 위치시켜주세요! (home.jsp와 동일한 위치) 
6. web.xml에 404에러페이지 /main.do 등록
	web.xml 112 ~ 115행
	
7. images폴더에 있는 gatherTown.png , khad.jpg, sufit.jpg . resources dist img 에 추가
8. board-mapper.xml 135 ~ 164 추가 

--------------------------------------------------------------------



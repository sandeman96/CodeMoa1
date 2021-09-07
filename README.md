# CodeMoa1
👨‍💻👨‍💻👨‍💻👨‍💻👨‍💻👨‍💻

너무 늦게 올렸습니다.. 죄송합니다ㅜ
올린거 외에도 아직 조금식 더 수정이 필요하나 자리는 잡아야할꺼 같아서 늦었지만 지금이라도 올립니다 ㅠ..

만드신부분에 조금식 수정이 들어가서 덮어씌워지시면 안될까봐 집어넣어야 하는 부분에 대해 작성해보았습니다.
아래는 적용 방법입니다.

---------------------------------------------
우선적으로 테이블입니다 테이블이 수정이 들어감에 따라 같이 올립니다 파일로도 올렸으나 혹시나 해서 글로도 남깁니다.

P_BPAGE 는 board 글 확인에 필요하며, P_MNICK은 FOREIGN KEY 가 M_ID로 들어감에 따라 닉네임 확인 용으로 들어갔으며,
P_BTYPE은 신고 insert이후 redirect를 제가 제대로 처리하지 못하여.. 신고후 다시금 boardList.bo 로 돌아가기 위해 집어넣었습니다.


DROP TABLE REPORT CASCADE CONSTRAINTS;

CREATE TABLE REPORT (
   P_NO   NUMBER(10)      NOT NULL,
   P_TYPE   NUMBER(10)      NOT NULL,
   P_TITLE   VARCHAR2(100)      NOT NULL,
   P_CONTENT   VARCHAR2(4000)      NOT NULL,
   P_DATE   DATE   DEFAULT SYSDATE   NOT NULL,
   P_STATUS   VARCHAR2(100)   DEFAULT 'Y'   NOT NULL,
   P_BNO   NUMBER(10)      NOT NULL,
   P_RECEIVER   VARCHAR2(100)      NOT NULL,
   P_REPORTER   VARCHAR2(100)      NOT NULL,
   P_BPAGE VARCHAR2(20) 	NOT NULL,
   P_MNICK VARCHAR2(100) NUT NULL,
   P_BTYPE VARCHAR2(10) NOT NULL
);

ALTER TABLE REPORT ADD CONSTRAINT PK_REPORT PRIMARY KEY (
   P_NO
);

ALTER TABLE REPORT ADD CONSTRAINT REPORT_MEMBER_ID
FOREIGN KEY (P_RECEIVER)
REFERENCES MEMBER (M_ID);

ALTER TABLE REPORT ADD CONSTRAINT REPORT_MEMBER_ID2
FOREIGN KEY (P_REPORTER)
REFERENCES MEMBER (M_ID);

ALTER TABLE REPORT ADD CONSTRAINT REPORT_BOARD_ID
FOREIGN KEY (P_BNO)
REFERENCES BOARD (B_NO);

CREATE SEQUENCE SEQ_RNO
    START WITH 1
    INCREMENT BY 1;

---------------------------------------------
mybatis-config.xml 부분입니다. 각각의 부분에 넣어주시면 됩니다

<typeAliases>
		<typeAlias type="com.study.codemoa.admin.model.vo.Report" alias="Report" />
</typeAliases>


<mappers>
		<mapper resource="mapper/admin-mapper.xml"/>
</mappers>

---------------------------------------------

web.xml 부분입니다 편하신 곳에다 추가해주시면 되겠습니다..

<!-- admin페이지 관련 -->
	<servlet>
		<servlet-name>adminServlet</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>
			/WEB-INF/spring/appServlet/admin-context.xml
			</param-value>
		</init-param>
	</servlet>
	<servlet-mapping>
		<servlet-name>adminServlet</servlet-name>
		<url-pattern>*.ad</url-pattern>
	</servlet-mapping>

---------------------------------------------

<Board> 부분 :
  boardDetail.jsp
  돌아가기 버튼 위에 들어가는 신고하기 버튼입니다.
  
     <c:choose>
             <c:when test="${  b.bFirst =='Y' }">
                <button type="button" class="btn btn-warning" data-toggle="modal" 
							data-target="#reportModal" 
							style="font-size: 0.8rem; color: #939597; width: 7rem; visibility: hidden;" >
								신고하기
							</button>
                        </c:when>
        				<c:when test="${ loginUser != null and b.bFirst =='N' }">
        		        	<button type="button" class="btn btn-warning" data-toggle="modal" 
							data-target="#reportModal" 
							style="font-size: 0.8rem; color: #939597; width: 7rem;">
								신고하기
							</button>
							<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">해당 글을 신고 하시겠습니까?</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-footer">
						      	<form action="adminInsertReport.ad" method="get">
						      	<input type="hidden" name="bType" id="bType" value="${ b.bType }">
						      	<input type="hidden" name="bNo" id="bNo" value="${ b.bNo }">
						      	<input type="hidden" name="bWriter" id="bWriter" value="${ b.bWriter }">
						      	<input type="hidden" name="bTitle" id="bTitle" value="${ b.bTitle }">
						      	<input type="hidden" name="nickName" id="nickName" value="${ b.nickName }">
						      	<input type="hidden" name="bContent" id="bContent" value="${ b.bContent }">
						      	<input type="hidden" name="bDate" id="bDate" value="${ b.bDate }">
						      	<input type="hidden" name="page" id="page" value="${ page }">
						      	<input type="submit" class="btn btn-primary" value="신고하러가기" onclick="location.href='adminInsertReport.ad?bNo=${b.bNo}'">
						      	</form> 
						      	
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						      </div>
						    </div>
						  </div>
						</div>
        				</c:when>
        				<c:otherwise>
        					<button type="button" class="btn btn-warning" data-toggle="modal"
        					 data-target="#needLogin" style="font-size: 0.8rem; color: #939597; width: 7rem;">
							  신고하기
							</button>
        				<div class="modal fade" id="needLogin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">로그인 후 이용해주세요</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>		
						      <div class="modal-footer">					   
						      	<button type="button" class="btn btn-primary 2" onclick="location.href='loginForm.me'">
						      	로그인 하러가기
						      	</button>
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
						      </div>
						    </div>
						  </div>
						</div>
        				</c:otherwise>
        				</c:choose>
  
 ----------------------------------------------------------------
  
    boardList.jsp
    글쓰기 버튼에 넣어주시면 됩니다
  
      <div class="col-sm-2 btn float-sm-right">
						<c:if test="${ !empty loginUser }">
							<button type="button" class="btn btn-warning" onclick="location.href='insertBoardForm.bo'" style="font-size: 0.8rem; color: #939597; width: 7rem;">글 쓰기</button>
						</c:if>
						<c:if test="${ loginUser != null and loginUser.admin =='Y' }">
							<button type="button" class="btn btn-warning" onclick="location.href='insertFirstBoardForm.bo'" style="font-size: 0.8rem; color: #939597; width: 7rem;">공지글 쓰기</button>					
						</c:if>			
					</div>
 
  ----------------------------------------------------------------
  
    insertBoardForm.jsp
      form 태그 안에 넣어주시면 됩니다, 여기 부분부터 끝나는 부분까지 입니다. >> <form action="insertBoard.bo"  method="post">  
          
    <input type="hidden" name="bFirst" id="bFirst" value="N">
  
  -------------------------------------------------------------
 
  board 부분에 추가 되는 것들입니다.
  
  view/ board 에 넣어주시면 됩니다. >> insertFirstBoardForm.jsp
  
  ------------------------------------------------------------
  
  board-mapper.xml 에 insert 구문을 수정하였습니다.
  
  <insert id="insertBoard">
		insert into board values (seq_bno.nextval, #{bType}, #{bTitle}, #{bContent},
		sysdate, default, default, #{bFirst}, #{bWriter}, #{bTags})
	</insert>
  
  -----------------------------------------------------
  
  이 외 나머지는 전부 admin 폴더로 들어갑니다
  
  

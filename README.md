# CodeMoa1
👨‍💻👨‍💻👨‍💻👨‍💻👨‍💻👨‍💻

<h3>이메일 인증</h3>
 - pom.xml
  <!-- https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-mail -->
  
		<dependency>
		    <groupId>org.springframework.boot</groupId>
		    <artifactId>spring-boot-starter-mail</artifactId>
		    <version>2.2.6.RELEASE</version>
		</dependency>
    
 - web.xml
  /WEB-INF/spring/mail-context.xml 추가
 
 - MemberController 
   @RequestMapping("sendemail.me") 부분 추가
   
 - .jsp 



쪽지sql

			DROP TABLE MESSAGE CASCADE CONSTRAINTS;

			CREATE TABLE MESSAGE (
			    MG_NO   NUMBER    NOT NULL,
			    MG_CONTENT   VARCHAR2(2000)      NOT NULL,
			    MG_RECEIVER   VARCHAR2(100)      NOT NULL,
			    MG_SENDER   VARCHAR2(100)      NOT NULL,
			    MG_DATE   DATE   DEFAULT SYSDATE   NOT NULL,
			    MG_RSTATUS   VARCHAR2(10)   DEFAULT 'Y'   NOT NULL,
			    MG_SSTATUS   VARCHAR2(10)   DEFAULT 'Y'   NOT NULL,
			    MG_OPEN   VARCHAR2(100)   DEFAULT 'Y'   NOT NULL
			);

			ALTER TABLE MESSAGE ADD CONSTRAINT PK_MESSAGE PRIMARY KEY (
			   MG_NO
			);

			ALTER TABLE MESSAGE ADD CONSTRAINT MESSAGE_MEMBER_ID
			FOREIGN KEY (MG_RECEIVER)
			REFERENCES MEMBER (M_ID);

			ALTER TABLE MESSAGE ADD CONSTRAINT MESSAGE_MEMBER_ID2
			FOREIGN KEY (MG_SENDER)
			REFERENCES MEMBER (M_ID);
   
   
   ** 쪽지 최종
   mybatis-config.xml 
   
   		<typeAlias type="com.study.codemoa.message.model.vo.Message" alias="Message" />
		<mapper resource="mapper/message-mapper.xml" />
		
		
loginForm
상단 테두리색 노란색으로 변경

코드모아 이메일 생성 및 mail-context.xml 변경



<h2>합친것</h2>
![image](https://user-images.githubusercontent.com/84279882/132993612-c2a89c67-fb17-449e-a6eb-4c77afbb00da.png)
코드 변경해서 사이드바 넘기는거 안쓰도록 했습니다. 

adminpage에서 검색 안쓰는거 같아서 검색창 지웠고 태그들 중복되는거 살짝 정리했습니다.
adminSidebar 이미지 안뜨도록 했고 사용자 메뉴 추가해서 따로 변경 안해도 되도록 했습니다. 

오라클에서 추가해주세요!

			CREATE TABLE REPORT ( 
			    P_NO NUMBER NOT NULL, 
			    P_TYPE NUMBER NOT NULL, 
			    P_TITLE VARCHAR2(100) NOT NULL, 
			    P_CONTENT VARCHAR2(4000) NOT NULL, 
			    P_DATE DATE DEFAULT SYSDATE NOT NULL, 
			    P_STATUS VARCHAR2(100) DEFAULT 'Y' NOT NULL, 
			    P_BNO NUMBER NOT NULL, 
			    P_RECEIVER VARCHAR2(100) NOT NULL, 
			    P_REPORTER VARCHAR2(100) NOT NULL, 
			    P_BPAGE VARCHAR2(20) NOT NULL, 
			    P_MNICK VARCHAR2(100) NOT NULL, 
			    P_BTYPE VARCHAR2(10) NOT NULL 
			);

			ALTER TABLE REPORT ADD CONSTRAINT PK_REPORT PRIMARY KEY ( P_NO );

			ALTER TABLE REPORT ADD CONSTRAINT REPORT_MEMBER_ID FOREIGN KEY (P_RECEIVER) REFERENCES MEMBER (M_ID);

			ALTER TABLE REPORT ADD CONSTRAINT REPORT_MEMBER_ID2 FOREIGN KEY (P_REPORTER) REFERENCES MEMBER (M_ID);

			ALTER TABLE REPORT ADD CONSTRAINT REPORT_BOARD_ID FOREIGN KEY (P_BNO) REFERENCES BOARD (B_NO);
			
			
			
			
			
			+ member부분에 m_enable하나만 추가해주시면 됩니다.



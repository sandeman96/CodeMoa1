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

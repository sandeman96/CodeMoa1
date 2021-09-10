DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE LIKEY CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE MESSAGE CASCADE CONSTRAINTS;
DROP TABLE REPORT CASCADE CONSTRAINTS;
DROP TABLE CROOM CASCADE CONSTRAINTS;
DROP TABLE CHAT CASCADE CONSTRAINTS;
DROP TABLE IMAGE CASCADE CONSTRAINTS;
DROP TABLE R_IMAGE CASCADE CONSTRAINTS;
DROP TABLE HASHTAG CASCADE CONSTRAINTS;

-----------------------------------------------------------

CREATE TABLE MEMBER (
    M_ID   VARCHAR2(100)      NOT NULL,
    M_EMAIL   VARCHAR2(100)      NOT NULL,
    M_PWD   VARCHAR2(100)      NOT NULL,
    M_NICK   VARCHAR2(100)      NOT NULL,
    M_STATUS   VARCHAR2(1)   DEFAULT 'Y'   NOT NULL,
    M_ADMIN   VARCHAR2(1)   DEFAULT 'N'   NOT NULL,
    M_EDU	VARCHAR2(1000)		NULL,
    M_LOCATION	VARCHAR2(1000)	NULL,
	M_SKILL	VARCHAR2(1000)		NULL,
	M_NOTE	VARCHAR2(1000)		NULL
);

ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
   M_ID
);

INSERT INTO MEMBER
VALUES('codemoa', 'codeMoa111@mail.com', '$2a$10$UW3aeZWxx9IW3PYOkboaPO0GhbF3fHxyLe0j6hArQ6YVTlbuqnNES', '코모',  DEFAULT, DEFAULT, NULL, NULL, NULL, NULL);

-----------------------------------------------------------

CREATE TABLE BOARD (
   B_NO   NUMBER     NOT NULL,
   B_TYPE   NUMBER      NOT NULL,
   B_TITLE   VARCHAR2(500)      NOT NULL,
   B_CONTENT   VARCHAR2(4000)      NOT NULL,
   B_DATE   DATE   DEFAULT SYSDATE   NOT NULL,
   B_COUNT   NUMBER   DEFAULT 0   NULL,
   B_STATUS   VARCHAR2(5)   DEFAULT 'Y'   NOT NULL,
   B_FIRST   VARCHAR2(1000) DEFAULT 'N'  NOT NULL,
   B_WRITER   VARCHAR2(100)      NOT NULL,
   B_TAGS VARCHAR2(2000) NULL
);

ALTER TABLE BOARD ADD CONSTRAINT PK_BOARD PRIMARY KEY (
   B_NO
);

ALTER TABLE BOARD ADD CONSTRAINT BOARD_MEMBER_ID
FOREIGN KEY (B_WRITER)
REFERENCES MEMBER (M_ID);


-----------------------------------------------------------

CREATE TABLE REPLY (
   R_NO   NUMBER    NOT NULL,
   R_DATE   DATE   DEFAULT SYSDATE   NOT NULL,
   R_CONTENT   VARCHAR2(2000)      NOT NULL,
   R_STATUS   VARCHAR2(1)   DEFAULT 'Y'   NOT NULL,
   R_WRITER   VARCHAR2(100)      NOT NULL,
   R_BNO   NUMBER    NOT NULL
);

ALTER TABLE REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY (
   R_NO
);

ALTER TABLE REPLY ADD CONSTRAINT REPLY_MEMBER_ID
FOREIGN KEY (R_WRITER)
REFERENCES MEMBER (M_ID);

ALTER TABLE REPLY ADD CONSTRAINT REPLY_BOARD_ID
FOREIGN KEY (R_BNO)
REFERENCES BOARD (B_NO);

-----------------------------------------------------------

CREATE TABLE IMAGE (
   I_NO   NUMBER      NOT NULL,
   I_ORIGIN   VARCHAR2(500)      NOT NULL,
   I_CHANGE   VARCHAR2(1000)      NOT NULL,
   I_PATH   VARCHAR2(1000)      NOT NULL,
   I_DATE   DATE      NULL,
   I_LEVEL   NUMBER     NULL,
   I_STATUS   VARCHAR2(1)   DEFAULT 'Y'   NOT NULL
);

ALTER TABLE IMAGE ADD CONSTRAINT PK_IMAGE PRIMARY KEY (
   I_NO
);

-----------------------------------------------------------

CREATE TABLE LIKEY (
   L_NO   NUMBER      NOT NULL,
   L_ID   VARCHAR2(100)      NOT NULL,
   L_BNO   NUMBER     NOT NULL
);

ALTER TABLE LIKEY ADD CONSTRAINT PK_LIKEY PRIMARY KEY (
   L_NO
);

ALTER TABLE LIKEY ADD CONSTRAINT LIKEY_MEMBER_ID
FOREIGN KEY (L_ID)
REFERENCES MEMBER (M_ID);

ALTER TABLE LIKEY ADD CONSTRAINT LIKEY_BOARD_ID
FOREIGN KEY (L_BNO)
REFERENCES BOARD (B_NO);


-----------------------------------------------------------

CREATE TABLE R_IMAGE (
   RI_NO   NUMBER    NOT NULL,
   RI_ORIGIN   VARCHAR2(500)      NOT NULL,
   RI_CHANGE   VARCHAR2(1000)      NOT NULL,
   RI_PATH   VARCHAR2(1000)      NOT NULL,
   RI_DATE   DATE      NULL,
   I_STATUS   VARCHAR2(1)   DEFAULT 'Y'   NOT NULL
);

ALTER TABLE R_IMAGE ADD CONSTRAINT PK_R_IMAGE PRIMARY KEY (
   RI_NO
);


-----------------------------------------------------------

CREATE TABLE HASHTAG (
   H_NO   NUMBER      NOT NULL,
   H_TAG   VARCHAR2(1000)  NOT NULL,
   H_BNO NUMBER NOT NULL,
    H_STATUS VARCHAR2(10) DEFAULT 'Y' NOT NULL
);

ALTER TABLE HASHTAG ADD CONSTRAINT PK_HASHTAG PRIMARY KEY (
   H_NO
);

ALTER TABLE HASHTAG ADD CONSTRAINT HASHTAG_BOARD_ID
FOREIGN KEY (H_BNO)
REFERENCES BOARD (B_NO);

-----------------------------------------------------------

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

-----------------------------------------------------------

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

-----------------------------------------------------------

CREATE TABLE CROOM (
   CR_NO   NUMBER      NOT NULL,
   CR_TITLE   VARCHAR2(100)      NOT NULL,
   CR_DATE   DATE   DEFAULT SYSDATE   NOT NULL,
   CR_SECRET   VARCHAR2(100)   DEFAULT 'Y'   NOT NULL,
   CR_PWD   VARCHAR2(100)      NOT NULL,
   CR_MAKER   VARCHAR2(100)      NOT NULL
);

ALTER TABLE CROOM ADD CONSTRAINT PK_CROOM PRIMARY KEY (
   CR_NO
);

ALTER TABLE CROOM ADD CONSTRAINT CROOM_MEMBER_ID
FOREIGN KEY (CR_MAKER)
REFERENCES MEMBER (M_ID);

-----------------------------------------------------------

CREATE TABLE CHAT (
   C_NO   NUMBER      NOT NULL,
   C_DATE   VARCHAR2(100)      NOT NULL,
   C_CHAT   VARCHAR2(2000)      NULL,
   C_ROOM   NUMBER   NOT NULL,
   C_SENDER   VARCHAR2(100)      NOT NULL
);

ALTER TABLE CHAT ADD CONSTRAINT PK_CHAT PRIMARY KEY (
   C_NO
);

ALTER TABLE CHAT ADD CONSTRAINT CHAT_CROOM_ID
FOREIGN KEY (C_ROOM)
REFERENCES CROOM (CR_NO);

ALTER TABLE CHAT ADD CONSTRAINT CHAT_MEMBER_ID
FOREIGN KEY (C_SENDER)
REFERENCES MEMBER (M_ID);

-----------------------------------------------------------

DROP SEQUENCE SEQ_MGNO;
DROP SEQUENCE SEQ_LNO;
DROP SEQUENCE SEQ_RNO;
DROP SEQUENCE SEQ_PNO;
DROP SEQUENCE SEQ_BNO;
DROP SEQUENCE SEQ_CNO;
DROP SEQUENCE SEQ_CRNO;

CREATE SEQUENCE SEQ_MGNO
    START WITH 1
    INCREMENT BY 1;
    
CREATE SEQUENCE SEQ_LNO
    START WITH 1
    INCREMENT BY 1;
    
CREATE SEQUENCE SEQ_RNO
    START WITH 1
    INCREMENT BY 1;
    
CREATE SEQUENCE SEQ_PNO
    START WITH 1
    INCREMENT BY 1;

CREATE SEQUENCE SEQ_BNO
    START WITH 1
    INCREMENT BY 1;

CREATE SEQUENCE SEQ_CNO
    START WITH 1
    INCREMENT BY 1;
    
CREATE SEQUENCE SEQ_CRNO
    START WITH 1
    INCREMENT BY 1;
# CodeMoa1
👨‍💻👨‍💻👨‍💻👨‍💻👨‍💻👨‍💻

-수정사항-
2021.08.24 : MemberController.java, member-mapper.xml, loginForm.jsp, registerForm.jsp, MemberService.java, MemberServiceImpl.java

2021.09.10 : 채팅 추가 
              1. vo : Message 삭제, Chat, ChatRoom 수정
              2. chat-mapper.xml 추가 -> mybatis-config.xml에 typeAlias, mappers 추가
              3. view : chat 폴더(chat.jsp, room.jsp) 추가 / menu.jsp 채팅부분(100 ~ 127 라인) 추가
              4. web.xml에서 <servlet-mapping>
                              <servlet-name>appServlet</servlet-name>
                              <url-pattern>/</url-pattern>     <---- " / " 으로 변경
                            </servlet-mapping>
              로그인
              1. MemberController : login 수정
              2. view : loginForm.jsp 수정
  
  
              DB 적용
              alter table croom drop column cr_detail;
              alter table croom modify cr_no number;
              alter table chat modify c_room number;
              SYSTEM 로그인 => GRANT CREATE VIEW TO Codemoa;
              create or replace view v_chat
              as
              select c_no, c_date, c_chat, m_nick as c_sender, c_room
              from chat
                   left join member on (c_sender = m_id);
          

# CodeMoa1
👨‍💻👨‍💻👨‍💻👨‍💻👨‍💻👨‍💻

21/09/11
현재 깃에 올라와있는 모든 파일을 합쳐서 올렸습니다
안되는게 몇가지 있습니다..제가 몇가지 빼먹은거 같은데 
message.ms로 이동시 message 화면이 아닌 home.do 화면이 나옵니다, url은 message.ms에 걸려있는데 이상하게 home 화면이 나옵니다.
채팅 적용을 하고 메인홈페이지 이동시 sevelt-context에서 / 로 넘어가면 아예 화면이 나오지 않습니다, 부득이하게 (*.do)로 넘겼습니다
몇가지 더 있긴한데 회의하면서 맞춰봐야 할꺼같습니다..(home.do에서 TopN이 b_status ='N' 값을 가지고 온다던지 하는 문제들입니다)

수정이 완료되는데로 다시금 업데이트 하겠습니다.  

다음은 제가 작성한 admin페이지 관련입니다.
해경님이 작성한 admin 정보는 해경님이 보내주신걸로 올려 드리겠습니다.
번거롭더라도 한번씩만 확인해주세요..

member: 
MemberController : login.me(수정) nickUpdate.me(추가)
  
MemberService~DAO : nickUpdate.me(추가)

member-mapper: updateNick(쿼리문 추가), insertMember(쿼리문 수정)

Member(vo) : String enable(추가)

MEMBER(SQL) : ALTER TABLE MEMBER ADD M_ENABLE VARCHAR(5) DEFAULT '0' NOT NULL;

view : loginError.jsp(추가)
  
----------------------------------------------
  Controller >> login.me
  
  @RequestMapping(value = "login.me", method = RequestMethod.POST)
	public String login(@ModelAttribute Member m, Model model) {

		Member loginUser = mService.login(m);
		
		if (bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			
			if (loginUser.getAdmin().equals("Y")) {
	            return "redirect:adminPage.ad";
			}	
				
			if(loginUser.getEnable().equals("0")) {
				return "redirect:/";
			}
	        if(loginUser.getEnable().equals("1")) {
	        	model.addAttribute("msg", "부적절한 닉네임으로 신고 되었습니다, 닉네임을 바꿔주세요");
	            return "/loginError";
	        }
	        } else {
				model.addAttribute("msg", "failed");
				return "loginForm";
			}
		return "redirect:/";
	}
  
  service와 DAO에는 넘어가는 값이 없습니다
  
  -------------------------------
  Controller >> nickUpdate.me
  
  @RequestMapping("nickUpdate.me")
	public String updateNick(@ModelAttribute Member m){
		System.out.println(m);
		
		m.setEnable("0");
		
		int result = mService.updateNick(m);
		System.out.println(result);
		
		 if (result > 0) {
			 
			 return "redirect:logout.me";
		}else {
			throw new MemberException("닉네임 변경 실패");
		}
			
	}
  
  
  넘어가는 값이 있습니다
  
  int updateNick(Member m);
  
  @Override
	public int updateNick(Member m) {
		return mDao.updateNick(sqlSession, m);
	}
  
  public int updateNick(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateNick", m);
	}
  
---------------------------------------------
member-mapper.xml 쿼리문입니다
  
  <!-- 마지막에 default는 enable값 -->
  <insert id="insertMember">
		insert into member
		values(#{id}, #{email}, #{pwd}, #{nickName}, default, default, null, null, null, null, default)
	</insert>
  
  <!-- enable 겸 nick -->
	<update id="updateNick">
		update member
		set m_nick=#{nickName}, m_enable=#{enable}
		where m_id=#{id}
	</update>
  
---------------------------------------------
board:
BoardController : deleteBoard.bo(수정) insertFirstBoardForm.bo(추가)
  
BoardService~DAO : 

board-mapper: insertBoard(쿼리문 변경)

Board(vo) : 

BOARD(SQL) : 

view : insertFirstBoardForm.jsp(추가), insertBoardForm.jsp(변경)
  
---------------------------------------------
Controller >> deleteBoard.bo
해경님이랑 저랑 건든 부분이 하필 같아서 일단 합쳐는 보았습니다,
해경님 원버전도 같이 아래에 작성하겠습니다.
여기서 Integer delNo는 관리자 페이지에서 신고된 board글을 detail에서 삭제시 return을 admminReportBoard.ad로 넘어오게 해주는 값 입니다
아래는 합쳐본 코드입니다.
  
  /* board delete */
	@RequestMapping("deleteBoard.bo")
	public String deleteBoard(@RequestParam("bNo") int bNo, 
							  @RequestParam("bType") int bType,
							  @RequestParam(value="delNo", required=false) Integer delNo, int page,
			          HttpServletRequest request, String side) {

		int result = bService.deleteBoard(bNo);
  
    if(side.equals("Y")) {
			return "redirect:boardDetail.bo?bNo=" + bNo + "&page=" + page + "&side=" + side;
		}

		String path = "";
		if (result > 0) {
			switch (bType) {
			case 1:
				if(delNo != null) {
					path = "redirect:adminReportBoard.ad";
				} else {
					
					path = "redirect:boardListFaq.bo";
				}
				break;
				
			case 2:
				if(delNo != null) {
					path = "redirect:adminReportBoard.ad";
				} else {
				path = "redirect:boardListTips.bo";
				}
				break;
				
			case 3:
				if(delNo != null) {
					path = "redirect:adminReportBoard.ad";
				} else {
				path = "redirect:boardListStudy.bo";
				}
				break;
			}
		} else {
			throw new BoardException("게시물 삭제에 실패했습니다.");
		}

		return path;
	}
  
------------------------해경님---------------------------
  /* board delete */
	@RequestMapping("deleteBoard.bo")
	public String deleteBoard(@RequestParam("bNo") int bNo, @RequestParam("bType") int bType, int page,
			HttpServletRequest request, String side) {

		int result = bService.deleteBoard(bNo);
		
		if(side.equals("Y")) {
			return "redirect:boardDetail.bo?bNo=" + bNo + "&page=" + page + "&side=" + side;
		}

		String path = "";
		if (result > 0) {
			switch (bType) {
			case 1:
				path = "redirect:boardListFaq.bo";
				break;
			case 2:
				path = "redirect:boardListTips.bo";
				break;
			case 3:
				path = "redirect:boardListStudy.bo";
				break;
			}
		} else {
			throw new BoardException("게시글 삭제에 실패하였습니다.");
		}

		return path;
	}
  
  
  
---------------------------------------------------------------
  Controller >> insertFirstBoardForm
  
  공지글 작성 버튼에 관여하며 공지글 작성시 b_first값이 1로 넘어값니다
  
  /* insertFirstBoardForm 이동 */
	@RequestMapping("insertFirstBoardForm.bo")
	public String insertFirstBoardForm() {
		return "insertFirstBoardForm";
	}
  
 insertBoardForm으로 form이 같아 이동만 합니다.
 Service~DAO가 없습니다
  
----------------------------------------------------------------
board-mapper >> insertBoard
  
bFirst를 default가 아닌 값 형태로 넘어옵니다 sql은 변함없습니다.
  
  <insert id="insertBoard" parameterType="Board">
		insert into board values (seq_bno.nextval, #{bType}, #{bTitle}, #{bContent},
		sysdate, default, default, #{bFirst}, #{bWriter}, #{bTags})
		<selectKey resultType="int" keyProperty="afterNo" order="AFTER">
		 	select seq_bno.currval from dual
		</selectKey>		
	</insert>
  
---------------------------------------------------------------
 view >> detailBoard
 이 부분도 겹쳤습니다
 마지막 맨 아래쯤에 //삭제하기 버튼 클릭시 script에서 겹쳤는데
  
  if (result.isConfirmed) {
						~~~
						function saved(){
							 location.href="deleteBoard.bo?bNo=${b.bNo}&bType=${b.bType}&delNo=1"
						}	
이부분의 location.href 부분이 겹칩니다 위에가 제가 쓴거, 아래가 해경님 코드입니다. 마찬가지로 delNo는 삭제시 return을 잡아주는 역할을 합니다
  
  function saved(){
							 location.href="deleteBoard.bo?bNo=${b.bNo}&bType=${b.bType}&page=${page}&side=${side}";
						}
  
합쳐본 코드입니다
   function saved(){
							 location.href="deleteBoard.bo?bNo=${b.bNo}&bType=${b.bType}&page=${page}&side=${side}&delNo=1";
						}
  
---------------------------------------------------------------------
 08일과 11일에 추가된 글 외에 나머지는 전부 admin에서 처리가 됩니다.
 
여기부터 08일 전 까지 해경님이 보내주신 사용법입니다
  
  << View >>
★ 추가 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

## Admin 관련
1. adminBoard.jsp
2. adminMember.jsp
3. adminUpdateMember.jsp
4. adminPwdConfirmjsp
5. adminSidebar.jsp 
→ 혜연님이 올려주신 최종본 menu에서 수정했습니다.

------------------------------------------------------

## Common
1. menu.jsp
→ 저희 관리자는 채팅이랑 쪽지 기능 없다고 해서, 그 부분 숨겼습니다.

------------------------------------------------------

## Board
1. boardDetail.jsp
→ 사이드바 여부
<c:choose>
	<c:when test='${ side eq "Y" }'>
		<c:import url="../admin/adminSidebar.jsp"/>
	</c:when>
	<c:otherwise>
		<c:import url="../common/menu.jsp" />
	</c:otherwise>
</c:choose>

→ 관리자는 삭제된 게시물도 확인할 수 있고, 게시물을 되살릴 수도 삭제할 수도 있다
<c:if test='${ loginUser.id eq b.bWriter and b.bStatus eq "Y" }'>
	<button type="button" class="btn btn-warning"
		onclick="location.href='updateBoardForm.bo?page=${page}&bNo=${b.bNo}&boardName=${boardName}&side=${side}'"
		style="font-size: 0.8rem; color: #939597; width: 7rem;">수정하기</button>
	<button type="button" id="checkDelete" class="btn btn-warning"
		style="font-size: 0.8rem; color: #939597; width: 7rem;">삭제하기</button>
</c:if>
<c:choose>
	<c:when test='${ loginUser.id ne b.bWriter and b.bStatus eq "Y" and loginUser.admin eq "Y" }'>
		<button type="button" class="btn bg-gradient-warning" id="checkDelete" 
			style="font-size: 0.8rem; color: #939597; width: 7rem;">삭제하기</button>
	</c:when>
	<c:when test='${ b.bStatus eq "N" and loginUser.admin eq "Y" }'>
		<button type="button" class="btn bg-gradient-warning" id="checkRevive"
			style="font-size: 0.8rem; color: #939597; width: 7rem;">되살리기</button>
	</c:when>
</c:choose>

→ 관리자페이지에서 mypage에 들어갈 때 사이드바가 관리자 sidebar로 고정
<td><a href="mypage.me?userId=${b.bWriter}&side=${side}">${ b.nickName }</a></td>

→ function getReplyList()에서 관리자가 댓글 삭제할 수 있도록
var $tdAdBtn = $('<td id="replyBtnArea'+i+'" style="width:20%;">');
var $deleteReplyAdBtn = $('<button id="deleteReplyBtn'+i+'" class="btn bg-gradient-warning updateReplyBtn" type="button" style="font-size: 0.8rem; color: #939597; width: 7rem;">').text('삭제하기');

$tdAdBtn.append($deleteReplyAdBtn);
$tr.append($tdAdBtn);

if (data[i].rWriter != '${loginUser.id}' || '${loginUser.id}' == null || '${ b.bStatus }' == 'N') {
	$tdBtn.css('display', 'none');
}
if('${loginUser.admin}' != 'Y' || data[i].rWriter == '${loginUser.id}' || '${ b.bStatus }' == 'N'){
	$tdAdBtn.css('display', 'none');
}

→ $('#checkDelete').click(function() 수정
→ $('#checkRevive').click(function() 추가

2. updateBoardForm.jsp
→ 사이드바 여부
<c:choose>
	<c:when test='${ side eq "Y" }'>
		<c:import url="../admin/adminSidebar.jsp"/>
	</c:when>
	<c:otherwise>
		<c:import url="../common/menu.jsp" />
	</c:otherwise>
</c:choose>

→ 관리자페이지에서 디테일에 들어가 수정할 경우, 사이드바 관리자로 고정
<form action="updateBoard.bo?side=${ side }" method="post">

3. boardList.jsp
→ boardDetail.jsp를 볼 때 사이드바가 menu로 들어가도록 side 파라미터 추가
<c:url var="bdetail" value="boardDetail.bo">
	<c:param name="bNo" value="${ b.bNo }" />								
<c:param name="page" value="${ pi.currentPage }" />
	<c:param name="side" value="N" />
</c:url>

------------------------------------------------------

## Member
1. mypage.jsp
→ 사이드바 여부
<c:choose>
	<c:when test='${ side eq "Y" }'>
		<c:import url="../admin/adminSidebar.jsp"/>
	</c:when>
	<c:otherwise>
		<c:import url="../common/menu.jsp" />
	</c:otherwise>
</c:choose>

→ 
<form id="upload" action="uploadImg.me?side=${ side }" method="post" enctype="multipart/form-data">

→ 
<c:if test="${ userImg != 'none' }">
	<c:url var="deleteUserImg" value="deleteImg.me">
		<c:param name="userImg" value="${ userImg }" />
		<c:param name="side" value="${ side }" />
	</c:url>
	<a class="dropdown-item" href="${ deleteUserImg }">remove photo</a>
</c:if>

→ 관리자는 쪽지 보내기 안됨
<c:if test='${ loginUser.admin eq "N" }'>
	<button type="button" class="btn btn-default btn-block mb-2" onclick="location.href='${ sendMsg }'">쪽지 보내기</button>
</c:if>

→ 
<c:url var="bdetail" value="boardDetail.bo">
	<c:param name="bNo" value="${ b.bNo }" />
	<c:param name="page" value="1" />
	<c:param name="side" value="${ side }" />
</c:url>

*******************************
*******************************

<< mapper >>
## boardMapper
→  조건문에 b.b_status = 'Y' 삭제 : 관리자가 삭제된 게시글도 확인하기 위해
<select id="selectBoard" resultMap="boardResultSet">
	SELECT *
		FROM (
		SELECT b.b_no, b.b_type, b.b_title, b.b_content, b.b_date, b.b_count, b.b_status, 
		b.b_first, b.b_writer, b.b_tags, m.m_nick, 
		(SELECT COUNT(r.r_no) FROM reply r WHERE r.r_bno = b.b_no and r.r_status='Y') as "rCount",
		(SELECT COUNT(l.l_no) FROM likey l WHERE l.l_bno = b.b_no) as "lCount"
		 FROM board b join member m on (b.b_writer = m.m_id)
		 WHERE b_no=#{bNo})
</select>

→  boardDetail에서 게시글 삭제 취소
<update id="reviveBoard">
	update board
	set b_status='Y'
	where b_no=#{bNo}
</update>

*******************************
*******************************

<< service >>
## BoardService
1. reviveBoard 추가

<< serviceImpl >>
## BoardServiceImpl
1. reviveBoard 추가

<< dao >>
## BoardDAO
1. reviveBoard 추가

<< Controller >>
## BoardController
1. boardDetail.bo 수정 
2. updateBoardForm.bo 수정 
3. updateBoard.bo 수정 
4. deleteBoard.bo 수정 
5. reviveBoard.bo 추가 

# MemberController
1. uploadImg.me 수정
2. deleteImg.me 수정
  
까지 해경님 수정 부분입니다
---------------------------------------------------------------------

21/09/08
  
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

	<typeAlias type="com.study.codemoa.admin.model.vo.Report" alias="Report" />

	<mapper resource="mapper/admin-mapper.xml"/>

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

admin-context.xml
appServlet에 admin-context.xml 이 추가됩니다

<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc-4.3.xsd
		http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">

	<mvc:annotation-driven/>
	
	<mvc:resources location="/resources" mapping="/resources/**"/>
	
	<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<property name="prefix" value="/WEB-INF/views/admin/"/>
		<property name="suffix" value=".jsp"></property>
	</bean>
	
	<context:component-scan base-package="com.study.codemoa"/>
	
</beans>

--------------------------------------------

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
  
   menu.jsp 에 들어가는 부분입니다
	</ul> 위에 넣어 주시면 됩니다
	
		<c:choose>
        				<c:when test="${ loginUser != null and loginUser.admin =='Y'}">
        		        	<li class="nav-item">
		                     <a onclick="location.href='adminPage.ad'" class="nav-link">
		                        <i class="nav-icon fab fa-github"></i>
		                        <p>사용자 관리</p>
		                     </a>
                	 		</li>
        				</c:when>
        				<c:otherwise>
        				<li class="nav-item">
		                     <a onclick="location.href='adminPage.ad'" class="nav-link" style= "visibility: hidden;">
		                        <i class="nav-icon fab fa-github"></i>
		                        <p>사용자 관리</p>
		                     </a> 
        				</c:otherwise>
        				</c:choose>
	
	
	
  -----------------------------------------------------
	
  
  이 외 나머지는 전부 admin 폴더로 들어갑니다

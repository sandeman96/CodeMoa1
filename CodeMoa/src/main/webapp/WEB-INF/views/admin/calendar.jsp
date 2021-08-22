<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>AdminLTE 3 | Calendar</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/codemoa/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="/codemoa/resources/plugins/fullcalendar/main.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet" href="/codemoa/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="/codemoa/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="/codemoa/resources/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/codemoa/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/codemoa/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="/codemoa/resources/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="/codemoa/resources/plugins/summernote/summernote-bs4.min.css">

<style>
/* 로그아웃 */
#logoutBtn {
	position: absolute;
	bottom: 10px;
	font-weight: bold;
}
#logoutBtn:hover {
	background-color: rgba(255, 255, 255, .1);
	color: #fff;
}
#dark i {
	color: #f5df4d;
}
#chatbox {
	position: absolute;
	top: 58;
	right: 15px;
}
</style>
</head>
<body class="hold-transition sidebar-mini">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<div class="wrapper">
  <!-- Navbar -->
		<!-- Preloader -->
		<div class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="resources/img/codemoa.png" alt="CodeMoaLogo">
		</div>

		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light fixed-top">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" data-widget="pushmenu" href="#" role="button">
						<i class="fas fa-bars"></i>
					</a>
				</li>
				<li class="nav-item d-none d-sm-inline-block">
					<a href="home.do" class="nav-link">Home</a>
				</li>
				<li class="nav-item d-none d-sm-inline-block">
					<a href="#" class="nav-link">Contact</a>
				</li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item">
					<a class="nav-link" data-widget="navbar-search" href="#" role="button">
						<i class="fas fa-search"></i>
					</a>
					<div class="navbar-search-block">
						<form>
							<div class="input-group col-6 ml-7">
								<input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button" data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</li>

				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown">
					<a id="chat" class="nav-link" data-toggle="dropdown" href="#">
						<i class="far fa-comments" title=""></i>
						<span class="badge badge-danger navbar-badge">3</span>
						<input id="bool" type="hidden" value="false">
					</a>
					<div>
						<!-- ==============================채팅창=========================== -->
						<div id="chatbox" style="display: none">

							<!-- DIRECT CHAT WARNING -->
							<div class="card card-warning direct-chat direct-chat-warning" style="width: 25rem;">
								<div class="card-header">
									<h3 class="card-title">Direct Chat</h3>

									<div class="card-tools">
										<span title="3 New Messages" class="badge bg-danger">3</span>
										<button type="button" class="btn btn-tool" data-card-widget="collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool" title="Contacts" data-widget="chat-pane-toggle">
											<i class="fas fa-comments"></i>
										</button>
									</div>
								</div>
								<!-- /.card-header -->

								<div class="card-body">

									<div class="direct-chat-messages">

										<div class="direct-chat-msg">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-left">Alexander Pierce</span>
												<span class="direct-chat-timestamp float-right">23 Jan 2:00 pm</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img" src="resources/dist/img/user1-128x128.jpg" alt="Message User Image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">Is this template really for free? That's unbelievable!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message to the right -->
										<div class="direct-chat-msg right">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-right">Sarah Bullock</span>
												<span class="direct-chat-timestamp float-left">23 Jan 2:05 pm</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img" src="resources/dist/img/user3-128x128.jpg" alt="Message User Image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">You better believe it!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->
									</div>
									<!--/.direct-chat-messages-->

									<!-- Contacts are loaded here -->
									<div class="direct-chat-contacts">
										<ul class="contacts-list">
											<li>
												<img class="contacts-list-img" src="resources/dist/img/user1-128x128.jpg" alt="User Avatar">

												<div class="contacts-list-info">
													<span class="contacts-list-name">
														Count Dracula <small class="contacts-list-date float-right">2/28/2015</small>
													</span>
													<span class="contacts-list-msg">How have you been? I was...</span>
												</div>
												<!-- /.contacts-list-info -->

											</li>
											<!-- End Contact Item -->
										</ul>
										<!-- /.contatcts-list -->
									</div>
									<!-- /.direct-chat-pane -->
								</div>
								<!-- /.card-body -->

								<div class="card-footer">
									<form action="#" method="post">
										<div class="input-group">
											<input type="text" name="message" placeholder="Type Message ..." class="form-control">
											<span class="input-group-append">
												<button type="submit" class="btn btn-warning">Send</button>
											</span>
										</div>
									</form>
								</div>

								<!-- /.card-footer-->
							</div>
							<!--/.direct-chat -->

						</div>

					</div>
				</li>

				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown">
					<a class="nav-link" data-toggle="dropdown" href="#">
						<i class="far fa-bell"></i>
						<span class="badge badge-warning navbar-badge">15</span>
					</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header">15 Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="fas fa-envelope mr-2"></i>
							4 new messages
							<span class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="fas fa-users mr-2"></i>
							8 friend requests
							<span class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i class="fas fa-file mr-2"></i>
							3 new reports
							<span class="float-right text-muted text-sm">2 days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
					</div>
				</li>

				<li class="nav-item">
					<a class="nav-link" data-widget="fullscreen" href="#" role="button">
						<i class="fas fa-expand-arrows-alt"></i>
					</a>
				</li>

				<li class="nav-item">
					<a id="dark" class="nav-link" data-widget="dark-mode" data-slide="true" href="#" role="button">
						<i class="fas fa-moon"></i>
					</a>
				</li>


			</ul>
		</nav>
		<!-- /.navbar -->

<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="home.do" class="brand-link">
				<img src="/codemoa/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">CODE MOA</span>
			</a>


			<!-- Sidebar -->
			<div class="sidebar">

							<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<c:if test="${ loginUser == null }">
						<div class="info">
							<a href="loginForm.me" class="d-block">로그인을 해주세요</a>
						</div>
					</c:if>

					<c:if test="${ loginUser != null }">
					<c:url var="mypage" value="mypage.me">
						<c:param name="user" value="${ loginUser.email }"/>
					</c:url>
						<div class="image">
							<img src="resources/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
						</div>
						<div class="info">
							<a href="${ mypage }" class="d-block">${ loginUser.name }</a>
						</div>
					</c:if>
				</div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
               <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                  <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
				
				 <li class="nav-item">
                     <a onclick="location.href='adminPage.ad'" class="nav-link">
                        <i class="nav-icon fab fa-github"></i>
                        <p>관리자 메인 화면</p>
                     </a>
                  </li>
				
                  <li class="nav-item">
                     <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-code"></i>
                        <p>
                           	사용자 관리
                           <i class="fas fa-angle-left right"></i>
                        </p>
                     </a>
                     <ul class="nav nav-treeview">
                        <li class="nav-item">
                           <a href="pages/tables/simple.html" class="nav-link">
                              <p>관리 페이지 1</p>
                           </a>
                        </li>
                        <li class="nav-item">
                           <a href="pages/examples/faq.html" class="nav-link">
                              <p>관리 페이지2</p>
                           </a>
                        </li>
                     </ul>
                  </li>

                  <li class="nav-item">
                     <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-users"></i>
                        <p>
                           	게시글 관리
                           <i class="fas fa-angle-left right"></i>
                        </p>
                     </a>
                     <ul class="nav nav-treeview">
                        <li class="nav-item">
                           <a href="pages/examples/projects.html" class="nav-link">
                              <p>Study</p>
                           </a>
                        </li>
                        <li class="nav-item">
                           <a href="pages/calendar.html" class="nav-link">
                              <p>Calendar</p>
                           </a>
                        </li>
                        <li class="nav-item">
                           <a href="pages/mailbox/mailbox.html" class="nav-link">
                              <p>Job</p>
                           </a>
                        </li>
                     </ul>
                  </li>

                  <li class="nav-item">
                     <a onclick="location.href='adminCalendar.ad'" class="nav-link">
                        <i class="nav-icon fab fa-github"></i>
                        <p>캘린더 관리</p>
                     </a>
                  </li>
               </ul>
            </nav>
            
            	<c:if test="${ loginUser != null }">
					<a href="logout.me" id="logoutBtn" class="nav-link">
						&nbsp;&nbsp;
						<i class="nav-icon fas fa-sign-out-alt"></i>
						<p class="float-right">LOGOUT</p>
					</a>
				</c:if>
				
            <!-- /.sidebar-menu -->
         </div>
         <!-- /.sidebar -->
      </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>일정 관리 달력</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Calendar</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
            <div class="sticky-top mb-3">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">끌어서 이벤트 저장</h4>
                </div>
                <div class="card-body">
                  <!-- the events -->
                  <div id="external-events">
                    <div class="external-event bg-success">자격증 시험</div>
                    <div class="external-event bg-warning">국가 자격증 시험</div>
                    <div class="external-event bg-info">주요 회사 면접</div>
                    <div class="external-event bg-primary">그다음에 뭐있지?</div>
                    <div class="external-event bg-danger">상반기 공채</div>
                    <div class="checkbox">
                      <label for="drop-remove">
                        <input type="checkbox" id="drop-remove">
                        remove after drop
                      </label>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
<!--               <div class="card"> -->
<!--                 <div class="card-header"> -->
<!--                   <h3 class="card-title">일정 생성</h3> -->
<!--                 </div> -->
<!--                 <div class="card-body"> -->
<!--                   <div class="btn-group" style="width: 100%; margin-bottom: 10px;"> -->
<!--                     <ul class="fc-color-picker" id="color-chooser"> -->
<!--                       <li><a class="text-primary" href="#"><i class="fas fa-square"></i></a></li> -->
<!--                       <li><a class="text-warning" href="#"><i class="fas fa-square"></i></a></li> -->
<!--                       <li><a class="text-success" href="#"><i class="fas fa-square"></i></a></li> -->
<!--                       <li><a class="text-danger" href="#"><i class="fas fa-square"></i></a></li> -->
<!--                       <li><a class="text-muted" href="#"><i class="fas fa-square"></i></a></li> -->
<!--                     </ul> -->
<!--                   </div> -->
<!--                   /btn-group -->
<!--                   <div class="input-group"> -->
<!--                     <input id="new-event" type="text" class="form-control" placeholder="일정 내용 입력"> -->

<!--                     <div class="input-group-append"> -->
<!--                       <button id="add-new-event" type="button" class="btn btn-primary">Add</button> -->
<!--                     </div> -->
<!--                     /btn-group -->
<!--                   </div> -->
<!--                   /input-group -->
<!--                 </div> -->
<!--               </div> -->
            </div>
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card card-primary">
              <div class="card-body p-0">
                <!-- THE CALENDAR -->
                <div id="calendar"></div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.1.0
    </div>
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/codemoa/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/codemoa/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jQuery UI -->
<script src="/codemoa/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- AdminLTE App -->
<script src="/codemoa/resources/dist/js/adminlte.min.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="/codemoa/resources/plugins/moment/moment.min.js"></script>
<script src="/codemoa/resources/plugins/fullcalendar/main.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/codemoa/resources/dist/js/demo.js"></script>
<!-- Page specific script -->
	<script>
		$('#dark').on('click', function() {
			var toggle = $(this).children().attr('class').indexOf('moon');
			if (toggle > 0) {
				$(this).children().removeClass('fa-moon').addClass('fa-sun');
				$('body').addClass('dark-mode');
			} else {
				$(this).children().removeClass('fa-sun').addClass('fa-moon');
				$('body').removeClass('dark-mode');
			}
		});
		/* 채팅창 */
		$('#chat').on('click', function() {
			if ($('#bool').val() == 'false') {
				$('#bool').val('true');
				$('#chatbox').css('display', 'block');
			} else {
				$('#bool').val('false');
				$('#chatbox').css("display", 'none');
			}
		});
	</script>

<script>
  $(function () {

    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {

        // create an Event Object (https://fullcalendar.io/docs/event-object)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        }

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject)

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex        : 1070,
          revert        : true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        })

      })
    }

    ini_events($('#external-events div.external-event'))

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()

    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    var containerEl = document.getElementById('external-events');
    var checkbox = document.getElementById('drop-remove');
    var calendarEl = document.getElementById('calendar');

    // initialize the external events
    // -----------------------------------------------------------------

    new Draggable(containerEl, {
      itemSelector: '.external-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText,
          backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
        };
      }
    });

    var calendar = new Calendar(calendarEl, {
      headerToolbar: {
        left  : 'prev,next today',
        center: 'title',
        right : 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      themeSystem: 'bootstrap',
      //Random default events
      events: [
        {
          title          : 'All Day Event',
          start          : new Date(y, m, 1),
          backgroundColor: '#f56954', //red
          borderColor    : '#f56954', //red
          allDay         : true
        },
        {
          title          : 'Long Event',
          start          : new Date(y, m, d - 5),
          end            : new Date(y, m, d - 2),
          backgroundColor: '#f39c12', //yellow
          borderColor    : '#f39c12' //yellow
        },
        {
          title          : 'Meeting',
          start          : new Date(y, m, d, 10, 30),
          allDay         : false,
          backgroundColor: '#0073b7', //Blue
          borderColor    : '#0073b7' //Blue
        },
        {
          title          : 'Lunch',
          start          : new Date(y, m, d, 12, 0),
          end            : new Date(y, m, d, 14, 0),
          allDay         : false,
          backgroundColor: '#00c0ef', //Info (aqua)
          borderColor    : '#00c0ef' //Info (aqua)
        },
        {
          title          : 'Birthday Party',
          start          : new Date(y, m, d + 1, 19, 0),
          end            : new Date(y, m, d + 1, 22, 30),
          allDay         : false,
          backgroundColor: '#00a65a', //Success (green)
          borderColor    : '#00a65a' //Success (green)
        },
        {
          title          : 'Click for Google',
          start          : new Date(y, m, 28),
          end            : new Date(y, m, 29),
          url            : 'https://www.google.com/',
          backgroundColor: '#3c8dbc', //Primary (light-blue)
          borderColor    : '#3c8dbc' //Primary (light-blue)
        }
      ],
      editable  : true,
      droppable : true, // this allows things to be dropped onto the calendar !!!
      drop      : function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
      }
    });

    calendar.render();
    // $('#calendar').fullCalendar()

    /* ADDING EVENTS */
    var currColor = '#3c8dbc' //Red by default
    // Color chooser button
    $('#color-chooser > li > a').click(function (e) {
      e.preventDefault()
      // Save color
      currColor = $(this).css('color')
      // Add color effect to button
      $('#add-new-event').css({
        'background-color': currColor,
        'border-color'    : currColor
      })
    })
    $('#add-new-event').click(function (e) {
      e.preventDefault()
      // Get value and make sure it is not null
      var val = $('#new-event').val()
      if (val.length == 0) {
        return
      }

      // Create events
      var event = $('<div />')
      event.css({
        'background-color': currColor,
        'border-color'    : currColor,
        'color'           : '#fff'
      }).addClass('external-event')
      event.text(val)
      $('#external-events').prepend(event)

      // Add draggable funtionality
      ini_events(event)

      // Remove event from text input
      $('#new-event').val('')
    })
  })
</script>
</body>
</html>

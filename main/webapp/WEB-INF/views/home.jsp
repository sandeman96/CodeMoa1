<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	
	<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/codemoa/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="/codemoa/resources/plugins/fullcalendar/main.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/codemoa/resources/dist/css/adminlte.min.css">
	
	
</head>
<body>


		
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>👩‍💻🧙‍♂️</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="">Home</a></li>
              <li class="breadcrumb-item active">CodeMoa</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
	

<!-- Main Content -->
<section class="content">
<div class="container-fluid">
    <div class="row">
		<!-- 에디터 초이스 / 조회순  -->
        <div class="col-md-6">
        	<div class="card">
              <div class="card-header">
                <h3 class="card-title">🧚‍♂️ Editor's Choice</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 10px">no</th>
                      <th>Question</th>
                      <th>Languages</th>
                      <th style="width: 40px">ID</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1.</td>
                      <td>자바의 신은 어디에 계실까요..</td>
                      <td><span class="badge bg-warning">Tips</span></td>
                      <td>willy</td>
                    </tr>
                    <tr>
                      <td>2.</td>
                      <td>echo문 안에 confirm 넣기 가능??</td>
                      <td><span class="badge bg-warning">Tips</span></td>
                      <td>HealthyK</td>
                    </tr>
                    <tr>
                      <td>3.</td>
                      <td>파이썬 병렬실행 관련 질문</td>
					  <td><span class="badge bg-warning">Study</span></td>
					  <td>boldDo</td>
                    </tr>
                    <tr>
                      <td>4.</td>
                      <td>c++ virtual 파괴자의 사용</td>
                      <td><span class="badge bg-warning">Q&A</span></td>
                      <td>ryuRR</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        
        <div class="col-md-6">
        	<div class="card">
              <div class="card-header">
                <h3 class="card-title">🥇🥈🥉 Hits</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 10px">no</th>
                      <th>Question</th>
                      <th>Languages</th>
                      <th style="width: 40px">ID</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1.</td>
                      <td>자바의 신은 어디에 계실까요..</td>
                      <td><span class="badge bg-warning">Q&A</span></td>
                      <td>willy</td>
                    </tr>
                    <tr>
                      <td>2.</td>
                      <td>echo문 안에 confirm 넣기 가능??</td>
                      <td><span class="badge bg-warning">Q&A</span></td>
                      <td>HealthyK</td>
                    </tr>
                    <tr>
                      <td>3.</td>
                      <td>파이썬 병렬실행 관련 질문</td>
					  <td><span class="badge bg-warning">Tips</span></td>
					  <td>boldDo</td>
                    </tr>
                    <tr>
                      <td>4.</td>
                      <td>c++ virtual 파괴자의 사용</td>
                      <td><span class="badge bg-warning">Tips</span></td>
                      <td>ryuRR</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        
      </div>
      	<!-- /.row -->
      	
      	<!-- 광고.. 구글광고!? -->
      	<h5 class="mb-2">💲 Main Sponsor 💲</h5>
        <div class="card card-success">
          <div class="card-body">
            <div class="row">
              <div class="col-md-12 col-lg-6 col-xl-4">
                <div class="card mb-2 bg-gradient-dark">
                  <img class="card-img-top" src="resources/dist/img/khad.jpg" alt="Dist Photo 1">
                  <div class="card-img-overlay d-flex flex-column justify-content-end">
                    <h5 class="card-title text-primary text-primary"></h5>
                    <p class="card-text text-white pb-2 pt-1"></p>
                    <a href="www.iei.or.kr" class="text-white">www.iei.or.kr</a>
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-lg-6 col-xl-4">
                <div class="card mb-2 bg-gradient-dark">
                  <img class="card-img-top" src="resources/dist/img/gatherTown.png" alt="Dist Photo 2">
                  <div class="card-img-overlay d-flex flex-column justify-content-end">
                    <h5 class="card-title text-primary text-white">@gatherTown</h5>
                    <p class="card-text text-white pb-2 pt-1"><br>줌에 지친 여러분! 8비트의 개더타운에서 만나요!  </p>
                    <a href="https://www.gather.town/" class="text-white">www.gather.town</a>
                  </div>
                </div>
              </div>
              <div class="col-md-12 col-lg-6 col-xl-4">
                <div class="card mb-2 bg-gradient-dark">
                  <img class="card-img-top" src="resources/dist/img/sufit.jpg" alt="Dist Photo 3">
                  <div class="card-img-overlay d-flex flex-column justify-content-end">
                    <h5 class="card-title text-primary"></h5>
                    <p class="card-text text-primary pb-2 pt-1"></p>
                    <a href="www.surfit.io" class="text-danger">www.surfit.io</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Q&A , Tips 게시판 (링크 및 조회순으로 출력?) -->
       <div class="row">
        <div class="col-md-6">
        	<div class="card">
              <div class="card-header">
                <h3 class="card-title"><a class="page-link" href="#">🤷‍♂️ Q&A</a></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 10px">no</th>
                      <th>Question</th>
                      <th>Languages</th>
                      <th style="width: 40px">ID</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1.</td>
                      <td>자바의 신은 어디에 계실까요..</td>
                      <td><span class="badge bg-danger">java</span></td>
                      <td>willy</td>
                    </tr>
                    <tr>
                      <td>2.</td>
                      <td>echo문 안에 confirm 넣기 가능??</td>
                      <td><span class="badge bg-warning">PHP</span></td>
                      <td>HealthyK</td>
                    </tr>
                    <tr>
                      <td>3.</td>
                      <td>파이썬 병렬실행 관련 질문</td>
					  <td><span class="badge bg-primary">Python</span></td>
					  <td>boldDo</td>
                    </tr>
                    <tr>
                      <td>4.</td>
                      <td>c++ virtual 파괴자의 사용</td>
                      <td><span class="badge bg-success">C++</span></td>
                      <td>ryuRR</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        
        <div class="col-md-6">
        	<div class="card">
              <div class="card-header">
                <h3 class="card-title"><a class="page-link" href="#">👩‍💻 Tips</a></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 10px">no</th>
                      <th>Question</th>
                      <th>Languages</th>
                      <th style="width: 40px">ID</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1.</td>
                      <td>자바의 신은 어디에 계실까요..</td>
                      <td><span class="badge bg-danger">java</span></td>
                      <td>willy</td>
                    </tr>
                    <tr>
                      <td>2.</td>
                      <td>echo문 안에 confirm 넣기 가능??</td>
                      <td><span class="badge bg-warning">PHP</span></td>
                      <td>HealthyK</td>
                    </tr>
                    <tr>
                      <td>3.</td>
                      <td>파이썬 병렬실행 관련 질문</td>
					  <td><span class="badge bg-primary">Python</span></td>
					  <td>boldDo</td>
                    </tr>
                    <tr>
                      <td>4.</td>
                      <td>c++ virtual 파괴자의 사용</td>
                      <td><span class="badge bg-success">C++</span></td>
                      <td>ryuRR</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        
      </div>
      	<!-- /.row -->
   
      	
      	<!-- 달력
      		좌측 카드를 지워버리면 달력이 제대로 작동하지 않아서.. 
      		일단 남기고 색상을 이용해 달력에 있는 행사 성격을 알려주는
      		용도로 해보면 어떨까 싶습니다.
      	 -->
      	<h5 class="mb-2">🏃‍♀️ Calendar 🏃‍♂️</h5>
    	<div class="row">
      	<div class="col-md-3">
            <div class="sticky-top mb-3">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">행사 종류</h4>
                </div>
                <div class="card-body">
                  <!-- the events -->
                  <div id="external-events">
                    <div class="external-event bg-success">공채</div>
                    <div class="external-event bg-warning">설명회</div>
                    <div class="external-event bg-info">해커톤</div>
                    <div class="external-event bg-primary">웨비나</div>
                    <div class="external-event bg-danger">코드모아</div>
                    <div class="checkbox">
                      <label for="drop-remove">
                        <input type="checkbox">
                        
                      </label>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
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
          </div>
          </section>
          </div>
          
          
          
          
		
	
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


<!-- 스크립트는 아직 정리 안함. -->
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
      editable  : false,
      droppable : false, // this allows things to be dropped onto the calendar !!!
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
    })
  })
</script>


	
</body>
</html>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/resources/OpenSource/fullcalendar-5.11.3/lib/main.css">
<script type="text/javascript"
        src="/resources/OpenSource/fullcalendar-5.11.3/lib/main.js"></script>
<script type="text/javascript"
        src="/resources/OpenSource/fullcalendar-5.11.3/lib/main.min.js"></script>

<script>

    var calendar = null;

    $(document).ready(function () {
        var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendar.Draggable;

        var containerEl = document.getElementById('external-events');
        var calendarEl = document.getElementById('calendar');
        var checkbox = document.getElementById('drop-remove');


        // initialize the external events
        // -----------------------------------------------------------------

        var all_events = null;
        all_events = lodinCalender();
        new Draggable(containerEl, {
            itemSelector: '.fc-event',
            eventData: function (eventEl) {
                return {
                    title: eventEl.innerText
                };
            }

        });

        // initialize the calendar
        // -----------------------------------------------------------------
        calendar = new Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            editable: true,  // 수정가능 여부
            droppable: true, // 드레그 드랍 여부
            events: all_events,
            drop: function (info) {
                // is the "remove after drop" checkbox checked?
                if (checkbox.checked) {
                    // if so, remove the element from the "Draggable Events" list
                    info.draggedEl.parentNode.removeChild(info.draggedEl);
                }
            },
            eventClick: function(info) {
                window.open(
                    "/clubCal/getClubCalender?clubCalenderNum="+info.event.id,  "모임 일정 후기글 수정",
                    "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no"
                )
            },

            locale: 'ko'
        });

        calendar.render();

    });

    function lodinCalender() {

        var result_val = null;

        var clubNum = $(".clubNum").val();

        $.ajax({
            url: "/clubCal/json/getListCalender",
            method: "POST",
            contentType: 'application/json; charset=utf-8',
            dataType: "json",
            async : false,
            data: JSON.stringify({
                "clubNum": clubNum
            }),
            success: function (JSONData, status) {

                result_va = JSONData

                result_val = new Array(result_va);


            }

        })
                console.log(result_val);
                return result_val;

    }




    $(".addDay").on("click", function () {
        /*  var dateStr = prompt('Enter a date in YYYY-MM-DD format');
          var date = new Date(dateStr + 'T00:00:00'); // 입력할 시간


          if (!isNaN(date.valueOf())) { // 입력할 시간이 valueCheck
              calendar.addEvent({
                  title: dataTitle,
                  start: date,
                  Text: dateText,
                  allDay: true
              });
              alert('Great. Now, update your database...');
          } else {
              alert('Invalid date.');
          }*/
        // 팝업창 오픈
        alert("리뷰창 오픈 ");

        var pop = window.open(
            "/view/community/add/addClubCalender.jsp", "리뷰페이지",
            "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");


    });



</script>

<style>
    .fc-event {
        margin-top: 5px;
        cursor: pointer;
    }
</style>
</head>
<body>

<div class='demo-topbar'>
    <input hidden class="clubNum" value="10001">
    <div id='external-events'
         style="float: left; width: 20%; margin-top: 75px; padding: 5px;">

        <p>
            <strong>일정 목록</strong>
        </p>

        <div
                class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
            <div class='fc-event-main'>My Event 1</div>
        </div>
        <div
                class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
            <div class='fc-event-main'>My Event 2</div>
        </div>
        <div
                class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
            <div class='fc-event-main'>My Event 3</div>
        </div>
        <div
                class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
            <div class='fc-event-main'>My Event 4</div>
        </div>
        <div
                class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
            <div class='fc-event-main'>My Event 5</div>
        </div>

        <p>
            <input type='checkbox' id='drop-remove'/> <label for='drop-remove'>드레그
            후 제거</label>
        </p>
    </div>
    <div id='calendar-container' style="float: left; width: 50%; font-size: 0.7em; ">
        <div style="height: 30px; text-align: center; font-size: 30px; font-weight: bold; color: rgba(69, 69, 199, 0.721); margin-bottom: 20px;">
            나의 일정
        </div>
        <input type="button" class="allSave" value="전체 저장">
        <input type="button" class="addDay" value="일정 추가">
        <div id='calendar'></div>
    </div>
</div>

</body>
</html>

</body>
</html>
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
            editable: true,  // �������� ����
            droppable: true, // �巹�� ��� ����
            events: all_events,
            drop: function (info) {
                // is the "remove after drop" checkbox checked?
                if (checkbox.checked) {
                    // if so, remove the element from the "Draggable Events" list
                    info.draggedEl.parentNode.removeChild(info.draggedEl);
                }
            },

            eventClick: function (info) {
                window.open(
                    "/clubCal/getClubCalender?clubCalenderNum=" + info.event.id, "���� ���� �ı�� ����",
                    "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no"
                )
            },

            locale: 'ko'
        });

        calendar.render();

    });

    function lodinCalender() {
        var boardNum = $(".boardNum").val()

        var result_val = null;


        $.ajax({
            url: "/clubCal/json/getListCalender",
            method: "POST",
            contentType: 'application/json; charset=utf-8',
            dataType: "json",
            async: false,
            data: JSON.stringify({
                "clubNum": boardNum

            }),
            success: function (JSONData, status) {
                result_val = new Array;

                $.each(JSONData, function (indext, item) {
                    console.log(item);

                    result_val.push(item);

                })

            }

        })
        console.log(result_val);

        return result_val;

    }


    $(function () {

        $(".addCalender").on("click", function () {

            window.open(
                "/view/community/add/addClubCalender.jsp", "����������",
                "top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

        });
    })


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
    <div id='external-events' style="float: left; width: 20%; margin-top: 75px; padding: 5px; margin-bottom: 50px;"> </div>
    <div id='calendar-container' style="float: left; width: 50%; font-size: 0.7em; ">
        <div style="height: 30px; text-align: center; font-size: 30px; font-weight: bold; color: rgba(69, 69, 199, 0.721); margin-bottom: 20px;"> ���� ���� </div>
        <div id='calendar'></div>
        <input type="button" class="addCalender" value="���� ���� �ۼ�">
    </div>
</div>

</body>
</html>

</body>
</html>
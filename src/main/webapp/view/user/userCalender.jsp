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

            eventClick: function (info) {
                if (info.event.groupId === 1) {
                    window.open(
                        "/clubCal/getClubCalender?clubCalenderNum=" + info.event.id, "모임 일정 후기글 수정",
                        "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no"
                    )
                }else if(info.event.groupId === 2){

                    window.open(
                        "/commu/getDealCalender?dealNum=" + info.event.id, "거래 상세 조회",
                        "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no"
                    )
                }
            },

            locale: 'ko'
        });

        calendar.render();

    });

    function lodinCalender() {


        var userId = '${user.userId}'

        var result_val = null;


        $.ajax({
            url: "/clubCal/json/getListCluber",
            method: "POST",
            contentType: 'application/json; charset=utf-8',
            dataType: "json",
            async: false,
            data: JSON.stringify({
                "userId": userId
            }),
            success: function (JSONData) {

                result_val = new Array;

                $.each(JSONData.list, function (index, item) {
                    console.log(item.clubCalendarNum);

                    var clubCalendarNum = item.clubCalendarNum

                    $.ajax({
                        url: "/clubCal/json/getListCluberCalender",
                        method: "POST",
                        contentType: 'application/json; charset=utf-8',
                        dataType: "json",
                        async: false,
                        data: JSON.stringify({
                            "clubCalendarNum": clubCalendarNum

                        }),
                        success: function (JSONData, status) {


                            $.each(JSONData, function (indext, item) {


                                result_val.push(item);

                            })

                        }

                    })
                })
            }
        })


        $.ajax({
            url: "/commu/json/getListDealCalender",
            method: "POST",
            contentType: 'application/json; charset=utf-8',
            dataType: "json",
            async: false,
            data: JSON.stringify({
                "userId": userId

            }),
            success: function (JSONData, status) {

                $.each(JSONData, function (indext, item) {
                    console.log(item);

                    result_val.push(item);

                })

            }

        })

        console.log(result_val);

        return result_val;

    }


</script>

<style>
    .fc-event {
        margin-top: 5px;
        cursor: pointer;
    }
</style>

<body>
<div class='demo-topbar' style="width: 839px;">
    <div id='external-events'></div>
    <div id='calendar-container' style="font-size: 0.7em;">
        <div id='calendar'></div>
    </div>
</div>

</body>
</html>


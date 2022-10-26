<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/resources/OpenSource/fullcalendar-5.11.3/lib/main.css">
<script type="text/javascript"
        src="/resources/OpenSource/fullcalendar-5.11.3/lib/main.js"></script>
<script type="text/javascript"
        src="/resources/OpenSource/fullcalendar-5.11.3/lib/main.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

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
                $(function () {
            /*    window.open(
                    "/commu/getDealCalender?dealNum=" + info.event.id, "�ŷ� �� ��ȸ",
                    "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no"
                )*/

                    $.ajax({
                        url: "/clubCal/json/getDealCalender",
                        method: "POST",
                        dataType: "json",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({
                            "dealBoardNum": info.event.id
                        }),
                        success: function (JSONData, result) {

                            var deal = JSONData.deal

                            console.log("deal : "+ deal.dealDate);

                            var date = new Date(deal.dealDate);

                            const year = date.getFullYear();
                            const month = ('0' + (date.getMonth() + 1)).slice(-2);
                            const day = ('0' + date.getDate()).slice(-2);
                            const dateStr = year + '-' + month + '-' + day;


                            $(".dealCalenderTitle2").val(deal.dealCalenderTitle);
                            $(".dealDate2").val(dateStr);
                            $(".dealLocation2").val(deal.dealLocation);

                            const modal = new bootstrap.Modal('#exampleModal2', {})
                            modal.show();

                        }
                    })

                })



            },

            locale: 'ko'
        });

        calendar.render();

    });

    function lodinCalender() {

        var userId = '${user.userId}'

        var result_val = null;


        $.ajax({
            url: "/clubCal/json/getListDealCalender",
            method: "POST",
            contentType: 'application/json; charset=utf-8',
            dataType: "json",
            async: false,
            data: JSON.stringify({
                "userId": userId

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

        var dealBoardNum = $(".dealNum").val();

        $(".getDealPage").on("click", ()=>{

            window.open(
                "/commu/getDealCalender?dealNum=" + dealBoardNum, "�ŷ� �� ��ȸ",
                "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no")


        })


        $(".updateSubmit").on("click", function () {


        })
    })


</script>

<style>
    .fc-event {
        margin-top: 5px;
        cursor: pointer;
    }
</style>
<body>
<div class='demo-topbar'>
    <div id='external-events' style="float: left; width: 20%; margin-top: 75px; padding: 5px; margin-bottom: 50px;"> </div>
    <div id='calendar-container' style="float: left; width: 50%; font-size: 0.7em; ">
        <div style="height: 30px; text-align: center; font-size: 30px; font-weight: bold; color: rgba(69, 69, 199, 0.721); margin-bottom: 20px;"> �ŷ� ���� </div>
        <div id='calendar'></div>
    </div>
</div>



<%--�ŷ� ���� �ۼ�--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <input type="hidden" class="dealNum" value="">
                <h1 class="modal-title fs-5" id="exampleModalLabel4"> �ŷ� ���� �ۼ�</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="fileForm4">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control dealCalenderTitle" id="recipient-name" value=""
                               placeholder="asdasd">
                        <label for="recipient-name">�� ��</label>
                    </div>


                    <div class="form-floating mb-3">

                        <input type="date" class="form-control dealDate" id="date-text" value="" placeholder="asdasd"/>
                        <label for="date-text">���� ���� ��¥</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="text" class="form-control dealLocation" value="��ġ ����">

                    </div>

                </form>

            </div>

            <div class="modal-footer" style=" justify-content:center;">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�ݱ�</button>
                <button type="button" class="btn btn-primary dealSubmit">���</button>


            </div>
        </div>
    </div>
</div>


<%--�ŷ� ���� �� ��ȸ--%>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <input type="hidden" class="dealNum" value="">
                <h1 class="modal-title fs-5" id="exampleModalLabel2"> �ŷ� ����</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">


                    <div class="form-floating mb-3">
                        <input type="text" class="form-control dealCalenderTitle2" value=""
                               placeholder="asdasd">
                        <label for="recipient-name">�� ��</label>
                    </div>


                    <div class="form-floating mb-3">

                        <input type="date" class="form-control dealDate2"  value="" placeholder="asdasd"/>
                        <label for="date-text">���� ���� ��¥</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="text" class="form-control dealLocation2" value="��ġ ����">

                    </div>


            </div>

            <div class="modal-footer" style=" justify-content:center;">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�ݱ�</button>
                <button type="button" class="btn btn-info updateSubmit">����</button>
                <button type="button" class="btn btn-secondary getDealPage">�Խñ� �� ��ȸ</button>

            </div>
        </div>
    </div>
</div>

</body>
</html>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<html>
<link rel="stylesheet" href="/resources/OpenSource/fullcalendar-5.11.3/lib/main.css">
<script type="text/javascript"
        src="/resources/OpenSource/fullcalendar-5.11.3/lib/main.js"></script>
<script type="text/javascript"
        src="/resources/OpenSource/fullcalendar-5.11.3/lib/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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

                $(function () {

                    /*모임 일정*/
                    if (info.event.groupId === '1') {

                        //상세 조회 modal 오픈
                        $.ajax({
                            url: "/clubCal/json/getClubCalender",
                            method: "POST",
                            contentType: 'application/json; charset=utf-8',
                            dataType: "json",
                            async: false,
                            data: JSON.stringify({
                                "clubCalenderNum": info.event.id

                            }),
                            success: function (JSONData, result) {

                                console.log(JSONData.clubCalendar)

                                var clubCalendar = JSONData.clubCalendar;

                                $(".clubCalnderNum").val(clubCalendar.clubCalenderNum);
                                $(".clubNum").val(clubCalendar.clubNum);
                                $(".calenderTitle2").val(clubCalendar.calenderTitle);
                                $(".calenderText2").val(clubCalendar.calenderText);
                                $(".clubDate2").val(clubCalendar.clubDate);
                                $(".noticeTime2").val(clubCalendar.noticeTime);
                                $(".location2").val(clubCalendar.location);


                                if (clubCalendar.noticeCheck === '2') {
                                    $(".noticeCheck2").prop("checked", true);
                                } else {
                                    $(".noticeCheck2").prop("checked", false);
                                }

                                if (clubCalendar.calendarApplyCheck === '2') {
                                    $(".calendarApplyCheck2").prop("checked", true);
                                } else {
                                    $(".calendarApplyCheck2").prop("checked", false);
                                }

                                if (clubCalendar.applyAutoCheck === '2') {
                                    $(".applyAutoCheck2").prop("checked", true);
                                } else {
                                    $(".applyAutoCheck2").prop("checked", false);
                                }


                                var str = ''
                                $.each(clubCalendar.file, function (index, item) {
                                    console.log(item.fileName)

                                    str +=

                                        '<div class="carousel-inner">' +
                                        '<div class="carousel-item active" data-bs-interval="2000">' +
                                        '<img src="/resources' + item.fileName + '" width="490px" height="400px">' +
                                        '</div>' +
                                        '</div>'

                                })

                                $(".slide").html(str);

                                const modal = new bootstrap.Modal('#exampleModal1', {})
                                modal.show();
                            }
                        })

                        /*거래일정 */
                    } else if (info.event.groupId === '2') {

                        $(".boardNum").val(info.event.id);

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

                                console.log("deal : " + deal.dealCalenderTitle + deal.dealId);

                                var date = new Date(deal.dealDate);

                                const year = date.getFullYear();
                                const month = ('0' + (date.getMonth() + 1)).slice(-2);
                                const day = ('0' + date.getDate()).slice(-2);
                                const dateStr = year + '-' + month + '-' + day;

                                $(".dealCalenderTitle2").val(deal.dealCalenderTitle);
                                $(".dealDate2").val(dateStr);
                                $(".dealLocation2").val(deal.dealLocation);
                                $(".dealId").val(deal.dealId);
                                const modal = new bootstrap.Modal('#exampleModal3', {})
                                if (deal.boardCategory === '08') {
                                    if ('${user.userId}' === deal.dealId) {
                                        $('.addReview').css('display', 'block')
                                    } else {
                                        $('.addReview').css('display', 'none')
                                    }
                                } else if (deal.boardCategory === '09') {
                                    if ('${user.userId}' === deal.user.userId) {
                                        $('.addReview').css('display', 'block')
                                    } else {
                                        $('.addReview').css('display', 'none')
                                    }
                                }

                                modal.show();

                            }
                        })

                    }
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
            url: "/clubCal/json/getListDealCalender",
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

    $(function () {

        $(".getDealPage").on("click", () => {

            var boardNum = $(".boardNum").val()


            Swal.fire({
                icon: 'success',
                title: '해당 페이지로 이동 하시겠습니까?',
                confirmButtonText: '이동',
                showCancelButton: true,
                CancelButtonText: '취소',
                footer: '<a href="">Why do I have this issue?</a>'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "/deal/getDeal/" + boardNum;

                }
            })
        })


        $(".getClub").on("click", () => {

            var clubNum = $(".clubNum").val()

            Swal.fire({
                icon: 'success',
                title: '해당 페이지로 이동 하시겠습니까?',
                confirmButtonText: '이동',
                showCancelButton: true,
                CancelButtonText: '취소',
                footer: '<a href="">Why do I have this issue?</a>'
            }).then((result) => {
                if (result.isConfirmed) {

                    location.href = "/club/getClub/" + clubNum

                }


            })

        })


        $(".location2").on("click", function () {
            var location = $(".location2").val();


            $("#location2 .modal-content").load("/view/site/getCalenderMap.jsp",
                {location: location},
                function (re) {

                    $("#location2 .modal-content").html(re);


                    $("#exampleModal1").modal("hide");
                    $("#location2").modal("show");
                    $("#location2 .getLocation").off("click").on("click", function () {

                        $("#location2").modal("hide");
                        $("#exampleModal1").modal("show");

                    })
                }
            );
        })


        $("#exampleModal3 .dealLocation2").on("click", function () {


            var location = $(".dealLocation2").val()


            $("#location2 .modal-content").load("/view/site/getCalenderMap.jsp",
                {location: location},
                function (re) {

                    $("#location2 .modal-content").html(re);


                    $("#exampleModal3").modal("hide");
                    $("#location2").modal("show");

                    $("#location2 .getLocation").off("click").on("click", function () {

                        $("#location2").modal("hide");
                        $("#exampleModal3").modal("show");

                    })
                }
            )

        })

        //상세보기 지도 보기
        $("#location2").on("shown.bs.modal", () => {
            getClubLocation()
        })


    })

    // review add
    $(function () {
        $(".submit").on("click", function () {
            var rating = $(".rating").val()
            var content = $(".content").val();
            var dealBoardNum = $(".boardNum").val();
            var dealId = $(".dealId").val();

            $.ajax({
                url: "/deal/json/addReview",
                method: "post",
                data: JSON.stringify({
                    "reviewPt": rating,
                    "review": content,
                    "dealBoardNum": dealBoardNum,
                    "dealId": dealId
                }),
                dataType: "json",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json; charset=UTF-8"
                },
                success: function (JSONData, result) {
                    console.log(JSONData);

                    // 성공시 해당 창을 닫고 부모창을 reload
                    Swal.fire({
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });

                    setTimeout(function () {
                        window.location.reload();
                    }, 2000);
                    //error 발생시 그냥 창을 닫음

                }, error: function () {
                    Swal.fire({
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500

                    });
                    setTimeout(function () {
                        window.close();
                    }, 2000);
                }
            })
        })
    })

    $(function () {

        $('.calenderCluber2').off('click').on('click', function () {

            $.ajax({
                url: '/club/listCalendarCluber/' + $('#exampleModal1 .clubCalnderNum').val(),
                success: function (re) {
                    $('#listCalendarCluber .modal-content').html(re)
                    $('#listCalendarCluber .listClubCalendarApply').css('display', 'none')
                    $('#exampleModal1').modal('hide')
                    $('#listCalendarCluber').modal('show')
                    $('#listCalendarCluber .back-btn').off('click').on('click', function () {
                        $('#listCalendarCluber').modal('hide')
                        $('#exampleModal1').modal('show')
                    })
                }
            })
        })

    })
    $(function () {

    })

</script>

<style>
    .fc-event {
        margin-top: 5px;
        cursor: pointer;
    }

    /* 평점 영역 */
    .rating_div {
        padding-top: 10px;
    }

    .rating_div h4 {
        margin: 0;
    }

    select {
        margin: 15px;
        width: 100px;
        height: 40px;
        text-align: center;
        font-size: 16px;
        font-weight: 600;
    }

    /* 리뷰 작성 영역 */
    .content_div {
        padding-top: 10px;
    }

    .content_div h4 {
        margin: 0;
    }

    textarea {
        width: 100%;
        height: 100px;
        border: 1px solid #dadada;
        padding: 12px 8px 12px 8px;
        font-size: 15px;
        color: #a9a9a9;
        resize: none;
        margin-top: 10px;
    }

</style>

<body>
<div class='demo-topbar' style="width: 839px;">
    <div id='external-events'></div>
    <div id='calendar-container' style="font-size: 0.7em;">
        <div id='calendar'></div>
    </div>
</div>


<%--상세 조회--%>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <input name="clubCalenderReviewNum" class="clubCalenderReviewNum" hidden value="">
            <div class="modal-header">
                <input hidden class="clubCalnderNum" value="">
                <input hidden class="clubNum" value="">
                <h1 class="modal-title fs-5" id="exampleModalLabel1"> 모임 일정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                <div class="borderBox">

                    <div class="addBox" style=" float: right; display: flex; flex-direction: column;">

                    </div>
                </div>
            </div>
            <div class="modal-body">

                <div class="form-floating mb-3">
                    <input type="text" class="form-control calenderTitle2" id="recipient-name" value=""
                           placeholder="asdasd">
                    <label for="recipient-name">제 목</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control calenderText2" id="message-text" value=""
                           placeholder="asdasd"/>
                    <label for="message-text">일정 내용</label>
                </div>

                <div class="form-floating mb-3">

                    <input type="date" class="form-control clubDate2" id="date-text" value=""
                           placeholder="asdasd"/>
                    <label for="date-text">모임 일정 날짜</label>

                </div>

                <div class="input-group mb-3">

                    <input type="button" class="form-control location2" value="위치 보기">

                </div>

                <div class="input-group mb-3 fileBox">
                    <div class="shadow-lg midle" style="margin-bottom: 50px; margin-top: -3px; overflow: hidden;">
                        <div id="carouselExampleDark" class=" shadow-lg carousel carousel-dark slide"
                             data-bs-ride="carousel">


                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                                    data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"
                                      style="z-index: 3; position: absolute;"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>

                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                                    data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"
                                      style="z-index: 3; position: absolute;"></span>
                                <span class="visually-hidden">Next</span>
                            </button>

                        </div>
                    </div>

                </div>

                <div class="input-group mb-3">
                    <input type="button" class="form-control calenderCluber2" multiple value="모임 인원 리스트">

                </div>


                <hr>


                <div class=" mb-3 form-check form-switch">
                    추가 참여 여부
                    <input class="form-check-input check calendarApplyCheck2" name="calendarApplyCheck" type="checkbox"
                           role="switch" id="flexSwitchCheckDefault5">

                </div>

                <hr>

                <div class=" mb-3 form-check form-switch">
                    자동 참여 가능
                    <input class="form-check-input check applyAutoCheck2" name="applyAutoCheck" type="checkbox"
                           role="switch"
                           id="flexSwitchCheckDefault6">

                </div>

                <hr>


            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary getClub">모임페이지로 이동</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>

            </div>
        </div>
    </div>
</div>

<%--모임 일정 참여자 조회--%>
<div class="modal fade" id="listCalendarCluber" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
        </div>
    </div>
</div>


<%--거래 일정 상세 조회--%>
<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <input hidden class="boardNum" value="">
        <div class="modal-content">
            <div class="modal-header">
                <input type="hidden" class="dealNum" value="">
                <h1 class="modal-title fs-5" id="exampleModalLabel3"> 거래 일정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">


                <div class="form-floating mb-3">
                    <input type="text" class="form-control dealCalenderTitle2" value=""
                           placeholder="asdasd">
                    <label for="recipient-name">제 목</label>
                </div>


                <div class="form-floating mb-3">

                    <input type="date" class="form-control dealDate2" value="" readonly placeholder="asdasd"/>
                    <label for="date-text">모임 일정 날짜</label>

                </div>

                <div class="input-group mb-3">

                    <input type="button" class="form-control dealLocation2" value="위치 선택">

                </div>


            </div>

            <div class="modal-footer" style=" justify-content:center;">
                <input hidden name="dealBoardNum" value="${map.dealBoardNum}" class="dealBoardNum">
                <button type="button" class="btn btn-primary getDealPage">게시글 상세 조회</button>
                <%--                <c:if test="${deal.boardCategory=='08'}">--%>
                <%--                <c:if test="${deal.dealId==sessionScope.user.userId}">--%>
                <button type="button" class="btn btn-primary addReview" data-bs-toggle="modal"
                        data-bs-target="#addReview">리뷰작성
                </button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <%--                </c:if>--%>
                <%--                </c:if>--%>
                <%--<c:if test="${deal.dealBoard=='09'}">--%>

            </div>
        </div>
    </div>

</div>

<%-- 리뷰 모달창 만들기 헤헷 --%>

<div class="modal fade" id="addReview" tabindex="-1" aria-labelledby="addReviewLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form id="addReviewForm" enctype="multipart/form-data">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="addReviewlLabel">리뷰 작성</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                    <input hidden name="dealBoardNum" value="${map.dealBoardNum}" class="dealBoardNum">
                    <input hidden name="dealId" value="${map.dealId}" class="dealId">
                    <input type="hidden" name="deleteFileName" value="${deal.clubImage}" disabled>
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            ${deal.dealTitle}
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <div class="rating_div">
                                <h4>평점</h4>

                                <select name="rating" class="rating">
                                    <c:forEach var="i" begin="0" end="100">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>

                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <div class="content_div">
                                <h4>리뷰</h4>
                                <textarea name="content" class="content" value=""></textarea>
                            </div>
                        </div>

                    </div>

            </div>
            <div class="row">
                <div class="col-xs-12 text-center ">
                    <button type="button" class="btn btn-primary btn-lg submit">확인</button>

                </div>
            </div>
                <input type="hidden" value="${deal}">
            </form>
        </div>
    </div>
</div>

<%--상세조회 지도--%>
<div class="modal fade" id="location2" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <jsp:include page="/view/site/getCalenderMap.jsp"/>

        </div>
    </div>
</div>

</body>
</html>


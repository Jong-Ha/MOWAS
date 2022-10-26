<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<link rel="stylesheet" href="/resources/OpenSource/fullcalendar-5.11.3/lib/main.css">
<script type="text/javascript"
        src="/resources/OpenSource/fullcalendar-5.11.3/lib/main.min.js"></script>

<script>

    var calendar = null;

    $(document).ready(function () {

        var Calendar = FullCalendar.Calendar;

        var calendarEl = document.getElementById('calendar');
        var checkbox = document.getElementById('drop-remove');


        // initialize the external events
        // -----------------------------------------------------------------

        var all_events = null;
        all_events = lodinCalender();

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
                            $(".calenderTitle2").val(clubCalendar.calenderTitle);
                            $(".calenderText2").val(clubCalendar.calenderText);
                            $(".clubDate2").val(clubCalendar.clubDate);
                            $(".noticeTime2").val(clubCalendar.noticeTime);
                            $.ajax({
                                url : '/club/json/getCalendarCluberCondition',
                                data : JSON.stringify({
                                    clubCalendarNum : clubCalendar.clubCalenderNum,
                                    userId : '${user.userId}'
                                }),
                                method : 'post',
                                contentType: 'application/json; charset=utf-8',
                                success : function(re){
                                    const applyCondition = re.condition
                                    if(applyCondition==='0'){
                                        $('#exampleModal2 .deleteClubCalendarApply').css('display','')
                                    }else if(applyCondition==='1'){

                                    }else {
                                        $('#exampleModal2 .addClubCalendarApply').css('display','')
                                    }
                                }
                            })

                            if (clubCalendar.noticeCheck === '1') {
                                $(".noticeCheck2").prop("checked", true);
                            } else {
                                $(".noticeCheck2").prop("checked", false);
                            }

                            if (clubCalendar.calendarApplyCheck === '1') {
                                $(".calendarApplyCheck2").prop("checked", true);
                            } else {
                                $(".calendarApplyCheck2").prop("checked", false);
                            }

                            if (clubCalendar.applyAutoCheck === '1') {
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

                            $(".slide").append(str);

                            const modal = new bootstrap.Modal('#exampleModal2', {})
                            modal.show();

                            const date = new Date();

                            const year = date.getFullYear();
                            const month = ('0' + (date.getMonth() + 1)).slice(-2);
                            const day = ('0' + date.getDate()).slice(-2);
                            const dateStr = year + '-' + month + '-' + day;

                            var Cdate = $(".clubDate2").val()

                            const date2 = new Date(dateStr);
                            const date3 = new Date(Cdate);

                            var button

                            if (date3 > date2) {

                                button = '<button class="btn btn-primary update" data-bs-toggle="modal" data-bs-target="#exampleModal3">' +
                                    '수정' +
                                    '</button>' +
                                    '<button class="btn btn-primary delete">' +
                                    '삭제' +
                                    '</button>'

                                $(".addBox").html('');

                                $(".addBox").append(button);
                            }

                            if (date3 < date2) {

                                button = '<button class="btn btn-primary addReview" data-bs-toggle="modal" data-bs-target="#exampleModal4">' +
                                    '모임 일정 후기글 작성' +
                                    '</button>' +
                                    '<button class="btn btn-primary addShort"  data-bs-toggle="modal" data-bs-target="#exampleModal5">' +
                                    '모임 일정 쇼츠' +
                                    '</button>'

                                $(".addBox").html('');

                                $(".addBox").append(button);
                            }


                            var clubCalenderNum = $(".clubCalnderNum").val()

                            //수정 modal 오픈
                            $(".update").on("click", function () {



                                $.ajax({
                                    url: "/clubCal/json/getClubCalender",
                                    method: "POST",
                                    contentType: 'application/json; charset=utf-8',
                                    dataType: "json",
                                    async: false,
                                    data: JSON.stringify({
                                        "clubCalenderNum": clubCalenderNum

                                    }),
                                    success: function (JSONData, result) {

                                        console.log(JSONData.clubCalendar)

                                        var clubCalendar = JSONData.clubCalendar;

                                        $(".clubCalenderNum3").val(clubCalendar.clubCalenderNum);
                                        $(".calenderTitle3").val(clubCalendar.calenderTitle);
                                        $(".calenderText3").val(clubCalendar.calenderText);
                                        $(".clubDate3").val(clubCalendar.clubDate);
                                        $(".noticeTime3").val(clubCalendar.noticeTime);


                                        if (clubCalendar.noticeCheck === '1') {
                                            $(".noticeCheck3").prop("checked", true);
                                        } else {
                                            $(".noticeCheck3").prop("checked", false);
                                        }

                                        if (clubCalendar.calendarApplyCheck === '1') {
                                            $(".calendarApplyCheck3").prop("checked", true);
                                        } else {
                                            $(".calendarApplyCheck3").prop("checked", false);
                                        }

                                        if (clubCalendar.applyAutoCheck === '1') {
                                            $(".applyAutoCheck3").prop("checked", true);
                                        } else {
                                            $(".applyAutoCheck3").prop("checked", false);
                                        }


                                    }
                                });


                            })


                            $(".delete").on("click", function () {


                                $.ajax({
                                    url: "/clubCal/json/deleteClubCalender",
                                    type: "POST",
                                    data: JSON.stringify({"clubCalenderNum": clubCalenderNum}),
                                    dataType: "json",
                                    contentType: 'application/json; charset=UTF-8',
                                    success: function (JSONData, result) {
                                        console.log(result);

                                        // 성공시 해당 창을 닫고 부모창을 reload
                                        Swal.fire({
                                            position: 'top-end',
                                            icon: 'success',
                                            title: 'Your work has been saved',
                                            showConfirmButton: false,
                                            timer: 1500
                                        });

                                        setTimeout(function () {
                                            window.location.reload()
                                        }, 2000);
                                    }

                                })
                            })
                        }


                    })

                })


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

        var clubNum = '${param.clubNum}'

        /*등록 submit*/

        $(".submit").on("click", function () {

            var calenderTitle = $(".calenderTitle").val()
            var calenderText = $(".calenderText").val()
            var clubDate = $(".clubDate").val()
            var location = $(".location").val()
            var noticeCheck = $(".noticeCheck").prop("checked")
            var noticeTime = $(".noticeTime").val()
            var calendarApplyCheck = $(".calendarApplyCheck").prop("checked")
            var applyAutoCheck = $(".applyAutoCheck").prop("checked")
            var boardCategory = '05';


            alert(noticeCheck);
            alert(calendarApplyCheck);
            alert(applyAutoCheck);


            var clubers = $(".clubers")

            var cluber = new Array();

            $.each(clubers, function (index, item) {
                cluber.push($(item).val());
            })

            console.log(cluber)

            $.ajax({
                url: "/clubCal/json/addClubCalender",
                method: "post",
                data: JSON.stringify({
                    "clubNum": clubNum,
                    "calenderTitle": calenderTitle,
                    "calenderText": calenderText,
                    "clubDate": clubDate,
                    "location": location,
                    "noticeCheck": noticeCheck,
                    "noticeTime": noticeTime,
                    "calendarApplyCheck": calendarApplyCheck,
                    "applyAutoCheck": applyAutoCheck

                }),
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function (JSONData, result) {
                    // 등록에 성공하면 해당 boardNum을 return 해서 출력 하고 변수에 등록
                    console.log(JSONData);

                    var boardNum = JSONData

                    var file = ("#file").length

                    alert(file);

                    if (file > 0) {

                        //form 테그를 불러와서 form변수에 등록
                        var form = document.querySelector("#fileForm");
                        //formData 변수에 html에서 form과 같은 역활을 하는 javaScript의 FormData에 form을 넣는다
                        var formData = new FormData(form);
                        //파일 사이즈만큼 formData을 돌리기 위해 fileSize를 알아내는 변수
                        var fileSize = $("#fileForm #file")[0].files;

                        //console.log($("#file")[0].files.length);
                        console.log(fileSize.length);

                        //formData에 해당 게시글 번호, 게시글 category append
                        formData.append("boardNum", boardNum);
                        formData.append("boardCategoru", boardCategory);

                        //file길이 만큼 for문으로 formData에 append함
                        for (var i = 0; i < fileSize.length; i++) {
                            formData.append("form", fileSize[i]);
                            //파일이 잘 들어 갔는지 확인
                            console.log(fileSize[i]);
                        }

                        console.log(formData);
                        //formData에 들어 있는 boardNum과 file의 정보를 비동기식으로 보냄
                        //파일은 json형식으로 보낼수 없기 ?문에 contentType, processData, dataType을 false로 지정
                        $.ajax({
                            url: "/clubCal/json/fileUpload",
                            type: "post",
                            processData: false,
                            contentType: false,
                            cache: false,
                            timeout: 600000,
                            data: formData,
                            headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
                            enctype: "multipart/form-data",
                            success: function (result) {
                                console.log(result);

                            }
                        })
                    }

                    $.ajax({
                        url: "/clubCal/json/addCluber",
                        method: "post",
                        data: JSON.stringify({
                            "cluberList": cluber,
                            "clubCalenderNum": boardNum
                        }),
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        success: function (JSONData, result) {

                        }

                    })

                    console.log(result);
                    // 성공시 해당 창을 닫고 부모창을 reload
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });

                    setTimeout(function () {
                        window.location.reload()
                    }, 2000);
                    //error 발생시 그냥 창을 닫음
                }, error: function () {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    setTimeout(function () {
                        window.location.reload()
                    }, 2000);

                }
            });

        });


        //수정 submit

        $(".updateSubmit").on("click", function () {


            var clubCalenderNum = $(".clubCalenderNum3").val()
            var calenderTitle = $(".calenderTitle3").val()
            var calenderText = $(".calenderText3").val()
            var clubDate = $(".clubDate3").val()
            var location = $(".location3").val()
            var noticeCheck = $(".noticeCheck3").prop("checked")
            var noticeTime = $(".noticeTime3").val();
            var calendarApplyCheck = $(".calendarApplyCheck3").prop("checked")
            var applyAutoCheck = $(".applyAutoCheck3").prop("checked")
            var boardCategory = '05';


            alert(noticeCheck);
            alert(calendarApplyCheck);
            alert(applyAutoCheck);
            alert(noticeTime);

            var clubers = $(".clubers3")

            var cluber = new Array();

            $.each(clubers, function (index, item) {
                cluber.push($(item).val());
            })

            console.log(cluber)

            $.ajax({
                url: "/clubCal/json/updateClubCalender",
                method: "post",
                data: JSON.stringify({
                    "clubCalenderNum" : clubCalenderNum,
                    "calenderTitle": calenderTitle,
                    "calenderText": calenderText,
                    "clubDate": clubDate,
                    "location": location,
                    "noticeCheck": noticeCheck,
                    "noticeTime": noticeTime,
                    "calendarApplyCheck": calendarApplyCheck,
                    "applyAutoCheck": applyAutoCheck

                }),
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function (JSONData, result) {
                    // 등록에 성공하면 해당 boardNum을 return 해서 출력 하고 변수에 등록
                    console.log(JSONData);

                    var boardNum = JSONData

                    var file = ("#file2").length

                    alert(file);

                    if (file > 0) {

                        //form 테그를 불러와서 form변수에 등록
                        var form = document.querySelector("#fileForm2");
                        //formData 변수에 html에서 form과 같은 역활을 하는 javaScript의 FormData에 form을 넣는다
                        var formData = new FormData(form);
                        //파일 사이즈만큼 formData을 돌리기 위해 fileSize를 알아내는 변수
                        var fileSize = $("#fileForm2 #file2")[0].files;

                        //console.log($("#file")[0].files.length);
                        console.log(fileSize.length);

                        //formData에 해당 게시글 번호, 게시글 category append
                        formData.append("boardNum", boardNum);
                        formData.append("boardCategoru", boardCategory);

                        //file길이 만큼 for문으로 formData에 append함
                        for (var i = 0; i < fileSize.length; i++) {
                            formData.append("form", fileSize[i]);
                            //파일이 잘 들어 갔는지 확인
                            console.log(fileSize[i]);
                        }

                        console.log(formData);
                        //formData에 들어 있는 boardNum과 file의 정보를 비동기식으로 보냄
                        //파일은 json형식으로 보낼수 없기 ?문에 contentType, processData, dataType을 false로 지정
                        $.ajax({
                            url: "/clubCal/json/fileUpload",
                            type: "post",
                            processData: false,
                            contentType: false,
                            cache: false,
                            timeout: 600000,
                            data: formData,
                            headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
                            enctype: "multipart/form-data",
                            success: function (result) {
                                console.log(result);

                            }
                        })
                    }

                    $.ajax({
                        url: "/clubCal/json/addCluber",
                        method: "post",
                        data: JSON.stringify({
                            "cluberList": cluber,
                            "clubCalenderNum": boardNum
                        }),
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        success: function (JSONData, result) {

                        }

                    })

                    console.log(result);
                    // 성공시 해당 창을 닫고 부모창을 reload
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });

                    setTimeout(function () {
                        window.location.reload()
                    }, 2000);
                    //error 발생시 그냥 창을 닫음
                }, error: function () {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    setTimeout(function () {
                        window.location.reload()
                    }, 2000);

                }
            });

        });


        $(".file3").on("change", function () {
            if ($(this)[0].files.length > 10){
                alert("파일의 갯수가 초과 했습니다");
                $(this).val('');
            }
        })

        // 등록 버튼 클릭시 해당 이벤트 실핼
        $(".calenderReviewSubmit").on("click", function () {


            //등록할 내용을 가져와서 변수 등록
            var clubCalender = $(".clubCalnderNum").val()
            var reviewTitle = $(".reviewTitle1").val();
            var reviewText = $(".reviewText1").val();
            var reviewRange = $(".reviewRange1").val();
            var boardCategory = '01'

            //ajax로 비동기식으로 RestController로 보냄
            $.ajax({
                url: "/clubCal/json/addClubCalenderReview",
                method: "post",
                data: JSON.stringify({
                    "clubCalenderNum" : clubCalender,
                    "clubNum" : clubNum,
                    "boardCategory": boardCategory,
                    "reviewTitle": reviewTitle,
                    "reviewText": reviewText,
                    "reviewRange": reviewRange
                }),
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function (JSONData, result) {
                    // 등록에 성공하면 해당 boardNum을 return 해서 출력 하고 변수에 등록
                    console.log(JSONData);

                    var boardNum = JSONData

                    var file = ("#file3").length

                    if (file > 0) {

                        //form 테그를 불러와서 form변수에 등록
                        var form = document.querySelector("form");
                        //formData 변수에 html에서 form과 같은 역활을 하는 javaScript의 FormData에 form을 넣는다
                        var formData = new FormData(form);
                        //파일 사이즈만큼 formData을 돌리기 위해 fileSize를 알아내는 변수
                        var fileSize = $("#fileForm3 #file3")[0].files;
                        console.log(fileSize.length);
                        //formData에 해당 게시글 번호, 게시글 category append
                        formData.append("boardNum", boardNum);
                        formData.append("boardCategoru", boardCategory);

                        //file길이 만큼 for문으로 formData에 append함
                        for (var i = 0; i < fileSize.length; i++) {
                            formData.append("form", fileSize[i]);
                            //파일이 잘 들어 갔는지 확인
                            console.log(fileSize[i]);
                        }
                        //formData에 들어 있는 boardNum과 file의 정보를 비동기식으로 보냄
                        //파일은 json형식으로 보낼수 없기 ?문에 contentType, processData, dataType을 false로 지정
                        $.ajax({
                            url: "/clubCal/json/fileUpload",
                            type: "post",
                            processData: false,
                            contentType: false,
                            cache: false,
                            timeout: 600000,
                            data: formData,
                            headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
                            enctype: "multipart/form-data",
                            success: function (result) {

                                console.log(result);

                            }

                        })

                    }
                    // 성공시 해당 창을 닫고 부모창을 reload
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });

                    setTimeout(function () {
                        window.location.reload()
                    }, 2000);
                    //error 발생시 그냥 창을 닫음
                }, error: function () {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    setTimeout(function () {
                        window.location.reload()
                    }, 2000);

                }
            });

        });





        /*      $(".file4").on("change", function () {

                  if($(this)[0].files.length > 1){
                      alert("파일의 갯수가 초과 했습니다");
                      $(this).val('');
                  }

              })*/

        $(".calenderReviewShortSubmit").on("click", function () {
            var clubCalenderNum = $(".clubCalnderNum").val()
            var boardCategory = '02'
            var reviewTitle = $(".reviewTitle5").val();
            var reviewRange = $(".reviewRange5").val();


            $.ajax({
                url: "/clubCal/json/addClubCalenderReview",
                method: "post",
                data: JSON.stringify({
                    "clubNum": clubNum,
                    "clubCalenderNum": clubCalenderNum,
                    "boardCategory": boardCategory,
                    "reviewTitle": reviewTitle,
                    "reviewRange": reviewRange,
                }),
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function (JSONData, result) {
                    // 등록에 성공하면 해당 boardNum을 return 해서 출력 하고 변수에 등록
                    console.log(JSONData);

                    var boardNum = JSONData

                    var file = $("#file4").length

                    if (file > 0) {

                        //form 테그를 불러와서 form변수에 등록
                        var form = document.querySelector("form");
                        //formData 변수에 html에서 form과 같은 역활을 하는 javaScript의 FormData에 form을 넣는다
                        var formData = new FormData(form);
                        //파일 사이즈만큼 formData을 돌리기 위해 fileSize를 알아내는 변수
                        var fileSize = $("#fileForm4 #file4")[0].files;
                        console.log(fileSize.length);
                        //formData에 해당 게시글 번호, 게시글 category append
                        formData.append("boardNum", boardNum);
                        formData.append("boardCategoru", boardCategory);

                        //file길이 만큼 for문으로 formData에 append함
                        for (var i = 0; i < fileSize.length; i++) {
                            formData.append("form", fileSize[i]);
                            //파일이 잘 들어 갔는지 확인
                            console.log(fileSize[i]);
                        }
                        //formData에 들어 있는 boardNum과 file의 정보를 비동기식으로 보냄
                        //파일은 json형식으로 보낼수 없기 ?문에 contentType, processData, dataType을 false로 지정
                        $.ajax({
                            url: "/clubCal/json/fileUpload",
                            type: "post",
                            processData: false,
                            contentType: false,
                            cache: false,
                            timeout: 600000,
                            data: formData,
                            headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
                            enctype: "multipart/form-data",
                            success: function (result) {

                                console.log(result);

                            }

                        })

                        // 성공시 해당 창을 닫고 부모창을 reload
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Your work has been saved',
                            showConfirmButton: false,
                            timer: 1500
                        });

                        setTimeout(function () {
                            window.location.reload()
                        }, 2000);


                    }
                    //error 발생시 그냥 창을 닫음
                }, error: function () {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    setTimeout(function () {
                        window.location.reload()
                    }, 2000);

                }

            });

        });


        $(".close").on("click", function () {
            window.close();
        });




        $(".calenderCluber").on("click", function () {
            window.open(
                "/clubCal/addCalenderCluber?clubNum=${param.clubNum}", '_blnk'
                , "top=200, width=200px, height=700px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no")

        });




    })


</script>

<style>
    .fc-event {
        margin-top: 5px;
        cursor: pointer;
    }

    .check {
        height: 20px;
        width: 35px;
    }
</style>
<html>
<body>
<input hidden class="boardNum" value="${param.clubNum}">
<div class='demo-topbar' style="display: flex;align-items: center;justify-content: center;">
    <div id='calendar-container' style="float: left; width: 50%; font-size: 0.7em; ">
        <div style="display:none; height: 30px; text-align: center; font-size: 30px; font-weight: bold; color: rgba(69, 69, 199, 0.721); margin-bottom: 20px;">
            모임 일정
        </div>
        <div id='calendar' style="padding-top: 30px;"></div>
        <input type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class="addCalender" value="모임 일정 작성">
    </div>
</div>


<%--등록--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <input name="clubCalenderReviewNum" class="clubCalenderReviewNum" hidden value="">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel"> 모임 일정 작성 </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="fileForm">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control calenderTitle" id="recipient-name" value=""
                               placeholder="asdasd">
                        <label for="recipient-name">제 목</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control calenderText" id="message-text" value=""
                               placeholder="asdasd"/>
                        <label for="message-text">일정 내용</label>
                    </div>

                    <div class="form-floating mb-3">

                        <input type="date" class="form-control clubDate" id="date-text" value=""
                               placeholder="asdasd"/>
                        <label for="date-text">모임 일정 날짜</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="button" class="form-control" value="위치 선택">

                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file" class="form-control file" multiple value="파일 첨부">
                    </div>

                    <div class="input-group mb-3">
                        <input type="button" class="form-control calenderCluber" multiple value="모임 인원 추가 하기">

                    </div>


                    <div class=" mb-3 form-check form-switch">
                        알림 설정 여부
                        <input class="form-check-input check noticeCheck" name="noticeCheck" type="checkbox"
                               role="switch" id="flexSwitchCheckDefault1">
                    </div>

                    <hr>


                    <div class="input-group mb-3">
                        알림 시간 설정
                        <input type="time" class="noticeTime" name="noticeTime">
                    </div>

                    <hr>


                    <div class=" mb-3 form-check form-switch">
                        추가 참여 여부
                        <input class="form-check-input check calendarApplyCheck" name="calendarApplyCheck"
                               type="checkbox" role="switch" id="flexSwitchCheckDefault2">

                    </div>

                    <hr>

                    <div class=" mb-3 form-check form-switch">
                        자동 참여 가능
                        <input class="form-check-input check applyAutoCheck" name="applyAutoCheck" type="checkbox"
                               role="switch"
                               id="flexSwitchCheckDefault3">

                    </div>

                    <hr>


                </form>

            </div>

            <div class="mb-3">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary submit">등록</button>

            </div>
        </div>
    </div>
</div>


<%--상세 조회--%>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <input name="clubCalenderReviewNum" class="clubCalenderReviewNum" hidden value="">
            <div class="modal-header">
                <input hidden class="clubCalnderNum" value="">
                <h1 class="modal-title fs-5" id="exampleModalLabe3"> 모임 일정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                <div class="borderBox">

                    <div class="addBox" style=" float: right; display: flex; flex-direction: column;">

                    </div>
                </div>
            </div>
            <div class="modal-body">

                <div class="form-floating mb-3">
                    <input type="text" class="form-control calenderTitle2" id="recipient-name2" value=""
                           placeholder="asdasd">
                    <label for="recipient-name">제 목</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control calenderText2" id="message-text2" value=""
                           placeholder="asdasd"/>
                    <label for="message-text">일정 내용</label>
                </div>

                <div class="form-floating mb-3">

                    <input type="date" class="form-control clubDate2" id="date-text2" value=""
                           placeholder="asdasd"/>
                    <label for="date-text">모임 일정 날짜</label>

                </div>

                <div class="input-group mb-3">

                    <input type="button" class="form-control" value="위치 선택">

                </div>

                <div class="input-group mb-3 fileBox">
                    <div class="shadow-lg midle"
                         style="margin-bottom: 50px; margin-top: -3px; width: 490px; overflow: hidden; height: 400px;">
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
                <div>
                    <div class="input-group mb-3">
                        <button class="btn btn-primary listCalendarCluberView" data-bs-toggle="modal"
                                data-bs-target="#listCalendarCluber">
                            참여자
                        </button>
                    </div>
                    <div class="input-group mb-3">
                        <button class="btn btn-primary addClubCalendarApply" style="display: none">
                            모임 일정 참여
                        </button>
                    </div>
                    <div class="input-group mb-3">
                        <button class="btn btn-primary deleteClubCalendarApply" style="display: none">
                            모임 일정 참여 취소
                        </button>
                    </div>
                </div>


                <div class=" mb-3 form-check form-switch">
                    알림 설정 여부
                    <input class="form-check-input check noticeCheck2" name="noticeCheck" type="checkbox" role="switch"
                           id="flexSwitchCheckDefault4">
                </div>

                <hr>


                <div class="input-group mb-3">
                    알림 시간 설정
                    <input type="time" class="noticeTime2" name="noticeTime">
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

            <div class="mb-3">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>

            </div>
        </div>
    </div>
</div>

<%--수정--%>
<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <input hidden class="clubCalenderNum3"  value="">
            <div class="modal-header">
                <h1 class="modal-title fs-5"> 모임 일정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">

                <form id="fileForm2">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control calenderTitle3" id="recipient-name3" value="" placeholder="asdasd">
                        <label for="recipient-name3">제 목</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control calenderText3" id="message-text3" value="" placeholder="asdasd"/>
                        <label for="message-text3">일정 내용</label>
                    </div>

                    <div class="form-floating mb-3">

                        <input type="date" class="form-control clubDate3" id="date-text3" value="" placeholder="asdasd"/>
                        <label for="date-text3">모임 일정 날짜</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="text" class="form-control location3" value="위치 선택">

                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file2" class="form-control file" multiple value="파일 첨부">

                    </div>

                    <div class="input-group mb-3">
                        <input type="button" class="form-control calenderCluber3" multiple value="모임 인원 추가 하기">

                    </div>


                    <div class=" mb-3 form-check form-switch">
                        알림 설정 여부
                        <input class="form-check-input check noticeCheck3" name="noticeCheck" type="checkbox" role="switch">
                    </div>

                    <hr>


                    <div class="input-group mb-3">
                        알림 시간 설정
                        <input type="time" class="noticeTime3" name="noticeTime">
                    </div>

                    <hr>


                    <div class=" mb-3 form-check form-switch">
                        추가 참여 여부
                        <input class="form-check-input check calendarApplyCheck3" name="calendarApplyCheck" type="checkbox" role="switch">

                    </div>

                    <hr>

                    <div class=" mb-3 form-check form-switch">
                        자동 참여 가능
                        <input class="form-check-input check applyAutoCheck3" name="applyAutoCheck" type="checkbox" role="switch">

                    </div>

                    <hr>


                </form>

            </div>

            <div class="mb-3">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary updateSubmit">수정</button>

            </div>
        </div>
    </div>
</div>





<%--모임 일정 후기글 등록--%>
<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel3"> 모임 일정 후기글 </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="fileForm3">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control reviewTitle1" id="recipient-name4" value="" placeholder="asdasd">
                        <label for="recipient-name" >제 목</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control reviewText1" id="message-text4" value="" placeholder="asdasd"/>
                        <label for="message-text">내용</label>
                    </div>

                    <div class="form-floating mb-3">

                        <select class="form-select reviewRange1" name="reviewRange" id="floatingSelect1">
                            <option selected>공개 여부를 선택 하세요</option>
                            <option value="1">전체 공개</option>
                            <option value="2">모임 공개</option>
                        </select>

                        <label for="floatingSelect">공개 여부</label>


                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file3" class="form-control file3" multiple  value="파일 첨부">
                    </div>

                    <div class="form-floating mb-3">

                        <input type="date" class="form-control clubDate1" id="date-text4" value="" placeholder="asdasd"/>
                        <label for="date-text">모임 일정 날짜</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="text"  class="form-control location1"   value="위치 선택">

                    </div>

                </form>

            </div>

            <div class="mb-3">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary calenderReviewSubmit">등록</button>

            </div>
        </div>
    </div>
</div>


<%--모임 일정 후기 쇼츠--%>
<div class="modal fade" id="exampleModal5" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel4"> 모임 일정 후기글 쇼츠 작성 </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="fileForm4">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control reviewTitle2" id="recipient-name5" value="" placeholder="asdasd">
                        <label for="recipient-name" >제 목</label>
                    </div>

                    <div class="form-floating mb-3">

                        <select class="form-select reviewRange2" name="reviewRange" id="floatingSelect">
                            <option selected>공개 여부를 선택 하세요</option>
                            <option value="1">전체 공개</option>
                            <option value="2">모임 공개</option>
                        </select>

                        <label for="floatingSelect">공개 여부</label>


                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file4" class="form-control file4" multiple  value="파일 첨부">
                    </div>

                    <div class="form-floating mb-3">

                        <input type="date" class="form-control clubDate2" id="date-text5" value="" placeholder="asdasd"/>
                        <label for="date-text">모임 일정 날짜</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="text"  class="form-control location2"   value="위치 선택">

                    </div>

                </form>

            </div>

            <div class="mb-3">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary calenderReviewShortSubmit">등록</button>

            </div>
        </div>
    </div>
</div>








<%--거래 일정 상세 조회--%>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <input type="hidden" class="dealNum" value="">
                <h1 class="modal-title fs-5" id="exampleModalLabel2"> 거래 일정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">


                <div class="form-floating mb-3">
                    <input type="text" class="form-control dealCalenderTitle2" value=""
                           placeholder="asdasd">
                    <label for="recipient-name">제 목</label>
                </div>


                <div class="form-floating mb-3">

                    <input type="date" class="form-control dealDate2"  value="" placeholder="asdasd"/>
                    <label for="date-text">모임 일정 날짜</label>

                </div>

                <div class="input-group mb-3">

                    <input type="text" class="form-control dealLocation2" value="위치 선택">

                </div>


            </div>

            <div class="modal-footer" style=" justify-content:center;">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-info updateSubmit">수정</button>
                <button type="button" class="btn btn-secondary getDealPage">게시글 상세 조회</button>

            </div>
        </div>
    </div>
</div>

</body>
</html>


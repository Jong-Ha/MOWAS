<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<link rel="stylesheet" href="/resources/OpenSource/fullcalendar-5.11.3/lib/main.css">
<script type="text/javascript"
        src="/resources/OpenSource/fullcalendar-5.11.3/lib/main.min.js"></script>

<script>
    var calendar = null;

    function calenderInfo() {

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






                    if(${currentCluber.cluberStatus=='4'||currentCluber.cluberStatus=='5'||currentCluber.cluberStatus=='6'}){


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

                            // 상세 조회
                            $(".clubCalnderNum").val(clubCalendar.clubCalenderNum);
                            $(".calenderTitle2").val(clubCalendar.calenderTitle);
                            $(".calenderText2").val(clubCalendar.calenderText);
                            $(".clubDate2").val(clubCalendar.clubDate);
                            $(".location2").val(clubCalendar.location)
                            $(".noticeTime2").val(clubCalendar.noticeTime);



                            //모임 일정 후기 등록 할떄 정보 display

                            $(".clubDate4").val(clubCalendar.clubDate);
                            $(".location4").val(clubCalendar.location)



                            $(".clubDate5").val(clubCalendar.clubDate);
                            $(".location5").val(clubCalendar.location)

                            $.ajax({
                                url: '/club/json/getCalendarCluberCondition',
                                data: JSON.stringify({
                                    clubCalendarNum: clubCalendar.clubCalenderNum,
                                    userId: '${user.userId}'
                                }),
                                method: 'post',
                                contentType: 'application/json; charset=utf-8',
                                success: function (re) {

                                    const applyCondition = re.condition

                                    if (applyCondition === '0') {

                                        $('#exampleModal2 .deleteClubCalendarApply').css('display', '')

                                    } else if (applyCondition === '1') {

                                    } else {
                                        $('#exampleModal2 .addClubCalendarApply').css('display', '')
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

                            if(clubCalendar.file.length===0){
                                $('.slide').parents('.fileBox').remove()
                            }else {
                                $.each(clubCalendar.file, function (index, item) {

                                    console.log("====================" + item.fileName);


                                    str +=

                                        '<div class="carousel-inner">' +
                                        '<div class="carousel-item active" data-bs-interval="2000">' +
                                        '<img src="/resources' + item.fileName + '" width="490px" height="400px">' +
                                        '</div>' +
                                        '</div>'


                                })

                                $(".slide").html(str);
                            }

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

                                button =
                                    '<button class="btn btn-primary update" data-bs-toggle="modal" data-bs-target="#exampleModal3">' +
                                    '수정' +
                                    '</button>' +
                                    '<button class="btn btn-danger delete">' +
                                    '삭제' +
                                    '</button>'

                                $(".addBox").html('');
                                $(".addBox2").html('');

                                $(".addBox").append(button);
                            }

                            if (date3 < date2) {

                                button = '<button class="btn btn-primary addReview" data-bs-toggle="modal" data-bs-target="#exampleModal4">' +
                                    '후기글 작성' +
                                    '</button>' +
                                    '<button class="btn btn-primary addShort"  data-bs-toggle="modal" data-bs-target="#exampleModal5">' +
                                    '쇼츠 작성' +
                                    '</button>'

                                $(".addBox").html('');
                                $(".addBox2").html('');

                                $(".addBox2").append(button);
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
                                            icon: 'warning',
                                            title: '게시글이 삭제 됩니다',
                                            showConfirmButton: false,
                                            timer: 1500
                                        });

                                        setTimeout(function () {

                                            $('#exampleModal2').modal("hide");

                                            calenderInfo()

                                        }, 2000);
                                    }

                                })
                            })
                        }


                    })
                    }else{

                        Swal.fire({
                            icon: 'error',
                            title: '사용할수 없는 기능 입니다',
                            text: '모임원만 조회할 수 있습니다',
                            footer: '<a href="">Why do I have this issue?</a>'
                        })
                    }
                })


            },

            locale: 'ko'
        });

        calendar.render();


    }

    function upSize() {
        calendar.updateSize()
    }

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

        calenderInfo()

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
                        icon: 'success',
                        title: '일정 등록에 성공 했습니다',
                        showConfirmButton: false,
                        timer: 1500
                    });

                    setTimeout(function () {

                        $('#exampleModal').modal("hide");

                        calenderInfo()


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

                        $('#exampleModal').modal("hide");

                        calenderInfo()

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
            var calendarApplyCheck = $(".calendarApplyCheck3").prop("checked")
            var applyAutoCheck = $(".applyAutoCheck3").prop("checked")
            var boardCategory = '05';



            $.ajax({
                url: "/clubCal/json/updateClubCalender",
                method: "post",
                data: JSON.stringify({
                    "clubCalenderNum": clubCalenderNum,
                    "calenderTitle": calenderTitle,
                    "calenderText": calenderText,
                    "clubDate": clubDate,
                    "location": location,
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


                    console.log(result);
                    // 성공시 해당 창을 닫고 부모창을 reload
                    Swal.fire({
                        icon: 'success',
                        title: '수정 되었습니다',
                        showConfirmButton: false,
                        timer: 1500
                    });

                    setTimeout(function () {

                        $('#exampleModal3').modal("hide");

                        calenderInfo()

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

                        $('#exampleModal3').modal("hide");

                        calenderInfo()

                    }, 2000);

                }
            });

        });


        $(".file3").on("change", function () {
            if ($(this)[0].files.length > 10) {
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
            var boardCategory = '1'

            //ajax로 비동기식으로 RestController로 보냄
            $.ajax({
                url: "/clubCal/json/addClubCalenderReview",
                method: "post",
                data: JSON.stringify({
                    "clubCalenderNum": clubCalender,
                    "clubNum": clubNum,
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
                        icon: 'success',
                        title: '모임 일정 후기글이 등록 되었습니다',
                        showConfirmButton: false,
                        timer: 1500
                    });

                    setTimeout(function () {

                        $('#exampleModal4').modal("hide");

                        calenderInfo()

                    }, 2000);
                    //error 발생시 그냥 창을 닫음
                }, error: function () {
                    Swal.fire({
                        icon: 'error',
                        title: '등록 실패',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    setTimeout(function () {

                        $('#exampleModal4').modal("hide");

                        calenderInfo()

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
            var boardCategory = '2'
            var reviewTitle = $(".reviewTitle2").val();
            var reviewRange = $(".reviewRange2").val();


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
                            icon: 'success',
                            title: '모임 일정 후기 쇼츠글 작성이 성공하였습니다',
                            showConfirmButton: false,
                            timer: 1500
                        });

                        setTimeout(function () {

                            $('#exampleModal5').modal("hide");

                            calenderInfo()

                        }, 2000);


                    }
                    //error 발생시 그냥 창을 닫음
                }, error: function () {
                    Swal.fire({
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    setTimeout(function () {

                        $('#exampleModal5').modal("hide");

                        calenderInfo()

                    }, 2000);

                }

            });

        });

        /*모임원 등록*/
        $(".calenderCluber").on("click", function () {

            var clubNum = '${param.clubNum}'


            $.ajax({
                url: "/clubCal/json/addCalenderCluber",
                method: "post",
                dataType: "json",
                contentType: 'application/json; charset=UTF-8',
                data: JSON.stringify({
                    clubNum : clubNum
                }),
                success: function (json) {
                    console.log(json)

                    var str = ' ';

                    $.each(json.list , function (index,item) {

                    str +=
                        '<div class="cluberList"  style= " margin-bottom: 20px; display: flex; justify-content: center; align-items: center; align-content: center;">'+
                        '      <div class="shadow-lg"  style=" height: 89px; border-radius: 10px; display: flex; flex-direction: row; width: 80%;">'+
                        '           <div class="userPoto" style=" height: 86px; padding: 6px; width: 42%; overflow: hidden;  align-items: center;  justify-content: center;">'+
                        '               <img src="/resources/'+item.user.userImage+'" style=" width: 100%;">'+
                        '           </div>'+
                        '           <div class="userId" style=" height: 100%; width: 80%;">'+item.user.userId+'</div>'+
                        '           <input hidden class="inputUser" value="'+item.user.userId+'">'+
                        '       </div>'+
                        '       <input type="checkbox" class="btn btn-primary btn-lg add" style="width: 30px;height: 30px; margin-left: 10px; display: flex;"/>'+
                        '</div>'

                    })

                    $(".cluberListBox").html(str);

                    $(".add").on("click", function () {
                       var userId = $(this).parents(".cluberList").find(".inputUser").val()

                            $(document).find("#fileForm").append($("<input type='hidden' class='clubers' value='"+userId+"'/>"));


                    });
                }
            })

            $(".close").on("click", function () {

                $("#calenderCluber").modal("hide")
                $("#exampleModal").modal("show");

            });
        })



        //일정 등록
        $("#location1").on("shown.bs.modal", function () {
            relayout1();
        })


        $(".location2").on("click", function () {
            var location = $(".location2").val();

            $("#location2 .modal-content").load("/view/site/getCalenderMap.jsp",
                {location: location},
                function (re) {

                    $("#location2 .modal-content").html(re);

                    $("#location2").modal("show")

                    $("#location2 .getLocation").on("click", function () {

                        $("#location2").modal("hide")
                        $("#exampleModal2").modal("show");
                    })

                })




        })

        //상세보기 지도 보기
        $("#location2").on("shown.bs.modal", () => {
            getClubLocation();
        })

        //일정 수정
        $("#location3").on("shown.bs.modal", function () {
            relayout2();
        })

    })


</script>

<style>
    .fc-event {
        margin-top: 5px;
        cursor: pointer;
    }

    #getCalendarFooter button {
        margin : 5px;
    }

    .check {
        height: 20px;
        width: 35px;
    }
</style>
<input hidden class="boardNum" value="${param.clubNum}">
<div class='demo-topbar' style="display: flex;align-items: center;justify-content: center;">
    <div id='calendar-container' style="float: left; width: 80%; font-size: 0.7em; ">
        <div style="display:none; height: 30px; text-align: center; font-size: 30px; font-weight: bold; color: rgba(69, 69, 199, 0.721); margin-bottom: 20px;">
            모임 일정
        </div>
        <div id='calendar' style="padding-top: 30px;"></div>
        <c:if test="${param.cluberStatus=='5'||param.cluberStatus=='6'}">
            <input type="button" data-bs-toggle="modal" data-bs-target="#exampleModal"
                   class="btn btn-primary addCalender" value="모임 일정 작성" style=" font-size: 2em; margin-top: 30px">
        </c:if>
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

                        <input type="button" class="form-control" data-bs-toggle="modal" data-bs-target="#location1"
                               value="위치 선택">

                        <div class="input-group input-group-sm mb-3">
                            <span class="input-group-text" id="inputGroup-sizing-sm">위치 정보</span>
                            <input type="text" class="form-control location" aria-label="위치 정보"
                                   aria-describedby="inputGroup-sizing-sm">
                        </div>

                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file" class="form-control file" multiple value="파일 첨부">
                    </div>

                    <div class="input-group mb-3">
                        <input type="button" class="form-control calenderCluber" data-bs-toggle="modal"
                               data-bs-target="#calenderCluber" value="모임 인원 추가 하기">

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
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <input name="clubCalenderReviewNum" class="clubCalenderReviewNum" hidden value="">
            <div class="modal-header">
                <input hidden class="clubCalnderNum" value="">
                <h1 class="modal-title fs-5" id="exampleModalLabe3"> 모임 일정 상세 조회</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>


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

                    <input type="button" class="form-control location2" data-bs-toggle="modal"
                           data-bs-target="#location2" value="위치 보기">

                </div>

                <div class="input-group mb-3 fileBox">
                    <div class="shadow-lg midle"
                         style="margin-bottom: 50px; margin-top: -3px; overflow: hidden;">
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



            </div>
<div id="getCalendarFooter" class="modal-footer" style="justify-content: space-between">

    <div style="display: flex;justify-content: space-around;align-items: center;">
        <div class="input-group mb-3" style="width: fit-content">
            <button class="btn btn-primary listCalendarCluberView" data-bs-toggle="modal"
                    data-bs-target="#listCalendarCluber">
                참여자
            </button>
        </div>
        <div class="mb-3">
            <div class="input-group">
                <button class="btn btn-primary addClubCalendarApply" style="display: none">
                    참여하기
                </button>
            </div>
            <div class="input-group">
                <button class="btn btn-primary deleteClubCalendarApply" style="display: none">
                    참여취소
                </button>
            </div>
        </div>
    </div>

    <div class="mb-3" style="    display: flex; align-items: center;    justify-content: center;">
        <c:if test="${param.cluberStatus=='5'||param.cluberStatus=='6'}">
            <div class="addBox"
                 style="    display: flex;"></div>
        </c:if>

        <div class="addBox2"
             style=" display: flex;"></div>

    </div>
</div>

        </div>
    </div>
</div>

<%--수정--%>
<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <input hidden class="clubCalenderNum3" value="">
            <div class="modal-header">
                <h1 class="modal-title fs-5"> 모임 일정 수정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">

                <form id="fileForm2">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control calenderTitle3" id="recipient-name3" value=""
                               placeholder="asdasd">
                        <label for="recipient-name3">제 목</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control calenderText3" id="message-text3" value=""
                               placeholder="asdasd"/>
                        <label for="message-text3">일정 내용</label>
                    </div>

                    <div class="form-floating mb-3">

                        <input type="date" class="form-control clubDate3" id="date-text3" value=""
                               placeholder="asdasd"/>
                        <label for="date-text3">모임 일정 날짜</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="button" class="form-control" data-bs-toggle="modal" data-bs-target="#location3" value="위치 선택">

                        <div class="input-group input-group-sm mb-3">
                            <span class="input-group-text">위치 정보</span>
                            <input type="text" class="form-control location3" aria-label="위치 정보"
                                   aria-describedby="inputGroup-sizing-sm">
                        </div>

                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file2" class="form-control file" multiple value="파일 첨부">

                    </div>


                    <hr>


                    <div class=" mb-3 form-check form-switch">
                        추가 참여 여부
                        <input class="form-check-input check calendarApplyCheck3" name="calendarApplyCheck"
                               type="checkbox" role="switch">

                    </div>

                    <hr>

                    <div class=" mb-3 form-check form-switch">
                        자동 참여 가능
                        <input class="form-check-input check applyAutoCheck3" name="applyAutoCheck" type="checkbox"
                               role="switch">

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
<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel3"> 모임 일정 후기글 </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="fileForm3">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control reviewTitle1" id="recipient-name4" value=""
                               placeholder="asdasd">
                        <label for="recipient-name">제 목</label>
                    </div>

                    <div class="form-floating mb-3">
                        <textarea type="text" class="form-control reviewText1" id="message-text4" value=""
                                  placeholder="asdasd" style="height: 150px"></textarea>
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
                        <input type="file" id="file3" class="form-control file3" multiple value="파일 첨부">
                    </div>

                    <div class="form-floating mb-3">

                        <input type="date" class="form-control clubDate4" id="date-text4" value=""
                               placeholder="asdasd"/>
                        <label for="date-text">모임 일정 날짜</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="button" class="form-control location4" data-bs-toggle="modal"
                               data-bs-target="#location2" value="위치 보기">

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
<div class="modal fade" id="exampleModal5" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel4"> 모임 일정 후기글 쇼츠 작성 </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="fileForm4">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control reviewTitle2" id="recipient-name5" value=""
                               placeholder="asdasd">
                        <label for="recipient-name">제 목</label>
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
                        <input type="file" id="file4" class="form-control file4" multiple value="파일 첨부">
                    </div>

                    <div class="form-floating mb-3">

                        <input type="date" class="form-control clubDate5" id="date-text5" value=""
                               placeholder="asdasd"/>
                        <label for="date-text">모임 일정 날짜</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="button" class="form-control location5" data-bs-toggle="modal"
                               data-bs-target="#location2" value="위치 보기">

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


<%--모임원 상세 조회--%>
<div class="modal fade" id="calenderCluber" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <input name="clubCalenderReviewNum" class="clubCalenderReviewNum" hidden value="">
            <div class="modal-header">
                <h1 class="modal-title fs-5"> 모임 인원 추가 하기 </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body cluberListBox" style="display: flex;flex-direction: column;flex-wrap: wrap;align-content: center;">


            </div>


            <div class="mb-3">

                <button type="button" class="btn btn-secondary close">닫기</button>

            </div>

        </div>
    </div>
</div>


<%--등록 지도--%>
<div class="modal fade" id="location1" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <jsp:include page="/view/site/addCalenderMap.jsp"/>

        </div>
    </div>
</div>


<%--상세조회 지도--%>
<div class="modal fade" id="location2" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">


        </div>
    </div>
</div>


<%--수정 지도--%>
<div class="modal fade" id="location3" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <jsp:include page="/view/site/updateCalenderMap.jsp"/>

        </div>
    </div>
</div>


</body>
</html>


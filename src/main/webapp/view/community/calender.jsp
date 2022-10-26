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

                $(function () {

                    //�� ��ȸ modal ����
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
                                    '����' +
                                    '</button>' +
                                    '<button class="btn btn-primary delete">' +
                                    '����' +
                                    '</button>'

                                $(".addBox").html('');

                                $(".addBox").append(button);
                            }

                            if (date3 < date2) {

                                button = '<button class="btn btn-primary addReview" data-bs-toggle="modal" data-bs-target="#exampleModal4">' +
                                        '���� ���� �ı�� �ۼ�' +
                                        '</button>' +
                                        '<button class="btn btn-primary addShort"  data-bs-toggle="modal" data-bs-target="#exampleModal5">' +
                                        '���� ���� ����' +
                                        '</button>'

                                $(".addBox").html('');

                                $(".addBox").append(button);
                            }


                            var clubCalenderNum = $(".clubCalnderNum").val()

                            //���� modal ����
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

                                        // ������ �ش� â�� �ݰ� �θ�â�� reload
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

        /*��� submit*/

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
                    // ��Ͽ� �����ϸ� �ش� boardNum�� return �ؼ� ��� �ϰ� ������ ���
                    console.log(JSONData);

                    var boardNum = JSONData

                    var file = ("#file").length

                    alert(file);

                    if (file > 0) {

                        //form �ױ׸� �ҷ��ͼ� form������ ���
                        var form = document.querySelector("#fileForm");
                        //formData ������ html���� form�� ���� ��Ȱ�� �ϴ� javaScript�� FormData�� form�� �ִ´�
                        var formData = new FormData(form);
                        //���� �����ŭ formData�� ������ ���� fileSize�� �˾Ƴ��� ����
                        var fileSize = $("#fileForm #file")[0].files;

                        //console.log($("#file")[0].files.length);
                        console.log(fileSize.length);

                        //formData�� �ش� �Խñ� ��ȣ, �Խñ� category append
                        formData.append("boardNum", boardNum);
                        formData.append("boardCategoru", boardCategory);

                        //file���� ��ŭ for������ formData�� append��
                        for (var i = 0; i < fileSize.length; i++) {
                            formData.append("form", fileSize[i]);
                            //������ �� ��� ������ Ȯ��
                            console.log(fileSize[i]);
                        }

                        console.log(formData);
                        //formData�� ��� �ִ� boardNum�� file�� ������ �񵿱������ ����
                        //������ json�������� ������ ���� ?���� contentType, processData, dataType�� false�� ����
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
                    // ������ �ش� â�� �ݰ� �θ�â�� reload
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
                    //error �߻��� �׳� â�� ����
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


        //���� submit

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
                    // ��Ͽ� �����ϸ� �ش� boardNum�� return �ؼ� ��� �ϰ� ������ ���
                    console.log(JSONData);

                    var boardNum = JSONData

                    var file = ("#file2").length

                    alert(file);

                    if (file > 0) {

                        //form �ױ׸� �ҷ��ͼ� form������ ���
                        var form = document.querySelector("#fileForm2");
                        //formData ������ html���� form�� ���� ��Ȱ�� �ϴ� javaScript�� FormData�� form�� �ִ´�
                        var formData = new FormData(form);
                        //���� �����ŭ formData�� ������ ���� fileSize�� �˾Ƴ��� ����
                        var fileSize = $("#fileForm2 #file2")[0].files;

                        //console.log($("#file")[0].files.length);
                        console.log(fileSize.length);

                        //formData�� �ش� �Խñ� ��ȣ, �Խñ� category append
                        formData.append("boardNum", boardNum);
                        formData.append("boardCategoru", boardCategory);

                        //file���� ��ŭ for������ formData�� append��
                        for (var i = 0; i < fileSize.length; i++) {
                            formData.append("form", fileSize[i]);
                            //������ �� ��� ������ Ȯ��
                            console.log(fileSize[i]);
                        }

                        console.log(formData);
                        //formData�� ��� �ִ� boardNum�� file�� ������ �񵿱������ ����
                        //������ json�������� ������ ���� ?���� contentType, processData, dataType�� false�� ����
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
                    // ������ �ش� â�� �ݰ� �θ�â�� reload
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
                    //error �߻��� �׳� â�� ����
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
                alert("������ ������ �ʰ� �߽��ϴ�");
                $(this).val('');
            }
        })

        // ��� ��ư Ŭ���� �ش� �̺�Ʈ ����
        $(".calenderReviewSubmit").on("click", function () {


            //����� ������ �����ͼ� ���� ���
            var clubCalender = $(".clubCalnderNum").val()
            var reviewTitle = $(".reviewTitle1").val();
            var reviewText = $(".reviewText1").val();
            var reviewRange = $(".reviewRange1").val();
            var boardCategory = '01'

            //ajax�� �񵿱������ RestController�� ����
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
                    // ��Ͽ� �����ϸ� �ش� boardNum�� return �ؼ� ��� �ϰ� ������ ���
                    console.log(JSONData);

                    var boardNum = JSONData

                    var file = ("#file3").length

                    if (file > 0) {

                        //form �ױ׸� �ҷ��ͼ� form������ ���
                        var form = document.querySelector("form");
                        //formData ������ html���� form�� ���� ��Ȱ�� �ϴ� javaScript�� FormData�� form�� �ִ´�
                        var formData = new FormData(form);
                        //���� �����ŭ formData�� ������ ���� fileSize�� �˾Ƴ��� ����
                        var fileSize = $("#fileForm3 #file3")[0].files;
                        console.log(fileSize.length);
                        //formData�� �ش� �Խñ� ��ȣ, �Խñ� category append
                        formData.append("boardNum", boardNum);
                        formData.append("boardCategoru", boardCategory);

                        //file���� ��ŭ for������ formData�� append��
                        for (var i = 0; i < fileSize.length; i++) {
                            formData.append("form", fileSize[i]);
                            //������ �� ��� ������ Ȯ��
                            console.log(fileSize[i]);
                        }
                        //formData�� ��� �ִ� boardNum�� file�� ������ �񵿱������ ����
                        //������ json�������� ������ ���� ?���� contentType, processData, dataType�� false�� ����
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
                    // ������ �ش� â�� �ݰ� �θ�â�� reload
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
                    //error �߻��� �׳� â�� ����
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
                alert("������ ������ �ʰ� �߽��ϴ�");
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
                    // ��Ͽ� �����ϸ� �ش� boardNum�� return �ؼ� ��� �ϰ� ������ ���
                    console.log(JSONData);

                    var boardNum = JSONData

                    var file = $("#file4").length

                    if (file > 0) {

                        //form �ױ׸� �ҷ��ͼ� form������ ���
                        var form = document.querySelector("form");
                        //formData ������ html���� form�� ���� ��Ȱ�� �ϴ� javaScript�� FormData�� form�� �ִ´�
                        var formData = new FormData(form);
                        //���� �����ŭ formData�� ������ ���� fileSize�� �˾Ƴ��� ����
                        var fileSize = $("#fileForm4 #file4")[0].files;
                        console.log(fileSize.length);
                        //formData�� �ش� �Խñ� ��ȣ, �Խñ� category append
                        formData.append("boardNum", boardNum);
                        formData.append("boardCategoru", boardCategory);

                        //file���� ��ŭ for������ formData�� append��
                        for (var i = 0; i < fileSize.length; i++) {
                            formData.append("form", fileSize[i]);
                            //������ �� ��� ������ Ȯ��
                            console.log(fileSize[i]);
                        }
                        //formData�� ��� �ִ� boardNum�� file�� ������ �񵿱������ ����
                        //������ json�������� ������ ���� ?���� contentType, processData, dataType�� false�� ����
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

                        // ������ �ش� â�� �ݰ� �θ�â�� reload
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
                    //error �߻��� �׳� â�� ����
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
<div class='demo-topbar'>
    <div id='external-events'
         style="float: left; width: 20%; margin-top: 75px; padding: 5px; margin-bottom: 50px;"></div>
    <div id='calendar-container' style="float: left; width: 50%; font-size: 0.7em; ">
        <div style="height: 30px; text-align: center; font-size: 30px; font-weight: bold; color: rgba(69, 69, 199, 0.721); margin-bottom: 20px;">
            ���� ����
        </div>
        <div id='calendar'></div>
        <input type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class="addCalender" value="���� ���� �ۼ�">
    </div>
</div>


<%--���--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <input name="clubCalenderReviewNum" class="clubCalenderReviewNum" hidden value="">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel"> ���� ���� �ۼ� </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="fileForm">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control calenderTitle" id="recipient-name" value=""
                               placeholder="asdasd">
                        <label for="recipient-name">�� ��</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control calenderText" id="message-text" value=""
                               placeholder="asdasd"/>
                        <label for="message-text">���� ����</label>
                    </div>

                    <div class="form-floating mb-3">

                        <input type="date" class="form-control clubDate" id="date-text" value=""
                               placeholder="asdasd"/>
                        <label for="date-text">���� ���� ��¥</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="button" class="form-control" value="��ġ ����">

                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file" class="form-control file" multiple value="���� ÷��">
                    </div>

                    <div class="input-group mb-3">
                        <input type="button" class="form-control calenderCluber" multiple value="���� �ο� �߰� �ϱ�">

                    </div>


                    <div class=" mb-3 form-check form-switch">
                        �˸� ���� ����
                        <input class="form-check-input check noticeCheck" name="noticeCheck" type="checkbox"
                               role="switch" id="flexSwitchCheckDefault1">
                    </div>

                    <hr>


                    <div class="input-group mb-3">
                        �˸� �ð� ����
                        <input type="time" class="noticeTime" name="noticeTime">
                    </div>

                    <hr>


                    <div class=" mb-3 form-check form-switch">
                        �߰� ���� ����
                        <input class="form-check-input check calendarApplyCheck" name="calendarApplyCheck"
                               type="checkbox" role="switch" id="flexSwitchCheckDefault2">

                    </div>

                    <hr>

                    <div class=" mb-3 form-check form-switch">
                        �ڵ� ���� ����
                        <input class="form-check-input check applyAutoCheck" name="applyAutoCheck" type="checkbox"
                               role="switch"
                               id="flexSwitchCheckDefault3">

                    </div>

                    <hr>


                </form>

            </div>

            <div class="mb-3">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�ݱ�</button>
                <button type="button" class="btn btn-primary submit">���</button>

            </div>
        </div>
    </div>
</div>


<%--�� ��ȸ--%>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <input name="clubCalenderReviewNum" class="clubCalenderReviewNum" hidden value="">
            <div class="modal-header">
                <input hidden class="clubCalnderNum" value="">
                <h1 class="modal-title fs-5" id="exampleModalLabe3"> ���� ����</h1>
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
                    <label for="recipient-name">�� ��</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control calenderText2" id="message-text2" value=""
                           placeholder="asdasd"/>
                    <label for="message-text">���� ����</label>
                </div>

                <div class="form-floating mb-3">

                    <input type="date" class="form-control clubDate2" id="date-text2" value=""
                           placeholder="asdasd"/>
                    <label for="date-text">���� ���� ��¥</label>

                </div>

                <div class="input-group mb-3">

                    <input type="button" class="form-control" value="��ġ ����">

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
                            ������
                        </button>
                    </div>
                    <div class="input-group mb-3">
                        <button class="btn btn-primary addClubCalendarApply" style="display: none">
                            ���� ���� ����
                        </button>
                    </div>
                    <div class="input-group mb-3">
                        <button class="btn btn-primary deleteClubCalendarApply" style="display: none">
                            ���� ���� ���� ���
                        </button>
                    </div>
                </div>


                <div class=" mb-3 form-check form-switch">
                    �˸� ���� ����
                    <input class="form-check-input check noticeCheck2" name="noticeCheck" type="checkbox" role="switch"
                           id="flexSwitchCheckDefault4">
                </div>

                <hr>


                <div class="input-group mb-3">
                    �˸� �ð� ����
                    <input type="time" class="noticeTime2" name="noticeTime">
                </div>

                <hr>


                <div class=" mb-3 form-check form-switch">
                    �߰� ���� ����
                    <input class="form-check-input check calendarApplyCheck2" name="calendarApplyCheck" type="checkbox"
                           role="switch" id="flexSwitchCheckDefault5">

                </div>

                <hr>

                <div class=" mb-3 form-check form-switch">
                    �ڵ� ���� ����
                    <input class="form-check-input check applyAutoCheck2" name="applyAutoCheck" type="checkbox"
                           role="switch"
                           id="flexSwitchCheckDefault6">

                </div>

                <hr>


            </div>

            <div class="mb-3">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�ݱ�</button>

            </div>
        </div>
    </div>
</div>

<%--����--%>
<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <input hidden class="clubCalenderNum3"  value="">
            <div class="modal-header">
                <h1 class="modal-title fs-5"> ���� ����</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">

                <form id="fileForm2">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control calenderTitle3" id="recipient-name3" value="" placeholder="asdasd">
                        <label for="recipient-name3">�� ��</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control calenderText3" id="message-text3" value="" placeholder="asdasd"/>
                        <label for="message-text3">���� ����</label>
                    </div>

                    <div class="form-floating mb-3">

                        <input type="date" class="form-control clubDate3" id="date-text3" value="" placeholder="asdasd"/>
                        <label for="date-text3">���� ���� ��¥</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="text" class="form-control location3" value="��ġ ����">

                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file2" class="form-control file" multiple value="���� ÷��">

                    </div>

                    <div class="input-group mb-3">
                        <input type="button" class="form-control calenderCluber3" multiple value="���� �ο� �߰� �ϱ�">

                    </div>


                    <div class=" mb-3 form-check form-switch">
                        �˸� ���� ����
                        <input class="form-check-input check noticeCheck3" name="noticeCheck" type="checkbox" role="switch">
                    </div>

                    <hr>


                    <div class="input-group mb-3">
                        �˸� �ð� ����
                        <input type="time" class="noticeTime3" name="noticeTime">
                    </div>

                    <hr>


                    <div class=" mb-3 form-check form-switch">
                        �߰� ���� ����
                        <input class="form-check-input check calendarApplyCheck3" name="calendarApplyCheck" type="checkbox" role="switch">

                    </div>

                    <hr>

                    <div class=" mb-3 form-check form-switch">
                        �ڵ� ���� ����
                        <input class="form-check-input check applyAutoCheck3" name="applyAutoCheck" type="checkbox" role="switch">

                    </div>

                    <hr>


                </form>

            </div>

            <div class="mb-3">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�ݱ�</button>
                <button type="button" class="btn btn-primary updateSubmit">����</button>

            </div>
        </div>
    </div>
</div>





<%--���� ���� �ı�� ���--%>
<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel3"> ���� ���� �ı�� </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="fileForm3">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control reviewTitle1" id="recipient-name4" value="" placeholder="asdasd">
                        <label for="recipient-name" >�� ��</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control reviewText1" id="message-text4" value="" placeholder="asdasd"/>
                        <label for="message-text">����</label>
                    </div>

                    <div class="form-floating mb-3">

                        <select class="form-select reviewRange1" name="reviewRange" id="floatingSelect1">
                            <option selected>���� ���θ� ���� �ϼ���</option>
                            <option value="1">��ü ����</option>
                            <option value="2">���� ����</option>
                        </select>

                        <label for="floatingSelect">���� ����</label>


                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file3" class="form-control file3" multiple  value="���� ÷��">
                    </div>

                    <div class="form-floating mb-3">

                        <input type="date" class="form-control clubDate1" id="date-text4" value="" placeholder="asdasd"/>
                        <label for="date-text">���� ���� ��¥</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="text"  class="form-control location1"   value="��ġ ����">

                    </div>

                </form>

            </div>

            <div class="mb-3">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�ݱ�</button>
                <button type="button" class="btn btn-primary calenderReviewSubmit">���</button>

            </div>
        </div>
    </div>
</div>


<%--���� ���� �ı� ����--%>
<div class="modal fade" id="exampleModal5" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel4"> ���� ���� �ı�� ���� �ۼ� </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="fileForm4">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control reviewTitle2" id="recipient-name5" value="" placeholder="asdasd">
                        <label for="recipient-name" >�� ��</label>
                    </div>

                    <div class="form-floating mb-3">

                        <select class="form-select reviewRange2" name="reviewRange" id="floatingSelect">
                            <option selected>���� ���θ� ���� �ϼ���</option>
                            <option value="1">��ü ����</option>
                            <option value="2">���� ����</option>
                        </select>

                        <label for="floatingSelect">���� ����</label>


                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file4" class="form-control file4" multiple  value="���� ÷��">
                    </div>

                    <div class="form-floating mb-3">

                        <input type="date" class="form-control clubDate2" id="date-text5" value="" placeholder="asdasd"/>
                        <label for="date-text">���� ���� ��¥</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="text"  class="form-control location2"   value="��ġ ����">

                    </div>

                </form>

            </div>

            <div class="mb-3">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�ݱ�</button>
                <button type="button" class="btn btn-primary calenderReviewShortSubmit">���</button>

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


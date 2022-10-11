<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>


<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="utf-8">

    <!-- 참조 : http://getbootstrap.com/css/   참조 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


    <!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
        body {
            padding-top: 50px;
        }

        .wap {
            width: 700px;
            font-size: 0.9em;
        }

        .check {
            height: 20px;
            width: 35px;
        }
    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">

        //============= 회원정보수정 Event  처리 =============
        $(function () {

            $(".submit").on("click", function () {

                var calenderTitle = $(".calenderTitle").val()
                var calenderText = $(".calenderText").val()
                var clubDate = $(".clubDate").val()
                var location = $(".location").val()
                var file = $(".file").val()
                var noticeCheck = $(".noticeCheck").val()
                var noticeTime = $(".noticeTime").val()
                var calendarApplyCheck = $(".calendarApplyCheck").val()
                var applyAutoCheck = $(".applyAutoCheck").val()

                $.ajax({
                    url: "/clubCal/json/addClubCalender",
                    method: "post",
                    data: JSON.stringify({
                        "calenderTitle" :calenderTitle,
                        "calenderText": calenderText,
                        "clubDate" : clubDate,
                        "location": location,
                        "file": file,
                        "noticeCheck" : noticeCheck,
                        "noticeTime": noticeTime,
                        "calendarApplyCheck": calendarApplyCheck,
                        "applyAutoCheck" : applyAutoCheck
                    }),
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    success: function () {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Your work has been saved',
                            showConfirmButton: false,
                            timer: 1500
                        });

                        setTimeout(function () {
                            opener.location.reload();
                            window.close();
                        });
                    },
                    error: function () {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: '작성이 실패 되었습니다',
                            showConfirmButton: false,
                            timer: 1500
                        });

                        setTimeout(function () {
                            window.close();
                        })
                    }
                });

            });

            $(".close").on("click", function () {
                window.close();
            });
        });


    </script>

</head>

<body>

<form>
    <!--  화면구성 div Start /////////////////////////////////////-->
    <div class="wap">
        <div class="container">

            <div class="page-header">
                <h3 class=" text-info">모임 일정 작성</h3>
            </div>

            <div class="row">
                <div class="col-xs-4 col-xs-2"><strong>제 목</strong></div>
                <div class="col-xs-8 col-xs-4">
                    <input type="text" class="form-control calenderTitle"  name="calenderTitle" value="${clubCalender.calenderTitle}"/>
                </div>
            </div>


            <hr/>

            <div class="row">
                <div class="col-xs-4 col-xs-2"><strong>일정 내용</strong></div>
                <div class="col-xs-8 col-xs-4">
                    <textarea class="form-control calenderText"  name="calenderText"
                              style=" height: 200px;  width: 500px;  margin-bottom: 20px;">${clubCalender.calenderText}</textarea>
                </div>
            </div>


            <hr/>

            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>일정 날짜
                        <input class="form-control clubDate" value="${clubCalender.clubDate}" name="clubDate" type="date">
                    </strong>
                </div>
            </div>


            <hr/>


            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>위치
                        <input type="button location" name="location" value="위치 입력">
                    </strong>
                </div>
            </div>

            <hr/>


            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>파일
                        <input type="file file" name="file" value="파일 첨부">
                    </strong>
                </div>
            </div>

            <hr/>

            알림 시간
            <hr>

            <input type="time" class="noticeTime" value="${clubCalender.noticeTime}" name="noticeTime">


            <hr/>


            <div class="row">
                <div class="col-xs-12 text-center ">
                    <button type="button" class="btn btn-primary btn-lg submit">확인</button>
                    <button type="button" class="btn btn-secondary btn-lg close">닫기</button>
                </div>
            </div>

            <br/>

        </div>
    </div>
</form>

</body>

</html>
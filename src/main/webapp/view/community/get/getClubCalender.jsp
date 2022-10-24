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
            const date = new Date();

            const year = date.getFullYear();
            const month = ('0' + (date.getMonth() + 1)).slice(-2);
            const day = ('0' + date.getDate()).slice(-2);
            const dateStr = year + '-' + month + '-' + day;

            var Cdate = $(".clubDate").val()

            const date2 = new Date(dateStr);
            const date3 = new Date(Cdate);


            if (date3 < date2) {

                var button = '<button class="btn btn-primary update">' +
                    '수정' +
                    '</button>' +
                    '<button class="btn btn-primary delete">' +
                    '삭제' +
                    '</button>'


                $(".addBox").append(button);
            }


            if (date3 > date2) {

                var button = '<button class="btn btn-primary addReview">' +
                    '모임 일정 후기글 작성' +
                    '</button>' +
                    '<button class="btn btn-primary addShort">' +
                    '모임 일정 쇼츠' +
                    '</button>'


                $(".addBox").append(button);
            }

            $(".update").on("click", function () {
                location.href = "/clubCal/updateClubCalender?clubCalenderNum=" + calenderNum
            })

            $(".delete").on("click", function () {


                $.ajax({
                    url: "/clubCal/json/deleteclubCalendar",
                    type: "POST",
                    data: JSON.stringify({"calenderNum": calenderNum}),
                    dataType: "json",
                    contentType: 'application/json; charset=UTF-8',
                    success: function (JSONData, result) {
                        console.log(result);
                    }

                })
            })


            $(".close").on("click", function () {
                window.close();
            });

            var calenderNum = $(".calenderNum").val();

            $(".addReview").on("click", function () {
                window.open(
                    "/clubCal/addClubCalenderReview?clubCalenderNum=" + calenderNum + "&boardCategory=01", "모임 일정 후기글 작성",
                    "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

                window.close();

            });

            $(".addShort").on("click", function () {

                window.open(
                    "/clubCal/addClubCalenderReview?clubCalenderNum=" + calenderNum + "&boardCategory=02", "모임 일정 후기글 쇼츠 작성",
                    "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no"
                );

                window.close();

            });

            $(".cluber").on("click", ()=>{
                window.open(
                    "/club/listCalendarCluber/"+calenderNum, "일정 참여자 보기",
                    "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no"
                );
            })





        });


    </script>

</head>

<body>

<form>
    <!--  화면구성 div Start /////////////////////////////////////-->
    <div class="wap">
        <input class="calenderNum" hidden value="${clubCalender.clubCalenderNum}">
        <div class="container">

            <div class="page-header" style="display: flex; flex-direction: row-reverse;">
                <h3 class=" text-info">모임 일정</h3>
            </div>
            <div class="borderBox">
                <div class="addBox" style=" float: right; display: flex; flex-direction: column;">

                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-xs-2"><strong>제 목</strong></div>
                <div class="col-xs-8 col-xs-4">
                    <input type="text" class="form-control calenderTitle" name="calenderTitle"
                           value="${clubCalender.calenderTitle}"/>
                </div>
            </div>


            <hr/>

            <div class="row">
                <div class="col-xs-4 col-xs-2"><strong>일정 내용</strong></div>
                <div class="col-xs-8 col-xs-4">
                    <textarea class="form-control calenderText" name="calenderText"
                              style=" height: 200px;  width: 500px;  margin-bottom: 20px;">${clubCalender.calenderText}</textarea>
                </div>
            </div>


            <hr/>

            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>일정 날짜
                        <input class="form-control clubDate" value="${clubCalender.clubDate}" name="clubDate"
                               type="date">
                    </strong>
                </div>
            </div>


            <hr/>

            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>모임 일정 참여자
                        <input class="cluber"  name="clubDate" type="button" value="참여자 보기">
                    </strong>
                </div>
            </div>


            <hr/>


            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>위치
                        <input type="button" name="location" value="위치 입력">
                    </strong>
                </div>
            </div>

            <hr/>


            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>파일
                        <input type="file" name="file" value="파일 첨부">
                    </strong>
                </div>
            </div>

            <hr/>



            <hr/>

            <div class="form-check form-switch">
                알림 설정 여부
                <input class="form-check-input check noticeCheck"
                       name="noticeCheck" ${ (clubCalender.noticeCheck eq 2) ? 'checked' : ''} type="checkbox"
                       role="switch"
                       id="flexSwitchCheckDefault1">
                <label class="form-check-label" for="flexSwitchCheckDefault1"></label>
            </div>


            <hr/>

            알림 시간 설정
            <hr>
            <input type="time" class="noticeTime" name="noticeTime" value="${clubCalender.noticeTime}">
            <hr/>

            <div class="form-check form-switch">
                추가 참여 여부
                <input class="form-check-input check calendarApplyCheck" ${(clubCalender.calendarApplyCheck eq 2) ? 'checked' : ''}
                       name="calendarApplyCheck" type="checkbox" role="switch" id="flexSwitchCheckDefault2">
                <label class="form-check-label" for="flexSwitchCheckDefault2"></label>
            </div>


            <hr/>


            <div class="form-check form-switch">
                자동 참여 가능
                <input class="form-check-input check applyAutoCheck"
                       name="applyAutoCheck" ${ (clubCalender.applyAutoCheck eq 2) ? 'checked' : ''} type="checkbox"
                       role="switch"
                       id="flexSwitchCheckDefault3">
                <label class="form-check-label" for="flexSwitchCheckDefault3"></label>
            </div>


            <hr/>


            <div class="row">
                <div class="col-xs-12 text-center ">
                    <button type="button" class="btn btn-secondary btn-lg close">닫기</button>
                </div>
            </div>

            <br/>

        </div>
    </div>
</form>

</body>

</html>
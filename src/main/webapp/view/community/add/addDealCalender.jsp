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

                var dealBoardNum = '${boardNum}'
                var dealCalenderTitle = $(".dealCalenderTitle").val()
                var dealDate = $(".dealDate").val()
                var dealLocation = $(".dealLocation").val()

                console.log(dealBoardNum)
                console.log(dealCalenderTitle)
                console.log(dealDate)
                console.log(dealLocation)

                $.ajax({
                    url: "/commu/json/addDealCalender",
                    method: "post",
                    data: JSON.stringify({
                        "dealBoardNum" : dealBoardNum,
                        "dealCalenderTitle": dealCalenderTitle,
                        "dealDate": dealDate,
                        "dealLocation": dealLocation,
                    }),

                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
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
                            opener.location.reload();
                            window.close();
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
                            window.close();
                        }, 2000);

                    }
                });

            });


            $(".close").on("click", function () {
                window.close();
            });

            const date = new Date();
           if($(".clubDate").val() > date.toString());
        });


    </script>

</head>

<body>

<form>
    <!--  화면구성 div Start /////////////////////////////////////-->

    <div class="wap">
        <div class="container">

            <div class="page-header">
                <h3 class=" text-info">거래 일정 작성</h3>
            </div>

            <div class="row">
                <div class="col-xs-4 col-xs-2"><strong>제 목</strong></div>
                <div class="col-xs-8 col-xs-4">
                    <input type="text" class="form-control dealCalenderTitle" name="calenderTitle" value=""/>
                </div>
            </div>


            <hr/>

            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>일정 날짜
                        <input class="form-control dealDate" name="clubDate" type="date">
                    </strong>
                </div>
            </div>


            <hr/>


            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>위치
                        <input type="text" class="dealLocation" name="location" value="위치 입력">
                    </strong>
                </div>
            </div>

            <hr/>


            알림 시간 설정
            <hr>
            <input type="time" class="noticeTime" name="noticeTime">

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
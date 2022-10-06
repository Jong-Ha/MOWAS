<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="EUC-KR">

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

        //=============  Event  처리 =============
        $(function () {

            $(".submit").on("click", function () {

                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Your work has been saved',
                    showConfirmButton: false,
                    timer: 1500,
                });

                $("form").attr("method", "post").attr("action", "/clubCal/updateClubCalenderReview").submit();

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
        <input name="clubCalenderReviewNum" hidden value="${calenderReview.clubCalenderReviewNum}">
        <input name="boardCategory" hidden value="${calenderReview.boardCategory}">
        <div class="container">

            <div class="page-header">
                <h3 class=" text-info">모임 일정 후기쇼츠 작성</h3>
            </div>

            <div class="row">
                <div class="col-xs-4 col-xs-2"><strong>제 목</strong></div>
                <div class="col-xs-8 col-xs-4">
                    <input type="text" class="form-control" name="reviewTitle" value="${calenderReview.reviewTitle}"/>
                </div>
            </div>


            <hr/>

            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>파일
                        <input type="file" name="file" value="영상 첨부">
                    </strong>
                </div>
            </div>

            <hr/>

            <select class="form-select " name="reviewRange" style="width: 300px;">
                <option selected>공개 여부를 선택 하세요</option>
                <option value="1">전체 공개</option>
                <option value="2">모임 공개</option>
            </select>

            <hr/>




            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>모임 일정 날짜
                        <input type="date" name="clubCalenderDate" value="모임 일정 날짜">
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
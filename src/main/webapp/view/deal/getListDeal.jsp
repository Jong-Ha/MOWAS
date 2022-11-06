<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 903-9
  Date: 2022-10-06
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>


<!DOCTYPE html>

<html lang="ko">

<head>

    <title>MOWAS</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <script>
        let submitCheck = false
        $(function () {
            // 작성 페이지로 navigation
            $(".dealBox").off('click').on('click', function (e) {


                location.href = "/deal/getDeal/" + $(this).find('[name="dealBoardNum"]').val();

            })

            $('.searchBtn').on('click', function () {
                submitCheck = true;
                $('#listForm').attr('method', 'post').attr('action', '/deal/getListDeal').submit()
            })

            $('#listForm').on('submit', function () {
                if (!submitCheck) {
                    return false
                }
            })
        })


        $(function () {
            var dealBoardNum = $(this).find(".dealBoardNum").val()


            $(".adddealbox").on('click', function () {
                var userId = $(".userId").val();
                // alert(userId)
                // alert($(".userId").val())
                if (userId === '' || userId === null) {

                        alert('로그인 후 이용해주세요')
                        $('#loginModal').modal('show')
                        return false


                } else if (userId !== '') {

                    $("#addDeal").find(".newDeal").on('click', function () {

                        if ($("#dealTitle").val() === '') {
                            alert("거래명은 필수입니다")
                            return;
                        }
                        if ($("#dealProduct").val() === '') {
                            alert("제품명은 필수입니다")
                            return;
                        }
                        if ($("#price").val() === '') {
                            alert("가격은 필수입니다")
                            return;
                        }
                        if ($("#dealText").val() === '') {
                            alert("상품 설명은 필수입니다")
                            return;
                        }
                        if ($("#file").val() === '') {
                            alert("파일 첨부는 필수입니다")
                            return;
                        }

                        $('#addDealForm').attr("action", "/deal/addDeal").attr("method", "post").submit();


                    })
                }
            })
        })

        $(function () {

            $(".allList").on("click", function () {
                location.href = "/deal/getListDeal?boardCategory=" + "99";
            });

            $(".deallist").on("click", function () {
                location.href = "/deal/getListDeal?boardCategory=" + "08";
            })

            $(".dealrequestlist").on("click", function () {
                location.href = "/deal/getListDeal?boardCategory=" + "09";
            });
        })

        function numberWithCommas(x) {

            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

        }


        //무한스크롤
        $(function () {
            function getFormJson(selector) {
                // Select Form
                let selForm = document.querySelector(selector);

                // Getting an FormData
                let data = new FormData(selForm);

                // Getting a Serialize Data from FormData
                let serializedFormData = serialize(selector, data);

                // Log
                console.log(JSON.stringify(serializedFormData));
                return JSON.stringify(serializedFormData)
            }

            function serialize(selector, rawData) {

                let rtnData = {};
                for (let [key, value] of rawData) {
                    let sel = document.querySelectorAll(selector + " [name=" + key + "]");

                    // Array Values
                    if (sel.length > 1) {
                        if (rtnData[key] === undefined) {
                            rtnData[key] = [];
                        }
                        rtnData[key].push(value);
                    }
                    // Other
                    else {
                        rtnData[key] = value;
                    }
                }

                return rtnData;
            }

            let loadCheck = false
            $(window).on('scroll', function () {
                console.log($(window).scrollTop())
                console.log($(document).height() - $(window).height())
                if ($(document).height() - $(window).height() - $(window).scrollTop() < 1300) {
                    if (loadCheck) {
                        return
                    }
                    loadCheck = true
                    console.log('ajax!')

                    // const data = $('#listForm').serializeArray()
                    // console.log(data)

                    const json = getFormJson('#listForm')
                    //  alert(json)
                    $.ajax({
                        url: '/deal/json/getListDeal',
                        method: 'post',
                        'data': json,
                        contentType: 'application/json; charset=utf-8',
                        success: function (re) {
                            //  alert("되나요 ?")
                            $.each(re.list, function (index, item) {
                                console.log(index)
                                console.log(item)
                                let html = '<div class="cardbox">' +
                                    '<div class="col dealBox">' +
                                    '<input type="hidden" name="dealBoardNum" class="dealBoardNum" value="' + item.dealBoardNum + '">' +
                                    '<input type="hidden" name="villCode" class="villCode" value="' + item.villCode + '">' +
                                    ' <div class="card h-100 shadow-lg">' +
                                    ' <div class="card-footer" style=" border-bottom: 1px solid; display: flex; font-weight: bold">' + item.dealTitle +
                                    '<p class="allFlex " style="position: absolute; right: 10px;">'
                                if (item.dealStatus === 0) {
                                    html += '거래전'
                                } else if (item.dealStatus === 1) {
                                    html += '거래중'
                                } else {
                                    html += '거래완료'
                                }
                                html += '</div>' +
                                    '<div class= "potoBox">'
                                if (item.files[0].fileName === '') {
                                    html += '<img class="poto" width="100%" height="100%"  alt="any">'
                                } else if (item.files[0].fileName === undefined) {
                                    html += '<img class="poto" width="100%" height="100%"  alt="any">'
                                } else {
                                    html += '<img class="poto" width="100%" height="100%" src="/resources/' + item.files[0].fileName + '"  alt="any">'
                                }

                                html += '</div>' +
                                    '<div class="cardM " style="display: flex; padding: 10px 0 0 10px; height: 120px; ">' +
                                    ' <div class="dealinfo cartFont" style="flex: 1; width: 50%;">' +
                                    '<p class="allFlex" style="font-size: 1.3em; font-weight: bold"> ' + item.price + '원 </p>' +
                                    ' <p class="allFlex" id="demo" style="font-size: 1.3em; font-weight: bold">&nbsp;&nbsp;</p>' +
                                    '<p class="allFlex" style="font-size: 1em"> 좋아요 ' + item.likeCount + ' ∙ 조회수 ' + item.viewCount + '</p>' +
                                    '   </div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>'

                                $('.addlistbox').append($(html))
                            })
                            $('#listForm .currentPage').val(parseInt($('#listForm .currentPage').val()) + 1);
                            $(function () {
                                // 작성 페이지로 navigation
                                $(".dealBox").off('click').on('click', function (e) {


                                    location.href = "/deal/getDeal/" + $(this).find('[name="dealBoardNum"]').val();

                                })
                            })
                            if (re.list.length > 0) {
                                loadCheck = false
                            } else {
                                $(window).off('scroll')
                            }

                            $('.cardbox').each(function (index,item) {
                                var address = $(item).find('.villCode').val();
                                const myArray = address.split(" ");
                                console.log(index)
                                console.log(item)
                                console.log(myArray)
                                $(item).find('#demo').html(myArray[2]);


                            })

                        }
                    })
                }
            })
        })
        $(function () {

            $('.cardbox').each(function (index,item) {
                var address = $(item).find('.villCode').val();
                const myArray = address.split(" ");
                console.log(index)
                console.log(item)
                console.log(myArray)
                $(item).find('#demo').append(myArray[2]);


            })
            let checkprice = /^[0-9]+$/;
            $('#addDeal #dealTitle').on('keyup',function(){
                if($(this).val().length>30){
                    alert('거래명은 최대 20글자입니다')
                    $(this).val($(this).val().substring(0, 30));
                }
            })
            $('#addDeal #productName').on('keyup',function(){
                if($(this).val().length>30){

                    alert('상품명은 최대 30글자입니다')
                    $(this).val($(this).val().substring(0, 30));
                }
            })
            $('#addDeal #dealText').on('keyup',function(){
                if($(this).val().length>300){
                    alert('상품설명은 최대 300글자입니다')
                    $(this).val($(this).val().substring(0, 300));
                }
            })
            $('#addDeal #price').on('keyup',function(){
                if(!checkprice.test($(this).val())){
                    alert('숫자만 입력가능합니다.')
                }
            })
            //가격 콤마찍기
            $('#dealPrice')

        })
    </script>


    <style>
        .body {
            text-align: -webkit-center;
        }

        .wap {
            margin-top: 70px;
            font-size: 1em;
            width: 1030px;
            padding: 5px 5px;
            height: 580px;
            border-radius: 10px;
        }


        .card-title {
            width: 250px;
            font-size: 1em;
        }

        .cardbox {
            display: flex;
            flex-direction: row;
            margin-bottom: 30px;

            transition: all 0.2s linear;
        }

        button.buttonBox {
            font-size: 0.7em;
            /* float: left; */
            /* size: b4; */
            height: 25px;
            width: 5px;
        }

        .col.dealBox {
            width: 320px;
            /*margin-right: 30px;*/
        }

        .like {
            font-size: 0.1rem;
            width: 45px;
            outline: 0;
            border: none;
            background-color: #fff;
        }

        .addBox {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 50px;
            margin-top: 20px;

        }

        /*.addBox {*/
        /*    width: 100%;*/
        /*    display: flex;*/
        /*    flex-direction: row-reverse;*/
        /*    margin-bottom: 100px;*/
        /*}*/

        .add {
            margin-right: -700px;
        }

        .update,
        .delete {
            font-size: 0.5em;
        }

        .get {
            width: 100px;
            height: 200px;
            overflow: hidden;
        }


        .carditem {
            display: flex;
            flex-direction: column;
        }

        .card-title {
            width: 250px;
            font-size: 1em;
        }

        .cardbox {
            display: flex;
            flex-direction: row;
            margin-bottom: 40px;
            width: 360px;
            height: 400px;
            float: left;
            transition: all 0.2s linear;
        }

        .cardbox:hover {
            transform: scale(1.12);
        }

        .potoBox {
            cursor: pointer;
            padding: 1px;
            width: 360px;
            height: 250px;
            overflow: hidden;
            border-radius: 0 0 5px 5px;
            border-bottom: 2px solid #0a090945
        }

        .text {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .allFlex {
            display: flex;
        }

        .cartFont {
            font-size: 0.8em;
        }

        .wrapper {
            height: 13ch;
            display: grid;
            place-items: center;
        }

        .typing {
            width: 14ch;
            animation: typing 0.9s steps(22), blink .5s step-end infinite alternate;
            white-space: nowrap;
            overflow: hidden;
            border-right: 3px solid;
            font-size: 2em;
            height: 2ch;
        }

        @keyframes typing {
            from {
                width: 0
            }
        }

        .btn-primary {
            --bs-btn-color: #000;
            --bs-btn-bg: #f8cd07b3;
            --bs-btn-border-color: #f8cd07b3;
            --bs-btn-hover-color: #000;
            --bs-btn-hover-bg: #f8cd07;
            --bs-btn-hover-border-color: #f8cd07;
            --bs-btn-focus-shadow-rgb: 130, 138, 145;
            --bs-btn-active-color: #000;
            --bs-btn-active-bg: #f8cd07;
            --bs-btn-active-border-color: #f8cd07;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color: #fff;
            --bs-btn-disabled-bg: #6c757d;
            --bs-btn-disabled-border-color: #6c757d;
        }

        /*deallistBox 시작*/
        .deallistBox {
            margin-bottom: 50px;
            justify-content: center;
        }


        a {
            text-decoration: none;
        }

        .underline {
            line-height: 1.2;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol";
            font-size: 1.5em;
            font-weight: 700;
            background-image: linear-gradient(transparent calc(100% - 3px), #000 3px);
            background-repeat: no-repeat;
            background-size: 0% 100%;
            transition: background-size 0.2s;
            color: #000;
            cursor: pointer;
            margin-right: 25px;
        }

        @media (min-width: 1000px) {
            .underline {
                font-size: 1.5em;
            }
        }

        .underline.yellow {
            background-image: linear-gradient(transparent 60%, #F8CD07 40%);
        }

        .underline:hover {
            background-size: 100% 100%;
        }

        .wrapper {
            height: 13ch;
            display: grid;
            place-items: center;
        }

        /*.typing {*/
        /*    width: 14ch;*/
        /*    animation: typing 0.9s steps(22), blink .5s step-end infinite alternate;*/
        /*    white-space: nowrap;*/
        /*    overflow: hidden;*/
        /*    border-right: 3px solid;*/
        /*    font-size: 2em;*/
        /*    height: 2ch;*/
        /*}*/

        @keyframes typing {
            from {
                width: 0
            }
        }

        @keyframes blink {
            80% {
                border-color: transparent
            }

        }

        .addlistbox {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-around;
        }

        /*검색*/
        /*.form-control {*/
        /*    display: block;*/
        /*    width: 100%;*/
        /*    padding: 0.375rem 0.75rem;*/
        /*    font-size: 1rem;*/
        /*    font-weight: 400;*/
        /*    line-height: 1.5;*/
        /*    color: #212529;*/
        /*    background-color: #fff;*/
        /*    background-clip: padding-box;*/
        /*    border: 1px solid #ced4da;*/
        /*    -webkit-appearance: none;*/
        /*    -moz-appearance: none;*/
        /*    appearance: none;*/
        /*    border-radius: 0.375rem;*/
        /*    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;*/
        /*}*/
        /*.form-select {*/
        /*    display: block;*/
        /*    width: 100%;*/
        /*    padding: 0.375rem 2.25rem 0.375rem 0.75rem;*/
        /*    -moz-padding-start: calc(0.75rem - 3px);*/
        /*    font-size: 1rem;*/
        /*    font-weight: 400;*/
        /*    line-height: 1.5;*/
        /*    color: #212529;*/
        /*    background-color: #fff;*/
        /*    background-image: url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e);*/
        /*    background-repeat: no-repeat;*/
        /*    background-position: right 0.75rem center;*/
        /*    background-size: 16px 12px;*/
        /*    border: 1px solid #ced4da;*/
        /*    border-radius: 0.375rem;*/
        /*    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;*/
        /*    -webkit-appearance: none;*/
        /*    -moz-appearance: none;*/
        /*    appearance: none;*/
        /*}*/
        .searchbox {
            display: flex;
        }

        .dealTab{
            margin: 0 25px;
            width: 110px;
            text-align: center;
        }
    </style>
</head>


<!-- ToolBar Start /////////////////////////////////////-->

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--상단 툴바--%>
<input hidden class="userId" value="${user.userId}">

<%--구현 후 빼야함--%>
<%--<input type="button" class="dealLogin" value="로그인">--%>
<%--<label>--%>
<%--  아이디 : <input type="text" name="userId" value="user01">--%>
<%--</label>--%>
<%--${user.userId}--%>
<!-- Example Code -->
<jsp:include page="/layout/toolbar.jsp"/>
<%--<jsp:include page="/view/deal/history.jsp"/>--%>
<img class="shadow-lg" src="/resources/uploadFiles/dealBoardFiles/중고거래.jpg"
     style="height: 500px;border-radius: 10px;  width: 1600px;">
<div class="container">

    <div class="wrapper">
        <div class="typing">
            <h4 style="font-weight: bolder; margin-bottom: 50px; font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);">
                중고거래 게시판</h4>
        </div>
    </div>


    <body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
    <form id="listForm">
        <input type="hidden" class="currentPage" name="currentPage" value="2">
        <input hidden class="userId" value="${user.userId}">
        <input hidden class="boardCategory" value="${boardCategory}" name="boardCategory">


        <nav class="navbar navbar-expand-lg deallistBox">

            <div>
                <div class="underline yellow allList dealTab">전체</div>
            </div>

            <div>
                <div class="underline yellow deallist dealTab">판매</div>
            </div>

            <div>
                <div class="underline yellow dealrequestlist dealTab">판매 요청</div>
            </div>

        </nav>
        <hr>
        <%--
        사진 들어가야지 ??

        --%>


        <%--  <div class="add" style="display:flex;justify-content: space-between;align-items: center;">--%>
        <%--    <button class="btn btn-primary addDeal">--%>
        <%--      거래 만들기--%>
        <%--    </button>--%>
        <%--    <div>--%>
        <%--      <button class="btn btn-primary deal" value="08">--%>
        <%--        판매--%>
        <%--      </button>--%>
        <%--      <button class="btn btn-primary dealRequest" value="09">--%>
        <%--        판매요청--%>
        <%--      </button>--%>
        <%--      <button class="btn btn-primary searchTag">--%>
        <%--        태그--%>
        <%--      </button>--%>
        <%--    </div>--%>
        <%--  </div>--%>


        <%--버튼 모음 시작--%>
        <div class="addBox" style="display:flex;justify-content: space-between;align-items: center;">
            <div class="adddealbox">
                <button class="btn btn-primary addDeal" data-bs-toggle="modal" data-bs-target="#addDeal">
                    거래 작성
                </button>
            </div>


            <%--            <select class="btn btn-primary dealCategory" name="dealCategory">--%>
            <%--                &lt;%&ndash;  <option selected>판매구분</option>&ndash;%&gt;--%>
            <%--                <option value="99" ${boardCategory == "99"? 'selected':''}>전체</option>--%>
            <%--                <option value="08" ${boardCategory == "08"? 'selected':''}>판매</option>--%>
            <%--                <option value="09" ${boardCategory == "09"? 'selected':''}>판매요청</option>--%>
            <%--            </select>--%>

            <%--            <button class="center btn btn-primary searchTag">--%>
            <%--                태그--%>
            <%--            </button>--%>
            <%--            <form class="form-inline" name="detailForm">--%>

            <%--        <div class="form-group">--%>
            <%--                    <select class="form-control" name="searchCondition">--%>
            <%--                        <option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>--%>
            <%--                            제목--%>
            <%--                        </option>--%>
            <%--                        <option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>--%>
            <%--                            상품명--%>
            <%--                        </option>--%>
            <%--                    </select>--%>
            <%--                </div>--%>

            <%--                <div class="form-group">--%>
            <%--                    <label class="sr-only" for="searchKeyword">검색어</label>--%>
            <%--                    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어"--%>
            <%--                           value="${! empty search.searchKeyword ? search.searchKeyword : '' }">--%>
            <%--                </div>--%>

            <%--                <button type="submit" class="btn btn-secondary">--%>
            <%--                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>--%>
            <%--                <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->--%>
            <%--                <input type="hidden" id="currentPage" name="currentPage" value="2"/>--%>
            <%--    <span class="_1knjz499"><input class="_1knjz49b" placeholder="물품을 검색해보세요" value=""/></span></span>--%>
            <%--                            </form>--%>
            <%--                <div class="input-group mb-3">--%>
            <%--                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"--%>
            <%--                            aria-expanded="false">검색--%>
            <%--                    </button>--%>
            <%--                    <ul class="dropdown-menu" name="searchCondition">--%>
            <%--                        <li><a class="dropdown-item" href="#" value="0"${!empty search.searchCondition&&search.searchCondition==0 ? "selected":"" }>제목</a></li>--%>
            <%--                        <li><a class="dropdown-item" href="#" value="1"${!empty search.searchCondition&&search.searchCondition==0 ? "selected":"" }>상품명</a></li>--%>

            <%--                    </ul>--%>
            <%--                    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" aria-label="Text input with dropdown button">--%>
            <%--                </div>--%>
            <div class="searchbox">
                <div style="width: 100px;">
                    <select name="searchCondition" class="form-select" aria-label="Default select example">
                        <option value="0">선택 하세요</option>
                        <option ${search.searchCondition == '1' ? 'selected' : '' } value="1">제목</option>
                        <option ${search.searchCondition == '2' ? 'selected' : '' } value="2">상품명</option>
                    </select>
                </div>

                <input class="form-control me-2" type="search" name="searchKeyword" placeholder="검색" aria-label="Search"
                       value="${search.searchKeyword}" style="width: 255px;">
                <button class="btn btn-primary searchBtn" type="submit">검색</button>
            </div>

        </div>
    </form>
    <%--버튼 모음 끝--%>

    <div class="container">
        <div class="addlistbox">
            <c:set var="i" value="0"/>
            <c:forEach var="deal" items="${list}">
                <c:set var="i" value="${i+1}"/>
                <div class="cardbox">
                    <div class="col dealBox">
                        <input type="hidden" name="dealBoardNum" class="dealBoardNum" value="${deal.dealBoardNum}">
                        <input type="hidden" name="villCode" class="villCode" value="${deal.villCode}">
                        <div class="card h-100 shadow-lg">
                            <div class="card-footer "
                                 style=" border-bottom: 1px solid; display: flex; font-weight: bold;  ">
                                    <div class="text-truncate" style="width:280px;text-align: left">
                                            ${deal.dealTitle}
                                    </div>
                                <p class="allFlex " style="position: absolute; right: 10px;">
                                    <c:if test="${deal.dealStatus == 0}">
                                    거래전
                                </c:if>
                                    <c:if test="${deal.dealStatus ==1}">
                                        거래중
                                    </c:if>
                                    <c:if test="${deal.dealStatus ==2}">
                                        거래완료
                                    </c:if></p>
                            </div>
                                <%--  <div id="carouselExampleSlidesOnly" class="carousel potoBox" data-bs-ride="carousel">--%>
                            <div class="potoBox">
                                    <%--    <div class="carousel-inner">--%>
                                    <%--      <div class="carousel-item active get">--%>
                                <img class="poto" width="100%" height="100%" src="/resources/${deal.files[0].fileName}"
                                     alt="any">
                                    <%--      </div>--%>
                                    <%--    </div>--%>
                            </div>
                            <div class="cardM " style="display: flex; padding: 10px 0 0 10px; height: 120px;; ">
                                    <%--                            <div class="card-text text allFlex" style="width: 50%; ">--%>
                                    <%--                                    ${deal.productName}--%>
                                    <%--                            </div>--%>

                                <div class="dealinfo cartFont" style="flex: 1; width: 50%;">
                                    <p class="allFlex" id="dealPrice"style="font-size: 1.3em; font-weight: bold"> ${deal.price} 원 </p>
                                    <p class="allFlex" id="demo"
                                       style="font-size: 1.3em; font-weight: bold">&nbsp;&nbsp;
                                    </p>

                                    <p class="allFlex" style="font-size: 1em"> 좋아요 ${deal.likeCount} ∙
                                        조회수 ${deal.viewCount} </p>

                                </div>
                            </div>
                                <%--                        <div class="tags" style="height: 30px;">--%>

                                <%--                                &lt;%&ndash;              ${deal.tag}&ndash;%&gt;--%>

                                <%--                        </div>--%>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</div>
<%--  <c:forEach var="deal" items="${list}">--%>

<%--  <div class="row row-cols-1 row-cols-md-3 g-4 cardbox">--%>
<%--    <div class="col dealBox">--%>
<%--      <input type="hidden" name="dealBoardNum" class="dealBoardNum" value="${deal.dealBoardNum}">--%>
<%--      <div class="card h-100">--%>
<%--          &lt;%&ndash;            <c:forEach var="File" items="${Deal.files}">&ndash;%&gt;--%>
<%--          &lt;%&ndash;              <div class="carousel-inner">&ndash;%&gt;--%>
<%--          &lt;%&ndash;                <div class="carousel-item active get">&ndash;%&gt;--%>
<%--          &lt;%&ndash;                  <img class="poto" width="100%" height="100%"  src="/resources/${File.fileName }" alt="any">&ndash;%&gt;--%>
<%--          &lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--          &lt;%&ndash;              </div>&ndash;%&gt;--%>
<%--          &lt;%&ndash;            </c:forEach>&ndash;%&gt;--%>


<%--        <div class="card-img-top" style="cursor: pointer">--%>
<%--          <img src="/resources/${deal.files[0].fileName}" alt="거래이미지">--%>
<%--        </div>--%>


<%--        <div class="card-body carditem">--%>
<%--          <h3 class="card-title">${deal.dealTitle}</h3>--%>
<%--          <div class="row g-3">--%>
<%--            <div class="col-6">--%>
<%--              <div class="badge bg-primary text-wrap" style="width: 6rem;">--%>
<%--                <c:if test="${deal.dealStatus == 0}">--%>
<%--                  거래전--%>
<%--                </c:if>--%>
<%--                <c:if test="${deal.dealStatus ==1}">--%>
<%--                  거래중--%>
<%--                </c:if>--%>
<%--                <c:if test="${deal.dealStatus ==2}">--%>
<%--                  거래완료--%>
<%--                </c:if>--%>
<%--              </div>--%>
<%--              <div class="badge bg-primary text-wrap" style="width: 6rem;">--%>
<%--                  ${deal.villCode}--%>
<%--              </div>--%>
<%--              <div class="badge bg-primary text-wrap" style="width: 6rem;">--%>
<%--                  ${deal.price}--%>
<%--              </div>--%>
<%--            </div>--%>

<%--          </div>--%>
<%--          <button type="button" class="btn btn-outline-primary dealTag">${deal.tag}</button>--%>
<%--        </div>--%>

<%--          &lt;%&ndash;<div class="card-footer">--%>
<%--              <small class="text-muted">Last updated 3 mins ago</small>--%>
<%--          </div>&ndash;%&gt;--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div> </c:forEach>--%>


<%--거래 만들기 모달창 시작--%>
<c:if test="${!empty user}">
    <div class="modal fade" id="addDeal" tabindex="-1" aria-labelledby="addDealLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="addDealLabel">거래 게시글 작성</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addDealForm" enctype="multipart/form-data" method="post">
                        <div class="input-group mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="dealTitle" name="dealTitle"
                                       placeholder="거래명"
                                       required>
                                <label for="dealTitle">거래명</label>
                            </div>
                        </div>

                        <div class="input-group mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="productName" name="productName"
                                       placeholder="제품명"
                                       required>
                                <label for="productName">제품명</label>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="price" name="price" placeholder="가격"
                                       required>
                                <label for="price">가격</label>
                            </div>
                        </div>

                        <div class="input-group mb-3">
                            <div class="form-floating">
                                <select class="form-select" id="boardCategory" name="boardCategory" required>
                                    <option value="08" selected>판매</option>
                                    <option value="09">판매요청</option>

                                </select>
                                <label for="boardCategory">판매구분</label>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="dealText" name="dealText"
                                       placeholder="상품 설명"
                                       required>
                                <label for="dealText">상품설명</label>
                            </div>
                        </div>


                        <div class="mb-3">
                            <label for="file" class="form-label" style="display: none"></label>
                            <input class="form-control" type="file" id="file" name="file" multiple="multiple">
                        </div>

                            <%--                            <div class="input-group mb-3">--%>
                            <%--                                <div class="form-floating">--%>
                            <%--                                    <input type="text" class="tagify shadow-lg" id="dealTag" style="border-radius: 7px;"--%>
                            <%--                                           placeholder="태그 : Enter!">--%>
                            <%--                                    <label for="dealTag" style="display: none">태그 : Enter!</label>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                    </form>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary newDeal" style="margin-right: 185px">거래 게시글 작성
                    </button>
                </div>
            </div>
        </div>
    </div>

</c:if>

<%--거래 만들기 모달창 끝--%>

<%--채팅아이콘--%>
<jsp:include page="/layout/chatIcon.jsp"/>
<%--하단바--%>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>


<%--<jsp:include page="/layout/toolbar.jsp"/>--%>

<%--<form>--%>
<%--<div class="form-group">--%>
<%--  <nav class="shadow-lg navbar navbar-expand-lg bg-light commuBox">--%>

<%--    <button type="button" class="btn btn-outline-primary btnlf deal" value="08">판매</button>--%>
<%--    <button type="button" class="btn btn-outline-secondary btnlf dealRequest" value="09">판매요청</button>--%>
<%--  </nav>--%>

<%--</div>--%>

<%--  <table class="table table-hover table-striped" >--%>

<%--    <thead>--%>
<%--    <tr>--%>
<%--      <th align="left">번호</th>--%>
<%--      <th align="left">제목</th>--%>
<%--      <th align="left">내용</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>

<%--    <tbody>--%>

<%--    <c:set var="i" value="0" />--%>
<%--    <c:forEach items="${list}" var="deal">--%>

<%--    <tr>--%>
<%--      <input type="hidden" name="dealBoardNum" value="${deal.dealBoardNum}">--%>
<%--      <td align="left">   ${deal.dealBoardNum}</td>--%>
<%--      <td align="left">    ${deal.dealTitle}</td>--%>
<%--      <td align="left">    ${deal.dealText}</td>--%>
<%--      <td align="left"><a href="/deal/getDeal/${deal.dealBoardNum}">상세보기</a></td>--%>

<%--      </c:forEach>--%>
<%--      <a href="/deal/addDeal"> <input type="button" class="addDeal" value="거래 만들기"></a>--%>
<%--    </tbody>--%>

<%--  </table>--%>
<%--  <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">--%>
<%--    <span class="paging">${i}</span>--%>
<%--  </c:forEach>--%>
<%--  <label>--%>
<%--    <input type="hidden" id="currentPage" name="currentPage" value="1">--%>
<%--    <input type="text" name="searchKeyword" value="${search.searchKeyword}">--%>
<%--  </label>--%>
<%--  <input type="submit" value="검색">--%>
<%--</form>--%>


<%--<input type="button" class="clubLogin" value="로그인">--%>
<%--<label>--%>
<%--  아이디 : <input type="text" name="userId" value="">--%>
<%--</label>--%>
<%--${user.userId}--%>

<%--</body>--%>


<%--</html>--%>
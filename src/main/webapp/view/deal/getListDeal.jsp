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
    <%--  <script src="/resources/deal/js/listDeal.js"></script>--%>
    <%--  <link href="/resources/deal/css/listDeal.css" rel="stylesheet" type="text/css"/>--%>
    <!--  ///////////////////////// CSS ////////////////////////// -->
    <%--  <style>--%>
    <%--    body > div.container{--%>
    <%--      border: 3px solid #D6CDB7;--%>
    <%--      margin-top: 10px;--%>
    <%--    }--%>
    <%--  </style>--%>

    <%--  <!--  ///////////////////////// JavaScript ////////////////////////// -->--%>
    <%--  <script type="text/javascript">--%>

    <%--    // ============= "가입"  Event 연결 =============--%>
    <%--    $(function() {--%>
    <%--      $(".paging").on("click",function(){--%>

    <%--        $("#currentPage").val($(this).text())--%>
    <%--        $("form").submit()--%>
    <%--      })--%>
    <%--      $("form").on("submit",function(){--%>


    <%--        $(this).attr("action","/deal/getListDeal?${deal.boardCategory}").attr("method","post")--%>
    <%--      })--%>


    <%--      // //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)--%>
    <%--      // $( "button.btn.btn-primary" ).on("click" , function() {--%>
    <%--      //   self.location = "/deal/getDeal?dealBoardNum="+$(this).children().val();--%>
    <%--      // });--%>
    <%--      // $(".dealLogin").on("click",function(){--%>
    <%--      //   location.href="/deal/login?userId="+$("input[name='userId']").val()--%>
    <%--      // })--%>


    <%--    });--%>


    <%--    // $(function() {--%>
    <%--    //   //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)--%>
    <%--    //   $( .addDeal ).on("click" , function() {--%>
    <%--    //     self.location = "/deal/dd="+$(this).children().val();--%>
    <%--    //   });--%>
    <%--    // });--%>

    <%--    // //============= "취소"  Event 처리 및  연결 =============--%>
    <%--    // $(function() {--%>
    <%--    //   //==> 추가된부분 : "addUser"  Event 연결--%>
    <%--    //   $("a[href='#' ]:contains('상세 보기')").on("click", function() {--%>
    <%--    //     self.location = "/deal/getDeal?dealBoardNum="+$(this).children().val();--%>
    <%--    //   });--%>
    <%--    // });--%>
    <%--    $(function () {--%>
    <%--      $(".deal").on("click", function () {--%>

    <%--         location.href = "/deal/getListDeal?boardCategory="+$(".deal").val();--%>

    <%--        //$(this).attr("action","/deal/getListDeal/08").attr("method","post")--%>
    <%--      });--%>

    <%--      $(".dealRequest").on("click", function () {--%>
    <%--        alert($(".dealRequest").val());--%>
    <%--        location.href = "/deal/getListDeal?boardCategory="+$(".dealRequest").val();--%>

    <%--       // $(this).attr("action","/deal/getListDeal/09").attr("method","post")--%>
    <%--      })--%>
    <%--      $(".dealBox").on('click', function (e) {--%>
    <%--        alert("hi")--%>
    <%--        var dealBoardNum= $(this).find(".dealBoardNum").val()--%>
    <%--        alert(dealBoardNum);--%>
    <%--        location.href = "/deal/getDeal/"+dealBoardNum;--%>

    <%--      })--%>
    <%--      $(".addDeal").on("click", function () {--%>
    <%--        location.href = "/deal/addDeal"--%>
    <%--      })--%>
    <%--    });--%>
    <%--  </script>--%>


    <%--  <style>--%>
    <%--    .body {--%>
    <%--      text-align: -webkit-center;--%>
    <%--    }--%>

    <%--    .wap {--%>
    <%--      width: 1000px;--%>
    <%--    }--%>

    <%--    .carditem {--%>
    <%--      height: 210px;--%>
    <%--      display: flex;--%>
    <%--      flex-direction: column;--%>
    <%--    }--%>

    <%--    .card-title {--%>
    <%--      width: 250px;--%>
    <%--      font-size: 1.2em;--%>
    <%--    }--%>

    <%--    .cardbox {--%>
    <%--      display: flex;--%>
    <%--      flex-direction: row;--%>
    <%--      margin: 6px;--%>
    <%--      float: left;--%>
    <%--    }--%>

    <%--    button.buttonBox {--%>
    <%--      font-size: 0.7em;--%>
    <%--      /* float: left; */--%>
    <%--      /* size: b4; */--%>
    <%--      height: 25px;--%>
    <%--      width: 5px;--%>
    <%--    }--%>

    <%--    .col.dealBox {--%>
    <%--      width: 320px;--%>
    <%--    }--%>

    <%--    .add {--%>
    <%--      /*margin-right: 800px;*/--%>
    <%--      margin-bottom: 50px;--%>
    <%--    }--%>

    <%--    .card-img-top {--%>
    <%--      text-align: center;--%>
    <%--      width: 100%;--%>
    <%--      height: 200px;--%>
    <%--    }--%>

    <%--    .card-img-top > img {--%>
    <%--      object-fit: contain;--%>
    <%--      width: 100%;--%>
    <%--      height: 100%;--%>
    <%--    }--%>

    <%--    svg {--%>
    <%--      font-size: 40px;--%>
    <%--    }--%>

    <%--    .dealTag {--%>
    <%--      height: 210px;--%>
    <%--      --bs-btn-color: #000000;--%>
    <%--      --bs-btn-border-color: #000000;--%>
    <%--      --bs-btn-hover-color: #000000;--%>
    <%--      --bs-btn-hover-bg: #fff;--%>
    <%--      --bs-btn-hover-border-color: #000000;--%>
    <%--      --bs-btn-focus-shadow-rgb: 13,110,253;--%>
    <%--      --bs-btn-active-color: #000000;--%>
    <%--      --bs-btn-active-bg: #fff;--%>
    <%--      --bs-btn-active-border-color: #000000;--%>
    <%--      --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);--%>
    <%--      --bs-btn-disabled-color: #000000;--%>
    <%--      --bs-btn-disabled-bg: transparent;--%>
    <%--      --bs-btn-disabled-border-color: #000000;--%>
    <%--      --bs-gradient: none;--%>
    <%--    }--%>

    <%--  </style>--%>
    <script>
        $(function () {
            // 작성 페이지로 navigation
            $(".dealBox").on('click', function (e) {

                location.href = "/deal/getDeal/" + $(this).find('[name="dealBoardNum"]').val()
            })
//판매 리스트 보기
//     $(".deal").on("click", function () {
//
//       location.href = "/deal/getListDeal?boardCategory="+$(".deal").val();
//       //$(this).attr("action","/deal/getListDeal/08").attr("method","post")--%>
//     });

            //판매요청 리스트
            $(".dealCategory").on("change", function () {
                if ($(".dealCategory").val() == "08") {
                    location.href = "/deal/getListDeal?boardCategory=" + $(".dealCategory").val();
                } else if ($(".dealCategory").val() == "09") {
                    location.href = "/deal/getListDeal?boardCategory=" + $(".dealCategory").val();
                } else if ($(".dealCategory").val() == "99") {
                    alert("dsjfjewljr'w")
                    location.href = "/deal/getListDeal?boardCategory=" + $(".dealCategory").val();
                }
            })

            // $(this).attr("action","/deal/getListDeal/09").attr("method","post")--%>


            //태그
            var input = document.querySelector("[name='searchTagInput']")

            // init Tagify script on the above inputs
            var tagify = new Tagify(input, {
                dropdown: {
                    position: "input",
                    enabled: 0 // always opens dropdown when input gets focus
                }
            })

            let items = []

            // $.each($(".searchTag"), function (index, item) {
            //     // alert($(item).val())
            //     items.push($(item).val())
            // })
            // tagify.addTags(items)
            //
            // $('.modal.fade .modal-footer button').on("click", function () {
            //     // alert($(".tagify__tag").attr('value'))
            //     $(".tagForm").html('')
            //     $.each($(".tagify__tag"), function (index, item) {
            //         $(".tagForm").append('<input type="hidden" name="searchTag" class="searchTag" value="' + $(item).attr('value') + '">')
            //     })
            // })


            //리스트 조회
            $(".searchListDeal").on("click", function () {
                $("#listForm").attr("action", "/deal/getListDeal").attr("method", "pt").submit()
            })
        })

        $(function () {
            var dealBoardNum = $(this).find(".dealBoardNum").val()


            // var dealTag = document.querySelector("#dealTag")
            // var tagify = new Tagify(dealTag, {
            //     dropdown: {
            //         position: "input",
            //         enabled: 0 // always opens dropdown when input gets focus
            //     }
            // })
            $(".addDeal").on('click', function () {
                var userId = $(".userId").val();
                // alert(userId)
                // alert($(".userId").val())
                if (userId === '' || userId === null) {
                    alert("로그인후 사용해 주세요")

                } else if (userId !== '') {

                    $("#addDeal").find(".newDeal").on('click', function () {

                        if ($("#dealTitle").val() === '') {
                            alert("제목은 필수입니다")
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
                        // if($("#clubTag").val()===''){
                        //     return;
                        // }
                        // alert(JSON.parse($("#clubTag").val()))
                        // let addForm = $("#addDealForm");
                        // $.each(JSON.parse($("#dealTag").val()), function (index, item) {
                        //     addForm.append('<input type="hidden" name="dealTags" value="' + item.value + '">')
                        // })
                        $('#addDealForm').attr("action", "/deal/addDeal").attr("method", "post").submit();

                        // alert('asd')
                    })
                }
            })
        })

        // $(".likeButton").on("click", function () {
        // var userId = $(".userId").val();
        //
        // console.log("유저의 아이디는 : " + userId);
        //
        // if ( userId === '' || userId === null) {
        // alert("로그인후 사용해 주세요")
        //
        // } else if (userId !== '') {
        //
        // var likeCount = $(this).parents(".cardbox").find(".likeText").html();
        // var boardNum = $(this).parents(".cardbox").find(".CalenderReviewNum").val();
        // var boardCategory = $(this).parents(".cardbox").find(".boardCategory").val();
        // var likeText = $(this).parents(".cardbox").find(".likeText")
        //
        // $.ajax({
        // url: "/commu/json/addLike",
        // type: "POST",
        // data: JSON.stringify({
        // "likeCount": likeCount,
        // "boardNum": boardNum,
        // "boardCategory": boardCategory
        // }),
        // dataType: "JSON",
        // contentType: 'application/json; charset=UTF-8',
        // success: function (JSONData, result) {
        // likeText.html(JSONData)
        // }
        // })
        // }
        // })
        // })
        //deallistBox 시작
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
            float: left;
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
            margin-right: 30px;
        }

        .like {
            font-size: 0.1rem;
            width: 45px;
            outline: 0;
            border: none;
            background-color: #fff;
        }

        .addBox {
            margin-bottom: 50px;
        }

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
            margin-bottom: 30px;
            float: left;
            transition: all 0.2s linear;
        }

        .cardbox:hover {
            transform: scale(1.12);
        }

        .potoBox {
            cursor: pointer;
            padding: 1px;
            width: 294px;
            height: 200px;
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
            width: 9ch;
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

        @keyframes blink {
            80% {
                border-color: transparent
            }
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
<jsp:include page="/view/deal/history.jsp"/>
<img src="/resources/uploadFiles/dealBoardFiles/중고거래.png" style="height: 500px;border-radius: 10px;  width: 1600px;">
<div class="wap">

    <div class="wrapper">
        <div class="typing">
            <h4 style="font-weight: bolder; margin-bottom: 50px; font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);">
                중고 거래</h4>
        </div>
    </div>


    <body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">

    <nav class="navbar navbar-expand-lg deallistBox">

        <div>
            <div class="underline yellow allList">전체</div>
        </div>

        <div>
            <div class="underline yellow deallist">판매</div>
        </div>

        <div>
            <div class="underline yellow dealrequestlist">판매 요청</div>
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
        <button class="btn btn-primary addDeal" data-bs-toggle="modal" data-bs-target="#addDeal">
            거래 작성
        </button>


        <div>
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
                <%--                <input type="hidden" id="currentPage" name="currentPage" value=""/>--%>
                <%--    <span class="_1knjz499"><input class="_1knjz49b" placeholder="물품을 검색해보세요" value=""/></span></span>--%>
<%--                            </form>--%>
                <div class="input-group mb-3">
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">검색
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">제목</a></li>
                        <li><a class="dropdown-item" href="#">상품명</a></li>

                    </ul>
                    <input type="text" class="form-control" aria-label="Text input with dropdown button">
                </div>
        </div>
    </div>
    <%--버튼 모음 끝--%>
    <div class="wap">

        <c:set var="i" value="0"/>
        <c:forEach var="deal" items="${list}">
            <c:set var="i" value="${i+1}"/>
            <div class="row row-cols-1 row-cols-md-3 g-4 cardbox">
                <div class="col dealBox">
                    <input type="hidden" name="dealBoardNum" class="dealBoardNum" value="${deal.dealBoardNum}">
                    <div class="card h-100 shadow-lg">
                        <div class="card-footer" style=" border-bottom: 1px solid; display: flex; font-weight: bold">
                                ${deal.dealTitle}
                            <p class="allFlex " style="position: absolute; right: 10px;"><c:if
                                    test="${deal.dealStatus == 0}">
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
                                <p class="allFlex" style="font-size: 1.3em; font-weight: bold"> ${deal.price} 원 </p>
                                <p class="allFlex" style="font-size: 1.3em; font-weight: bold">${deal.villCode}
                                    ∙ ${deal.dealRegDate}</p>
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
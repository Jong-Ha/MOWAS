<%--
  Created by IntelliJ IDEA.
  User: BACK
  Date: 2022-10-05
  Time: 오전 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <script type="text/javascript">
        $(function () {

            $(".clubCalenderReview").on("click", function () {
                location.href = "/clubCal/listCalenderReview?boardCategory="+1+"&reviewRange=" + 1
            });

            $(".clubCalenderReviewShort").on("click", function () {
                location.href = "/clubCal/listCalenderReview?boardCategory=" + 2 +"&reviewRange=" + 1
            })

            $(".villBoard").on("click", function () {

                var villCode = '${user.villCode}'

                var userId = '${user.userId}'

                if(userId !== ''){

                    location.href = "/commu/villBoardList?villCode=" + villCode + "&boardCategory=" + 3;

                }else{
                    Swal.fire({
                        icon: 'error',
                        title: '사용할수 없는 기능 입니다',
                        text: '로그인후 사용해 주세요',
                        footer: '<a href="">Why do I have this issue?</a>'
                    }).then(()=>{

                            $("#loginModal").modal("show")

                        }
                    )
                }
            });


        });
    </script>

    <style>
        .commuBox {
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

<div class="wrapper">
    <div class="typing">
        <h4 style="font-weight: bolder; margin-bottom: 50px; font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);">
            커뮤니티 게시판</h4>
    </div>
</div>

<nav class="navbar navbar-expand-lg commuBox">


    <div>
        <div class="underline yellow clubCalenderReview">모임 일정 후기</div>
    </div>

    <div>
        <div class="underline yellow  clubCalenderReviewShort">모임 일정 쇼츠</div>
    </div>

    <div>
        <div class="underline yellow villBoard">우리 동네 게시글</div>
    </div>


</nav>

<div class="container">
    <hr>
</div>
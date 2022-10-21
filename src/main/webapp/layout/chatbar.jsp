<%--
  Created by IntelliJ IDEA.
  User: BACK
  Date: 2022-10-05
  Time: 오전 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript">
        $(function () {

            $(".onebyone").on("click", function () {
                location.href = "/chat/chatList?chatCategory="+ 'onebyone';
            });

            $(".dealChat").on("click", function () {
                location.href = "/chat/chatList?chatCategory="+ 'dealChat';
            })

            $(".clubChat").on("click", function () {
                location.href = "/chat/chatList?chatCategory="+ 'clubChat';
            });

            $(".siteChat").on("click", function () {
                location.href = "/chat/chatList?chatCategory="+ 'siteChat';
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
            width: 5.8ch;
            animation: typing 0.6s steps(22), blink .5s step-end infinite alternate;
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
<body>
<div class="wrapper">
    <div class="typing">
        <h4 style="font-weight: bolder; margin-bottom: 50px; font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);">
            채팅방</h4>
    </div>
</div>

<nav class="navbar navbar-expand-lg commuBox">

    <div>
        <div class="underline yellow onebyone">1대1 채팅</div>
    </div>

    <div>
        <div class="underline yellow dealChat">거래 채팅</div>
    </div>

    <div>
        <div class="underline yellow clubChat">모임 채팅</div>
    </div>

    <div>
        <div class="underline yellow  siteChat">고객센터 채팅</div>
    </div>


</nav>
<hr>
</body>
</html>

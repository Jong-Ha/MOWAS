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
    <title>Bootstrap Example</title>

    <script type="text/javascript">
        $(function () {

            $('.${chatCategory}').addClass('checkedBar')

            $(".onebyone").on("click", function () {
                // location.href = "/chat/chatList?chatCategory="+ 'onebyone';
                socket.disconnect()
                socket.io.opts.query.chatCategory = 'onebyone'
                socket.connect()
                $('.chatBar > div').removeClass('checkedBar')
                $(this).addClass('checkedBar')
            });

            $(".dealChat").on("click", function () {
                // location.href = "/chat/chatList?chatCategory="+ 'dealChat';
                socket.disconnect()
                socket.io.opts.query.chatCategory = 'dealChat'
                socket.connect()
                $('.chatBar > div').removeClass('checkedBar')
                $(this).addClass('checkedBar')
            })

            $(".clubChat").on("click", function () {
                // location.href = "/chat/chatList?chatCategory="+ 'clubChat';
                socket.disconnect()
                socket.io.opts.query.chatCategory = 'clubChat'
                socket.connect()
                $('.chatBar > div').removeClass('checkedBar')
                $(this).addClass('checkedBar')
            });

        });
    </script>

    <style>
        .chatBar {
            margin-top: 10px;
            margin-bottom: 10px;
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
            margin-right: 0;
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

        .checkedBar{
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
<nav class="navbar navbar-expand-lg chatBar" style="display: flex;justify-content: space-between;width: 100%;">

        <div class="underline yellow onebyone">1대1 채팅</div>

        <div class="underline yellow dealChat">거래 채팅</div>

        <div class="underline yellow clubChat">모임 채팅</div>

</nav>
</body>
</html>

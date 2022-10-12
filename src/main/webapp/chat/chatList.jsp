<%--
  Created by IntelliJ IDEA.
  User: BACK
  Date: 2022-10-11
  Time: 오후 3:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

    <title>Title</title>

    <script>
        $(function () {
            $(".chatText").on("click" ,function () {
                location.href  = "/commu/getChat?chatCategory="+1
            })

            $(".clubChathatText").on("click", function (){
                location.href  = "/commu/getChat?chatCategory="+2
            })
            $(".dealChatText").on("click", function (){
                location.href  = "/commu/getChat?chatCategory="+3
            })
            $(".siteChatText").on("click", function (){
                location.href  = "/commu/getChat?chatCategory="+4
            })
        })

    </script>

    <style>
        .wap{
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }
        .chatBox{
            display: flex;
            width: 500px;
            border: 1px solid;
            height: 700px;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }
        .chatText{
            display: flex;
            width: 450px;
            margin-top: 20px;
            border: 1px solid;
            height: 100px;


        }
        .clubChathatText{
            width: 450px;
            margin-top: 20px;
            border: 1px solid;
            height: 100px;
        }
        .dealChatText{
            width: 450px;
            margin-top: 20px;
            border: 1px solid;
            height: 100px;
        }
        .siteChatText{
            width: 450px;
            margin-top: 20px;
            border: 1px solid;
            height: 100px;
        }

    </style>
</head>
<body>
<jsp:include page="/layout/chatbar.jsp"/>
<div class="wap">
<div class="chatBox">
    <div class="chatText">
        1대1 채팅
    </div>
    <div class="clubChathatText">
        모임 채팅
    </div>
    <div class="dealChatText">
       거래 채팅
    </div>
    <div class="siteChatText">
        고객센터 채팅
    </div>
</div>
</div>
</body>
</html>

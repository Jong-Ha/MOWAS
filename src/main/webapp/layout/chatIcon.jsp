<%--
  Created by IntelliJ IDEA.
  User: BACK
  Date: 2022-10-07
  Time: 오후 1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
  $(function () {

    $(".chatBox").on("click", ()=> {
      window.open("/chat/chatList", "chatList")
    })

  })
</script>
<html>
<head>
  <style>
    .chat{
      font-size: 2em;
      color: #000000;
    }

    .chatBox{
      position: fixed;
      background-color: #FFFFFF;
      border: 2px solid #000000;
      cursor: pointer;
      bottom: 50px;
      right: 50px;
      width: 60px;
      height: 60px;
      border-radius: 50%;
      z-index: 3;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 0 2rem rgba(0,0,0,.5);
      transition: 0.2s;
    }

    .chatBox:hover{
      transform: scale(1.1);
    }
  </style>
    <title>Title</title>
</head>
<body>
  <div class="chatBox">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-text chat" viewBox="0 0 16 16">
      <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
      <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
    </svg>
  </div>

</body>
</html>
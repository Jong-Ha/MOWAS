<%--
  Created by IntelliJ IDEA.
  User: BACK
  Date: 2022-10-07
  Time: 오후 1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
  $(function () {

    $(".chatBox").on("click", ()=> {
      window.open("/chat/chatList", "chatList",
      "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no")
    })

  })
</script>
<html>
<head>
  <style>
    .chat{
      display: flex;
      justify-content: space-between;
      font-size: 3em;
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      z-index: 1;
      margin-top: 600px;
      margin-left: 1250px;
      text-align:center;
    }
    .chatBox{
      float: right;
      margin-top: 200px;
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
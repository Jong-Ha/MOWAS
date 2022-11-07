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
      if(${empty user}){
        // alert('로그인 후 이용해주세요')
        Swal.fire({
          icon: 'error',
          title: '로그인이 필요합니다',
          text: '로그인을 먼저 진행해주세요'
        }).then(()=>{
          $('#loginModal').modal('show')
        })
        // $('#loginModal').modal('show')
        return false
      }
      window.open("/chat/chatList",'chatList')
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
      /*border: 2px solid #f0d662;*/
      border: 2px solid #baac68;
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
      border-color: #f8cd07;
    }

    .bi-messenger {
      /*fill: #f0d662;*/
      fill: #baac68;
      transition: 0.3s;
    }

    .chatBox:hover .bi-messenger{
      fill: #f8cd07;
      transform: scale(1.3);
    }
  </style>
    <title>Title</title>
</head>
<body>
  <div class="chatBox">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-messenger chat" viewBox="0 0 16 16">
      <path d="M0 7.76C0 3.301 3.493 0 8 0s8 3.301 8 7.76-3.493 7.76-8 7.76c-.81 0-1.586-.107-2.316-.307a.639.639 0 0 0-.427.03l-1.588.702a.64.64 0 0 1-.898-.566l-.044-1.423a.639.639 0 0 0-.215-.456C.956 12.108 0 10.092 0 7.76zm5.546-1.459-2.35 3.728c-.225.358.214.761.551.506l2.525-1.916a.48.48 0 0 1 .578-.002l1.869 1.402a1.2 1.2 0 0 0 1.735-.32l2.35-3.728c.226-.358-.214-.761-.551-.506L9.728 7.381a.48.48 0 0 1-.578.002L7.281 5.98a1.2 1.2 0 0 0-1.735.32z"/>
    </svg>
  </div>

</body>
</html>
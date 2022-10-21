<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>Document</title>
    <script>

        $(function () {

            $('#hamburger-line-wrapper').click(function () {

                /* 추가된 부분 */
                $('.line').removeClass('init');
                $('#line-top').toggleClass('line-top').toggleClass('top-reverse');
                $('#line-mid').toggleClass('line-mid').toggleClass('mid-reverse');
                $('#line-bot').toggleClass('line-bot').toggleClass('bot-reverse');

                $(".dropdown-box").slideToggle();
            })




        })

    </script>

    <style>

        ul, li {
            list-style: none;
            padding: 5px;
            margin-top: 10px;

        }

        .dealList {
            margin-top: 15px;
            cursor: pointer;
            background-repeat: no-repeat;
            background-size: 0% 100%;
            transition: background-size 0.2s;


        }

        @media (min-width: 1000px) {
            .dealList {
                font-size: 1.5em;
            }
        }

        .dealList:hover {
            transition: 0.2s;
            background-size: 100% 100%;
            background-image: linear-gradient(transparent 60%, #F8CD07 40%);

        }

        #hamburger-line-wrapper {
            cursor: pointer;
            width: 16px;
            position: relative;
            float: right;
            margin-left: 400px;

        }

        /* 추가된 부분 */
        .init {
            animation: none !important;
        }

        .line {
            background: #ffffff;
            margin-top: 6px;
            margin-bottom: 6px;
            width: 56px;
            height: 7px;
            border-radius: 2px;
            position: relative;
        }

        .line-top {
            animation: line-top .5s forwards ease-out,
            line-top-rotate .3s .5s forwards ease-out;
        }

        /* 추가된 부분 */
        .top-reverse {
            animation: line-top-rotate-reverse .3s forwards ease-out,
            line-top-reverse .5s .3s forwards ease-out;
        }

        .line-mid {
            animation: line-mid .5s forwards ease-out;
        }

        /* 추가된 부분 */
        .mid-reverse {
            animation: line-mid-invisible .3s forwards ease-out,
            line-mid-reverse .5s .3s forwards ease-out;
        }

        .line-bot {
            animation: line-bot .5s forwards ease-out,
            line-bot-rotate .3s .5s forwards ease-out;
        }

        /* 추가된 부분 */
        .bot-reverse {
            animation: line-bot-rotate-reverse .3s forwards ease-out,
            line-bot-reverse .5s .3s forwards ease-out;
        }

        @keyframes line-top {
            0% {
                transform: translateY(0px)
            }
            100% {
                transform: translateY(13px)
            }
        }

        /* 추가된 부분 */
        @keyframes line-top-reverse {
            0% {
                transform: translateY(13px)
            }
            100% {
                transform: translateY(0px)
            }
        }

        @keyframes line-top-rotate {
            0% {
                transform: translateY(13px) rotateZ(0deg)
            }
            100% {
                transform: translateY(13px) rotateZ(45deg)
            }
        }

        /* 추가된 부분 */
        @keyframes line-top-rotate-reverse {
            0% {
                transform: translateY(13px) rotateZ(45deg)
            }
            100% {
                transform: translateY(13px) rotateZ(0deg)
            }
        }

        @keyframes line-mid {
            0% {
                transform: scale(1)
            }
            100% {
                transform: scale(0)
            }
        }

        /* 추가된 부분 */
        @keyframes line-mid-reverse {
            0% {
                transform: scale(0)
            }
            100% {
                transform: scale(1)
            }
        }

        @keyframes line-mid-invisible {
            0% {
                transform: scale(0)
            }
            100% {
                transform: scale(0)
            }
        }

        @keyframes line-bot {
            0% {
                transform: translateY(0px)
            }
            100% {
                transform: translateY(-13px)
            }
        }

        /* 추가된 부분 */
        @keyframes line-bot-reverse {
            0% {
                transform: translateY(-13px)
            }
            100% {
                transform: translateY(0px)
            }
        }

        @keyframes line-bot-rotate {
            0% {
                transform: translateY(-13px) rotateZ(0deg)
            }
            100% {
                transform: translateY(-13px) rotateZ(135deg)
            }
        }

        /* 추가된 부분 */
        @keyframes line-bot-rotate-reverse {
            0% {
                transform: translateY(-13px) rotateZ(135deg)
            }
            100% {
                transform: translateY(-13px) rotateZ(0deg)
            }
        }

    </style>
</head>
<body>
<div class="wrapper">
    <div class="user-container">

        <label for="nickname">대화</label>

        <input type="text" value="${user.userId}" id="nickname">

        <c:if test="${chatNameSpace == 'dealChat'}">

            <div class="hamburger">
                <div id="hamburger-wrapper">
                    <div id="hamburger-line-wrapper">
                        <!-- 추가된 부분 -->
                        <div id="line-top" class=" line init top-reverse"></div>
                        <div id="line-mid" class=" line init mid-reverse"></div>
                        <div id="line-bot" class=" line init bot-reverse"></div>
                    </div>
                </div>
            </div>

        </c:if>

    </div>

    <div class="dropdown-box" style="display: none;    position: absolute;
    background: rgba(249, 249, 249, 0.75);
    z-index: 2;
    width: 200px;
    height: 180px;
    margin-top: 67px;
    margin-left: 475px;">

        <ul class="">
            <li>
                <a class="dealList dealCalender">직거래 일정 등록 하기</a>
            </li>

            <li>
                <a class="dealList">택배거래</a>
            </li>

            <li>
                <a class="dealList">음...</a>
            </li>

        </ul>
    </div>


    <div class="display-container">
        <ul class="chatting-list">

        </ul>
    </div>
    <div class="input-container">
            <span>
                <input type="text" class="chatting-input">
                <button class="send-button">전송</button>
            </span>
        <form>
            <input id="file" type="file" multiple class="send-file" value="파일 전송"/>
        </form>
    </div>
</div>
<!--html이 로드된후 soket과 연결 하기 위해-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.5.2/socket.io.js"
        integrity="sha512-VJ6+sp2E5rFQk05caiXXzQd1wBABpjEj1r5kMiLmGAAgwPItw1YpqsCCBtq8Yr1x6C49/mTpRdXtq8O2RcZhlQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="/resources/css/chat.css">

<script>

    function fileUpload() {
        //alert("파일 업로드 시작 합니다");

        //form 테그를 불러와서 form변수에 등록
        var form = document.querySelector("form");
        //formData 변수에 html에서 form과 같은 역활을 하는 javaScript의 FormData에 form을 넣는다
        var formData = new FormData(form);
        //파일 사이즈만큼 formData을 돌리기 위해 fileSize를 알아내는 변수
        var fileSize = $("#file")[0].files;

        console.log(fileSize.length);

        //file길이 만큼 for문으로 formData에 append함
        for (var i = 0; i < fileSize.length; i++) {
            formData.append("form", fileSize[i]);
            //파일이 잘 들어 갔는지 확인
            console.log(fileSize[i]);
        }
        //파일은 json형식으로 보낼수 없기 떄문에 contentType, processData, dataType을 false로 지정
        $.ajax({
            url: "/chat/json/chatFile",
            type: "post",
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            data: formData,
            headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
            enctype: "multipart/form-data",
            success: function (result) {
                console.log(result);

                $("#file").val("");
            }

        })
    }

    //dom을 사용해서 클라이언트에서 기록되는 내용을 가지고온다
    const nickname = document.querySelector("#nickname");
    const chatList = document.querySelector(".chatting-list");
    const chatInput = document.querySelector(".chatting-input");
    const sendButton = document.querySelector(".send-button");
    const displayContainer = document.querySelector(".display-container");

    $(function () {
        console.log('${chatNameSpace}');
        console.log('${boardNum}');
        //app.js에 있는 io상수를 socket상수에 담는다
        const socket = io("http://192.168.0.235:5000/${chatNameSpace}", {
            cors: {origin: '*'},
            query: {

                roomId: '${roomId}',
                userId1: '${userId}',
                userId2: '${user.userId}',
                boardNum : '${boardNum}'
            }
        });

        socket.on("json", (msg) => {

            console.log(msg);

            $(".chatting-list *").remove();

            $.each(msg, (index, item) => {

                const newItem = new LiModel(item.userId[0], item.msg, item.time);

                //makeLi를 실행한다.
                newItem.makeLi();
            })
        });


        chatInput.addEventListener("keyup", (e) => {
            if (e.keyCode === 13) {
                sendMessage(socket)
            }

        });
        //button클릭시 발생하는 이벤트
        sendButton.addEventListener("click", () => {
            sendMessage(socket)
        })


        //server에서 data를 받음
        socket.on("chatting", (newMsg) => {

            //서버에게 받은 data를 각각 상수에 담음
            // const {name, msg, time} = newMsg;

            //item 상수에 LiModel 매개변수 (neme,msg,time)을 받는 함수를 실행 시키고
            // item에 담음
            // console.log(newMsg)
            // console.log(newMsg.userId)
            // console.log(newMsg.msg)
            // console.log(newMsg.time)
            const item = new LiModel(newMsg.userId, newMsg.msg, newMsg.time);

            //makeLi를 실행한다.
            item.makeLi();

            //채팅시 화면이 최하단으로 가기위해 scrollTo method를 사용
        })




        socket.on("postboardNum",(date)=>{

            console.log(date);

            window.open( "/commu/addDealCalender?boardNum="+ date , "거래 일정 등록",
                "top=100, width=550px, height=500px, marginwidth=0, marginheight=0, marginright:100px; scrollbars=no, scrolling=no, menubar=no, resizable=no")


        })


        $(".dealCalender").on("click", ()=>{


            socket.emit('getboardNum', ()=>{})

            alert("거래 일정 입장")

        })


    })

    function sendMessage(socket) {
        if (chatInput.value === '') {
            return
        }

        fileUpload();

        const data = {
            name: nickname.value,
            msg: chatInput.value
        }
        //Server에 socket.on으로 data정보를 전달
        socket.emit("chatting", data)
    }

    function LiModel(name, msg, time) {
        this.name = name;
        this.msg = msg;
        this.time = time;

        this.makeLi = () => {
            //li 상수에 li테크를 만드는 method를 담는다
            const li = document.createElement("li");
            //내가 작성한건지 상대방이 작성한건지 비교하는 method
            li.classList.add(nickname.value == this.name ? "sent" : "received")
            //li에 html을 넣는다
            li.innerHTML = '<span class="profile">' +
                '<span class="user">' + this.name + '</span>' +
                '<img class="userimg" src="https://placeimg.com/50/50/any" alt="any">' +
                '</span>' +
                '<span class="message">' + this.msg + '</span>' +
                '<span class="time">' + this.time + '</span>';

            //catList에 li의 html을 append한다
            chatList.appendChild(li);
            displayContainer.scrollTo(0, displayContainer.scrollHeight);

            $(chatInput).val('')
        }
    }
</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

</head>
<body>
<div class="wrapper">
    <div class="user-container">
        <label for="nickname">대화</label>
        <input type="text" value="${user.userId}" id="nickname">
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
    </div>
</div>

<!--html이 로드된후 soket과 연결 하기 위해-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.5.2/socket.io.js"
        integrity="sha512-VJ6+sp2E5rFQk05caiXXzQd1wBABpjEj1r5kMiLmGAAgwPItw1YpqsCCBtq8Yr1x6C49/mTpRdXtq8O2RcZhlQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/chat.css">

<script>
    $(function () {


        //app.js에 있는 io상수를 socket상수에 담는다
        const socket = io("http://192.168.0.235:5000/clubChat", {
            cors: {origin: '*'},
            query : {
                roomId : 2222
            }
        });
        //dom을 사용해서 클라이언트에서 기록되는 내용을 가지고온다
        const nickname = document.querySelector("#nickname");
        const chatList = document.querySelector(".chatting-list");
        const chatInput = document.querySelector(".chatting-input");
        const sendButton = document.querySelector(".send-button");
        const displayContainer = document.querySelector(".display-container");


        //button클릭시 발생하는 이벤트
        sendButton.addEventListener("click", () => {
            //상수 param에 값 : value 형식으로 저장한다
            const data = {
                name: nickname.value,
                msg: chatInput.value
            }
            //Server에 socket.on으로 data정보를 전달
            socket.emit("chatting", data)
        })
        //server에서 data를 받음
        socket.on("chatting", (data) => {
            //서버에게 받은 data를 각각 상수에 담음
            const {name, msg, time} = data;
            //item 상수에 LiModel 매개변수 (neme,msg,time)을 받는 함수를 실행 시키고
            // item에 담음
            const item = new LiModel(data.name, data.msg, data.time);
            //makeLi를 실행한다.
            item.makeLi();
            //채팅시 화면이 최하단으로 가기위해 scrollTo method를 사용
            displayContainer.scrollTo(0, displayContainer.scrollHeight);
        })

        function LiModel(name, msg, time) {
            this.name = name;
            this.msg = msg;
            this.time = time;

            this.makeLi = () => {
                //li 상수에 li테크를 만드는 method를 담는다
                const li = document.createElement("li");
                //내가 작성한건지 상대방이 작성한건지 비교하는 method
                li.classList.add(nickname.value === this.name ? "sent" : "received")
                //li에 html을 넣는다
                li.innerHTML = '<span class="profile">' +
                    '<span class="user">' + this.name + '</span>' +
                    '<img class="userimg" src="https://placeimg.com/50/50/any" alt="any">' +
                    '</span>' +
                    '<span class="message">' + this.msg + '</span>' +
                    '<span class="time">' + this.time + '</span>';

                //catList에 li의 html을 append한다
                chatList.appendChild(li);
            }
        }
    })
</script>
</body>
</html>

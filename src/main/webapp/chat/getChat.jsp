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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
    height: 190px;
    margin-top: 67px;
    margin-left: 475px;">

        <ul class="">
            <li>
                <a class="dealList dealCalender">일정 등록 하기</a>
            </li>

            <li>
                <a class="dealList dealUpdateCalender">일정 수정 하기</a>
            </li>

            <li>
                <a class="dealList dealCalenderlist">내 거래 일정 보기</a>
            </li>

            <li>
                <a class="dealList addReview">거래 확정</a>
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


<%--거래 일정 작성--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <input type="hidden" class="dealNum" value="">
                <h1 class="modal-title fs-5" id="exampleModalLabel4"> 거래 일정 작성 </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="fileForm4">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control dealCalenderTitle" id="recipient-name" value=""
                               placeholder="asdasd">
                        <label for="recipient-name">제 목</label>
                    </div>


                    <div class="form-floating mb-3">

                        <input type="date" class="form-control dealDate" id="date-text" value="" placeholder="asdasd"/>
                        <label for="date-text">모임 일정 날짜</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="text" class="form-control dealLocation" value="위치 선택">

                    </div>

                </form>

            </div>

            <div class="modal-footer" style=" justify-content:center;">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary dealSubmit">등록</button>

            </div>
        </div>
    </div>
</div>


<%--거래 일정 수정--%>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel5" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <input type="hidden" class="dealNum" value="">
                <h1 class="modal-title fs-5" id="exampleModalLabel5"> 거래 일정 수정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">


                <div class="form-floating mb-3">
                    <input type="text" class="form-control dealCalenderTitle2" id="recipient-name2" value=""
                           placeholder="asdasd">
                    <label for="recipient-name">제 목</label>
                </div>


                <div class="form-floating mb-3">

                    <input type="date" class="form-control dealDate2" id="date-text2" value="" placeholder="asdasd"/>
                    <label for="date-text">모임 일정 날짜</label>

                </div>

                <div class="input-group mb-3">

                    <input type="text" class="form-control dealLocation2" value="위치 선택">

                </div>

            </div>

            <div class="modal-footer" style=" justify-content:center;">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary dealUpdateSubmit">수정 하기</button>

            </div>
        </div>
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
        const socket = io("http://localhost:5000/${chatNameSpace}", {
            /*const socket = io("http://192.168.0.235:5000/${chatNameSpace}", {*/
            cors: {origin: '*'},
            query: {

                roomId: '${roomId}',
                userId1: '${userId}',
                userId2: '${user.userId}',
                boardNum: '${boardNum}'
            }
        })
        // 거래 계시판 번호 얻기
        socket.emit('getboardNum', () => { })

        socket.on("postboardNum", (date) => {

            console.log(date);

            $(".dealNum").val(date);
        })






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

            const item = new LiModel(newMsg.userId, newMsg.msg, newMsg.time);

            item.makeLi();

        })




        // 거래 모달창 오픈
        $(".dealCalender").on("click", () => {

            const modal = new bootstrap.Modal('#exampleModal', {})
            modal.show();

        })

        $(".dealUpdateCalender").on("click", () => {

            var dealBoardNum = $(".dealNum").val();

            alert(dealBoardNum);

            $.ajax({
                url: "/clubCal/json/getDealCalender",
                method: "POST",
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({
                    "dealBoardNum": dealBoardNum
                }),
                success: function (JSONData, result) {

                    var deal = JSONData.deal

                    console.log("deal : "+ deal);

                    var date = new Date(deal.dealDate);

                    const year = date.getFullYear();
                    const month = ('0' + (date.getMonth() + 1)).slice(-2);
                    const day = ('0' + date.getDate()).slice(-2);
                    const dateStr = year + '-' + month + '-' + day;


                    $(".dealCalenderTitle2").val(deal.dealCalenderTitle);
                    $(".dealDate2").val(dateStr);
                    $(".dealLocation2").val(deal.dealLocation);

                    const modal = new bootstrap.Modal('#exampleModal2', {})
                    modal.show();

                }
            })
        })

        $(".dealSubmit").on("click", function () {

            var dealBoardNum = $(".dealNum").val()
            var dealCalenderTitle = $(".dealCalenderTitle").val()
            var dealDate = $(".dealDate").val()
            var dealLocation = $(".dealLocation").val()

            console.log(dealBoardNum)
            console.log(dealCalenderTitle)
            console.log(dealDate)
            console.log(dealLocation)

            $.ajax({
                url: "/clubCal/json/updateDealCalender",
                method: "post",
                data: JSON.stringify({
                    "dealBoardNum": dealBoardNum,
                    "dealCalenderTitle": dealCalenderTitle,
                    "dealDate": dealDate,
                    "dealLocation": dealLocation,
                    "dealId": '${user.userId}'

                }),

                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function (JSONData, result) {

                    console.log(result);
                    // 성공시 해당 창을 닫고 부모창을 reload
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });

                    setTimeout(function () {
                        window.open("/view/community/list/dealCalender.jsp", "거래 일정",
                            "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no")
                        window.location.reload()
                    }, 2000);
                    //error 발생시 그냥 창을 닫음
                }, error: function () {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    setTimeout(function () {
                        window.location.reload()
                    }, 2000);

                }
            });

        });


        $(".dealUpdateSubmit").on("click", function () {

            var dealBoardNum = $(".dealNum").val()
            var dealCalenderTitle = $(".dealCalenderTitle2").val()
            var dealDate = $(".dealDate2").val()
            var dealLocation = $(".dealLocation2").val()

            console.log(dealBoardNum)
            console.log(dealCalenderTitle)
            console.log(dealDate)
            console.log(dealLocation)

            $.ajax({
                url: "/clubCal/json/updateDealCalender",
                method: "post",
                data: JSON.stringify({
                    "dealBoardNum": dealBoardNum,
                    "dealCalenderTitle": dealCalenderTitle,
                    "dealDate": dealDate,
                    "dealLocation": dealLocation,

                }),

                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function (JSONData, result) {

                    console.log(result);
                    // 성공시 해당 창을 닫고 부모창을 reload
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });

                    setTimeout(function () {
                        window.open("/view/community/list/dealCalender.jsp", "거래 일정",
                            "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no")
                        window.location.reload()
                    }, 2000);
                    //error 발생시 그냥 창을 닫음
                }, error: function () {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Your work has been saved',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    setTimeout(function () {
                        window.location.reload()
                    }, 2000);

                }
            });

        });

        $(".dealCalenderlist").on("click", function () {
            window.open("/view/community/list/dealCalender.jsp", "거래 일정",
                "left=300, top=200, width=750px, height=500px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no")
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
            li.innerHTML =
                '<span class="profile">' +
                '<span class="user">' + this.name + '</span>' +
                '<img class="userimg" src="https://placeimg.com/50/50/any" alt="any">' +
                '</span>' +
                '<span class="message">' + this.msg + '</span>' +
                '<span class="time">' + this.time + '</span>';

/*$(li).css('display','none')*/

                //catList에 li의 html을 append한다
                chatList.appendChild(li);
                //$('.chatting-list li:last-child').slideDown();
                displayContainer.scrollTo(0, displayContainer.scrollHeight);


            $(chatInput).val('')
        }
    }
</script>
</body>
</html>

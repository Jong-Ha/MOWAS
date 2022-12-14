<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <title>Document</title>
    <script>

        $(function () {

            $('#addVote').on('hide.bs.modal', () => {
                $('.xdsoft_datetimepicker').css('display', 'hide')
            })
            $('#updateVote').on('hide.bs.modal', () => {
                $('.xdsoft_datetimepicker').css('display', 'hide')
            })

            const tooltip = new bootstrap.Tooltip($('.send-button'))

            $('.listDrop').click(function () {


                $(".dropdown-box").slideToggle();
            })


            //투표합시당
            $('#listVote').off('show.bs.modal').on('show.bs.modal', function () {
                $('#listVote .modal-content').load('/club/listVote/${roomId}')
            })

            $('.display-container').parent().height($('#chatContainer').height() - $('.user-container').height() - 21)

        })

    </script>

    <style>

        .chatRoom ul, .chatRoom li {
            list-style: none;
            padding: 5px;
            margin-top: 10px;
            margin-bottom: 0;
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
        .chatRoom .init {
            animation: none !important;
        }

        .chatRoom .line {
            background: #ffffff;
            margin-top: 6px;
            margin-bottom: 6px;
            width: 56px;
            height: 7px;
            border-radius: 2px;
            position: relative;
        }

        .chatRoom .line-top {
            animation: line-top .5s forwards ease-out,
            line-top-rotate .3s .5s forwards ease-out;
        }

        /* 추가된 부분 */
        .chatRoom .top-reverse {
            animation: line-top-rotate-reverse .3s forwards ease-out,
            line-top-reverse .5s .3s forwards ease-out;
        }

        .chatRoom .line-mid {
            animation: line-mid .5s forwards ease-out;
        }

        /* 추가된 부분 */
        .chatRoom .mid-reverse {
            animation: line-mid-invisible .3s forwards ease-out,
            line-mid-reverse .5s .3s forwards ease-out;
        }

        .chatRoom .line-bot {
            animation: line-bot .5s forwards ease-out,
            line-bot-rotate .3s .5s forwards ease-out;
        }

        /* 추가된 부분 */
        .chatRoom .bot-reverse {
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

        .dropdown-box {
            display: none;
            position: absolute;
            background: rgb(249 249 249);
            z-index: 2;
            width: 160px;
            height: fit-content;
            margin-top: 37px;
            border-radius: 10px;
        }

        .dropdown-box > ul > li > a {
            font-size: 0.9rem;
            color: black;
        }

        .dropdown-box > ul > li > * {
            cursor: pointer;
        }

    </style>
</head>
<body>
<div class="wrapper">
    <div class="user-container"
         style="display: flex;justify-content: space-between;width: 100%;border-bottom: 1px solid;padding : 10px;">

        <label for="nickname"></label>

        <input type="text" class="form-control-plaintext" readonly value="${param.roomName}" style="font-size: 1.2em;"
               id="nickname">
        <input type="hidden" id="chatterId" value="${user.userId}">


        <div class="dropContainer" style="display: flex;flex-direction: row-reverse;">

            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                 class="bi bi-three-dots listDrop" viewBox="0 0 16 16" style="font-size: 3rem;">
                <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
            </svg>

            <div class="dropdown-box shadow-lg">

                <ul>
                    <c:if test="${chatNameSpace == 'dealChat'}">

                        <li>
                            <a class="dealList dealCalender">일정 등록 하기</a>
                        </li>

                        <li>
                            <a class="dealList dealUpdateCalender">일정 수정 하기</a>
                        </li>

                        <li>
                            <a class="dealList dealCalenderlist">내 거래 일정 보기</a>
                        </li>

                    </c:if>

                    <li>
                        <label for="file">파일 업로드 </label>
                    </li>
                    <c:if test="${chatNameSpace!='clubChat'}">
                        <li>
                            <div class="deleteChat">채팅나가기</div>
                        </li>
                    </c:if>


                    <c:if test="${chatNameSpace=='clubChat'}">

                        <li>
                            <div type="text" class="listVoteView" data-bs-target="#listVote"
                                 data-bs-toggle="modal">투표
                            </div>
                        </li>

                        <li>
                            <div type="text" class="getClub">모임으로
                            </div>
                        </li>

                    </c:if>

                </ul>
            </div>


            <form id="fileForm">
                <input id="file" type="file" multiple class="send-file" value="파일 전송" style="display: none"/>
            </form>

        </div>

    </div>


    <div style="height: 653px;width: 100%">
        <div class="display-container"
             style="width: 100%; height: 90%; overflow-y: scroll;background-color: #87cefa40;">
            <ul class="chatting-list">

            </ul>
        </div>
        <div class="input-container">

            <label for="chatting-input" class="form-label"></label>
            <textarea class="form-control chatting-input" id="chatting-input" style="resize: none;" rows="3"></textarea>

            <button class="send-button" style="aspect-ratio: 1" data-bs-title="전송" data-bs-toggle="tooltip">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send"
                     viewBox="0 0 16 16" style="font-size: 24px">
                    <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
                </svg>
            </button>


        </div>
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

                    <input type="button" class="form-control" data-bs-toggle="modal" data-bs-target="#location1"
                           value="위치 선택">

                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-sm">위치 정보</span>
                        <input type="text" id="dealLocation" class="form-control dealLocation" aria-label="위치 정보"
                               aria-describedby="inputGroup-sizing-sm">
                    </div>


                </div>


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


<div class="container">

    <%--listVote 모달창 시작--%>
    <div class="modal fade voteModal" id="listVote" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--listVote 모달창 끝--%>

    <%--addVote 모달창 시작--%>
    <div class="modal fade voteModal" id="addVote" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--addVote 모달창 끝--%>

    <%--getVote 모달창 시작--%>
    <div class="modal fade voteModal" id="getVote" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--getVote 모달창 끝--%>

    <%--updateVote 모달창 시작--%>
    <div class="modal fade voteModal" id="updateVote" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--updateVote 모달창 끝--%>


</div>


<!--html이 로드된후 soket과 연결 하기 위해-->
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.5.2/socket.io.js"--%>
<%--integrity="sha512-VJ6+sp2E5rFQk05caiXXzQd1wBABpjEj1r5kMiLmGAAgwPItw1YpqsCCBtq8Yr1x6C49/mTpRdXtq8O2RcZhlQ=="--%>
<%--crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>

<script>

    //dom을 사용해서 클라이언트에서 기록되는 내용을 가지고온다
    var nickname = document.querySelector("#chatterId");
    var chatList = document.querySelector(".chatting-list");
    var chatInput = document.querySelector(".chatting-input");
    var sendButton = document.querySelector(".send-button");
    var displayContainer = document.querySelector(".display-container");

    $(function () {
        <%--console.log('${chatNameSpace}');--%>
        <%--console.log('${boardNum}');--%>
        <%--alert('${roomId}');--%>
        // return false
        //app.js에 있는 io상수를 socket상수에 담는다
        chatSocket = io(socketServer + "/${chatNameSpace}", {
            cors: {origin: '*'},
            query: {
                roomId: '${roomId}',
                userId1: '${userId}',
                userId2: '${user.userId}',
                boardNum: '${boardNum}',
                roomName: '${roomName}',
                userImage1: '${userImage}',
                userImage2: '${user.userImage}'
            },
            autoConnect: false,
            forceNew: true
        })

        console.log(chatSocket)

        chatSocket.connect()

        chatSocket.on('connect', function () {
            // 거래 계시판 번호 얻기
            chatSocket.emit('getboardNum', () => {
            })

            chatSocket.off('postboardNum').on("postboardNum", (date) => {

                console.log(date);

                $(".dealNum").val(date);
            })


            chatSocket.off('json').on("json", (msg) => {

                console.log(msg);

                $(".chatting-list *").remove();

                $.each(msg, (index, item) => {

                    if (item.imgCheck !== 9) {
                        const newItem = new LiModel(item.userId[0], item.msg, item.time, item.file, item.imgCheck, item.userImage);
                        console.log(item)
                        //makeLi를 실행한다.
                        newItem.makeLi();
                    }

                })
            });

            chatInput.addEventListener("keydown", (e) => {
                if (e.keyCode === 13) {
                    sendMessage(chatSocket)
                }
            });

            chatInput.addEventListener("keyup", (e) => {
                if (e.keyCode === 13) {
                    chatInput.value = ''
                }
            });

            //button클릭시 발생하는 이벤트
            sendButton.addEventListener("click", () => {
                sendMessage(chatSocket)
            })


            //server에서 data를 받음
            chatSocket.off('chatting').on("chatting", (newMsg) => {

                if (newMsg.imgCheck !== 9) {
                    const item = new LiModel(newMsg.userId, newMsg.msg, newMsg.time, newMsg.file, newMsg.imgCheck, newMsg.userImage);
                    console.log(newMsg)
                    item.makeLi();
                }

            })

            //clubNum 받기
            chatSocket.off('clubNum').on("clubNum", (clubNum) => {
                $('.chatRoom .getClub').off('click').on('click', function () {
                    // 원래창 이동 후 채팅창 닫기
                    opener.location.href = '/club/getClub/' + clubNum
                    self.close()

                    // 새창 열기
                    // window.open('/club/getClub/'+clubNum)
                })

            })


            // 거래 모달창 오픈
            $(".dealCalender").off('click').on("click", () => {

                const modal = new bootstrap.Modal('#exampleModal', {})
                modal.show();

            })

            $(".dealUpdateCalender").off('click').on("click", () => {

                var dealBoardNum = $(".dealNum").val();

                // alert(dealBoardNum);

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
                        if (deal.dealCalenderTitle == null) {
                            Swal.fire('일정을 등록해주세요!')
                        } else {
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

                    }
                })
            })

            $(".deleteChat").off('click').on("click", () => {

                const data = {roomId: '${roomId}'}

                chatSocket.off('deleteChat')
                chatSocket.emit('deleteChat', data)
                $('.chatRoom').load('/chat/chatList.jsp #chattingRoom')
                chatSocket.disconnect()

            })

            chatSocket.off('deleteChat').on('deleteChat', () => {
                Swal.fire({
                    title: '상대방이 채팅방을 나갔습니다',
                    icon: 'warning'
                }).then(() => {
                    $('.chatRoom').load('/chat/chatList.jsp #chattingRoom')
                    chatSocket.disconnect()
                })
            })

            /*지도 출력*/
            $("#location1").on("shown.bs.modal", function () {

                relayout8();

            })

            $(".dealSubmit").off('click').on("click", function () {

                var dealBoardNum = $(".dealNum").val()
                var dealCalenderTitle = $(".dealCalenderTitle").val()
                var dealDate = $(".dealDate").val()
                var dealLocation = $(".dealLocation").val()
                var userId = '${user.userId}';

                // alert(userId);

                console.log(dealBoardNum)
                console.log(dealCalenderTitle)
                console.log(dealDate)
                console.log(dealLocation)

                $.ajax({
                    url: "/clubCal/json/addDealCalender",
                    method: "post",
                    data: JSON.stringify({
                        "dealBoardNum": dealBoardNum,
                        "dealCalenderTitle": dealCalenderTitle,
                        "dealDate": dealDate,
                        "dealLocation": dealLocation,
                        "dealId": userId

                    }),

                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    success: function (JSONData, result) {

                        console.log(result);
                        // 성공시 해당 창을 닫고 부모창을 reload
                        Swal.fire({
                            icon: 'success',
                            title: '일정이 등록되었습니다',
                            showConfirmButton: false,
                            timer: 1500
                        });

                        setTimeout(function () {
                            $('#exampleModal').modal('hide')
                            window.open("/view/community/list/dealCalender.jsp", "거래 일정",
                                "left=300, top=200, width=750px, height=500px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no")
                        }, 2000);
                        //error 발생시 그냥 창을 닫음
                    }, error: function () {
                        Swal.fire({
                            icon: 'success',
                            title: '에러 발생',
                            showConfirmButton: false,
                            timer: 1500
                        });
                        setTimeout(function () {
                            window.location.reload()
                        }, 2000);

                    }
                });

            });


            $(".dealUpdateSubmit").off('click').on("click", function () {

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

                        // 성공시 해당 창을 닫고 부모창을 reload
                        Swal.fire({
                            icon: 'success',
                            title: '일정이 수정되었습니다',
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

            $(".dealCalenderlist").off('click').on("click", function () {
                window.open("/view/community/list/dealCalender.jsp", "거래 일정",
                    "left=300, top=200, width=750px, height=500px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no")
            })


            $(".send-file").off('change').on("change", function () {

                //form 테그를 불러와서 form변수에 등록
                var form = document.querySelector("form");
                //formData 변수에 html에서 form과 같은 역활을 하는 javaScript의 FormData에 form을 넣는다
                var formData = new FormData(form);
                //파일 사이즈만큼 formData을 돌리기 위해 fileSize를 알아내는 변수
                var fileSize = $("#fileForm #file")[0].files;

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
                    success: function (JSONData, result) {

                        $.each(JSONData.list, function (inedx, item) {

                            console.log(item.fileName);


                            const data = {
                                name: nickname.value,
                                file: item.fileName,
                                imgCheck: 2,
                                userImage: '${user.userImage}'
                            }

                            chatSocket.emit("chatImg", data);
                        })


                    }

                })


            })
        })


    })

    function sendMessage(chatSocket) {
        if (chatInput.value === '' || chatInput.value === '\n') {
            chatInput.value = ''
            return
        }

        const data = {
            name: nickname.value,
            msg: chatInput.value,
            userImage: '${user.userImage}'
        }
        //Server에 socket.on으로 data정보를 전달
        chatSocket.emit("chatting", data)
        $('#chatting-input').val('')
    }

    function LiModel(name, msg, time, file, imgCheck, userImage) {
        this.name = name;
        this.msg = msg;
        this.time = time;
        this.file = file
        this.imgCheck = imgCheck
        this.userImage = userImage

        this.makeLi = () => {
            //li 상수에 li테크를 만드는 method를 담는다
            const li = document.createElement("li");

            if (imgCheck === 2) {
                li.innerHTML +=
                    '<div class="profile">' +
                    '<div class="user">' + this.name + '</div>' +
                    '<img class="userimg" src="/resources/' + this.userImage + '" alt="any">' +
                    '</div>' +
                    '<div class="message">' +
                    '<img src="/resources' + this.file + '" alt="/resources/images/proplePoto.png"></div>' +
                    '<div class="time">' + this.time + '</div>';

                li.classList.add(nickname.value == this.name ? "sent" : "received")

            }

            if (imgCheck !== 2) {
                li.innerHTML +=
                    '<div class="profile">' +
                    '<div class="user">' + this.name + '</div>' +
                    '<img class="userimg" src="/resources/' + this.userImage + '" alt="any">' +
                    '</div>' +
                    '<div class="message">' + this.msg + '</div>' +
                    '<div class="time">' + this.time + '</div>';

                li.classList.add(nickname.value == this.name ? "sent" : "received")
            }


            //catList에 li의 html을 append한다
            chatList.appendChild(li);
            //$('.chatting-list li:last-child').slideDown();
            setTimeout(function () {
                displayContainer.scrollTo(0, displayContainer.scrollHeight);
            }, 100)


        }
    }
</script>
</body>
</html>
<style>
    .message > img {
        /*max-width: 600px;*/
        /*max-height: 300px;*/
        width: 100%;
        object-fit: scale-down;
        background-color: #FFFFFF;
        border-radius: 10px;
    }

    .modal.voteModal .modal-body::-webkit-scrollbar {
        display: none;
    }

    .voteModal .back-btn {
        font-size: 1.5rem;
        cursor: pointer;
        width: 32px;
    }

    .voteModal .btn-close {
        margin: 0;
    }

    .voteModal .modal-title {
        text-align: center;
    }

    .voteModal .modal-text {
        font-size: 18px;
        border: 1px solid #ced4da;
        padding: 10px;
        border-radius: 0.375rem;
        align-items: baseline;
        background-color: #00000003;
        margin-bottom: 15px;
        text-align: left;
    }
</style>
<style>

    .chatRoom .input-container {
        display: flex;
        justify-content: stretch;
        align-items: stretch;
        height: 10%;
    }

    .chatRoom .input-container span {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        padding: 0.3rem;
        width: 100%;
    }

    .chatRoom .chatting-input {
        font-size: 12px;
        height: 100%;
        flex: 8;
        border: none;
    }

    .chatRoom .send-button {
        background: #ffeb33;
        border: none;
        height: 100%;
        border-radius: 3px 3px 5px 3px;
    }

    .chatRoom .profile {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .chatRoom .profile .user {
        font-size: 10px;
        margin-bottom: 0.3rem;
    }

    .chatRoom .profile .userimg {
        border-radius: 50%;
        object-fit: cover;
        width: 50px;
        height: 50px;
        background-color: #FFFFFF;
    }

    .chatRoom .message {
        border-radius: 5px;
        padding: 0.5rem;
        font-size: 12px;
        margin: 0 5px;
        text-align: left;
        word-break: break-all;
        max-width: 50%;
    }

    .chatRoom .time {
        font-size: 10px;
        margin: 0 5px;
        width: 75px;
    }

    .chatRoom .sent .time {
        text-align: right;
    }

    .chatRoom .received .time {
        text-align: left;
    }

    .chatRoom .sent {
        flex-direction: row-reverse;
        float: right;
    }


    .chatRoom .sent .message {
        background: #ffeb33;
    }

    .chatRoom .received .message {
        background: #ffffff;
    }


    .chatRoom .Imgsent {
        flex-direction: row-reverse;
        float: right;
        width: 38%
    }

    .chatRoom .Imgreceived {
        width: 38%;
        text-align: right;
    }


    .chatRoom .Imgsent .message {
        background: #ffeb33;
    }

    .chatRoom .Imgreceived .message {
        width: 150px;
        background: #ffffff;
    }

    .sent {
        float: left;
    }

    .chatRoom .chatting-list li.sent {
        width: 100%;
        padding: 0.3rem;
        display: flex;
        justify-content: flex-start;
        align-items: flex-end;
        margin-top: 0.5rem;
    }

    .chatRoom .chatting-list li.received {
        padding: 0.3rem;
        display: flex;
        justify-content: flex-start;
        align-items: flex-end;
        margin-top: 0.5rem;
    }

</style>
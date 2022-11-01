<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>MOWAS</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.5.2/socket.io.js"
            integrity="sha512-VJ6+sp2E5rFQk05caiXXzQd1wBABpjEj1r5kMiLmGAAgwPItw1YpqsCCBtq8Yr1x6C49/mTpRdXtq8O2RcZhlQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style href="/resources/css/chat.css" rel="stylesheet"></style>
    <title>Title</title>

    <style>
        .chatList {
            display: flex;
            width: 30%;
            flex-wrap: nowrap;
            flex-direction: column;
            align-items: center;
            align-content: center;
        }

        .chatRoom {
            width: 70%;
        }

        .card-title {
            text-align: left;
        }

        .card-body {
            padding: 0;
        }

        .chatBox {
            padding: 5px 5px;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            border-radius: 5px;
            border: 1px solid #2c262669;
            margin-bottom: 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<jsp:include page="/layout/toolbar.jsp"/>
<div class="container" style="display: flex;border: 1px solid;border-radius: 5px;padding: 0">

    <div class="chatList" style="border-right: 1px solid;padding: 3px 0;">
        <div style="width: 90%">
            <jsp:include page="/layout/chatbar.jsp"/>
        </div>

        <div style="border-top: 1px solid;width: 100%;">
        <div class="chatRooms" style="overflow-y: scroll;height: 650px;">



        </div>
    </div>

    </div>
    <div class="chatRoom">
        채팅 내용 표시 예정
    </div>
</div>


<script>
    let chatSocket

    $(function () {
        // alert('asdf')
        //채팅방 들어가기
        $(".addOneChat").on("click", function () {
            location.href = "/chat/addOneChat/" + $('[name="userId"]').val()
        })

        //소켓 연결
        const socket = io("http://localhost:5000/chatlist", {
            /*const socket = io("http://192.168.0.235:5000/chatlist", {*/
            cors: {origin: '*'},

            query: {
                userId: '${user.userId}',
                chatCategory: '${chatCategory}',
                roomId: 'null',
                userId1: 'null',
                userId2: 'null',
                boardNum: 'null',
                userImage1: 'null',
                userImage2: 'null'
            }

        })

        //채팅창 리스트 받기
        socket.on("list", (room) => {

            console.log(room)

            $(".chatRooms").html("");

            if(room.length===0){
                var chatlist = '<div>참여한 채팅방이 없습니다!</div>'
                $('.chatRooms').html(chatlist)
            }

            $.each(room, function (index, item) {

                console.log(item);

                var chatter;
                var roomImage;
                if (item.chatCategory === 'clubChat') {
                    chatter = item.roomName;
                    roomImage = item.roomImage
                } else {
                    if (item.users[0].userId === '${user.userId}') {
                        chatter = item.users[1].userId
                        roomImage = item.users[1].userImage
                    } else {
                        chatter = item.users[0].userId
                        roomImage = item.users[0].userImage
                    }
                }

                var chatList = ' <div class="card chatBox shadow-lg" style="width: 90%">' +
                    '<input hidden class="roomId" value="' + item.roomId + '">' +
                    '<input hidden class="rTime" value="0">' +
                    '<div class="row g-0" style="width: 100%">' +
                    '<div class="col-md-3 potoBox">' +
                    '<img class="bd-placeholder-img img-fluid rounded-start poto" src="/resources/'+roomImage+'"'+
                                 ' alt="any" style="width: 100%;object-fit: cover;border-radius: 5px;">' +
                    '</div>' +
                    '<div class="col-md-9 chatText">' +
                    '<div class="card-body " >' +
                    '<h5 class="card-title" style="height: 50%;display: flex;align-items: center;padding-left: 10px;">' + chatter + '</h5>' +
                    '<div style="display: flex;justify-content: space-between;align-items: center;padding-left: 10px;">'+
                    '<div class="card-text lastchatText text-truncate" style="max-width: 70%"><small>&nbsp;</small></div>'+
                    '<div class="card-text chatTime"><small class="text-muted" style="width: 30%">&nbsp;</small></div>'+
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>'

                $(".chatRooms").append(chatList);

                $('.poto').height($('.poto').width())
                $(window).off('resize').on('resize', function () {
                    $('.poto').height($('.poto').width())
                })
            })

            //최근 메시지 및 채팅창 시간 순 정렬
            socket.on("msg", (msg) => {
                // console.log(msg)
                // msg.forEach(function (a,b) {
                //     console.log(b)
                //     console.log(a)
                // })
                // console.log()
                // console.log()
                // console.log('===============================')
                // console.log(msg)
                // console.log('===============================')
                // console.log(msg[0])
                // console.log('===============================')
                // console.log()
                // console.log(i++)
                if (msg[0] === undefined) {
                    return false
                }
                var card = $(".roomId[value='" + msg[0].roomId + "']").parent()
                card.find(".lastchatText small").html(msg[0].msg)
                card.find(".chatTime small").html(msg[0].time)
                card.find(".rTime").val(msg[0].rtime)
                // alert(msg[0].rtime)
                // var chatBox = $(".chatBox")
                // console.log(chatBox.length)
                $.each($(".chatBox"), function (index, item) {
                    // alert($(item).find(".rTime").val())
                    if ($(item).find(".rTime").val() < msg[0].rtime) {

                        $(item).before(card)

                        return false;
                    }
                })

            });

            /*css append*/
            // var stylesheet = $("<link>", {
            //     rel: "stylesheet",
            //     type: "text/css",
            //     href: "/resources/css/chat.css"
            // });
            //
            // stylesheet.appendTo("head");
            let check = false
            $(".chatBox").off('click').on("click", function () {
                var roomId = $(this).find(".roomId").val()
                var roomName = $(this).find(".card-title").html()
                if(check){
                    chatSocket.disconnect()
                }else{
                    chatSocket = io("http://localhost:5000/${chatCategory}", {
                        /*const socket = io("http://192.168.0.235:5000/${chatCategory}", {*/
                        cors: {origin: '*'},
                        query: {
                            roomId: 'null',
                            userId1: 'null',
                            userId2: 'null',
                            boardNum: 'null',
                            userImage1: 'null',
                            userImage2: 'null'
                        }
                    })
                    chatSocket.on('connect',function(){
                        chatSocket.disconnect().off('connect')
                    })
                }
                check = true
                // alert(roomId)
                <%--alert("/chat/getChat?roomId=" + roomId + "&chatNameSpace=" + '${chatCategory}')--%>

                <%--location.href = "/chat/getChat?roomId=" + roomId + "&chatNameSpace=" + '${chatCategory}';--%>
                $.ajax({
                    url : "/chat/getChat?roomId=" + $(this).find(".roomId").val() + "&chatNameSpace=" + '${chatCategory}',
                    data: {
                        'roomName': roomName
                    },
                    success : function(re){
                        $('.chatRoom').html(re)
                    }
                })
            })

        })
    })


</script>


</body>
</html>

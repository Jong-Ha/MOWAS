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
    .chatList{
        display: flex;
        flex-wrap: nowrap;
        flex-direction: column;
        align-items: center;
        align-content: center;
    }
</style>
</head>
<body>
<div class="container">
    <jsp:include page="/layout/chatbar.jsp"/>

    <div class="chatList">

    </div>
</div>


<script>


    $(function () {
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
                chatCategory: '${chatCategory}'
            }

        })

        //채팅창 리스트 받기
        socket.on("list", (room) => {

            console.log(room)

            $(".chatList").html("");

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

                var chatList = ' <div class="card shadow-lg chatBox" style="width: 500px; max-width: 500px; margin-bottom: 20px">' +
                    '<input hidden class="roomId" value="' + item.roomId + '">' +
                    '<input hidden class="rTime" value="0">' +
                    '<div class="row g-0">' +
                    '<div class="col-md-4 potoBox">' +
                    '<img class="bd-placeholder-img img-fluid rounded-start poto" src="/resources/'+roomImage+'" alt="any" style="width: 320px;">' +
                    '</div>' +
                    '<div class="col-md-8 chatText">' +
                    '<div class="card-body " >' +
                    '<h5 class="card-title">' + chatter + '</h5>' +
                    '<hr>' +
                    '<p class="card-text lastchatText">&nbsp;</p>' +
                    '<hr>' +
                    '<p class="card-text"><small class="text-muted chatTime">&nbsp;</small></p>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>'

                $(".chatList").append(chatList);

                $(".chatBox").off('click').on("click", function () {
                    var roomId = $(this).find(".roomId").val()
// alert(roomId)

                    location.href = "/chat/getChat?roomId=" + roomId + "&chatNameSpace=" + '${chatCategory}';
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
                card.find(".lastchatText").html(msg[0].msg)
                card.find(".chatTime").html(msg[0].time)
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


        })
    })


</script>


</body>
</html>

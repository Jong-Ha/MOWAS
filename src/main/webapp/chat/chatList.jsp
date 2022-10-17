<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.5.2/socket.io.js"
            integrity="sha512-VJ6+sp2E5rFQk05caiXXzQd1wBABpjEj1r5kMiLmGAAgwPItw1YpqsCCBtq8Yr1x6C49/mTpRdXtq8O2RcZhlQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style href="/resources/css/chat.css" rel="stylesheet"></style>
    <title>Title</title>


</head>
<body>
<div class="wap">
    <jsp:include page="/layout/chatbar.jsp"/>
    <label>
        <input type="text" name="userId">
    </label>
    <input type="button" class="addOneChat" value="채팅만들기">
    <div class="chatList">


    </div>
</div>


<script>


    $(function () {
        $(".addOneChat").on("click", function(){
            location.href = "/chat/addOneChat/"+$('[name="userId"]').val()
        })

        const socket = io("http://192.168.0.234:5000/chatlist", {
            cors: {origin: '*'},
            query: {
                userId: '${user.userId}',
                chatCategory: 'onebyone'
            }
        })
        socket.on("list", (room) => {

            console.log(room)

            $(".chatList").html("");

            $.each(room, function(index, item) {

                console.log(item);

                var chatter;
                if(item.users[0].userId==='${user.userId}'){
                    chatter = item.users[1].userId
                }else {
                    chatter = item.users[0].userId
                }

                var chatList = ' <div class="card shadow-lg chatBox" style="max-width: 500px; margin-bottom: 20px">' +
                                '<input hidden class="roomId" value="'+item.roomId+'">'+
                                '<div class="row g-0">' +
                                '<div class="col-md-4 potoBox">' +
                                '<img class="bd-placeholder-img img-fluid rounded-start poto" src="https://placeimg.com/50/50/any" alt="any">' +
                                '</div>' +
                                '<div class="col-md-8 chatText">' +
                                '<div class="card-body " >' +
                                '<h5 class="card-title">'+chatter+'</h5>' +
                                '<hr>' +
                                '<p class="card-text lastchatText"></p>' +
                                '<hr>' +
                                '<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>'

                $(".chatList").append(chatList);
            })

            socket.on("msg", (msg) => {

                $(".lastchatText *").remove();

               $.each(msg ,function( index, item){

                    var lastText = item.msg;

                    $(".lastchatText").html(lastText);
                });

            });

            /*css append*/
            var stylesheet = $("<link>", {
                rel: "stylesheet",
                type: "text/css",
                href: "/resources/css/chat.css"
            });

            stylesheet.appendTo("head");


            $(".chatBox").on("click", function () {
               var roomId =  $(this).find(".roomId").val()

                alert(roomId);

                location.href = "/chat/getChat?chatCategory="+1+"&roomId="+roomId
            })
            $(".clubChathatText").on("click", function () {
                location.href = "/chat/getChat?chatCategory=" + 2
            })
            $(".dealChatText").on("click", function () {
                location.href = "/chat/getChat?chatCategory=" + 3
            })
            $(".siteChatText").on("click", function () {
                location.href = "/chat/getChat?chatCategory=" + 4
            })



        })
    })


</script>


</body>
</html>

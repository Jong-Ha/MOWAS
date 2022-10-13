/* Socket :  프로토콜,ip주소,포트 넘버로 정의됨
프로토콜 : 어떤 시스템이 다르 시스템과 통싱르 원활하게 수용하고록 해주는 통신 규약,약속
포트 : 네트워크 상에서 통신하게 위해거 호스트(네트워크에 연결되어 있는 컴퓨터)내부적으로
프로세스가 할당 받아야 하는 고유한 숫자
Socket은 다른 호스트를 연결 해준느 도구로써 인터페이스 역활을 하는데 데이터를 주고 받을수 있는 구조체로
Socket을 통해 데이터 통로가 만들어 진다.


WebSocket은 ws프로토콜을 이용하는 양뱡향 통신 방식
* ws프로토콜은 합번 연결되면 연결이 끊기지 않고 계속유지한 상태로 클라이언트와 서버가 서로 데이터를 주고 받는다
* http 통신의 경우는 클라이언트가 요청을 하고 서버가 응답을 하면 바로 연결이 끊어진다
* 즉 ws프로토콜을 이용하면 추가적인 요청이 없어도 서버에서 데이터를 보내고 받을수 있다
*
* ws모듈은 WebSocket통신을 구현 하기 위한 모듈

기본 구조는 서버측 WebSocket과 클라이언트측 WebSocket이 통신 하는 구조
*  */

//서버 생성 (express) 모듈 추출 해서 express 상수에 저장
//express 모듈로 서버를 실행하려면 http 모듈이 필요하다.
const express = require("express");
//파일을 입출력 처리 할떄 쓰는 모듈 추출
const fs = require("fs");
//http 모듈 추출후 http상수에 담는다.
const http = require("http");
// 상수 app에 express에 저장되어있는 express모듈을 저장한다
const app = express();
// path모듈 추출후 상수 path에 저장
const path = require("path");
//파일 업로드 모듈
const multer = require("multer");
// 상수 server에 http모듈의 메서드 createServer를 사용해서 express를 서버로 등록함
const server = http.createServer(app);
// socket.io모듈을 추출 후 soketIO 상수에 담는다
const socketIO = require("socket.io");
//현재 시간을 알기 위해 moment모듈을 추출후 moment에 담는다
const moment = require("moment")
//mongoBD 모듈 추출후  mongoose상수에 담음
const mongoose = require('mongoose');

//클라이언트에서 query에 있는 roomId 가져오기


mongoose.connect('mongodb://192.168.0.13:27017/');

var db = mongoose.connection;

db.on('error', function () {
    console.log('연동 실패');
})

db.once('open', function () {
    console.log("연동 성공!")
})


//soketIO에 server를 담고 io상수에 담는다
const io = socketIO(server, {
    cors: {
        origin: '*',
        methods: ["GET", "POST"]
    }
});

//정적 파일을 쓰기 위해 경로를 설정 한다
app.use(express.static(path.join(__dirname, "src")));
//포트 번호를 임의로 설정 ||
const port = process.env.port || 5000

//io에 .on "connection" 메서드를 사용해서 클라이언트 와 서버가 연결시 메시지를 전송하고
// 클라이언트로부터의 메시지를 수신한다
//'connection' : socket.io의 기본 이벤트, 사용자가 웹사이트에 접속하면 자동으로 발생하는 이벤트
/*io.on("connection", (socket) => {
    console.log("연결 완료")*/

//moongoDB에 Schema 생성
var room = mongoose.Schema({
    userId: ['string'],
    roomId: 'string',
    chatCategory: 'string',
    roomName: 'string'
});

//moongoDB에 Schema 생성
var msg = mongoose.Schema({
    userId: ['string'],
    roomId: 'string',
    chatCategory: 'string',
    msg: 'string',
    flie : 'string',
    time: 'string',
    rtime: 'number',
})

//정의된 스키마르 객체처럼 사용할수 있도록 model()함수로 컴파일

var Msg = mongoose.model('chat', msg);

var Room = mongoose.model("test", room);


var chatlist = io.of('/chatlist');
chatlist.on('connection', (socket) => {

    const userId = socket.handshake.query.userId
    const chatCategory = socket.handshake.query.chatCategory

    Room.find({'userId': userId, 'chatCategory': chatCategory}, function (error, room) {

        console.log('--- Room ---');

        if (error) {
            // console.log(error);
        } else {
            chatlist.emit("list", room);
           // var rs = []
            for (let i = 0; i < room.length; i++) {
                // console.log(room[i].roomId);
                Msg.find({'roomId': room[i].roomId}, function (error, msg) {
                    // console.log("마지막 매시지 : " + msg);
               /*     var r1 = JSON.stringify(room[i]);
                    var r2 = JSON.parse(r1);

                    r2.msg = msg[0];
                    rs.push(r2);*/
                    // console.log("list로 보낼 data : " + rs);
                    // console.log("list로 보낼 data : " + rs);
                    // chatlist.emit("list", rs);

                    chatlist.emit("msg", msg);

                }).sort({_id: -1}).limit(1)



            }

        }

    })

    socket.on('disconnect', () => {
        console.log('끝!')
    })

})
;







//room 생성
const onebyone = io.of('/onebyone');

onebyone.on('connection', (socket) => {

    const roomId = socket.handshake.query.roomId

    //socket에 roomId를 join
    socket.join(roomId);

    console.log("roomId onebyone : " + roomId);

    Msg.find({'roomId': roomId}, function (error, msg) {
        // console.log(msg);
        console.log('--- onebyone ---');
        if (error) {
            console.log(error);
        } else {
            onebyone.to(roomId).emit("json", msg);

            // console.log("내 테이터 가져 오기" + msg);
        }
    })

    //클라이언트에게 받은 data를 server에 받음
    socket.on("chatting", (data) => {
        // console.log(data);

        //서버가 현재 접속해 있는 모든 클라이언트에게 data를 전달 한다
        onebyone.to(roomId).emit("chatting", {
            name: data.name,
            msg: data.msg,
            flie : data.file,
            time: moment(new Date()).format("h:mm A")
        });

        // test객체를 new로 생성 해서 값을 입력
        var newMsg = new Msg({
            userId: data.name,
            roomId: roomId,
            msg: data.msg,
            time: moment(new Date()).format("h:mm A"),
            rtime: moment(new Date())
        });

        //데이터를 저장
        newMsg.save((error, data, res) => {
            if (error) {
                console.log(error);
            } else {
                Msg.find({'roomId': roomId}, function (error, msg) {
                    // console.log(msg);
                    console.log('--- onebyone ---');
                    if (error) {
                        console.log(error);
                    } else {
                        onebyone.to(roomId).emit("json", {msg});

                        // console.log("내 테이터 가져 오기" + msg);
                    }
                })
                console.log('성공이다!!!!!');
            }
        });


    })
})










// namesoaces 설정 하기
const clubChat = io.of('/clubChat');
clubChat.on('connection', (socket) => {

    const roomId = socket.handshake.query.roomId
    socket.join(roomId);

    //클라이언트에게 받은 data를 server에 받음
    socket.on("chatting", (data) => {
        console.log(data);
        //서버가 현재 접속해 있는 모든 클라이언트에게 data를 전달 한다
        clubChat.to(roomId).emit("chatting", {
            name: data.name,
            msg: data.msg,
            time: moment(new Date()).format("h:mm A")
        })
    })
})

const dealCaht = io.of('/dealCaht');
dealCaht.on('connection', (socket) => {

    const roomId = socket.handshake.query.roomId
    socket.join(roomId);

    //클라이언트에게 받은 data를 server에 받음
    socket.on("chatting", (data) => {
        console.log(data);
        //서버가 현재 접속해 있는 모든 클라이언트에게 data를 전달 한다
        dealCaht.to(roomId).emit("chatting", {
            name: data.name,
            msg: data.msg,
            time: moment(new Date()).format("h:mm A")
        })
    })
})

const siteChat = io.of('/siteChat');
siteChat.on('connection', (socket) => {
    const roomId = socket.handshake.query.roomId
    socket.join(roomId);

    //클라이언트에게 받은 data를 server에 받음
    socket.on("chatting", (data) => {
        console.log(data);
        //서버가 현재 접속해 있는 모든 클라이언트에게 data를 전달 한다
        siteChat.to(roomId).emit("chatting", {
            name: data.name,
            msg: data.msg,
            time: moment(new Date()).format("h:mm A")
        })
    })
})


server.listen(port, () => console.log('server is running ' + port));

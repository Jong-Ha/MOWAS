
//WebSocket을 WebSocket변수에 담음
const  WebSocket = require("ws").WebSocketServer;
// ws에 포트 번호 부여
const ws = new WebSocket.WebSocketServer({port:100000});
//WebSocket 특정 클라이언트가 연결돠었을떄 실행
ws.on("connection", function connect(ws, req) {
    console.log("Connect");
});
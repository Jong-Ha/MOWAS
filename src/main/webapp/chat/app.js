const express = require("express");
const http = require("http");
const app = express();
const path = require("path");
const server = http.createServer(app);
const socketIO = require("socket.io");

const io = socketIO(server);



app.use(express.static(path.join(__dirname, "src")));
const port = process.env.port || 5000

io.on("connection", (socket) => {
    console.log("연결 완료")
    socket.on("chatting", (data) => {
        io.emit("chatting", data)
    })
})

server.listen(port, () => console.log('server is running ' + port))
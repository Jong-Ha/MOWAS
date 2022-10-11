
sendButton.addEventListener("click", () => {
    const param = {
        name: nickname.value,
        msg: chatInput.value
    }
    /*Object 형식으로 Server로 보냄*/
    socket.emit("chatting", param)
})

socket.on("chatting", (data) => {
    const {name, msg, time} = data;
    const item = new LiModel(data.name, data.msg, data.time);
    console.log(data);
    item.makeLi();
})
function LiModel(name, msg, time){
    this.name = name;
    this.msg = msg;
    this.time = time;

    this.makeLi = ()=>{
        const li = document.createElement("li");
        li.innerText = '<span className="profile">' +
            '<span className="user">${this.name}</span>' +
            '<img className="userimg" src="https://placeimg.com/50/50/any" alt="any">' +
            '</span>' +
            '<span className="message">${this.msg}</span>' +
            '<span className="time">${this.time}</span>';
        chatList.appendChild(li);

    }
}
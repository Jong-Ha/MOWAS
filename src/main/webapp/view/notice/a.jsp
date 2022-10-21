<%--
  Created by IntelliJ IDEA.
  User: 903-14
  Date: 2022-09-30
  Time: 오전 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://www.gstatic.com/firebasejs/5.5.9/firebase.js"></script>
<html>
<head>
    <title>Title</title>
    <script>
        let subscribeUrl = "http://localhost:8080/view/notice/a.jsp";

        $(function(){
            $(document).ready(function () {


                alert("된다며")
                if (sessionStorage.getItem("mytoken") != null) {
                    let token = sessionStorage.getItem("mytoken");
                    let eventSource = new EventSource(subscribeUrl + "?token=" + token);

                    eventSource.addEventListener("addComment", function (event) {
                        let message = event.data;
                        alert(message);
                    })

                    eventSource.addEventListener("error", function (event) {
                        eventSource.close()
                    })
                }
            })
        })









        // Initialize Firebase
        var config = {
            apiKey: "AIzaSyCu45rhEDnBxZ2SU-79Pxza8hOw548Su-c",
            authDomain: "test-4e9a6.firebaseapp.com",
            databaseURL: "https://test-4e9a6.firebaseio.com",
            projectId: "test-4e9a6",
            storageBucket: "test-4e9a6.appspot.com",
            messagingSenderId: "90275796882"
        };
        firebase.initializeApp(config);

        const messaging = firebase.messaging();

        //token값 알아내기
        messaging.requestPermission()
            .then(function(){
                console.log("Have permission");
                return messaging.getToken();
            })
            .then(function(token){
                console.log(token);
            })
            .catch(function(arr){
                console.log("Error Occured");
            });



    </script>
</head>
<body>
<button>알림창인디 ?</button>

</body>
</html>

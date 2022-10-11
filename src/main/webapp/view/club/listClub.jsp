<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".addClub").on("click",function(){
                location.href="/club/addClub"
            })
            $(".clubLogin").on("click",function(){
                location.href="/club/login?userId="+$("input[name='userId']").val()
            })
            $(".likeToggle").on("click",function(){
                var clubNum = $(this).parent().children("[name='clubNum']").val();
                var button = $(this);
                $.ajax({
                    url: "/club/json/clubLike",
                    method:"POST",
                    data: JSON.stringify({
                        "boardNum": clubNum,
                        "boardCategory": "12"
                    }),
                    headers:{
                        "Accept":"application/json",
                        "Content-Type":"application/json; charset=UTF-8"
                    },
                    dataType: "JSON",
                    success: function () {
                        // alert("ajax")
                        if(button.val()==='좋아요!'){
                            // alert("누름")
                            button.val("좋아요 해제");
                        }else{
                            // alert("뺌")
                            button.val("좋아요!");
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>

<input type="button" class="addClub" value="모임 만들기">
<input type="button" class="clubLogin" value="로그인">
<label>
    아이디 : <input type="text" name="userId" value="user01">
</label>
${user.userId}
<br>
<br>
<c:forEach items="${list}" var="club">
    <div>
        <a href="/club/getClub/${club.clubNum}">${club}</a>
        <input type="button" class="likeToggle" value="${club.likeCheck=='y'?'좋아요 해제':'좋아요!'}">
        <input type="hidden" name="clubNum" value="${club.clubNum}">
        <br/>
        <br/>
    </div>
</c:forEach>
</body>
</html>

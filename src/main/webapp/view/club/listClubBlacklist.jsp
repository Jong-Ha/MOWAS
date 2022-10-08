<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>listClubBlacklist</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".updateClubBlacklist").on("click",function(){
                var process = "F"
                if($(this).val()=='등록'){
                    process = "T";
                }
                $("form").attr("method","post").attr("action","/club/updateClubBlacklist/"+process).submit()
            })
            $(".getClubBlacklist").on("click",function(){
                var clubUserNum = $(this).parents(".each").find("[name='clubUserNum']").val()
                var div = $(this).parents(".each").find(".blacklistText")
                var me = $(this)
                $.ajax({
                    url : "/club/json/getClubBlacklist",
                    method : "POST",
                    data : JSON.stringify({
                        "clubUserNum" : clubUserNum
                    }),
                    dataType : "JSON",
                    headers:{
                        "Accept":"application/json",
                        "Content-Type":"application/json; charset=UTF-8"
                    },
                    success: function (map) {
                        // alert(map.blacklistText)
                        div.html("<h4>"+map.blacklistText+"</h4>")
                        me.val("사유 숨기기")
                        me.off("click")
                        me.on("click",function(){
                            if(me.val()=="사유 숨기기"){
                                me.val("사유보기")
                            }else {
                                me.val("사유 숨기기")
                            }
                            div.toggle()
                        })
                    }
                })
            })
        })
    </script>
</head>
<body>
<form>
<c:forEach items="${list}" var="clubBlacklist">
    <div class="each">
        <label>
            <input type="checkbox" name="clubUserNum" value="${clubBlacklist.clubUserNum}">
            ${clubBlacklist}
        </label>
        <input type="button" class="getClubBlacklist" value="사유보기">
        <div class="blacklistText"></div>
    </div>
</c:forEach>
    <input type="hidden" name="clubNum" value="${clubNum}">
</form>
<input type="button" class="updateClubBlacklist" value="등록">
<input type="button" class="updateClubBlacklist" value="취소">
</body>
</html>

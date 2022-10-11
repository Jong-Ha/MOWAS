<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>updateClubMasterBoard</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".updateClubMasterBoard").on("click",function(){
                $("form").attr("method","post").attr("action","/club/updateClubMasterBoard").submit()
            })

            //파일 갯수 체크
            $("input:file").on("change",function(){
                if($(this)[0].files.length>10-$('#fileSize').val()){
                    alert('파일 갯수를 초과하였습니다.');
                    // alert(10-$('#fileSize').val());
                    $(this).val('');
                }
            })

            //파일 삭제 버튼
            $(".deleteFile").on("click",function(){
                var size = $("#fileSize");
                size.parent().append('<input type="hidden" name="deleteFileName" value="'+$(this).parent().attr('id')+'">')
                $(this).parent().remove()
                size.val(size.val()-1)
            })
        })
    </script>
</head>
<body>
<form enctype="multipart/form-data">
    <label>
        <input type="hidden" name="boardNum" value="${clubMasterBoard.boardNum}">
        <input type="hidden" id="fileSize" value="${fileSize}">
        제목<input type="text" name="title" value="${clubMasterBoard.title}"><br>
        내용<input type="text" name="text" value="${clubMasterBoard.text}"><br>
        파일<input type="file" name="file" multiple><br>
        알림<input type="checkbox" name="noticeSendCheck"><br>
        <c:forEach items="${clubMasterBoard.files}" var="i">
            <div id="${i.fileName}">
                <img src="/resources/${i.fileName}" alt="모임 공지사항 파일">
                <br>
                <input type="button" class="deleteFile" value="삭제">
                <br>
            </div>
        </c:forEach>
    </label>
</form>
<input type="button" class="updateClubMasterBoard" value="모임 공지사항 수정">
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>addClub</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".addClub").on("click",function(){
                $("form").attr("method","post").attr("action","/club/addClub").submit();
            })
        })
    </script>
</head>
<body>
<form enctype="multipart/form-data">
    <label>
        clubName : <input type="text" name="clubName" value=""><br>
        clubText : <textarea name="clubText"></textarea><br>
        interList : <select name="interList">
        <option value="01">독서</option>
        <option value="02">자동차</option>
        <option value="03">반려동물</option>
        <option value="04">공예</option>
        <option value="05">스포츠</option>
        <option value="06">댄스</option>
        <option value="07">여행</option>
        <option value="08">사진</option>
        <option value="09">육아</option>
        <option value="10">공연</option>
        <option value="11">음악</option>
        <option value="12">게임</option>
        <option value="13">그외</option>
    </select><br>
        villCode : <input type="text" name="villCode" value=""><br>
        clubImage : <input type="file" name="file"><br>
        tag : <input type="text" name="tag" value=""><br>
    </label>
    <input type="button" class="addClub" value="모임 만들기">
</form>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".updateClub").on("click",function(){
                $("form").attr("method","post").attr("action","/club/updateClub").submit();
            })
        })
    </script>
</head>
<body>
<form>
    <label>
        <input type="hidden" name="clubNum" value="${club.clubNum}">
        clubName : <input type="text" name="clubName" value="${club.clubName}"><br>
        clubName : <textarea name="clubText">${club.clubText}</textarea><br>
        interList : <select name="interList">
        <option value="01" ${club.interList == '01'? 'selected':''}>독서</option>
        <option value="02" ${club.interList == '02'? 'selected':''}>자동차</option>
        <option value="03" ${club.interList == '03'? 'selected':''}>반려동물</option>
        <option value="04" ${club.interList == '04'? 'selected':''}>공예</option>
        <option value="05" ${club.interList == '05'? 'selected':''}>스포츠</option>
        <option value="06" ${club.interList == '06'? 'selected':''}>댄스</option>
        <option value="07" ${club.interList == '07'? 'selected':''}>여행</option>
        <option value="08" ${club.interList == '08'? 'selected':''}>사진</option>
        <option value="09" ${club.interList == '09'? 'selected':''}>육아</option>
        <option value="10" ${club.interList == '10'? 'selected':''}>공연</option>
        <option value="11" ${club.interList == '11'? 'selected':''}>음악</option>
        <option value="12" ${club.interList == '12'? 'selected':''}>게임</option>
        <option value="13" ${club.interList == '13'? 'selected':''}>그외</option>
    </select><br>
        villCode : <input type="text" name="villCode" value="${club.villCode}"><br>
        clubImage : <input type="text" name="clubImage" value="${club.clubImage}"><br>
        tag : <input type="text" name="tag" value="${club.tag}"><br>
        모집여부 : <input type="radio" name="gatherCheck" value="1" ${club.gatherCheck == '1'? 'checked':''}>모집중
        <input type="radio" name="gatherCheck" value="0" ${club.gatherCheck == '0'? 'checked':''}>모집완료<br>
    </label>
    <input type="button" class="updateClub" value="모임 수정">
</form>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>getCluber</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".updateCluber").on("click",function(){
                location.href="/club/updateCluber/${cluber.clubUserNum}"
            })
            $(".updateClubMaster").on("click",function(){
                location.href="/club/updateClubMaster/${cluber.clubUserNum}"
            })
            $(".addClubManager").on("click",function(){
                location.href="/club/addClubManager/${cluber.clubUserNum}"
            })
            $(".deleteClubManager").on("click",function(){
                location.href="/club/deleteClubManager/${cluber.clubUserNum}"
            })
            $(".deleteCluber").on("click",function(){
                location.href="/club/deleteCluber/T?clubUserNum=${cluber.clubUserNum}"
            })
        })
    </script>
</head>
<body>
${cluber}
<input type="button" class="updateCluber" value="자기소개 수정">
<input type="button" class="updateClubMaster" value="모임장 위임">
<input type="button" class="addClubManager" value="매니저 임명">
<input type="button" class="deleteClubManager" value="매니저 권한 박탈">
<input type="button" class="deleteCluber" value="모임 강퇴">
</body>
</html>

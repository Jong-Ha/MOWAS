<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>getClub</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".updateClub").on("click",function(){
                location.href="/club/updateClub/${club.clubNum}"
            })
            $(".deleteClub").on("click",function(){
                var check = confirm("진짜 삭제?");
                if(check==true){
                    location.href="/club/deleteClub/${club.clubNum}"
                }
            })
            $(".listCluber").on("click",function(){
                location.href="/club/listCluber/${club.clubNum}"
            })
            $(".deleteCluber").on("click",function(){
                location.href="/club/deleteCluber/F?clubNum=${club.clubNum}"
            })
            $(".addCluberApply").on("click",function(){
                location.href="/club/addCluberApply/${club.clubNum}"
            })
            $(".updateCluberApply").on("click",function(){
                location.href="/club/updateCluberApply/${club.clubNum}"
            })
            $(".addClubMasterBoard").on("click",function(){
                location.href="/club/addClubMasterBoard/${club.clubNum}"
            })

            // 확인용
            $(".listClubMasterBoard").on("click",function(){
                location.href="/club/listClubMasterBoard/${club.clubNum}"
            })
        })
    </script>
</head>
<body>
${club}<br>
<input type="button" class="updateClub" value="모임 수정">
<input type="button" class="deleteClub" value="모임 삭제">
<input type="button" class="listCluber" value="모임원 목록">
<input type="button" class="deleteCluber" value="모임 탈퇴">
<input type="button" class="addCluberApply" value="가입 신청">
<input type="button" class="updateCluberApply" value="가입 신청 수정">
<input type="button" class="addClubreport" value="모임 신고">
<br><br>
<input type="button" class="listClubMasterBoard" value="모임 공지사항"><br>
<input type="button" class="addClubMasterBoard" value="모임 공지사항 작성">
<br><br>
<input type="button" class="listClubCalendar" value="모임 일정"><br>
<input type="button" class="listClubCalendar" value="모임 일정">
<br><br>
<input type="button" class="listClubCalendarReviewList" value="모임 후기글"><br>
<input type="button" class="listClubCalendarReviewList" value="모임 후기글">
<br><br>
<input type="button" class="listClubCalendarReviewShortList" value="모임 후기쇼츠"><br>
<input type="button" class="listClubCalendarReviewShortList" value="모임 후기쇼츠">
<br><br>
</body>
</html>

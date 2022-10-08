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

            // 일정 참여 신청 관련
            $(".addClubCalendarApply").on("click",function(){
                $.ajax({
                    url : "/club/json/addClubCalendarApply",
                    method : "POST",
                    data : JSON.stringify({
                        "clubCalendarNum" : 10003,
                        "userId" : "${user.userId}",
                        "userImage" : "${user.userImage}",
                        //1이면 확인 2면 자동
                        "applyAutoCheck" : "1"
                    }),
                    dataType : "JSON",
                    headers:{
                        "Accept":"application/json",
                        "Content-Type":"application/json; charset=UTF-8"
                    },
                    success: function () {
                        $(".addClubCalendarApply").toggle()
                        $(".deleteClubCalendarApply").toggle()
                    }
                })
            })
            //참여 신청 취소
            $(".deleteClubCalendarApply").on("click",function(){
                $.ajax({
                    url : "/club/json/deleteClubCalendarApply",
                    method : "POST",
                    data : JSON.stringify({
                        "clubCalendarNum" : 10003,
                        "userId" : "${user.userId}"
                    }),
                    dataType : "JSON",
                    headers:{
                        "Accept":"application/json",
                        "Content-Type":"application/json; charset=UTF-8"
                    },
                    success: function () {
                        $(".addClubCalendarApply").toggle()
                        $(".deleteClubCalendarApply").toggle()
                    }
                })
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
<input type="button" class="listClubCalendar" value="모임 일정">
<a href="/club/listCalendarCluber/10003">clubNum : 10001, clubCalendarNum : 10003</a>
<input type="button" class="addClubCalendarApply" value="모임 일정 참여">
<input type="button" class="deleteClubCalendarApply" style="display: none" value="모임 일정 참여 취소">
<br>
<input type="button" class="addClubCalendar" value="모임 일정 작성">
<br><br>
<input type="button" class="listClubCalendarReviewList" value="모임 후기글"><br>
<input type="button" class="addClubCalendarReviewList" value="모임 후기글 작성">
<br><br>
<input type="button" class="listClubCalendarReviewShortList" value="모임 후기쇼츠"><br>
<input type="button" class="addClubCalendarReviewShortList" value="모임 후기쇼츠 작성">
<br><br>
</body>
</html>

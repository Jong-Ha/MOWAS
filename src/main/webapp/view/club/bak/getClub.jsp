<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>MOWAS</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="/resources/club/js/getClub.js"></script>
    <link href="/resources/club/css/getClub.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<img src="/resources/${club.clubImage}" alt="모임이미지"><br>
${club}<br>
<input hidden class="boardNum" value="${club.clubNum}">
<input hidden class="userId" value="${user.userId}">
<input hidden class="userImage" value="${user.userImage}">
<input type="button" class="updateClub" value="모임 수정">
<input type="button" class="deleteClub" value="모임 삭제">
<input type="button" class="listCluber" value="모임원 목록">
<input type="button" class="deleteCluber" value="모임 탈퇴">
<input type="button" class="addCluberApply" value="가입 신청">
<input type="button" class="updateCluberApply" value="가입 신청 수정">
<input type="button" class="addClubreport" value="모임 신고">
<input type="button" class="listVote" value="투표 목록">
<br><br>
<input type="button" class="listClubMasterBoard" value="모임 공지사항"><br>
<input type="button" class="addClubMasterBoard" value="모임 공지사항 작성">
<br><br>
<input type="button" class="listClubCalendar" value="모임 일정">
<a href="/club/listCalendarCluber/10003">clubNum : 10001, clubCalendarNum : 10003</a>
<input type="button" class="addClubCalendarApply" value="모임 일정 참여">
<input type="button" class="deleteClubCalendarApply" style="display: none" value="모임 일정 참여 취소">
<br>
<input type="button" class="addCalender" value="모임 일정 작성">
<br><br>
<input type="button" class="listClubCalendarReviewList" value="모임 후기글"><br>
<input type="button" class="addClubCalendarReviewList" value="모임 후기글 작성">
<br><br>
<input type="button" class="listClubCalendarReviewShortList" value="모임 후기쇼츠"><br>
<input type="button" class="addClubCalendarReviewShortList" value="모임 후기쇼츠 작성">
<br><br>
<hr>
<hr>
<jsp:include page="/view/community/calender.jsp"/>
</body>
</html>

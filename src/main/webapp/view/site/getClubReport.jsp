<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-14
  Time: 오후 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<br>
<head>
  <title>Get Club Report</title>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

  <script type="text/javascript">

    //============= 회원정보수정 Event  처리 =============
    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $( "button:contains('처리')" ).on("click" , function() {
        self.location = "/site/updateClubReport/${clubReport.clubReportNo}"
      });

      $( "button:contains('이의처리')" ).on("click" , function() {
        self.location = "/site/updateClubRereport/${clubReport.clubReportNo}"
      });

      $( "button:contains('확인')" ).on("click" , function() {
        self.location = "/site/listClubReport"
      });

      $( "button:contains('삭제')" ).on("click" , function() {
        self.location = "/site/deleteClubReport/${clubReport.clubReportNo}"
      });
    });

  </script>
</head>
<br>
<br>
<body>
<form class="form-horizontal" name="detailForm">

<%--관리자 아이디 : ${masterBoard.adminId} </br>--%>
  모임신고번호 : ${clubReport.clubReportNo} </br>
  모임번호 : ${club.clubNum}<button type="button" class="btn btn-primary">처리</button></br>
  모임명 : ${club.clubName}</br>
  모임장 아이디 : ${club.clubMasterId}</br>
  신고 날짜 : ${clubReport.reportDate} </br>
  신고 상세 내용 : ${clubReport.reportText} </br>
  이의 제출 여부 : ${clubReport.rereportApplyCheck}<button type="button" class="btn btn-primary">이의처리</button></br>
  이의 내용 : ${clubReport.rereportText}</br>
  관리자아이디 : ${clubReport.adminId}</br>


<div class="col-md-4 text-center col-md-offset-1">
  <button type="button" class="btn btn-primary">확인</button>
  <button type="button" class="btn btn-primary">삭제</button>
</div>
</form>
</body>
</html>

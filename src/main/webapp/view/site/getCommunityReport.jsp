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
  <title>Get Community Report</title>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

  <script type="text/javascript">

    //============= 회원정보수정 Event  처리 =============
    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $( "button:contains('처리')" ).on("click" , function() {
        self.location = "/site/updateCommunityReport/${communityReport.reportNo}"
      });

      $( "button:contains('확인')" ).on("click" , function() {
        self.location = "/site/listCommunityReport"
      });

      $( "button:contains('삭제')" ).on("click" , function() {
        self.location = "/site/deleteCommunityReport/${communityReport.reportNo}"
      });
    });

  </script>
</head>
<body>
<br>
<form class="form-horizontal" name="detailForm">

<%--관리자 아이디 : ${masterBoard.adminId} </br>--%>
신고번호 : ${communityReport.reportNo} </br>
신고한 회원 ID : ${communityReport.reportId} </br>
신고 받은 회원 ID : ${communityReport.reportedId} <button type="button" class="btn btn-primary">처리</button></br>
신고 날짜 : ${communityReport.reportDate} </br>
신고 기준 : ${communityReport.reportBasis} </br>
신고 상세 내용 : ${communityReport.reportText} </br>

<div class="col-md-4 text-center col-md-offset-1">
  <button type="button" class="btn btn-primary">확인</button>
  <button type="button" class="btn btn-primary">삭제</button>
</div>
</form>
</body>
</html>

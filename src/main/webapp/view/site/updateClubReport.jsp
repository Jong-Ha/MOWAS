<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-17
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update Club Report</title>

  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

  <script type="text/javascript">

    //============= 회원정보수정 Event  처리 =============
    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
   <%--   $( "button:contains('알림')" ).on("click" , function() {
        self.location = "/deal/notice/${communityReport.reportNo}"
      }); --%>

      $( "button:contains('알림')" ).on("click" , function() {
        self.location = "/site/listCommunityReport"
          //커뮤니티 게시글 확인 컨트롤러 호출
      });

      $( "button:contains('확인')" ).on("click" , function() {
          $("form").attr("method","post").attr("action","/site/updateClubReport").submit();

      });

      $( "button:contains('취소')" ).on("click" , function() {
        self.location = "/site/listClubReport"
      });
    });

  </script>
</head>
<body>
<form class="form-horizontal" name="detailForm">

    <%--관리자 아이디 : ${masterBoard.adminId} </br>--%>
    <input type="hidden" name="clubReportNo" value="${clubReport.clubReportNo}">
        <%--모임명: ${club.clubName}<br>--%>
        모임 번호 : "${clubReport.clubNum} <button type="button" class="btn btn-primary">알림</button></br>
        모임장 아이디: ${clubReport.reportDate}<br>
        신고 날짜 : ${clubReport.reportDate}<br>
        신고 상세 내용 : ${clubReport.reportText}<br>
        이의 제출 여부 : ${clubReport.rereportApplyCheck}<br>
        신고 처리 <input type="text" name="reportResult" value="${clubReport.reportResult}"><br>

    <div class="col-md-4 text-center col-md-offset-1">
        <button type="button" class="btn btn-primary">확인</button>
        <button type="button" class="btn btn-primary">취소</button>
    </div>
</form>
</body>
</html>

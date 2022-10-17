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
    <title>Update Community Report</title>

  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

  <script type="text/javascript">

    //============= 회원정보수정 Event  처리 =============
    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
   <%--   $( "button:contains('알림')" ).on("click" , function() {
        self.location = "/deal/notice/${communityReport.reportNo}"
      }); --%>

      $( "button:contains('게시글확인')" ).on("click" , function() {
        self.location = "/site/listCommunityReport"
      });

      $( "button:contains('취소')" ).on("click" , function() {
        self.location = "/site/listCommunityReport"
      });
    });

  </script>
</head>
<body>

</body>
</html>

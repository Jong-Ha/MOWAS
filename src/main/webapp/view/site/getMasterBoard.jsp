<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-12
  Time: 오후 2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br>
<head>
    <title>Get Master Board</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <script type="text/javascript">

    //============= 회원정보수정 Event  처리 =============
    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $( "button:contains('수정')" ).on("click" , function() {
        self.location = "/site/updateMasterBoard/${masterBoard.masterBoardNo }"
      });

      $( "button:contains('확인')" ).on("click" , function() {
        self.location = "/site/listMasterBoard"
      });

      $( "button:contains('삭제')" ).on("click" , function() {
         self.location = "/site/deleteMasterBoard/${masterBoard.masterBoardNo }"
      });
    });

    </script>
</head>
<br>
<br class="form-horizontal" name="detailForm">

<%--관리자 아이디 : ${masterBoard.adminId} </br>--%>
제목 : ${masterBoard.mbTitle} </br>
내용 : ${masterBoard.mbText} </br>
날짜 : ${masterBoard.mbRegDate} </br>
이미지 <c:forEach items="${masterBoard.files}" var="i">
    <img src="/resources/${i.fileName}" alt="공지사항"><br>
    <br>
</c:forEach>


  <div class="col-md-4 text-center col-md-offset-1">
      <button type="button" class="btn btn-primary">수정</button>
      <button type="button" class="btn btn-primary">확인</button>
      <button type="button" class="btn btn-primary">삭제</button>
  </div>
</form>
</body>
</html>

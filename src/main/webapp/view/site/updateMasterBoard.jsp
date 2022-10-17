<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-13
  Time: 오전 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update MasterBoard</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script>
    $(function(){
      $(".updateMb").on("click",function(){
        $("form").attr("method","post").attr("action","/site/updateMasterBoard").submit();
      })
    })
  </script>
</head>
<body>
<form>
  <label>
    <input type="hidden" name="masterBoardNo" value="${masterBoard.masterBoardNo}">
    <%--<input type="hidden" name="adminId" value="${user.userId}">--%>
    <input type="hidden" name="adminId" value="admin">

    <div class="container">

      <h5>카테고리 선택</h5>

      <ul>
        <li>
          <input type="radio" id="f-option" name="mbCategory" value = '1'>
          <label for="f-option">회원</label>

          <div class="check"></div>
        </li>

        <li>
          <input type="radio" id="s-option" name="mbCategory" value = '2'>
          <label for="s-option">모임</label>

          <div class="check"><div class="inside"></div></div>
        </li>

        <li>
          <input type="radio" id="t-option" name="mbCategory" value = '3'>
          <label for="t-option">신고</label>

          <div class="check"><div class="inside"></div></div>
        </li>
      </ul>
    </div>
    공지사항 제목 : <textarea name="mbTitle">${masterBoard.mbTitle}</textarea><br>
    공지사항 내용 : <textarea name="mbText">${masterBoard.mbText}</textarea><br>

    <input type="button" class="updateMb" value="수정">
  </label>
</form>
</body>
</html>

</body>
</html>

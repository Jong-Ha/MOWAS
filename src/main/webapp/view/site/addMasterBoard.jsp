<%--
  Created by IntelliJ IDEA.
  Date: 2022-10-12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Add MasterBoard</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <script type="text/javascript">
      $(function() {
        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $( "button.btn.btn-primary" ).on("click" , function() {

            $("form").attr("method" , "POST").attr("action" , "/site/addMasterBoard").submit();
        });
      });

      $(function() {
        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $("a[href='#' ]").on("click" , function() {
          $("form")[0].reset();
        });
      });

    </script>


</head>
<body>

  <form enctype="multipart/form-data">
    <!--<form class="form-horizontal" name="detailForm">-->
      <label>
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

      제목<input type="text" name="mbTitle" value=""><br>
      내용<input type="text" name="mbText" value=""><br>
      파일<input type="file" name="file" multiple="multiple"/><br>
    </label>

  <div class="col-md-12 text-center ">
    <button type="button" class="btn btn-primary" >등 록</button>
    <a class="btn btn-primary btn" href = "#" role="button">취 소 </a>
  </div>


    </form>


</body>
</html>

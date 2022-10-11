<%--
  Created by IntelliJ IDEA.
  User: 903-9
  Date: 2022-10-08
  Time: 오후 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script>
    $(function(){
      $(".updateDeal").on("click",function(){
        $("form").attr("method","post").attr("action","/deal/updateDeal").submit();
      })
    })
  </script>
</head>
<body>
<form>
  <label>
    <input type="hidden" name="dealBoardNum" value="${deal.dealBoardNum}">
    dealTitle : <input type="text" name="dealTitle" value="${deal.dealTitle}"><br>
    dealStatus : <select name="dealStatus">
    <option value="01" ${deal.dealStatus == '01'? 'selected':''}>판매전</option>
    <option value="02" ${deal.dealStatus== '02'? 'selected':''}>판매중</option>
    <option value="03" ${deal.dealStatus == '03'? 'selected':''}>판매완료</option>
  </select><br>
    dealText : <textarea name="dealText">${deal.dealText}</textarea><br>

    productName : <input type="text" name="productName" value="${deal.productName}"><br>
    price : <input type="text" name="price" value="${deal.price}"><br>
    tag : <input type="text" name="tag" value="${deal.tag}"><br>

  <input type="button" class="updateDeal" value="거래 수정">
  </label>
</form>
</body>
</html>

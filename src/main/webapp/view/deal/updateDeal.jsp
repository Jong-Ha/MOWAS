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
      //파일 갯수 체크
      $("input:file").on("change",function(){
        if($(this)[0].files.length>10-$('#fileSize').val()){
          alert('파일 갯수를 초과하였습니다.');
          // alert(10-$('#fileSize').val());
          $(this).val('');
        }
      })

      //파일 삭제 버튼
      $(".deleteFile").on("click",function(){
        alert("${deal.files}");
        var size = $("#fileSize");
        size.parent().append('<input type="hidden" name="deleteFileName" value="'+$(this).parent().attr('id')+'">')
        $(this).parent().remove()
        size.val(size.val()-1)
      })
    })
  </script>
</head>
<body>
<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-default">
  <div class="container">
    <a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
  </div>
</div>
<!-- ToolBar End /////////////////////////////////////-->
<form enctype="multipart/form-data" method="post">
  <label>
    <input type="hidden" name="boardCategory" value="${deal.boardCategory}">
    <input type="hidden" name="dealBoardNum" value="${deal.dealBoardNum}">
    <input type="hidden" id="fileSize" value="${fileSize}">
    dealTitle : <input type="text" name="dealTitle" value="${deal.dealTitle}"><br>
    dealStatus : <select name="dealStatus">
    <option value="01" ${deal.dealStatus == '01'? 'selected':''}>판매전</option>
    <option value="02" ${deal.dealStatus== '02'? 'selected':''}>판매중</option>
    <option value="03" ${deal.dealStatus == '03'? 'selected':''}>판매완료</option>
  </select><br>
    파일<input type="file" name="file" multiple><br>
    <c:forEach items="${deal.files}" var="i">
      <div id="${i.fileName}">
        <img src="/resources/${i.fileName}" alt="거래 게시판">
        <br>
        <input type="button" class="deleteFile" value="삭제">
        <br>
      </div>
    </c:forEach>

    dealText : <textarea name="dealText">${deal.dealText}</textarea><br>
    productName : <input type="text" name="productName" value="${deal.productName}"><br>
    price : <input type="text" name="price" value="${deal.price}"><br>
    tag : <input type="text" name="tag" value="${deal.tag}"><br>

  </label>
</form>
<input type="button" class="updateDeal" value="거래 수정">
</body>
</html>

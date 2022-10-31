<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-13
  Time: 오전 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


  <script>
    $(function(){
      $(".updateMb").on("click",function(){
        $("form[id='updateMbForm']").attr("method","post").attr("action","/site/updateMasterBoard").submit();
      })
    })
  </script>

<%--
<form>
  <label>
    <input type="hidden" name="masterBoardNo" value="${masterBoard.masterBoardNo}">
    <input type="hidden" name="adminId" value="${user.userId}">
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
--%>
      <div class="modal-header" >
        <h3 class="modal-title text-danger fs-5" id="updateMbLabel">공지사항 수정</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="updateMbForm" enctype="multipart/form-data">
          <div class="input-group mb-3 mt-3">
            <div class="form-floating">
              <input type="hidden" name="masterBoardNo" value="${param.masterBoardNo}">
              <input type="hidden" name="adminId" value="${user.userId}">

              <input type="text" class="form-control " id="mbTitle" name="mbTitle" placeholder="제목"
                     value="${masterBoard.mbTitle}" required>
              <label for="mbTitle">제목</label>
            </div>
          </div>

          <div class="input-group mb-3 mt-3">
            <div class="form-floating">
              <select class="form-select" id="mbCategory" name="mbCategory" required>
                <option value="0" selected>선택하세요</option>
                <option value="1" ${masterBoard.mbCategory=='회원'?'selected':''}>회원</option>
                <option value="2" ${masterBoard.mbCategory=='모임'?'selected':''}>모임</option>
                <option value="3" ${masterBoard.mbCategory=='신고'?'selected':''}>신고</option>
              </select>
              <label for="mbCategory">카테고리</label>
            </div>
          </div>

          <div class="input-group mb-3 mt-3">
            <div class="form-floating">
              <input type="text" class="form-control" id="mbText" name="mbText" placeholder="상세내용"
                     required>
              <label for="mbText">상세내용</label>
            </div>
          </div>

          <div class="mb-3 mt-3">
            <label for="file" class="form-label" style="display: none"></label>
            <input class="form-control" type="file" id="file" name="file">
          </div>
        </form>
      </div>
      <div class="modal-footer text-center">
        <button type="button" class="btn btn-danger updateMb" data-bs-dismiss="modal">수 정</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>

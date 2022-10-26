<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-header" >
    <h3 class="modal-title text-danger fs-5" id="addCrLabel">모임 신고</h3>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">

    <form id="addCrForm" enctype="multipart/form-data">

        <input type="hidden" name="clubNum" value="${param.clubNum}">
        <input type="hidden" name="reportId" value="${param.reportId}">

        <div class="input-group mb-3 mt-3">
            <div class="form-floating">
                <select class="form-select" id="crBasis" name="crBasis" required>
                    <option value="0" selected>선택하세요</option>
                    <option value="1">목적과 다른 모임</option>
                    <option value="2">상업적 모임</option>
                    <option value="3">정치적 성향의 모임</option>
                    <option value="4">도박 모임</option>
                    <option value="5">다단계 판매</option>
                </select>
                <label for="crBasis">카테고리</label>
            </div>
        </div>

        <div class="input-group mb-3 mt-3">
            <div class="form-floating">
                <input type="text" class="form-control" id=reportText name="reportText" placeholder="상세신고내용"
                       required>
                <label for="reportText">상세신고내용</label>
            </div>
        </div>

        <div class="mb-3 mt-3">
            <label for="file" class="form-label" style="display: none"></label>
            <input class="form-control" type="file" id="file" name="file">
        </div>

    </form>
</div>
<div class="modal-footer" style="display: block">
    <button type="button" class="btn btn-danger addCr" data-bs-dismiss="modal">신 고</button>
</div>
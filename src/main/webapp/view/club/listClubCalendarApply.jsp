<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<div class="modal-header">
    <input type="hidden" id="clubNum" value="${clubNum}">
    <a class="navbar-brand back-btn"<%-- data-bs-target="#listCalendarCluber" data-bs-toggle="modal"--%>>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
            <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
        </svg>
    </a>
    <h5 class="modal-title">모임 일정 참여 신청 조회</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
    <input type="hidden" class="clubNum" value="${clubNum}">
<div class="clubCalendarApplyList">

    <c:if test="${empty list}">
        <div class="card shadow-lg cardBox" style="grid-template-columns: 1fr;">참여 신청자가 없습니다!</div>
    </c:if>

    <c:if test="${!empty list}">
        <c:forEach items="${list}" var="clubCalendarApply">
            <div class="card shadow-lg cardBox">
                <input type="hidden" name="clubCalendarApplyNum" value="${clubCalendarApply.clubCalendarApplyNum}">
                <div class="photoBox">
                    <img class="bd-placeholder-img img-fluid rounded-start photo"
                         src="/resources/${clubCalendarApply.user.userImage}" alt="any">
                </div>
                <div>
                    <div class="card-body">
                        <div>
                            <h3 class="card-title">
                                    ${clubCalendarApply.user.userId}
                                <small class="text-muted" style="font-size: 16px;">
                                        ${clubCalendarApply.applyDate}
                                </small>
                            </h3>
                        </div>
                        <div>
                            <small class="text-muted">
                                <input type="button" class="accept btn btn-primary" name="accept" value="승인">
                                <input type="button" class="reject btn btn-primary" name="reject" value="거절">
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>

</div>
</div>
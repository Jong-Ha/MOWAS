<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-header">
    <a class="navbar-brand back-btn" data-bs-target="#exampleModal2" data-bs-toggle="modal">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
                    <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                </svg>
    </a>
    <h1 class="modal-title fs-5">일정 참여자</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
    <div class="card-list">
    <c:forEach items="${list}" var="calendarCluber">
        <div class="card shadow-lg cardBox">
            <div class="photoBox">
                <img class="bd-placeholder-img img-fluid rounded-start photo"
                     src="/resources/${calendarCluber.user.userImage}" alt="any">
            </div>
            <div>
                <div class="card-body">
                    <div>
                        <h3 class="card-title">
                                ${calendarCluber.user.userId}
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    </div>
</div>
<div class="modal-footer" style="display: block">
    <button type="button" class="btn btn-primary listClubCalendarApply" data-bs-toggle="modal"
            data-bs-target="#listClubCalendarApply">참여 신청 목록</button>
</div>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<div class="modal-header">
    <a class="navbar-brand back-btn" data-bs-target="#listCluber" data-bs-toggle="modal">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
            <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
        </svg>
    </a>
    <h5 class="modal-title">블랙리스트 목록 조회</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
    <form id="listClubBlacklistForm">
        <input type="hidden" id="clubNum" name="clubNum" value="${clubNum}">
        <div style="padding-bottom: 20px; margin-left: 300px;">
            <label>
                <select class="form-select" name="searchCondition" id="searchCondition">
                    <option ${empty search.searchCondition?'selected':search.searchCondition == '0'?'selected':''}
                            value="0">전체 검색
                    </option>
                    <option ${search.searchCondition == '1'?'selected':''} value="1">현재 등록 상태</option>
                    <option ${search.searchCondition == '2'?'selected':''} value="2">등록 취소</option>
                </select>
            </label>
        </div>
        <c:if test="${empty list}">
            <div class="card shadow-lg cardBox" style="grid-template-columns: 1fr;">블랙리스트 대상자가 없습니다!</div>
        </c:if>
        <c:if test="${!empty list}">
            <div class="card-list" style="overflow-y: scroll;height: 600px;">
                <c:forEach items="${list}" var="clubBlacklist">
                    <div class="card shadow-lg cardBox each">
                        <input type="checkbox" class="clubUserNum" name="clubUserNum" value="${clubBlacklist.clubUserNum}"
                               style="display: none">
                        <input type="hidden" name="clubNum" value="${clubBlacklist.clubNum}">
                        <input type="hidden" name="userId" value="${clubBlacklist.user.userId}">
                        <div class="photoBox">
                            <img class="bd-placeholder-img img-fluid rounded-start photo"
                                 src="/resources/${clubBlacklist.user.userImage}" alt="any">
                        </div>
                        <div>
                            <div class="card-body">
                                <div>
                                    <h3 class="card-title">
                                            ${clubBlacklist.user.userId}
                                        <small class="text-muted" style="font-size: 16px;">
                                                ${clubBlacklist.blacklistDate}
                                        </small>
                                    </h3>
                                    <span class="badge bg-primary text-wrap">${clubBlacklist.blacklistCheck=='1'?'등록':'취소'}</span>
                                </div>
                                <div>
                                    <div class="blacklistText d-inline-block text-truncate" style="max-width: 250px;">
                                        <small>
                                                ${clubBlacklist.blacklistText}
                                        </small>
                                    </div>
                                    <span class="badge bg-primary text-wrap getClubBlacklist">자세히</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div style="margin-left: 335px;">
                <input type="button" class="updateClubBlacklist btn btn-primary" value="등록">
                <input type="button" class="updateClubBlacklist btn btn-primary" value="취소">
            </div>
            <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
                <span class="paging">${i}</span>
            </c:forEach>
            <label>
                <input type="hidden" id="currentPage" name="currentPage" value="1">
            </label>
        </c:if>
    </form>
</div>
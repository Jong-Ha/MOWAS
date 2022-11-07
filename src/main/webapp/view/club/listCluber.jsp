<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<script>
    $(function(){
        $.each($('.tooltipList'),function(i,e){
            const tooltip = new bootstrap.Tooltip(e)
        })
    })
</script>
<div class="modal-header">
    <input type="hidden" id="clubNum" value="${clubNum}">
    <a class="navbar-brand back-btn">
        <%--        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">--%>
        <%--            <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>--%>
        <%--            <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>--%>
        <%--        </svg>--%>
    </a>
    <h5 class="modal-title">모임원 목록 조회</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
    <c:if test="${currentCluber.cluberStatus=='5'||currentCluber.cluberStatus=='6'}">
        <div class="buttonClass">
            <div class="badge bg-primary text-wrap listCluberApply tooltipList" data-bs-target="#listCluberApply" data-bs-title="가입 신청 조회"
                 data-bs-toggle="modal">
                <img src="/resources/images/cluberApply.png" style="width: 50px;height: 50px;">
            </div>
            <div class="badge bg-primary text-wrap addClubBlacklist tooltipList" data-bs-target="#addClubBlacklist" data-bs-title="블랙리스트 등록"
                 data-bs-toggle="modal">
                <img src="/resources/images/clubBlacklist.png" style="width: 50px;height: 50px;">
            </div>
            <div class="badge bg-primary text-wrap listClubBlacklist tooltipList" data-bs-target="#listClubBlacklist" data-bs-title="블랙리스트 조회"
                 data-bs-toggle="modal">
                <img src="/resources/images/groupBlackllist.png" style="width: 50px;height: 50px;">
            </div>
            <c:if test="${search.searchCondition=='0'}">
                <div class="badge bg-primary text-wrap listCluberOut tooltipList" data-bs-target="#listCluberOut" data-bs-title="탈퇴한 모임원 조회"
                     data-bs-toggle="modal">탈퇴한 모임원 조회
                </div>
            </c:if>
            <c:if test="${search.searchCondition=='1'}">
                <div class="badge bg-primary text-wrap listCluber tooltipList" data-bs-target="#listCluber" data-bs-toggle="modal" data-bs-title="현재 모임원 조회">
                    현재 모임원 조회
                </div>
            </c:if>
        </div>
    </c:if>
    <div class="card-list">
        <c:if test="${empty list}">
            <div class="card shadow-lg cardBox noHover" style="grid-template-columns: 1fr;">탈퇴한 모임원이 없습니다!</div>
        </c:if>
        <c:if test="${!empty list}">
            <c:forEach items="${list}" var="cluber">
                <div class="card shadow-lg cardBox" data-bs-target="#getCluber" data-bs-toggle="modal">
                    <input type="hidden" class="clubUserNum" name="clubUserNum" value="${cluber.clubUserNum}">
                    <div class="photoBox">
                        <img class="bd-placeholder-img img-fluid rounded-start photo"
                             src="/resources/${cluber.user.userImage}" alt="any">
                    </div>
                    <div>
                        <div class="card-body">
                            <div>
                                <h4 class="card-title">${cluber.user.userId}</h4>
                                <div class="badge bg-primary text-wrap">
                                        ${cluber.cluberStatus=='4'?'모임원':''}
                                        ${cluber.cluberStatus=='5'?'매니저':''}
                                        ${cluber.cluberStatus=='6'?'모임장':''}
                                        ${cluber.cluberStatus=='7'?'탈퇴':''}
                                        ${cluber.cluberStatus=='8'?'강퇴':''}
                                </div>
                            </div>
                            <div>
                                <small class="text-muted">
                                        ${cluber.cluberStatus=='4'?cluber.clubRegDate:''}
                                        ${cluber.cluberStatus=='5'?cluber.clubRegDate:''}
                                        ${cluber.cluberStatus=='6'?cluber.clubRegDate:''}
                                        ${cluber.cluberStatus=='7'?cluber.clubOutDate:''}
                                        ${cluber.cluberStatus=='8'?cluber.clubOutDate:''}
                                </small>
                                <div class="badge bg-primary text-wrap">접속중미구현</div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>
<div class="modal-footer">

    <c:if test="${!empty list}">
        <c:if test="${search.searchCondition==1}">
            <form id="listCluberOutForm">
                <input type="hidden" name="clubNum" value="${clubNum}">
                <input type="hidden" id="currentPage" name="currentPage" value="1">
                <nav aria-label="Page navigation example" style="display: flex;justify-content: center;">
                    <ul class="pagination">
                        <li class="page-item pageUnit ${resultPage.beginUnitPage==1?'disabled':''}" value="${resultPage.beginUnitPage-resultPage.pageUnit}">
                            <a class="page-link" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
                            <li class="page-item ${search.currentPage==i?'active':'paging'}"><a class="page-link">${i}</a></li>
                        </c:forEach>
                        <li class="page-item pageUnit ${resultPage.maxPage==resultPage.endUnitPage?'disabled':''}" value="${resultPage.beginUnitPage+resultPage.pageUnit}">
                            <a class="page-link" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </form>
        </c:if>
    </c:if>
</div>
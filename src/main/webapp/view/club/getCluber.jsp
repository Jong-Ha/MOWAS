<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<div class="modal-header">
    <input type="hidden" id="clubNum" name="clubNum" value="${cluber.clubNum}">
    <input type="hidden" id="clubUserNum" name="clubUserNum" value="${cluber.clubUserNum}">
    <input type="hidden" id="cluberStatus" name="cluberStatus" value="${cluber.cluberStatus}">
    <a class="navbar-brand back-btn" data-bs-target="#listCluber${cluber.cluberStatus=='7'||cluber.cluberStatus=='8'?'Out':''}" data-bs-toggle="modal">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
                    <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                </svg>
    </a>
    <h5 class="modal-title">모임원 정보</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
    <div class="card-body cluberInfo">
        <div class="photoBox">
            <img src="/resources/${cluber.user.userImage}" alt="유저이미지">
        </div>
        <div class="cardM " style="display: flex; padding: 10px 0 0 10px; height: 120px; ">
            <div class="clubinfo cartFont" style="flex: 1; width: 50%;">
                <p class="allFlex">${cluber.user.userId}</p>
                <p class="allFlex">
                    ${cluber.cluberStatus=='4'?'모임원':''}
                    ${cluber.cluberStatus=='5'?'매니저':''}
                    ${cluber.cluberStatus=='6'?'모임장':''}
                    ${cluber.cluberStatus=='7'?'탈퇴':''}
                    ${cluber.cluberStatus=='8'?'강퇴':''}
                    ${cluber.cluberStatus=='9'?'블랙리스트':''}
                </p>
                <p class="allFlex">${cluber.clubRegDate} 가입</p>
                <c:if test="${!empty cluber.clubOutDate}">
                    <p class="allFlex">${cluber.clubOutDate} 탈퇴</p>
                </c:if>
            </div>
        </div>
    </div>

    <hr style="margin: 0;">

    <div class="card-body cluberText">
        <c:if test="${empty cluber.clubOutText}">
            ${empty cluber.cluberText?'자기소개가 없습니다.':cluber.cluberText}
        </c:if>
        <c:if test="${!empty cluber.clubOutText}">
            ${cluber.clubOutText}
        </c:if>
    </div>
</div>
<div class="modal-footer">
    <div class="card-body carditem" style="padding: 0;">

        <div class="itemBox">
            <c:if test="${user.userId==cluber.user.userId}"><input type="button" class="btn btn-primary updateCluber"
                                                                   value="자기소개 수정" data-bs-toggle="modal" data-bs-target="#updateCluber"></c:if>
            <c:if test="${currentCluber.cluberStatus=='6'}">
                <c:if test="${cluber.cluberStatus=='4'||cluber.cluberStatus=='5'}">
                    <input type="button" class="btn btn-primary updateClubMaster" value="모임장 위임">
                </c:if>
                <c:if test="${cluber.cluberStatus=='4'}">
                    <input type="button" class="btn btn-primary addClubManager" value="매니저 임명">
                </c:if>
                <c:if test="${cluber.cluberStatus=='5'}">
                    <input type="button" class="btn btn-primary deleteClubManager" value="매니저 권한 박탈">
                </c:if>
            </c:if>
            <c:if test="${currentCluber.cluberStatus=='5'||currentCluber.cluberStatus=='6'}">
                <c:if test="${cluber.cluberStatus=='4'}">
                    <input type="button" class="btn btn-primary deleteCluber" value="모임 강퇴" data-bs-toggle="modal" data-bs-target="#deleteCluber">
                </c:if>
            </c:if>
        </div>
    </div>
</div>
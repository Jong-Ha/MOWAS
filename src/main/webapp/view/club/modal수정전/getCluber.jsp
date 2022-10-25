<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MOWAS</title>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

</head>
<body>
<input type="hidden" id="clubNum" name="clubNum" value="${cluber.clubNum}">
<input type="hidden" id="clubUserNum" name="clubUserNum" value="${cluber.clubUserNum}">
<input type="hidden" id="cluberStatus" name="cluberStatus" value="${cluber.cluberStatus}">
<jsp:include page="backClose.jsp"/>
<div class="container content-box">

    <div class="cardbox">
        <div class="col reviewBox">
            <div class="card h-100 shadow-lg">

                <div class="card-footer" style=" border-bottom: 1px solid; display: flex; font-weight: bold">
                    모임원 정보
                </div>

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

                <div class="card-footer">
                    <div class="card-body carditem" style="padding: 0;">

                        <div class="itemBox">
                            <c:if test="${user.userId==cluber.user.userId}"><input type="button" class="btn btn-primary updateCluber"
                                                                                   value="자기소개 수정"></c:if>
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
                                    <input type="button" class="btn btn-primary deleteCluber" value="모임 강퇴">
                                </c:if>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script src="/resources/club/js/getCluber.js"></script>
<link href="/resources/club/css/getCluber.css" rel="stylesheet" type="text/css"/>
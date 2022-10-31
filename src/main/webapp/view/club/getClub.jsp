<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>MOWAS</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="/resources/club/js/getClub.js"></script>
    <link href="/resources/club/css/getClub.css" rel="stylesheet" type="text/css"/>
</head>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<input type="hidden" class="boardNum" value="${club.clubNum}">
<input type="hidden" class="cluberStatus" value="${currentCluber.cluberStatus}">
<input type="hidden" class="userId" value="${user.userId}">
<input type="hidden" class="userImage" value="${user.userImage}">
<input type="hidden" class="clubUserNum" value="${currentCluber.clubUserNum}">

<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>
<!-- Example Code -->
<div class="container" style="padding-top: 30px;margin-bottom: 50px;">

    <div id="nonModal">
        <div class="row" style="display: flex; align-items: center">
            <div class="col-2">
            </div>
            <div class="col-8">
                <h1>${club.clubName}</h1>
            </div>
            <div class="col-2" style="text-align: left;">
                <button class="btn btn-primary addClubReportView" data-bs-toggle="modal"
                        data-bs-target="#addClubReport">
                    모임 신고
                </button>
            </div>
        </div>
        <div class="container-fluid py-3" style="text-align: center; width: 70%;">
            <img src="/resources/${club.clubImage}" alt="모임 대표 이미지"
                 style="object-fit: cover; width: 100%; height: 100%">
        </div>

        <h5 style="width: 70%">${club.clubText}</h5>


        <div class="clubInfo" style="display: flex;">

            <div class="clubInfoLeft">

                <div class="container">
                    <div class="row">
                        <div class="col-4">모임장 : ${club.clubMasterId}</div>
                        <c:if test="${currentCluber.cluberStatus=='5'||currentCluber.cluberStatus=='6'}">
                            <div class="col-4">
                                <button class="btn btn-primary updateClubView font" data-bs-toggle="modal"
                                        data-bs-target="#updateClub">
                                    모임 수정
                                </button>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <div class="col-4">
                            Since : ${club.clubCreateDate}
                        </div>
                    </div>
                </div>


                <div class="container">
                    <div class="row">
                        <div class="col-4">${club.currentCluber}/25
                            <div class="badge bg-primary text-wrap">
                                ${club.gatherCheck==1?'모집중':'모집완료'}
                            </div>
                        </div>
                        <div class="col-4">
                            <c:if test="${currentCluber.cluberStatus=='4'||currentCluber.cluberStatus=='5'||currentCluber.cluberStatus=='6'}">
                                <button type="button" class="btn btn-primary font listCluber" data-bs-toggle="modal"
                                        data-bs-target="#listCluber">모임원 목록
                                </button>
                            </c:if>
                        </div>
                    </div>
                </div>

            </div>

            <div class="clubInfoRight">

                <div class="container">
                    <div class="badge bg-primary text-wrap">
                        ${club.villCode}
                    </div>
                    <div class="badge bg-primary text-wrap">
                        ${club.interList}
                    </div>
                </div>

                <div class="container">
                    <div class="badge bg-primary text-wrap"
                         style="width: 250px;height: 65px;display: grid;float: right;grid-template-columns: 1fr 1fr 1fr;">
                        <c:forEach items="${tagList}" var="tag">
                            <div>#${tag}</div>
                        </c:forEach>
                    </div>
                </div>

            </div>

        </div>

        <div>
            <nav class="navbar navbar-expand-lg clubTab">

                <div>
                    <div class="underline yellow listClubMasterBoardView">모임 공지사항</div>
                    <input type="button" class="getClubMasterBoard" data-bs-toggle="modal"
                           data-bs-target="#getClubMasterBoard" style="display: none"></input>
                </div>

                <div>
                    <div class="underline yellow calendarView">모임 일정</div>
                </div>

                <div>
                    <div class="underline yellow listClubCalendarReviewView">모임 일정 후기</div>
                </div>

                <div>
                    <div class="underline yellow listClubCalendarShortView">모임 일정 쇼츠</div>
                </div>

            </nav>

            <div class="clubBoarder container" id="ClubBoard" style="display: none">
                <div style="text-align: center">내용 출력 예정</div>
            </div>
            <div class="clubBoarder" id="ClubBoardRest">

            </div>
        </div>


        <div style="text-align: right; margin-right: 150px;">
            <c:if test="${currentCluber.cluberStatus=='6'}">
                <button class="btn btn-primary deleteClub" data-bs-toggle="modal" data-bs-target="#deleteClub">
                    모임 삭제
                </button>
            </c:if>
            <c:if test="${currentCluber.cluberStatus=='4'||currentCluber.cluberStatus=='5'}">
                <button class="btn btn-primary deleteCluberView" data-bs-toggle="modal" data-bs-target="#deleteCluber">
                    모임 탈퇴
                </button>
            </c:if>
        </div>

        <footer style="padding-top: 20px; clear: both;">
            <c:if test="${club.gatherCheck=='1'}">
                <c:if test="${empty currentCluber.cluberStatus}">
                    <button class="btn btn-primary addCluberApplyView" data-bs-toggle="modal"
                        ${!empty user?'data-bs-target="#cluberApply"':''}>
                        가입 신청
                    </button>
                </c:if>
            </c:if>
            <c:if test="${currentCluber.cluberStatus=='2'}">
                <button class="btn btn-primary updateCluberApplyView" data-bs-toggle="modal"
                        data-bs-target="#cluberApply">
                    가입 신청 수정
                </button>
            </c:if>

        </footer>

    </div>


    <%--모임 수정 모달창 시작--%>
    <c:if test="${currentCluber.cluberStatus=='5'||currentCluber.cluberStatus=='6'}">
        <div class="modal fade" id="updateClub" tabindex="-1" aria-labelledby="updateClubLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="updateClubLabel">모임 수정</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="updateClubForm" enctype="multipart/form-data">
                            <input type="hidden" name="clubNum" value="${club.clubNum}">
                            <input type="hidden" name="deleteFileName" value="${club.clubImage}" disabled>
                            <div class="input-group mb-3">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="clubName" name="clubName"
                                           placeholder="모임명"
                                           value="${club.clubName}" required>
                                    <label for="clubName">모임명</label>
                                </div>
                            </div>

                            <div class="input-group mb-3">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="clubText" name="clubText"
                                           placeholder="모임소개"
                                           value="${club.clubText}" required>
                                    <label for="clubText">모임소개</label>
                                </div>
                            </div>

                            <div class="input-group mb-3">
                                <div class="form-floating">
                                    <select class="form-select" id="interList" name="interList" required>
                                        <option value="00">선택하세요</option>
                                        <option value="01" ${club.interList=='독서'?'selected':''}>독서</option>
                                        <option value="02" ${club.interList=='자동차'?'selected':''}>자동차</option>
                                        <option value="03" ${club.interList=='반려동물'?'selected':''}>반려동물</option>
                                        <option value="04" ${club.interList=='공예'?'selected':''}>공예</option>
                                        <option value="05" ${club.interList=='스포츠'?'selected':''}>스포츠</option>
                                        <option value="06" ${club.interList=='댄스'?'selected':''}>댄스</option>
                                        <option value="07" ${club.interList=='여행'?'selected':''}>여행</option>
                                        <option value="08" ${club.interList=='사진'?'selected':''}>사진</option>
                                        <option value="09" ${club.interList=='육아'?'selected':''}>육아</option>
                                        <option value="10" ${club.interList=='공연'?'selected':''}>공연</option>
                                        <option value="11" ${club.interList=='음악'?'selected':''}>음악</option>
                                        <option value="12" ${club.interList=='게임'?'selected':''}>게임</option>
                                        <option value="13" ${club.interList=='그외'?'selected':''}>그외</option>
                                    </select>
                                    <label for="interList">관심목록</label>
                                </div>
                            </div>

                            <div class="input-group mb-3">
                                <button class="btn btn-outline-secondary" type="button" id="updateClubMap"
                                        data-bs-toggle="modal"
                                        data-bs-target="#searchLocation">주요활동위치
                                </button>
                                <input type="text" class="form-control" placeholder="" readonly name="villCode"
                                       id="villCode"
                                       value="${club.villCode}"
                                >
                            </div>

                            <div class="mb-3">
                                <div style="width: 466px;height: 233px; text-align: center;">
                                    <img src="/resources/${club.clubImage}"
                                         style="object-fit: contain; width: 100%; height: 100%" alt="수정전 이미지">
                                </div>
                                <label for="file" class="form-label" style="display: none"></label>
                                <input class="form-control" type="file" id="file" name="file">
                            </div>

                            <div class="input-group mb-3">
                                <div class="form-floating">
                                    <input type="text" class="tagify shadow-lg" id="clubTag" style="border-radius: 7px;"
                                           placeholder="태그 : Enter!">
                                    <label for="clubTag" style="display: none">태그 : Enter!</label>
                                    <c:forEach items="${tagList}" var="tag">
                                        <input type="hidden" class="tagList" value="${tag}">
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="input-group mb-3">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" role="switch" id="gatherCheck"
                                           value="1"
                                           name="gatherCheck" ${club.gatherCheck=='1'?'checked':''}>
                                    <label class="form-check-label"
                                           for="gatherCheck">${club.gatherCheck=='1'?'모집중':'모집완료'}</label>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer" style="display: block">
                        <button type="button" class="btn btn-primary updateClub">모임 수정
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <%--모임 수정 모달창 끝--%>


    <%--모임 가입 신청 모달창 시작--%>
    <c:if test="${club.gatherCheck=='1'}">
        <div class="modal fade" id="cluberApply" tabindex="-1" aria-labelledby="CluberApplyLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="CluberApplyLabel">모임 가입 신청</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="cluberApplyForm">
                            <c:if test="${!empty currentCluber.clubUserNum}">
                                <input type="hidden" name="clubUserNum" value="${currentCluber.clubUserNum}">
                            </c:if>
                            <input type="hidden" name="clubNum" value="${club.clubNum}">

                            <div class="input-group mb-3">
                                <div class="form-floating">
                                    <input type="text" class="form-control" name="userId" id="userId" placeholder="모임명"
                                           value="${user.userId}" required readonly>
                                    <label for="userId">아이디</label>
                                </div>
                            </div>

                            <div class="input-group mb-3">
                                <div class="form-floating">
                                    <input type="text" class="form-control" name="clubName" placeholder="모임명"
                                           value="${club.clubName}" required readonly>
                                    <label for="clubName">모임명</label>
                                </div>
                            </div>

                            <div class="input-group mb-3">
                                <div class="form-floating">
                                <textarea class="form-control" placeholder="자기소개" id="cluberText" name="cluberText"
                                          style="height: 200px;">${currentCluber.cluberText}</textarea>
                                    <label for="cluberText">자기소개</label>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <c:if test="${currentCluber.cluberStatus!='2'}">
                            <button type="button" class="btn btn-primary addCluberApply" style="margin-right: 185px">모임
                                가입
                                신청
                            </button>
                        </c:if>
                        <c:if test="${currentCluber.cluberStatus=='2'}">
                            <button type="button" class="btn btn-primary updateCluberApply" style="margin-right: 10px">
                                수정
                            </button>
                            <button type="button" class="btn btn-primary deleteCluberApply" style="margin-right: 175px">
                                삭제
                            </button>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <%--모임 가입 신청 모달창 끝--%>

    <%--모임 탈퇴 모달창 시작--%>
    <div class="modal fade" id="deleteCluber" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--모임 탈퇴 신청 모달창 끝--%>

    <%--모임원 목록 조회 모달창 시작--%>
    <div class="modal fade listCluberModal" id="listCluber" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--모임원 목록 조회 모달창 끝--%>

    <%--모임원 목록 조회 모달창 시작--%>
    <div class="modal fade listCluberModal" id="listCluberOut" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--모임원 목록 조회 모달창 끝--%>

    <%--getCluber 모달창 시작--%>
    <div class="modal fade" id="getCluber" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--getCluber 모달창 끝--%>

    <%--listCluberApply 모달창 시작--%>
    <div class="modal fade" id="listCluberApply" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--listCluberApply 모달창 끝--%>

    <%--listClubBlacklist 모달창 시작--%>
    <div class="modal fade" id="listClubBlacklist" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--listClubBlacklist 모달창 끝--%>

    <%--addClubBlacklist 모달창 시작--%>
    <div class="modal fade" id="addClubBlacklist" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--addClubBlacklist 모달창 끝--%>

    <%--updateCluber 모달창 시작--%>
    <div class="modal fade" id="updateCluber" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--updateCluber 모달창 끝--%>

    <%--listCalendarCluber 모달창 시작--%>
    <div class="modal fade" id="listCalendarCluber" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--listCalendarCluber 모달창 끝--%>

    <%--listClubCalendarApply 모달창 시작--%>
    <div class="modal fade" id="listClubCalendarApply" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--listClubCalendarApply 모달창 끝--%>

    <%--addClubReport 모달창 시작--%>
    <div class="modal fade" id="addClubReport" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--addClubReport 모달창 끝--%>

    <%--searchLocation 모달창 시작--%>
    <div class="modal fade" id="searchLocation" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <jsp:include page="/view/site/clubMap.jsp"/>
            </div>
        </div>
    </div>
    <%--searchLocation 모달창 끝--%>

    <%--addClubMasterBoard 모달창 시작--%>
    <div class="modal fade" id="addClubMasterBoard" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--addClubMasterBoard 모달창 끝--%>

    <%--getClubMasterBoard 모달창 시작--%>
    <div class="modal fade" id="getClubMasterBoard" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--getClubMasterBoard 모달창 끝--%>

    <%--updateClubMasterBoard 모달창 시작--%>
    <div class="modal fade" id="updateClubMasterBoard" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <%--updateClubMasterBoard 모달창 끝--%>


</div>

<%--채팅아이콘--%>
<jsp:include page="/layout/chatIcon.jsp"/>
<%--하단바--%>
<jsp:include page="/layout/footer.jsp"/>

</body>
</html>
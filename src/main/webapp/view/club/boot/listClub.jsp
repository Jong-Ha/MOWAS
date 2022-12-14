<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="/resources/club/js/listClub.js"></script>
    <link href="/resources/club/css/listClub.css" rel="stylesheet" type="text/css"/>
</head>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">

<%--구현 후 빼야함--%>
<input type="button" class="clubLogin" value="로그인">
<label>
    아이디 : <input type="text" name="userId" value="user01">
</label>
${user.userId}
<%--여기까지--%>

<!-- Example Code -->
<div class="wap">
    <%--상단 툴바--%>
    <jsp:include page="/layout/toolbar.jsp"/>

    <form id="listForm">
        <div style="display: none" class="tagForm">
            <c:forEach items="${searchTag}" var="tag">
                <input type="hidden" name='searchTag' class='searchTag' value="${tag}">
            </c:forEach>
        </div>
        <input type="hidden" name="searchLocation" value="${searchLocation}">
        <c:forEach items="${searchInterList}" var="i">
            <input type="hidden" name="searchedInterList" value="${i}">
        </c:forEach>
        <div class="modal fade" id="searchInterListDialog" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="searchInterListDialogLabel" style="margin-left: 120px;">관심목록을
                            선택해주세요</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="interList">
                            <label>
                                <input type="checkbox" name="searchInterList" value="01"> 독서
                            </label>
                            <label>
                                <input type="checkbox" name="searchInterList" value="02"> 자동차
                            </label>
                            <label>
                                <input type="checkbox" name="searchInterList" value="03"> 반려동물
                            </label>
                            <label>
                                <input type="checkbox" name="searchInterList" value="04"> 공예
                            </label>
                            <label>
                                <input type="checkbox" name="searchInterList" value="05"> 스포츠
                            </label>
                            <label>
                                <input type="checkbox" name="searchInterList" value="06"> 댄스
                            </label>
                        </div>
                        <div class="interList">
                            <label>
                                <input type="checkbox" name="searchInterList" value="07"> 여행
                            </label>
                            <label>
                                <input type="checkbox" name="searchInterList" value="08"> 사진
                            </label>
                            <label>
                                <input type="checkbox" name="searchInterList" value="09"> 육아
                            </label>
                            <label>
                                <input type="checkbox" name="searchInterList" value="10"> 공연
                            </label>
                            <label>
                                <input type="checkbox" name="searchInterList" value="11"> 음악
                            </label>
                            <label>
                                <input type="checkbox" name="searchInterList" value="12"> 게임
                            </label>
                            <label>
                                <input type="checkbox" name="searchInterList" value="13"> 그외
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <div class="modal fade" id="searchTagDialog" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title text-center fs-5" id="searchTagDialogLabel" style="margin-left: 190px">
                        태그입력</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label>
                        <span name='searchTagInput' class='tagify--outside' placeholder='태그를 입력해주세요'></span>
                    </label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>

    <div class="add" style="display:flex;justify-content: space-between;align-items: center;">
        <button class="btn btn-primary addClub" data-bs-toggle="modal" data-bs-target="#addClub">
            모임 만들기
        </button>
        <div>
            <button class="btn btn-primary searchLocation">
                ${searchLocation}
            </button>
            <button class="btn btn-primary searchInterList" data-bs-toggle="modal"
                    data-bs-target="#searchInterListDialog">
                관심목록
            </button>
            <button class="btn btn-primary searchTag" data-bs-toggle="modal" data-bs-target="#searchTagDialog">
                태그
            </button>
            <button class="btn btn-primary searchListClub">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search"
                     viewBox="0 0 16 16" style="font-size: 20px;">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg>
            </button>
        </div>
    </div>

    <c:if test="${empty list}">
        <div class="p-5 mb-4 bg-light rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold">조회된 모임이 없습니다</h1><br>
                <button class="btn btn-primary btn-lg addClub" type="button">모임 만들기</button>
            </div>
        </div>
    </c:if>
    <div class="listClub" style="display: grid;grid-template-columns: 1fr 1fr 1fr;">
        <c:forEach var="club" items="${list}">
            <div class="row row-cols-1 row-cols-md-3 g-4 cardbox">
                <div class="col clubBox" style="cursor: pointer">
                    <input type="hidden" name="clubNum" value="${club.clubNum}">
                    <div class="card h-100 shadow-lg">
                        <div class="card-img-top">
                            <img src="/resources/${club.clubImage}" alt="모임이미지">
                        </div>

                        <div class="card-body carditem">
                            <h3 class="card-title">${club.clubName}</h3>
                            <div class="row g-3">
                                <div class="col-6">
                                    <div class="badge bg-primary text-wrap" style="width: 6rem;">
                                            ${club.gatherCheck==1?'모집중':'모집완료'}
                                    </div>
                                    <div class="badge bg-primary text-wrap" style="width: 6rem;">
                                            ${club.villCode}
                                    </div>
                                    <div class="badge bg-primary text-wrap" style="width: 6rem;">
                                            ${club.interList}
                                    </div>
                                </div>
                                <div class="col-6">
                                        ${club.currentCluber}/25<br>
                                    <span class="likeToggle">
                                        <c:if test="${club.likeCheck!='y'}">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16"> <path
                                                    d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> </svg>
                                        </c:if>
                                    <c:if test="${club.likeCheck=='y'}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16"> <path
                                                fill-rule="evenodd"
                                                d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> </svg>
                                    </c:if>
                                </span>
                                </div>
                            </div>
                            <button type="button" class="btn btn-outline-primary clubTag">${club.tag}</button>
                        </div>
                            <%--<div class="card-footer">
                                <small class="text-muted">Last updated 3 mins ago</small>
                            </div>--%>
                    </div>
                </div>
            </div>

        </c:forEach>
    </div>
    <div class="modal fade" id="addClub" tabindex="-1" aria-labelledby="addClubLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="addClubLabel">모임 만들기</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addClubForm" enctype="multipart/form-data">
                        <div class="input-group mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="clubName" name="clubName" placeholder="모임명"
                                       required>
                                <label for="clubName">모임명</label>
                            </div>
                        </div>

                        <div class="input-group mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="clubText" name="clubText" placeholder="모임소개"
                                       required>
                                <label for="clubText">모임소개</label>
                            </div>
                        </div>

                        <div class="input-group mb-3">
                            <div class="form-floating">
                                <select class="form-select" id="interListView" name="interListView" required>
                                    <option value="00" selected>선택하세요</option>
                                    <option value="01">독서</option>
                                    <option value="02">자동차</option>
                                    <option value="03">반려동물</option>
                                    <option value="04">공예</option>
                                    <option value="05">스포츠</option>
                                    <option value="06">댄스</option>
                                    <option value="07">여행</option>
                                    <option value="08">사진</option>
                                    <option value="09">육아</option>
                                    <option value="10">공연</option>
                                    <option value="11">음악</option>
                                    <option value="12">게임</option>
                                    <option value="13">그외</option>
                                </select>
                                <label for="interListView">관심목록</label>
                            </div>
                        </div>

                        <div class="input-group mb-3">
                            <button class="btn btn-outline-secondary" type="button" id="button-addon1">주요활동위치</button>
                            <input type="text" class="form-control" placeholder="" name="villCode" id="villCode"
                                   >
                        </div>

                        <div class="mb-3">
                            <label for="file" class="form-label" style="display: none"></label>
                            <input class="form-control" type="file" id="file" name="file">
                        </div>

                        <div class="input-group mb-3">
                            <div class="form-floating">
                                <input type="text" class="tagify shadow-lg" id="clubTag" style="border-radius: 7px;" placeholder="태그 : Enter!">
                                <label for="clubTag" style="display: none">태그 : Enter!</label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary newClub" style="margin-right: 185px">모임 만들기</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>


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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css"/>
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
    <input hidden class="boardCategory" value="1">
    <%--상단 툴바--%>
    <jsp:include page="/layout/toolbar.jsp"/>

    <form>
        <input type="hidden" name="searchLocation" value="${user.villCode}">
        <input type="hidden" name="searchInterList" value="${user.interList}">
        <input type="hidden" name="searchTag" value="">
    </form>

    <div class="add" style="display:flex;justify-content: space-between;align-items: center;">
        <button class="btn btn-primary addClub">
            모임 만들기
        </button>
        <div>
            <button class="btn btn-primary searchLocation">
                ${user.villCode}
            </button>
            <button class="btn btn-primary searchInterList">
                관심목록
            </button>
            <button class="btn btn-primary searchTag">
                태그
            </button>
            <button class="btn btn-primary searchListClub">
                검색
            </button>
        </div>
    </div>

    <div class="listClub" style="display: grid;grid-template-columns: 1fr 1fr 1fr;">

        <c:forEach var="club" items="${list}">
            <div class="row row-cols-1 row-cols-md-3 g-4 cardbox">
                <div class="col clubBox" style="cursor: pointer">
                    <input type="hidden" name="clubNum" value="${club.clubNum}">
                    <div class="card h-100">
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

</div>
</body>
</html>


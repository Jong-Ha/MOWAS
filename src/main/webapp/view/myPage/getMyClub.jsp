<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<style>
    .tabBox {
        display: flex;
        margin: 0 15px;
    }

    .tabBox span {
        font-size: 25px;
        margin: 5px;
        font-weight: bolder;
    }

    .tabBox span.tabBtn {
        font-size: 25px;
        margin: 5px;
        font-weight: bolder;
        cursor: pointer;
    }

</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    $(function(){
        var userId = $(".myPageUserId").val();

        $(".getMyClub1").on("click", function () {
            self.location = "/myPage/getMyClub?userId="+userId;
        });
        $(".getMyClubApply1").on("click", function () {
            self.location = "/myPage/getMyClubApply?userId="+userId;
        });
    })

</script>
<body>
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>

<div class="tabBox">
    <span class="tabBtn getMyClub1" >가입한 모임</span>
    <span>|</span>
    <span class="tabBtn getMyClubApply1" >가입신청한 모임</span class="tabBtn">
</div>


<hr>
<h3>내가 가입한 모임</h3>
<hr/>
<div class="container" style="display: inline-block">

<c:set var="i" value="0" />
<c:forEach var="list" items="${map.getMyClub}"><br/>


<div class="row row-cols-1 row-cols-md-3 g-4 cardbox" style="display:inline-block; margin-left: 100px;">
    <div class="col clubBox" style="cursor: pointer">
        <input type="hidden" name="clubNum" value="10087">
        <div class="card h-50 shadow-lg clubCard">
            <div class="card-img-top">
                <img src="/resources/${list.clubImage}" alt="모임이미지">
            </div>

            <div class="card-body carditem" >
                <h3 class="card-title">${list.clubName}</h3>
                <div class="row g-3">
                    <div class="col-6">
                        <div class="badge bg-primary text-wrap" style="width: 6rem;">
                            ${list.gatherCheck}
                        </div>
                        <div class="badge bg-primary text-wrap" style="width: 6rem;">
                            ${list.villCode}
                        </div>
                        <div class="badge bg-primary text-wrap" style="width: 6rem;">
                            ${list.interList}
                        </div>
                    </div>
                    <div class="col-6">
                                    <span class="likeToggle">

                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16"> <path
                                                    fill-rule="evenodd"
                                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> </svg>

                                </span>
                    </div>
                </div>
                <button type="button" class="btn btn-outline-primary clubTag">${list.tag}</button>
            </div>
        </div>
    </div>
</div>


</c:forEach> <br/>
</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>

<link rel="stylesheet" href="/resources/club/css/listClub.css" />
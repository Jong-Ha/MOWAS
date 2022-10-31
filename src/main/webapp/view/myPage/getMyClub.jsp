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
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.getMyClub}"><br/>
    <%--모임원상태${list.cluberStatus}<br/>--%>
    관심목록 ${list.interList}<br/>
    모임명 ${list.clubName}<br/>
    동네코드 ${list.villCode}<br/>
    모임 이미지 ${list.clubImage}<br/>
    모집여부 ${list.gatherCheck}<br/>
    태그 ${list.tag}<br/>
</c:forEach> <br/>


<div class="row row-cols-1 row-cols-md-3 g-4 cardbox">
    <div class="col clubBox" style="cursor: pointer">
        <input type="hidden" name="clubNum" value="10087">
        <div class="card h-100 shadow-lg clubCard">
            <div class="card-img-top">
                <img src="/resources/uploadFiles\clubImages\5176af9c-4389-4d3b-a23f-3809cfc828b7sunset-gafedb3e5b_1280.jpg" alt="모임이미지">
            </div>

            <div class="card-body carditem">
                <h3 class="card-title">채팅 있는 새로운 모임</h3>
                <div class="row g-3">
                    <div class="col-6">
                        <div class="badge bg-primary text-wrap" style="width: 6rem;">
                            모집중
                        </div>
                        <div class="badge bg-primary text-wrap" style="width: 6rem;">
                            역삼1동
                        </div>
                        <div class="badge bg-primary text-wrap" style="width: 6rem;">
                            독서
                        </div>
                    </div>
                    <div class="col-6">
                                    <span class="likeToggle">

                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16"> <path
                                                    d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> </svg>


                                </span>
                    </div>
                </div>
                <button type="button" class="btn btn-outline-primary clubTag">#태그1 #태그2 #태그3 #하나는엄청긴태그 #그런거다 #이런거다 #그렇게하자</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>

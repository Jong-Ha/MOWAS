<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-15
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>

</head>
<style>
    .btn-prm {
        --bs-btn-color: #000;
        --bs-btn-bg: #f8cd07b3;
        --bs-btn-border-color: #f8cd07b3;
        --bs-btn-hover-color: #000;
        --bs-btn-hover-bg: #f8cd07;
        --bs-btn-hover-border-color: #f8cd07;
        --bs-btn-focus-shadow-rgb: 130, 138, 145;
        --bs-btn-active-color: #000;
        --bs-btn-active-bg: #f8cd07;
        --bs-btn-active-border-color: #f8cd07;
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #fff;
        --bs-btn-disabled-bg: #6c757d;
        --bs-btn-disabled-border-color: #6c757d;
    }

</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    $(function (){
        $("#updateClick").on("click" , function (){
            var userId = $(".myPageUserId").val();
            self.location ="/myPage/updateClick?userId="+userId;
        });
    });
    $(function (){
        $("#userOut").on("click" , function (){
            var userId = $("#userId").val();
            var result =confirm('정말로 탈퇴하시겠습니까?');
            if(result) {
                self.location = "/myPage/userOut?userId=" + userId;
                alert('회원 탈퇴 되었습니다');
            }
        });
        // $(".bbb").on("click",function (){
        //     var userPhoto = $(".userPhoto").val();
        //     window.open("/resources/"+userPhoto+"", "userPhoto", "height=300, width=300");
        // })
    });


</script>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<div class="container">
    <div class="row g-5">
        <div class="col-md-4 d-flex justify-content-end"><h3 class="fw-bold mt-4">내 정보 보기</h3></div>
        <div class="col-md-8 d-flex justify-content-center flex-column align-items-start">
            <form action="">
                <div class="col-lg-8">
                    <div class="card mb-4 border-0">
                        <div class="card-body" style="width: 400px; ">
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">회원아이디</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control"  id="userId" name="userId" value="${map.user.userId}" disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            <c:if test="${map.user.loginType=='1'}">
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">비밀번호</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="password" name="password" value="${map.user.password}"disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            </c:if>
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">이름</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="userName" name="userName" value="${map.user.userName}" disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
<%--                            <div class="row mt-2 mb-2">--%>
<%--                                <div class="col-sm-4">--%>
<%--                                    <p class="mb-0 fw-bold">주민등록번호</p>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-8">--%>
<%--                                    <p class="text-muted mb-0">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <input type="password" class="form-control" id="rrd" name="rrd" value="${map.user.rrd}" disabled="disabled">--%>
<%--                                    </div>--%>
<%--                                    </p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <div class="row mt-2 mb-2">
                            <div class="col-sm-4">
                                <p class="mb-0 fw-bold">성별</p>
                            </div>
                            <div class="col-sm-8">
                                <p class="text-muted mb-0">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="gender" name="gender" value="${map.user.gender}" disabled="disabled">
                                </div>
                                </p>
                            </div>
                        </div>
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">이메일</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="email" class="form-control"  id="email" name="email" value="${map.user.email}" disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            <c:if test="${map.user.loginType=='1'}">
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">휴대폰번호</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control"  id="phone" name="phone" value="${map.user.phone}"  disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            </c:if>
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">동네코드</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="villCode" name="villCode" value="${map.user.villCode}" disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">관심목록</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-control" disabled="disabled">
                        <c:set var="i" value="0" />
                <c:forEach var="list" items="${map.interList}">
                                               ${list}
                </c:forEach>

                                    </div>
                                    </p>
                                </div>
                            </div>

                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">벌점</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="ppt" name="ppt" value="${map.user.ppt}" disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>

                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">신뢰온도</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="reviewPt" name="reviewPt" value="${map.user.reviewPt}"  disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">패널티 시작 날짜</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="psd" name="psd" value="${map.user.psd}" disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>

                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">패널티 종료 날짜</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="ped" name="ped" value="${map.user.ped}"  disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            <c:if test="${map.user.loginType=='1'}">
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">회원 사진</p>
                                </div>
                                <div class="col-sm-8">
                                        <span class="aaa">
                                            <img id="userImage1"  src="/resources/${map.user.userImage}" class="w-75">
                                            <input type="hidden" class="userPhoto" value="${map.user.userImage}">
                                        </span>
                                </div>
                            </div>
                            </c:if>
                            <c:if test="${map.user.loginType=='2'}">
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">회원 사진</p>
                                </div>
                                <div class="col-sm-8">
                                        <span class="aaa">
                                            <img id="userImage2"   src="${map.user.userImage}" class="w-75">
                                            <input type="hidden" class="userPhoto" value="${map.user.userImage}">
                                        </span>
                                </div>
                            </div>
                            </c:if>
                            <c:if test="${map.user.loginType=='3'}">
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">회원 사진</p>
                                </div>
                                <div class="col-sm-8">
                                        <span class="aaa">
                                            <img id="userImage3"  src="${map.user.userImage}" class="w-75">
                                            <input type="hidden" class="userPhoto" value="${map.user.userImage}">
                                        </span>
                                </div>
                            </div>
                            </c:if>

                        </div>
                    </div>
                </div>

                <div class="col-lg-8 d-flex justify-content-around mb-3">
                    <button type="button" class="listUser btn  btn-prm btn-primary   me-3" id="updateClick">내 정보 수정하기</button>
                    <button type="button" class="listUser btn btn-prm  btn-primary " id="userOut">회원탈퇴 하기</button>
                </div>

            </form>
        </div>

    </div>

</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>

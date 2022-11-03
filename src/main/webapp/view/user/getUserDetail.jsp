<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-10
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Title</title>
</head>
<style>
    .btn-primary {
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">


    $(function (){
        $("#updatePsd").on("click" , function (){
            var userId = $("#getUserDerailuserId").val();

            self.location ="/user/updatePsd?userId="+userId;
        });
    });
    $(function (){
        $("#kickoutUser").on("click" , function (){
            var userId = $("#getUserDerailuserId").val();
            Swal.fire({
                title: '정말로 강퇴하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '확인',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        '강퇴되었습니다.',
                        'success'
                    )
                    setTimeout(function() { self.location = "/user/kickoutUser?userId="+userId }, 2000);
                }
            })
        });
    });
    $(function (){
        $("#ok").on("click" , function (){
            self.location="/user/listUsers";
        });
    });
</script>

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>


<div class="container">
    <div class="row g-5">
        <div class="col-md-4 d-flex justify-content-end"><h3 class="fw-bold mt-4">회원 상세 조회</h3></div>
        <div class="col-md-8 d-flex justify-content-center flex-column align-items-start">

                <div class="col-lg-8">
                    <div class="card mb-4 border-0">
                        <div class="card-body" style="width: 500px;">
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">회원아이디</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control"   value="${map.userDetail.userId}" disabled="disabled">
                                    <input type="hidden" class="form-control"  id="getUserDerailuserId" name="userId" value="${map.userDetail.userId}" >
                                    </div>
                                    </p>
                                </div>
                            </div>
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">이름</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="userName" name="userName" value="${map.userDetail.userName}" disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">성별</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="gender" name="gender" value="${map.userDetail.gender}" disabled="disabled">
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
                                        <input type="email" class="form-control"  id="email" name="email" value="${map.userDetail.email}" disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">휴대폰번호</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control"  id="phone" name="phone" value="${map.userDetail.phone}"  disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">동네코드</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="villCode" name="villCode" value="${map.userDetail.villCode}" disabled="disabled">
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
<c:forEach var="list" items="${map.listInter}">
       ${list}
    </c:forEach><br/>

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
                                        <input type="text" class="form-control" id="ppt" name="ppt"  value="${map.userDetail.ppt}" disabled="disabled">
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
                                        <input type="text" class="form-control" id="reviewPt" name="reviewPt" value="${map.userDetail.reviewPt}"  disabled="disabled">
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
                                        <input type="text" class="form-control" id="psd" name="psd" value="${map.userDetail.psd}" disabled="disabled">

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
                                        <input type="text" class="form-control" id="ped" name="ped" value="${map.userDetail.ped}"  disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">회원 상태</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="userStatus" name="userStatus" value="${map.userDetail.userStatus}"  disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">회원가입 상태</p>
                                </div>
                                <div class="col-sm-8">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="loginType" name="loginType" value="${map.userDetail.loginType}"  disabled="disabled">
                                    </div>
                                    </p>
                                </div>
                            </div>


<c:if test="${map.userDetail.loginType=='1'}">
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">회원 사진</p>
                                </div>
                                <div class="col-sm-8">
                                        <span class="aaa">
    <img id="userImage1"  class="w-50" src="/resources/${map.userDetail.userImage}">
    <input type="hidden" class="userPhoto" value="${map.userDetail.userImage}">
     </span>
                                </div>
                            </div>
</c:if>
<c:if test="${map.userDetail.loginType=='2'}">
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">회원 사진</p>
                                </div>
                                <div class="col-sm-8">
                                        <span class="aaa">
    <img id="userImage2"  class="w-50" src="${map.userDetail.userImage}">
    <input type="hidden" class="userPhoto" value="${map.userDetail.userImage}">
</span>
                                </div>
                            </div>
</c:if>
<c:if test="${map.userDetail.loginType=='3'}">
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">회원 사진</p>
                                </div>
                                <div class="col-sm-8">
                                        <span class="aaa">
    <img id="userImage3" class="w-50" src="${map.userDetail.userImage}">
    <input type="hidden" class="userPhoto" value="${map.userDetail.userImage}">
 </span>
                                </div>
                            </div>
</c:if>
                        </div>
                    </div>
                </div>
<br>
                <div class="col-lg-8 d-flex justify-content-around mb-3" style="width: 500px;">
<button type="button" class="listUser btn  btn-primary   me-3" id="updatePsd" >수정하기</button>
<button type="button"  class="listUser btn  btn-primary " id="kickoutUser">강퇴하기</button>
<button type="button"  class="listUser btn  btn-primary" style="width: 90px;" id="ok">확인</button>
                </div>

        </div>

    </div>

</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>

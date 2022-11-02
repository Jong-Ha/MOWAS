<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


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
    body{margin-top:20px;
        background-color:#f2f6fc;
        color:#69707a;
    }
    .img-account-profile {
        height: 10rem;
    }
    .rounded-circle {
        border-radius: 50% !important;
    }
    .card {
        box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
    }
    .card .card-header {
        font-weight: 500;
    }
    .card-header:first-child {
        border-radius: 0.35rem 0.35rem 0 0;
    }
    .card-header {
        padding: 1rem 1.35rem;
        margin-bottom: 0;
        background-color: rgba(33, 40, 50, 0.03);
        border-bottom: 1px solid rgba(33, 40, 50, 0.125);
    }
    .form-control, .dataTable-input {
        display: block;
        width: 100%;
        padding: 0.875rem 1.125rem;
        font-size: 0.875rem;
        font-weight: 400;
        line-height: 1;
        color: #69707a;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #c5ccd6;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        border-radius: 0.35rem;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }

    .nav-borders .nav-link.active {
        color: #0061f2;
        border-bottom-color: #0061f2;
    }
    .nav-borders .nav-link {
        color: #69707a;
        border-bottom-width: 0.125rem;
        border-bottom-style: solid;
        border-bottom-color: transparent;
        padding-top: 0.5rem;
        padding-bottom: 0.5rem;
        padding-left: 0;
        padding-right: 0;
        margin-left: 1rem;
        margin-right: 1rem;
    }
    Similar snippets
</style>



<script type="text/javascript">
    $(function (){
        $("form").on("submit",function (){
            var userId = $(".myPageUserId").val();
            var loginType = $("#loginType").val();
            $("form").attr("method","POST").attr("action","/myPage/updateMyInfor").submit;
        });
        //인증,비번,관심목록 수정해야함
    });
    $(function () {
        $(".emailKey").on("click", function () {

            $.ajax({
                url: "/user/json/mailSender",
                method: "POST",
                data: {
                    email: $("#email").val()
                },
                dataType: "json",
                success: function ({JSONData, status}) {
                    console.log(status);
                    $(".emailYC").css("display", '');
                }
            });
        });
        $(".smsKey").on("click",function (){
            $.ajax({
                url : "/user/json/smsSend",
                method: "POST",
                data : {
                    phone : $("#phone").val()
                },
                dataType: "json",
                success : function (){
                    $(".smsYC").css("display",'');
                }
            });
        });

        $(".CheckEmailKey2").on("click",function (){
            var CheckEmailKey = $(".CheckEmailKey").val();
            alert(CheckEmailKey);
            var emailNo = ${no.emailNo}
                alert("랜덤 이메일 인증번호 :"+emailNo);
            if(CheckEmailKey!=1234){
                $('.emailInfor').css('display','');
            }else{
                $(".emailInforYes").css('display','');
            }
        });
        $(".CheckSmsKey").on("click",function (){
            var CheckSms = $("#CheckSms").val();
            alert(CheckSms);
            if(CheckSms!=1234){
                $('.smsNo').css('display','');
            }else{
                $(".smsYes").css('display','');
            }
        });
        $("#password").on("keyup",function () {
            $.ajax({
                url: "/user/json/password",
                method: "POST",
                data: {
                    password : $("#password").val()
                },
                dataType: "json",
                success: function (result) {
                    if (result == true) {
                        $("#passwordChk").css("display", 'none');
                    } else {
                        $("#passwordChk").css("display", "");
                    }
                },
                error: function () {
                    alert('비밀번호유효성검사실패');
                }
            });
        })

    })

    <!--관심목록 스크립트 시작-->
    $(function (){
        var userId = $(".myPageUserId").val();
        $("#list01").on("change",function () {
            if($("#list01").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list02").on("change",function () {
            if($("#list02").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })
        $("#list03").on("change",function () {
            if($("#list03").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list04").on("change",function () {
            if($("#list04").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list05").on("change",function () {
            if($("#list05").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list06").on("change",function () {
            if($("#list06").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list07").on("change",function () {
            if($("#list07").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list08").on("change",function () {
            if($("#list08").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list09").on("change",function () {
            if($("#list09").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list10").on("change",function () {
            if($("#list10").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list11").on("change",function () {
            if($("#list11").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list12").on("change",function () {
            if($("#list12").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list13").on("change",function () {
            if($("#list13").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : userId,
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })
    })

    //////////////////////////////////////////////////////////////////////////
    // $(function (){
    //     $(".okay").on("click",function (){
    //         //오케이버튼 클릭시 부모창 리로드 해야함...
    //         // location.href="/view/user/main.jsp";
    //     })
    // })
 </script>
</head>

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>
<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>

<div class="container-xl px-4 mt-4">
   <hr class="mt-0 mb-4">
    <div class="row">
        <div class="col-xl-4">
            <!-- Profile picture card-->
            <div class="card mb-4 mb-xl-0">
                <div class="card-header">내 정보 수정하기</div>
                <div class="card-body text-center">
                    <!-- Profile picture image-->
                    <img class="img-account-profile rounded-circle mb-2" src="/resources/${user.userImage}" alt="">
                    <!-- Profile picture help block-->
                    <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                    <!-- Profile picture upload button-->
                    <button class="btn btn-primary" type="button">Upload new image</button>
                </div>
            </div>
        </div>
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">내 정보 수정하기</div>
                <div class="card-body">
                    <form>
                        <!-- Form Group (username)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputUsername">Username (how your name will appear to other users on the site)</label>
                            <input class="form-control" id="inputUsername" type="text" placeholder="Enter your username" value="username">
                        </div>
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (first name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="password">비밀번호</label>
                                <input class="form-control" id="password" name="password" type="text" placeholder="영문,숫자 혼합, 8~16글자로 입력해주세요" value="${map.user.password}">
                            </div>
                            <!-- Form Group (last name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="email">이메일</label>
                                <input class="form-control" id="email" name="email" type="email" placeholder="이메일을 입력하세요" value="${map.user.email}">
                                <button type="button" class="btn btn-primary btn-sm emailKey">인증번호 요청</button><br/>
                            </div>
                        </div>
                        <!-- Form Row        -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">Organization name</label>
                                <input class="form-control" id="inputOrgName" type="text" placeholder="Enter your organization name" value="Start Bootstrap">
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputLocation">Location</label>
                                <input class="form-control" id="inputLocation" type="text" placeholder="Enter your location" value="San Francisco, CA">
                            </div>
                        </div>
                        <!-- Form Group (email address)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputEmailAddress">Email address</label>
                            <input class="form-control" id="inputEmailAddress" type="email" placeholder="Enter your email address" value="name@example.com">
                        </div>
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (phone number)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputPhone">Phone number</label>
                                <input class="form-control" id="inputPhone" type="tel" placeholder="Enter your phone number" value="555-123-4567">
                            </div>
                            <!-- Form Group (birthday)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputBirthday">Birthday</label>
                                <input class="form-control" id="inputBirthday" type="text" name="birthday" placeholder="Enter your birthday" value="06/10/1988">
                            </div>
                        </div>

                        <input type="hidden" id="loginType" name="loginType" value="${map.user.loginType}">
                        <!-- Save changes button-->
                        <button class="btn btn-primary" type="submit" id="updateMyInfor">수정</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--
<div class="container">
    <div class="row g-5">
        <div class="col-md-4 d-flex justify-content-end"><h3 class="fw-bold mt-4">내 정보 수정하기</h3></div>
        <div class="col-md-8 d-flex justify-content-center flex-column align-items-start">
            <form enctype="multipart/form-data">
                <div class="col-lg-8">
                    <div class="card mb-4 border-0">
                        <div class="card-body">
                            <c:if test="${map.user.loginType=='1'}">
                            <div class="row mt-2 mb-2">
                                <div class="col-sm-4">
                                    <p class="mb-0 fw-bold">비밀번호</p>
                                </div>
                                <div class="col-sm-10">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="password" name="password" value="${map.user.password}">
                                    </div>
                                    </p>
                                </div>
                            </div>
                            </c:if>
    <span id="passwordChk" style="display: none;">
                <strong class="text-danger" style="color : red;">영문,숫자 혼합, 8~16글자로 입력해주세요</strong><br>
        </span>


<c:if test="${map.user.loginType=='1'}">
                                <div class="row mt-2 mb-2">
                                    <div class="col-sm-4">
                                        <p class="mb-0 fw-bold">이메일</p>
                                    </div>
                                    <div class="col-sm-10">
                                        <p class="text-muted mb-0">
                                        <div class="form-group">
                                            <input type="email" class="form-control"  id="email" name="email" value="${map.user.email}" >
                                        <button type="button" class="btn btn-primary btn-sm emailKey">인증번호 요청</button><br/>
                                        </div>
                                        </p>
                                    </div>
                                </div>


</c:if>

<c:if test="${map.user.loginType=='1'}">
                                <div class="col-sm-10">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
    <input type="text" class="form-control CheckEmailKey" placeholder="인증번호 입력" ><br/>
    <button type="button" class="btn btn-secondary btn-sm CheckEmailKey2">인증 확인</button><br/>
                                </div>
                                    </p>
                                </div>
    <span class="emailInfor" style="display: none;">
                <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
    <span class="emailYC" style="display: none">인증번호가 발송되었습니다</span>
    <span class="emailInforYes" style="display: none;">
                인증되었습니다
              </span>
</c:if>

<c:if test="${map.user.loginType=='1'}">
                                <div class="row mt-2 mb-2">
                                    <div class="col-sm-4">
                                        <p class="mb-0 fw-bold">휴대폰번호</p>
                                    </div>
                                    <div class="col-sm-10">
                                        <p class="text-muted mb-0">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="phone" name="phone" value="${map.user.phone}" >
                                        <button type="button" class="btn btn-primary btn-sm smsKey">인증번호 요청</button><br/>
                                        </div>
                                        </p>
                                    </div>
                                </div>

</c:if>
<c:if test="${map.user.loginType=='1'}">
                                <div class="col-sm-10">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
    <input type="text" class="form-control" id="CheckSms" placeholder="인증번호 입력" ><br/>
    <button type="button" class="btn btn-primary btn-sm CheckSmsKey">인증 확인</button><br/>
                                </div>
                                    </p>
                                </div>
    <span class="smsNo" style="display: none;">
              <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
    <span class="smsYC" style="display: none">인증번호가 발송되었습니다</span>
    <span class="smsYes" style="display: none;">
                인증되었습니다
              </span>
</c:if>
                                <div class="col-sm-10">
                                    <p class="text-muted mb-0">
                                    <div class="form-group">
동네코드 <input type="text" class="form-control" id="villCode" name="villCode" value="${map.user.villCode}"><br/>
<button type="button" class="btn btn-secondary btn-sm CheckSmsKey">동네인증 요청</button><br/>
                                </div>
                                    </p>
                                </div>

관심목록<br>
<button type="button" class="btn btn-secondary btn-sm addinterList"  data-bs-toggle="modal"
        data-bs-target="#searchInterListDialog">관심목록 추가/삭제</button><br/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.interList}">
    ${list}<br/>
</c:forEach> <br/>

    <div class="col-12">
        <label for="file" class="form-label">파일 업로드</label>
        <input type="file" id="file" name="file" value="${map.user.userImage}">
    </div>
<br>


<input type="hidden" id="loginType" name="loginType" value="${map.user.loginType}">

<button type="submit" class="listUser btn btn-primary" id="updateMyInfor">수정하기</button>
                        </div>
                    </div>
                </div>
</form>
        </div>
    </div>
</div>
--%>

<!--관심목록 모달창 시작-->
<div class="wap">
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
                <div>
                    <label>
                        <input type="checkbox" class="totalInterList"> 전체선택
                    </label>
                </div>
                <div class="interList">
                    <label>
                        <input type="checkbox" id="list01" name="interList" value="01"> 독서
                    </label>
                    <label>
                        <input type="checkbox" id="list02" name="interList" value="02"> 자동차
                    </label>
                    <label>
                        <input type="checkbox"  id="list03" name="interList" value="03"> 반려동물
                    </label>
                    <label>
                        <input type="checkbox" id="list04" name="interList" value="04"> 공예
                    </label>
                    <label>
                        <input type="checkbox" id="list05" name="interList" value="05"> 스포츠
                    </label>
                    <label>
                        <input type="checkbox" id="list06" name="interList" value="06"> 댄스
                    </label>
                </div>
                <div class="interList">
                    <label>
                        <input type="checkbox"  id="list07" name="interList" value="07"> 여행
                    </label>
                    <label>
                        <input type="checkbox" id="list08" name="interList" value="08"> 사진
                    </label>
                    <label>
                        <input type="checkbox"  id="list09" name="interList" value="09"> 육아
                    </label>
                    <label>
                        <input type="checkbox" id="list10" name="interList" value="10"> 공연
                    </label>
                    <label>
                        <input type="checkbox" id="list11" name="interList" value="11"> 음악
                    </label>
                    <label>
                        <input type="checkbox" id="list12" name="interList" value="12"> 게임
                    </label>
                    <label>
                        <input type="checkbox" id="list13" name="interList" value="13"> 그외
                    </label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="okay">확인</button>
            </div>
        </div>
    </div>
</div>
</div>




<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>

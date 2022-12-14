<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>MOWAS</title>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>


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

        body {
            margin-top: 20px;
            background-color: #f2f6fc;
        }

        .img-account-profile {
            height: 12rem;
            object-fit: cover;
            aspect-ratio: 1;
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
        let num
        let smsNum

        function readURL(inputSelector, outputSelector) {
            const input = $(inputSelector)[0]
            const output = $(outputSelector)[0]
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    output.src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                output.src = "/resources/images/proplePoto.png";
            }
        }

        $(function () {
            $('form #file').on('change',function(){
                readURL('form #file','.img-account-profile')
            })

            $("form").on("submit", function () {
                var userId = $("#updateUserId").val();
                var loginType = $("#loginType").val();
                console.log('userId는?'+userId)
                $("form").attr("method", "POST").attr("action", "/myPage/updateMyInfor").submit;
            });
            //인증,비번,관심목록 수정해야함
        });
        $(function () {
            function lodingNum() {
                $.ajax({
                    url: "/user/json/mailSender",
                    method: "POST",
                    data: {
                        email: $(".userEmail").val()
                    },
                    dataType: "json",
                    success: function (emailNo) {

                        console.log("emailNo"+emailNo)
                        num = emailNo;
                        $(".emailYC").css("display", '');
                    }
                });
            }

            $(".emailKey").on("click", function () {
                lodingNum();
            });

            function fncLodingSmsNum(){

                $.ajax({
                    url: "/user/json/smsSend",
                    method: "POST",
                    data: {
                        phone: $(".userPhone").val()
                    },
                    dataType: "json",
                    success: function (smsNo) {

                        console.log("smsNo"+smsNo)
                        smsNum = smsNo;
                        $("#smsYC").css("display", '');
                    }
                });
            }

            $(".smsKey").on("click",function (){
                fncLodingSmsNum();
            });

            $(".CheckEmailKey2").on("click",function (){
                console.log('asdsad')
                console.log(num)

                var CheckEmailKey = $(".CheckEmailKey").val();
                console.log(CheckEmailKey)
                //alert(CheckEmailKey);
                //var emailNo = num;
                // alert("랜덤 이메일 인증번호 :"+emailNo);
                if(parseInt(CheckEmailKey)!=num){
                    $(".emailYC").css("display", 'none');
                    $(".emailInforYes").css('display','none');
                    $('.emailInfor').css('display','');
                }else{
                    $(".emailYC").css("display", 'none');
                    $('.emailInfor').css('display','none');
                    $(".emailInforYes").css('display','');
                    $(".updatePassword").css('display','');
                    $(".chk").css('display','none');
                }
            });
            $(".CheckSmsKey").on("click",function (){
                var CheckSms = $("#CheckSms").val();
                console.log(smsNum);
                console.log(CheckSms);
                if(CheckSms!=smsNum){
                    $(".smsYC").css("display",'none');
                    $(".smsYes").css('display','none');
                    $('.smsNo').css('display','');
                }else{
                    $(".smsYC").css("display",'none');
                    $('.smsNo').css('display','none');
                    $(".smsYes").css('display','');
                    $(".updatePassword").css('display','');
                    $(".chk").css('display','none');
                }
            });

            $("#updatePassword").on("keyup",function () {
                $.ajax({
                    url: "/user/json/password",
                    method: "POST",
                    data: {
                        password : $("#updatePassword").val()
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
                        // alert('비밀번호유효성검사실패');
                    }
                });
            })

        })

        // 관심목록 스크립트 시작
        $(function () {
            var userId = $("#updateUserId").val();

            $("#list01").on("change", function () {
                if ($("#list01").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
                        }
                    });
                }
            })

            $("#list02").on("change", function () {
                if ($("#list02").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
                        }
                    });
                }
            })
            $("#list03").on("change", function () {
                if ($("#list03").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
                        }
                    });
                }
            })

            $("#list04").on("change", function () {
                if ($("#list04").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
                        }
                    });
                }
            })

            $("#list05").on("change", function () {
                if ($("#list05").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
                        }
                    });
                }
            })

            $("#list06").on("change", function () {
                if ($("#list06").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
                        }
                    });
                }
            })

            $("#list07").on("change", function () {
                if ($("#list07").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
                        }
                    });
                }
            })

            $("#list08").on("change", function () {
                if ($("#list08").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
                        }
                    });
                }
            })

            $("#list09").on("change", function () {
                if ($("#list09").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
                        }
                    });
                }
            })

            $("#list10").on("change", function () {
                if ($("#list10").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
                        }
                    });
                }
            })

            $("#list11").on("change", function () {
                if ($("#list11").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
                        }
                    });
                }
            })

            $("#list12").on("change", function () {
                if ($("#list12").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
                        }
                    });
                }
            })

            $("#list13").on("change", function () {
                if ($("#list13").is(":checked")) {
                    var check = $(this).val();
                    console.log("check True의 값 :" + check);
                    $.ajax({
                        url: "/user/json/addinterList",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비저장성공');
                        },
                        error: function () {
                            // alert('디비저장실패');
                        }
                    });
                } else {
                    var check = $(this).val();
                    console.log("check False의 값 :" + check);
                    $.ajax({
                        url: "/user/json/deleteInter",
                        method: "POST",
                        data: JSON.stringify({
                            userId: userId,
                            interList: check
                        }),
                        contentType: "application/json",
                        dataType: "json",
                        success: function () {
                            // alert('디비삭제성공');
                        },
                        error: function () {
                            // alert('디비삭제실패');
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
                    <c:if test="${user.loginType eq 1}">
                    <img class="img-account-profile rounded-circle mb-2" src="/resources/${user.userImage}" alt="">
                    </c:if>
                    <c:if test="${user.loginType eq 2}">
                        <img class="img-account-profile rounded-circle mb-2" src="${user.userImage}" alt="">
                    </c:if>
                    <c:if test="${user.loginType eq 3}">
                        <img class="img-account-profile rounded-circle mb-2" src="${user.userImage}" alt="">
                    </c:if>
                    <!-- Profile picture help block-->
                    <div class="font-italic text-muted mb-4">ID : ${user.userId}</div>
                    <!-- Profile picture upload button-->
                </div>
            </div>
        </div>
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">내 정보 수정하기</div>
                <div class="card-body">
                    <form enctype="multipart/form-data">
                        <!-- Form Group (username)-->

                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <div class="col-md-6">
                                <label class="small mb-1 fw-bold" for="email">이메일</label>
                                <input class="form-control userEmail" id="email" name="email" type="email"
                                       placeholder="이메일을 입력하세요" value="${map.user.email}">
                                <button type="button" class="btn btn-primary btn-sm emailKey">인증번호 요청</button>
                                <span class=" emailYC"  style="display: none;">
                <strong class="text-danger" >인증번호가 발송되었습니다</strong>
                    </span>
                            </div>

                            <div class="col-md-6">
                                <label class="small mb-1 fw-bold ">인증번호 입력</label>
                                <input type="text" class="form-control CheckEmailKey" placeholder="인증번호 입력해주세요">
                                <button type="button" class="btn btn-primary btn-sm CheckEmailKey2">인증 확인</button>
                            </div>
                        </div>
                        <div style="display: flex">
          <span class="emailInfor" style="display: none; margin-left: 130px;">
                <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>

                            <span class="emailInforYes" style="display: none; margin-left: 130px;">
              <strong class="text-danger" > 인증되었습니다</strong>
              </span>
                        </div>

                        <div class="row gx-3 mb-3">
                            <div class="col-md-6">
                                <label class="small mb-1 fw-bold" for="phone">휴대폰번호</label>
                                <input type="text" class="form-control userPhone" id="phone" name="phone"
                                       placeholder="휴대폰 번호를 입력하세요" value="${map.user.phone}">
                                <button type="button" class="btn btn-primary btn-sm smsKey">인증번호 요청</button>
                                <span class="smsYC" id="smsYC" style="display: none; ">
                     <strong class="text-danger" > 인증번호가 발송되었습니다</strong>
                      </span>
                            </div>

                            <div class="col-md-6">
                                <label class="small mb-1 fw-bold CheckSmsKey">인증번호 입력</label>
                                <input type="text" class="form-control" id="CheckSms" placeholder="인증번호 입력">
                                <button type="button" class="btn btn-primary btn-sm CheckSmsKey">인증 확인</button>
                            </div>
                        </div>
                        <div style="display: flex">
                                <span class="smsNo" style="display: none; margin-left: 132px;">
              <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>

                                <span class="smsYes" style="display: none; margin-left: 128px;">
               <strong class="text-danger" > 인증되었습니다</strong>
              </span>
                        </div>
                        <div class="small mb-1 fw-bold chk" >이메일 또는 휴대폰번호 인증을 하면 비밀번호 입력란이 나옵니다</div>
                        <div class="mb-3 updatePassword" style="display: none;">
                            <label class="small mb-1 fw-bold" for="updatePassword">비밀번호 (영문,숫자 혼합, 8~16글자로 입력해주세요)</label>
                            <input class="form-control" id="updatePassword" type="text" maxLength="16" name="password" placeholder="password"
                                   value="${map.user.password}">
                        </div>

                        <div class="mb-3">
                            <label class="small mb-1 fw-bold">주소</label>
                            <input type="text" class="form-control" id="villCode" placeholder="동이름을 입력해주세요"
                                   name="villCode" value="${map.user.villCode}">

                        </div>

                        <!-- Form Row        -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1 fw-bold">관심 목록</label>
                                <c:set var="i" value="0"/>
                                <c:forEach var="list" items="${map.interList}">
                                    <input type="text" class="form-control" id="addinterList" placeholder="관심 목록"
                                            value="${list}">
                                </c:forEach>

                                <button type="button" class="btn btn-primary btn-sm interList" data-bs-toggle="modal"
                                        data-bs-target="#searchInterListDialog">관심목록 추가/삭제
                                </button>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                <label class="small mb-1 fw-bold" for="file">새로운 이미지 업로드</label>
                                <input class="form-control" type="file" id="file" name="file"
                                       value="${map.user.userImage}" placeholder="이미지 파일을 올려주세요">
                            </div>
                        </div>
                        <!-- Form Group (email address)-->
                        <div class="col-mb-3" style=" text-align: center;">
                            <!-- Form Row-->
                            <input type="hidden" id="updateUserId" name="userId" value="${map.user.userId}">
                            <input type="hidden" id="loginType" name="loginType" value="${map.user.loginType}">
                            <!-- Save changes button-->
                            <button class="btn btn-primary" type="submit" id="updateMyInfor">수정</button>
                            <button class="btn btn-secondary">취소</button>
                        </div>
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
<div class="container">
    <!--관심목록 모달창 시작-->
    <div class="modal fade" id="searchInterListDialog" tabindex="-1" aria-labelledby="searchInterListDialogLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="searchInterListDialogLabel" style="margin-left: 100px;">관심목록을
                        선택해주세요</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="interList">
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'독서')==-1}">
                                <input type="checkbox" id="list01" name="interList" value="01"> 독서
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'독서')!=-1}">
                                <input type="checkbox" id="list01" name="interList" checked value="01"> 독서
                            </c:if>
                        </label>
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'자동차')==-1}">
                                <input type="checkbox" id="list02" name="interList" value="02"> 자동차
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'자동차')!=-1}">
                                <input type="checkbox" id="list02" name="interList" checked value="02"> 자동차
                            </c:if>
                        </label>
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'반려동물')==-1}">
                                <input type="checkbox" id="list03" name="interList" value="03"> 반려동물
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'반려동물')!=-1}">
                                <input type="checkbox" id="list03" name="interList" checked value="03"> 반려동물
                            </c:if>
                        </label>
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'공예')==-1}">
                                <input type="checkbox" id="list04" name="interList" value="04"> 공예
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'공예')!=-1}">
                                <input type="checkbox" id="list04" name="interList" checked value="04"> 공예
                            </c:if>
                        </label>
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'스포츠')==-1}">
                                <input type="checkbox" id="list05" name="interList" value="05"> 스포츠
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'스포츠')!=-1}">
                                <input type="checkbox" id="list05" name="interList" checked value="05"> 스포츠
                            </c:if>
                        </label>
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'댄스')==-1}">
                                <input type="checkbox" id="list06" name="interList" value="06"> 댄스
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'댄스')!=-1}">
                                <input type="checkbox" id="list06" name="interList" checked value="06"> 댄스
                            </c:if>
                        </label>
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'여행')==-1}">
                                <input type="checkbox" id="list07" name="interList" value="07"> 여행
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'여행')!=-1}">
                                <input type="checkbox" id="list07" name="interList" checked value="07"> 여행
                            </c:if>
                        </label>
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'사진')==-1}">
                                <input type="checkbox" id="list08" name="interList" value="08"> 사진
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'사진')!=-1}">
                                <input type="checkbox" id="list08" name="interList" checked value="08"> 사진
                            </c:if>
                        </label>
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'육아')==-1}">
                                <input type="checkbox" id="list09" name="interList" value="09"> 육아
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'육아')!=-1}">
                                <input type="checkbox" id="list09" name="interList" checked value="09"> 육아
                            </c:if>
                        </label>
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'공연')==-1}">
                                <input type="checkbox" id="list10" name="interList" value="10"> 공연
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'공연')!=-1}">
                                <input type="checkbox" id="list10" name="interList" checked value="10"> 공연
                            </c:if>
                        </label>
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'음악')==-1}">
                                <input type="checkbox" id="list11" name="interList" value="11"> 음악
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'음악')!=-1}">
                                <input type="checkbox" id="list11" name="interList" checked value="11"> 음악
                            </c:if>
                        </label>
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'게임')==-1}">
                                <input type="checkbox" id="list12" name="interList" value="12"> 게임
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'게임')!=-1}">
                                <input type="checkbox" id="list12" name="interList" checked value="12"> 게임
                            </c:if>
                        </label>
                        <label>
                            <c:if test="${fn:indexOf(map.interList,'그외')==-1}">
                                <input type="checkbox" id="list13" name="interList" value="13"> 그외
                            </c:if>
                            <c:if test="${fn:indexOf(map.interList,'그외')!=-1}">
                                <input type="checkbox" id="list13" name="interList" checked value="13"> 그외
                            </c:if>
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
<div style="margin-bottom: 100px;">
</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>

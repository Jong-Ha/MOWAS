<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <!-- 상단 툴바 css -->
    <style>
        .color {
            color: #ffff;
        }

        .topbar {
            margin-bottom: 20px;
        }

        .navbar {
            justify-content: center;
        }

        .btnlf {
            margin-left: 20px;
        }

        .textint {
            font-size: 0.2em;
            margin-top: -20px;
        }

        .login {
            float: left;
            margin-right: 20px;
            width: 120px;
        }

        .alrim {
            font-size: 0.1rem;
            width: 45px;
        }

        .loginbox {
            color: #FFFFFF;
            width: 100px;
        }

        .navCenter {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 1200px;
            margin: auto;
            color: #fff;
        }

        .logitem {
            margin-top: -20px;
            display: flex;
        }

        .underline {
            line-height: 1.2;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol";
            font-size: 1.5em;
            font-weight: 700;
            background-image: linear-gradient(transparent calc(100% - 3px), #000 3px);
            background-repeat: no-repeat;
            background-size: 0% 100%;
            transition: background-size 0.2s;
            color: #000;
            cursor: pointer;
            margin-right: 25px;
        }

        @media (min-width: 1000px) {
            .underline {
                font-size: 1.5em;
            }
        }

        .underline.yellow {
            background-image: linear-gradient(transparent 60%, #F8CD07 40%);
        }

        .underline:hover {
            background-size: 100% 100%;
        }

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

        .ok {
                width: 100px;
                margin:auto;

            }

    </style>
</head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
    let num
    let smsNum
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

                    console.log("emailNo의 값?"+emailNo)
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
                    alert('smsNo의값?'+smsNo)
                    console.log("smsNo의 값은????"+smsNo)
                    smsNum = smsNo;
                    alert('smsNum의 값?'+smsNum)
                    $("#smsYC").css("display", '');
                },
                error: function (){
                    console.log('휴대폰번호 인증번호 요청 실패')
                }
            });
        }

        $(".smsKey").on("click",function (){
            fncLodingSmsNum();
        });

        $(".CheckEmailKey2").on("click",function (){
            console.log('asdsad')
            console.log('인증번호 확인 클릭시 num의 값???'+num)

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
            }
        });
        $(".CheckSmsKey").on("click",function (){
            var CheckSms = $("#CheckSms").val();
            console.log('hhhh')
            console.log('인증확인 클릭시 smsNum의 값?'+smsNum);
            console.log('CheckSms의값? '+CheckSms);
            if(CheckSms!=smsNum){
                $(".smsYC").css("display",'none');
                $(".smsYes").css('display','none');
                $('.smsNo').css('display','');
            }else{
                $(".smsYC").css("display",'none');
                $('.smsNo').css('display','none');
                $(".smsYes").css('display','');
            }
        });
    });
    $(function () {
        let check = true

        $('#asd').on('submit',function(){
            if(check){
                return false
            }
        })

        $("#ok").on("click",function (){


            if(!$("input:checked[name='flexRadioDefault']").is(":checked")){
                Swal.fire({
                    icon: 'warning',
                    title: "휴대폰 또는 이메일 인증을 선택해주세요."
                })
                return false;
            }

            if(!$("input:checked[name='loginType']").is(":checked")){
                Swal.fire({
                    icon: 'warning',
                    title: "회원 가입유형을 선택해주세요."
                })
                return false;
            }

            check = false
            $("form").attr("method","POST").attr("action","/user/getMyId").submit();
        });
    });
</script>
<body>
<%-- <%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>
<form id="asd">
    <div class="container">
        <div class="row mx-4 my-5">
            <h3>아이디 찾기</h3>
            <p class="w-100 border-top py-2">아이디를 찾을 방법을 선택해주세요.</p>
        </div>

        <div class="row m-5">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                <label class="form-check-label" for="flexRadioDefault1">
                    회원정보에 등록한 휴대전화로 인증하기<br>
                </label>
            </div>

            <div class="form-check">
            <div class="row mt-2 mb-2">
                <div class="form-group d-flex align-items-center">
                    <p class="fw-bold text-left mx-3" style="width: 10%;">휴대전화 번호</p>
                    <input type="tel" class="form-control w-25 userPhone" name="phone"  placeholder="휴대폰번호('-'포함) 입력">
                    <button class="btn btn-primary mx-3 smsKey">인증번호 요청</button>
                    <span class="smsYC" id="smsYC" style="display: none;  margin-right: 192px;">
                     <strong class="text-danger" > 인증번호가 발송되었습니다</strong>
                      </span>
                </div>
            </div>
            <div class="row mt-2 mb-2">
                <div class="form-group d-flex align-items-center">
                    <p class="fw-bold text-left mx-3" style="width: 10%;"></p>
                    <input type="text" class="form-control w-25" id="CheckSms" placeholder="인증번호 입력">
                    <button class="btn btn-primary mx-3 CheckSmsKey">인증번호 확인</button>
                    <span class="smsYes" style="display: none;  margin-right: 274px;">
               <strong class="text-danger" > 인증되었습니다</strong>
              </span>
                </div>
            </div>
            <span class="smsNo" style="display: none;  margin-left: 129px;;">
              <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
            </div>

            <div class="form-check mt-5">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
                <label class="form-check-label" for="flexRadioDefault2">
                    본인확인 메일로 인증하기
                </label>

                <div class="row mt-2 mb-2">
                    <div class="form-group d-flex align-items-center">
                        <p class="fw-bold text-left mx-3" style="width: 10%;">이메일</p>
                        <input type="email" class="form-control w-25 userEmail"  id="email" name="email" placeholder="이메일 입력">
                        <button class="btn btn-primary mx-3 emailKey" >인증번호 요청</button>
                        <span class="emailYC" style="display: none;  margin-right: 192px;">
                             <strong class="text-danger" >인증번호가 발송되었습니다</strong>
                        </span>
                    </div>
                </div>
                <div class="row mt-2 mb-2">
                    <div class="form-group d-flex align-items-center">
                        <p class="fw-bold text-left mx-3" style="width: 10%;"></p>
                        <input type="text" class="form-control w-25 CheckEmailKey" placeholder="인증번호 입력">
                        <button class="btn btn-primary mx-3 CheckEmailKey2">인증번호 확인</button>
                        <span class="emailInforYes" style="display: none; ">
              <strong class="text-danger" > 인증되었습니다</strong>
              </span>
                    </div>
                </div>
                <div style="display: flex">
          <span class="emailInfor" style="display: none;  margin-left: 130px;">
                <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>

                </div>
            </div>

            <div class="form-check mt-5">
                <input class="form-check-input" type="radio" name="Type" id="flexRadioDefault3" checked>
                <label class="form-check-label" for="flexRadioDefault2">
                    회원 가입유형 선택
                </label>
                <div>
            <label for="basic">
                <input type="radio" id="basic" name="loginType" value="1">일반 회원가입
            </label>
            <label for="kakao">
                <input type="radio" id="kakao" name="loginType" value="2"> 카카오 로그인
            </label>
            <label for="naver">
                <input type="radio" id="naver" name="loginType" value="3"> 네이버 로그인
            </label>
                </div>
            </div>
        </div>
    </div>

<div style="text-align: center";>
<button type="button" class="btn btn-primary ok" style="display: inline-block; width: 200px;" id="ok">확인</button>
</div>
</form>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>

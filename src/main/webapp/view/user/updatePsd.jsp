<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-15
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.10.7/dayjs.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

        $(function() {
            //input을 datepicker로 선언
            $("#psd").datepicker({
                dateFormat: 'yy-mm-dd' //달력 날짜 형태
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
                ,changeYear: true //option값 년 선택 가능
                ,changeMonth: true //option값  월 선택 가능
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
                ,buttonText: "선택" //버튼 호버 텍스트
                ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
                ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
                ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
            });
            //초기값을 오늘 날짜로 설정해줘야 합니다.
            $('#psd').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        });
        $(function() {
            //input을 datepicker로 선언
            $("#ped").datepicker({
                dateFormat: 'yy-mm-dd' //달력 날짜 형태
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
                ,changeYear: true //option값 년 선택 가능
                ,changeMonth: true //option값  월 선택 가능
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
                ,buttonText: "선택" //버튼 호버 텍스트
                ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
                ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
                ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
            });
            //초기값을 오늘 날짜로 설정해줘야 합니다.
            $('#ped').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        });
        $(function (){
            $("#listupdatedUser").on("click", function (){

                alert('userId의 값'+$("#getUserDerailuserId").val());
                alert('psd의 값'+psd);
                alert('ped의 값'+ped);

               //  $("form").attr("method","POST").attr("action", "/user/listupdatedUser").submit();
                $("#updatPsdForm").attr("method","POST").attr("action", "/user/listupdatedUser").submit();

            })
        });

        /*
 $(function (){
         let d = new Date();

         let year = d.getFullYear();
         let month = d.getMonth() + 1; // 월은 0에서 시작하기 때문에 +1
         let day = d.getDate();
       // $('#psd').val(year-month-day);
        // $('#ped').val(`${year}-${month}-${day}`);
        // 버튼 클릭시 현재 날짜에서 1주일, 1개월, 3개월 더하기
        let endDate = d;
        $('#btnWeek').click(function(){
            //$('#psd').val(`${year}-${month}-${day}`);
            alert('endDate'+endDate);
            endDate.setDate(endDate.getDate() + 7);
            alert('endDAte 2'+endDate);
            //$('#ped').val(`${ped.getFullYear()}-${ped.getMonth()+1}-${ped.getDate()}`);

            endDate.setDate(endDate.getDate() - 7); // 버튼 클릭 시 계속 더해지기 때문에 초기화

            alert('a'+a);
        });
})

   $(function (){
        $("#pptDate").on("keydown", function (e){
            if(e.keyCode==13) {
                var def = $("#pptDate").val();
                alert('def' + def);
            }
        })
    $(function () {
       $("#psd7").on("click" , function (){
           var psd = $("#psd").val();
           alert('psd'+psd);
           var ped = psd.setDate(date.getDate()+7);
           alert('ped'+ped);
           $.ajax({
               url : "/user/json/psd7",
               method : "POST",
               data : JSON.stringify({
                   psd : psd,
                   ped : ped,
                   pptDate : pptDate
               }),
               dataType: "JSON",
               headers : {
                   "Accept" : "application/json",
                   "Content-Type" : "application/json"
               },
               success : function (map){
                   alert('7일추가성공');
               },
               error : function (){
                   alert('에이작스 실패');
               }
           })
       });
    });
    $(function() {
        $("#psd30").on("click" , function (){
            var pptDate = $("#pptDate").val();
            var psd = $("#psd").val();
            var ped = $("#ped").val();
            $.ajax({
                url : "/user/json/psd30",
                method : "POST",
                data : {
                    pptDate : pptDate,
                    psd : psd,
                    ped : ped
                },
                dataType: "JSON",
                contentType : "application/json",
                success : function (){
                    alert('30일추가성공');
                },
                error : function (){
                    alert('에이작스 실패');
                }
            })
        });
    });
    /*
    // 시작 일자 달력 이미지 클릭시 달력 표기
    $('#beginDate').datepicker({
        showOn: "button",
        buttonImage: "img/cal.png",
        buttonImageOnly: true,
        buttonText: "Select date"
    });
    $('#beginDate').datepicker('option','dateFormat','yy-mm-dd'); // 기존 dd/mm/yy에서 yy-mm-dd로 format 변경
   // 종료 일자 달력 이미지 클릭시 달력 표기
    $('#endDate').datepicker({
        showOn: "button",
        buttonImage: "img/cal.png",
        buttonImageOnly: true,
        buttonText: "Select date"
    });
    $('#endDate').datepicker('option','dateFormat','yy-mm-dd');
    let d = new Date();
    let year = d.getFullYear();
    let month = d.getMonth() + 1; // 월은 0에서 시작하기 때문에 +1
    let day = d.getDate();
    $('#beginDate').val(`${year}-${month}-${day}`);
    $('#endDate').val(`${year}-${month}-${day}`);
    // 버튼 클릭시 현재 날짜에서 1주일, 1개월, 3개월 더하기
    let endDate = d;
    $('#btnWeek').click(function(){
        $('#beginDate').val(`${year}-${month}-${day}`);
        endDate.setDate(endDate.getDate() + 7);
        $('#endDate').val(`${endDate.getFullYear()}-${endDate.getMonth()+1}-${endDate.getDate()}`);
        endDate.setDate(endDate.getDate() - 7); // 버튼 클릭 시 계속 더해지기 때문에 초기화
    });
    $('#btnMonth').click(function(){
        $('#beginDate').val(`${year}-${month}-${day}`);
        endDate.setMonth(endDate.getMonth() + 1);
        $('#endDate').val(`${endDate.getFullYear()}-${endDate.getMonth()+1}-${endDate.getDate()}`);
        endDate.setMonth(endDate.getMonth() - 1);
    });
    $('#btn3Month').click(function(){
        $('#beginDate').val(`${year}-${month}-${day}`);
        endDate.setMonth(endDate.getMonth() + 3);
        $('#endDate').val(`${endDate.getFullYear()}-${endDate.getMonth()+1}-${endDate.getDate()}`);
        endDate.setMonth(endDate.getMonth() - 3);
    });
*/
</script>

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<form id="updatPsdForm">
    <div class="container">
        <div class="row g-5">
            <div class="col-md-4 d-flex justify-content-end"><h3 class="fw-bold mt-4">회원 상세 조회</h3></div>
            <div class="col-md-8 d-flex justify-content-center flex-column align-items-start">
                <form action="">
                    <div class="col-lg-8">
                        <div class="card mb-4 border-0">
                            <div class="card-body">
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
                                            <input type="text" class="form-control" id="ppt" name="ppt" value="${map.userDetail.ppt}" disabled="disabled">
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
                                            <input type="text" class="form-control" id="psd" name="psd" value="${map.userDetail.psd}" >
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
                                            <input type="text" class="form-control" id="ped" name="ped" value="${map.userDetail.ped}" >
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
                    <div style="margin-left: 235px;">
                        <button type="submit" id="listupdatedUser" class="btn  btn-primary  me-3">확인</button>
                        <button type="button" class="btn  btn-primary  me-3"><a href="javascript:history.go(-1)">취소</a></button>
                    </div>


</form>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>

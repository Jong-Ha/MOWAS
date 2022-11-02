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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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

                alert('userId의 값'+$("#userId").text());
                alert('psd의 값'+psd);
                alert('ped의 값'+ped);

               //  $("form").attr("method","POST").attr("action", "/user/listupdatedUser").submit();
                $("form").attr("method","POST").attr("action", "/user/listupdatedUser").submit();

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
<form>
회원 상세 조회
<div><input  id="userId" name=userId value="${map.userDetail.userId}" readonly>
<br>
    <div> <input  name="userStatus" value="${map.userDetail.userStatus}"  readonly></div>
    <div> <input name="userName" value="${map.userDetail.userName}" readonly></div>
    <div>   <input  name="gender" value="${map.userDetail.gender}" readonly></div>
    <div><input name="email" value="${map.userDetail.email}" readonly></div>
        <div><input  name="phone" value="${map.userDetail.phone}" readonly></div>
            <div><input name="villCode" value="${map.userDetail.villCode}" readonly></div>
                <div><input name="userImage" value="${map.userDetail.userImage}" readonly></div>
                    <div><input name="lcd" value="${map.userDetail.lcd}" readonly></div>
</div>
<br/>

<br/>
패널티 시작 날짜<div class="abc"><input  id="psd" name="psd"></div>

<div >패널티 종료 날짜</div><div class="abc"><input id="ped" name="ped" readonly></div>
    <div>벌점<input  name="ppt" value="${map.userDetail.ppt}" readonly></div>
    <div>신뢰온도<input  name="reviewPt" value="${map.userDetail.reviewPt}" readonly></div>
    <div>로그인 타입<input  name="loginType" value="${map.userDetail.loginType}" readonly></div>
    <div>관심목록
        <input  name="interList" value="<c:set var="i" value="0" />
<c:forEach var="list" items="${map.listInterList}">
    ${list.interList}
</c:forEach>" readonly>
    </div>


<button type="submit" id="listupdatedUser">확인</button>
<button type="button"><a href="javascript:history.go(-1)">취소</a></button>
</form>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>

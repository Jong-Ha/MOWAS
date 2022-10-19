<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-13
  Time: 오전 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
  $(function(){

    $("#btn-kakao-login").click(function(event){
      // a태그 기능 실행멈춤.
      event.preventDefault();
      // 카카오 로그인 실행시 오류메시지를 표시하는 경고창을 화면에 보이지 않게 한다.
      $("alert-kakao-login").addClass("d-none");
      // 사용자 키를 전달, 카카오 로그인 서비스 초기화.
      Kakao.init('본인 접근키 입력');
      // 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기.
      Kakao.Auth.login({
        success:function(auth){
          Kakao.API.request({
            url: '/v2/user/me',
            success: function(response){
              // 사용자 정보를 가져와서 폼에 추가.
              var account = response.kakao_account;

              $('#form-kakao-login input[name=email]').val(account.email);
              $('#form-kakao-login input[name=name]').val(account.profile.nickname);
              $('#form-kakao-login input[name=img]').val(account.profile.img);
              // 사용자 정보가 포함된 폼을 서버로 제출한다.
              document.querySelector('#form-kakao-login').submit();
            },
            fail: function(error){
              // 경고창에 에러메시지 표시
              $('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
            }
          }); // api request
        }, // success 결과.
        fail:function(error){
          // 경고창에 에러메시지 표시
          $('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
        }
      }); // 로그인 인증.
    }) // 클릭이벤트
  })// 카카오로그인 끝.


</script>
<body>
<!-- 로그인 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="d-flex justify-content-center">
        <a href="#" class="text-reset p-2" title="Tooltip">비밀번호 찾기</a>
        <span class="p-2"> | </span>
        <a href="registerUser" class="text-reset p-2" title="Tooltip">회원가입</a>
      </div>
    </div>
    <div class="modal-footer ">
      <p>SNS 로그인</p>
      <div class="border p-3 mb-4 bg-light d-flex justify-content-between">
        <%--
            카카오 로그인 처리중 중 오류가 발생하면 아래 경고창에 표시된다.
            카카오 로그인 오류는 스크립트에서 아래 경고창에 표시합니다.
         --%>
        <div class="alert alert-danger d-none" id="alert-kakao-login">오류 메세지</div>

        <a id="btn-kakao-login" href="kakao/login">
          <img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="200" alt="카카오 로그인 버튼"/>
        </a>
      </div>
      <form id="form-kakao-login" method="post" action="kakao-login">
        <input type="hidden" name="email"/>
        <input type="hidden" name="name"/>
        <input type="hidden" name="img"/>
      </form>
    </div>
  </div>
</div>
</div>
</body>
</html>
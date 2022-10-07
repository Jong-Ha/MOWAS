<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    <style>
    .wap{
    	width: 800px;
    }
    </style>
  <script type="text/javascript">

    $(function (){
      $(".emailKey").on("click",function (){
        alert('이메일인증버튼?');
        $("form").attr("method", "POST").attr("action", "/user/mailSender").submit();
         // self.location="/user/mailSender";
      });
      $(".smsKey").on("click",function (){
        alert('문자인증버튼?');
        $("form").attr("method", "POST").attr("action", "/user/smsSend").submit();
        // self.location="/user/mailSender";
      });
      $(".CheckEmailKey").on("click",function (){
        result=true;
        if(value!=1234){
          result=false;
        }
      });
      $(".CheckSmsKey").on("click",function (){
        result=true;
        if(value!=1234){
          result=false;
        }
      });

      $(".addUser").on("click",function (){
        var id=$("input[name='id']").val();
        var pw=$("input[name='password']").val();
        var pw2=$("input[name='password2]").val();
        var name=$("input[name='username']").val();

        var gender=$("input[name='gender']").val();
        var email=$("input[id='CheckEamil']").val();
        var phone=$("input[id='CheckPhone']").val();




        $("form").attr("method","POST").attr("action","/user/addUser").submit();

      });



       $(".CheckRrd").on("click",function (){
         var rrdCheck=$("input[name='rrd']").val();
         alert(rrdCheck)
           $.post("/user/json/checkDupRrd",
              {

                  rrd : rrdCheck
                },
                function (map){
                  if(map.result) {
                    $(".rrdtext").show();
                    $(".rrdtext").html('회원가입할 수 있습니다');
                  } else{
                    $(".rrdtext").show();
                    $(".rrdtext").html('이미 가입한 회원입니다');
                  }

                });
         alert('이건되낭?')
              });








      $(function (){
        $(".cancle").on("click",function (){
          $("form")[0].reset();
        });
      });

    });

  </script>
 <body class="bg-light">
    
<div class="container" style="text-align: -webkit-center;">
<div class="wap">

  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4"  alt="" width="72" height="57">
      <h2>회원가입</h2>
      <p class="lead">정보를 입력해주세요</p>
    </div>

      <hr>

      <div class="col-md-7 col-lg-8">

        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-sm">
              <label for="id" class="form-label">아이디</label>
              <input type="text" class="form-control" id="Id" name="userId" maxLength="20" required>
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>

            <div class="col-12">
              <label for="password" class="form-label">비밀번호</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" id="password" name="password" minLength="8" maxLength="20" required>
                <div class="invalid-feedback"></div>
              </div>
            </div>
            <div class="col-12">
              <label for="password2" class="form-label">비밀번호 확인</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" id="password2" name="password2" minLength="8" maxLength="20" required>
                <div class="invalid-feedback"></div>
              </div>
            </div>


            <div class="col-12">
              <label for="username" class="form-label">이름</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="username" name="userName"  required>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12 ">
              <label for="rrd" class="form-label">주민등록번호</label>
              <div hidden class="rrdtext">ㅎ러ㅗ?러ㅗㅎ러</div>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="rrd" name="rrd" maxLength="14" required>
                <div class="invalid-feedback"></div>
              </div>
              <button type="button" class="btn btn-primary btn-sm CheckRrd">중복 확인</button>
            </div>


            <div class="col-12">
              성별
                <input type="radio" class="form-check-input" id="male" name="gender" value="male" checked required>남자
                <input type="radio" class="form-check-input" id="female" name="gender" value="female" required>여자
                <div class="invalid-feedback"></div>

            </div>
            <h6>이메일 또는 휴대폰번호 인증하기(택1)</h6>
            <div class="col-12">
              <label for="CheckEamil" class="form-label"><input type="radio" class="form-check-input" id="CheckEamil" required>
              이메일</label>
              <input type="email" class="form-control userEmail" id="email" name="email" >
              <input type="text" class="form-control CheckEmailKey" value="인증번호 입력" required>
              <button type="button" class="btn btn-primary btn-sm emailKey">인증번호 요청</button>
              <button type="button" class="btn btn-secondary btn-sm CheckEmailKey">인증 확인</button>
            </div>

            <div class="col-12">
              <label for="CheckPhone" class="form-label"><input type="radio" class="form-check-input" id="CheckPhone" required>
              휴대폰번호</label>
            <input type="tel" class="form-control" name="phone" >
            <input type="text" class="form-control" id="CheckSms" value="인증번호 입력" >
            <button type="button" class="btn btn-primary btn-sm smsKey">인증번호 요청</button>
              <button type="button" class="btn btn-secondary btn-sm CheckSmsKey">인증 확인</button>
            </div>
          </div>

            <div class="col-12">
              <label for="address" class="form-label">동네인증</label>
              <br>서울특별시</br>
              <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                  무슨구
                </button>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" >성동구</a></li>
                  <li><a class="dropdown-item" >중구</a></li>
                  <li><a class="dropdown-item" >광진구</a></li>
                </ul>
                <input type="text" id="ssv3-location-label" name="villCode" required>
                <button type="button" class="btn btn-primary btn-sm">동네인증 요청</button>

              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>
              동네인증 결과
              <input type="text" class="form-control" id="address"  required>

            <div class="col-12">

              <button class="btn btn-secondary dropdown-toggle" type="button" name="interList" data-bs-toggle="dropdown" aria-expanded="false">
                관심목록
              </button>
              <ul class="dropdown-menu">
                <li><a class="dropdown1" >스포츠</a></li>
                <li><a class="dropdown2" >반려동물</a></li>
                <li><a class="dropdown3" >음악</a></li>
                <li><a class="dropdown4" >독서</a></li>
                <li><a class="dropdown5" >게임</a></li>
                <li><a class="dropdown6" >육아</a></li>
                <li><a class="dropdown7" >공연</a></li>
                <li><a class="dropdown8" >공예</a></li>
                <li><a class="dropdown9" >댄스</a></li>
                <li><a class="dropdown10" >자동차</a></li>
                <li><a class="dropdown11" >사진</a></li>
                <li><a class="dropdown12" >여행</a></li>
                <li><a class="dropdown13" >기타</a></li>
              </ul>
              <button type="button" class="btn btn-primary btn-sm interList">관심목록 추가</button>
            </div>

            <div class="col-md-5">
              <label for="myInterList" class="form-label">내 관심목록 (최대 13개)</label>
              <input type="text" id="myInterList">
            </div>



            <div class="col-md-4">
              <label for="userImage" class="form-label">회원 사진 등록</label>
              <input type="file" id="userImage" name="userImage">
            </div>

            <input hidden class="masterCheck" name="masterCheck" value="0">
            <input hidden class="userStatus" name="userStatus" value="0">
            <input hidden class="lcd" name="lcd" value="2022-10-10">
              <input hidden class="loginCheck" name="loginCheck" value="0">
              <input hidden class="psd" name="psd" value="">
              <input hidden class="ped" name="ped" value="">
              <input hidden class="ppt" name="ppt" value="0">
              <input hidden class="reviewPt" name="reviewPt" value="0">


          </div>
            <hr>
            <div class="col-12">
            <button class="w-100 btn btn-primary btn-lg cancle" type="button"> 취소</button>
            <button class="w-100 btn btn-primary btn-lg addUser" type="submit"> 회원가입</button>
              <div class="invalid-feedback">
            </div>
          </div>

        </form>
      </div>
  </main>
    </div>

</div>


  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017-2022 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>
</body>
</html>
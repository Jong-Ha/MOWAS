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

        if(id==null||id.length<1){
          alert("아이디를 입력해주세요");
          return;
        }
        if(pw==null||pw.length<1){
          alert("비밀번호를 입력해주세요");
          return;
        }
        if(pw2==null||pw2.length<1){
          alert("비밀번호 확인란을 입력해주세요");
          return;
        }
        if(name==null||name.length<1){
          alert("이름을 입력해주세요");
          return;
        }
        if(pw != pw2){
          alert("비밀번호 확인이 일치하지 않습니다");
          $("#password2").focus();
          return;
        }






          if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)){
            alert("이메일 형식이 아닙니다.");
            return;
          }


        $("form").attr("method","POST").attr("action","/user/addUser").submit();

      });



       $(".CheckRrd").on("click",function (){
           $.ajax(
              {
                url : "/user/json/getUser",
                method : "POST",
                data :{
                  rrd : $("#rrd").val()
                },
                dataType : "json",
                success : function (JSONData, status){
                  var displayValue = "이미 가입한 회원입니다."

                  $(".CheckRrd").val(displayValue);
                }
              });
         });



      $(function (){
        $(".cancle").on("click",function (){
          $("form").reset();
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
              <input type="text" class="form-control" id="Id" name="id" maxLength="20" required>
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
                <input type="text" class="form-control" id="username" name="username"  required>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12">
              <label for="rrd" class="form-label">주민등록번호</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="rrd" name="rrd" maxLength="13" required>
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
              <input type="radio" class="form-check-input" id="CheckEamil" checked required>
              <label for="email" class="form-label">이메일 <span class="text-muted"> </span></label>
              <input type="email" class="form-control userEmail" id="email" name="email" value="you@email.com">
              <input type="text" class="form-control CheckEmailKey" value="인증번호 입력" required>
              <button type="button" class="btn btn-primary btn-sm emailKey">인증번호 요청</button>
              <button type="button" class="btn btn-secondary btn-sm CheckEmailKey">인증 확인</button>
            </div>

            <div class="col-12">
              <input type="radio" class="form-check-input" id="CheckPhone" required>
              휴대폰번호
            <input type="tel" class="form-control" name="sms" >
            <input type="text" class="form-control" value="인증번호 입력" >
            <button type="button" class="btn btn-primary btn-sm smsKey">인증번호 요청</button>
              <button type="button" class="btn btn-secondary btn-sm CheckSmsKey">인증 확인</button>
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
                <input type="text" id="ssv3-location-label" required>
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
              <input type="file" id="userImage">
            </div>


          </div>
            <hr>
            <div class="col-12">
            <button class="w-100 btn btn-primary btn-lg cancle" type="button"> 취소</button>
            <button class="w-100 btn btn-primary btn-lg addUser" type="submit"> 회원가입</button>
              <div class="invalid-feedback">
            </div>
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
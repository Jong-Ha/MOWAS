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
        alert('�̸���������ư?');
        $("form").attr("method", "POST").attr("action", "/user/mailSender").submit();
         // self.location="/user/mailSender";
      });
      $(".smsKey").on("click",function (){
        alert('����������ư?');
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
                    $(".rrdtext").html('ȸ�������� �� �ֽ��ϴ�');
                  } else{
                    $(".rrdtext").show();
                    $(".rrdtext").html('�̹� ������ ȸ���Դϴ�');
                  }

                });
         alert('�̰ǵǳ�?')
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
      <h2>ȸ������</h2>
      <p class="lead">������ �Է����ּ���</p>
    </div>

      <hr>

      <div class="col-md-7 col-lg-8">

        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-sm">
              <label for="id" class="form-label">���̵�</label>
              <input type="text" class="form-control" id="Id" name="userId" maxLength="20" required>
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>

            <div class="col-12">
              <label for="password" class="form-label">��й�ȣ</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" id="password" name="password" minLength="8" maxLength="20" required>
                <div class="invalid-feedback"></div>
              </div>
            </div>
            <div class="col-12">
              <label for="password2" class="form-label">��й�ȣ Ȯ��</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" id="password2" name="password2" minLength="8" maxLength="20" required>
                <div class="invalid-feedback"></div>
              </div>
            </div>


            <div class="col-12">
              <label for="username" class="form-label">�̸�</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="username" name="userName"  required>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12 ">
              <label for="rrd" class="form-label">�ֹε�Ϲ�ȣ</label>
              <div hidden class="rrdtext">������?���Ǥ���</div>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="rrd" name="rrd" maxLength="14" required>
                <div class="invalid-feedback"></div>
              </div>
              <button type="button" class="btn btn-primary btn-sm CheckRrd">�ߺ� Ȯ��</button>
            </div>


            <div class="col-12">
              ����
                <input type="radio" class="form-check-input" id="male" name="gender" value="male" checked required>����
                <input type="radio" class="form-check-input" id="female" name="gender" value="female" required>����
                <div class="invalid-feedback"></div>

            </div>
            <h6>�̸��� �Ǵ� �޴�����ȣ �����ϱ�(��1)</h6>
            <div class="col-12">
              <label for="CheckEamil" class="form-label"><input type="radio" class="form-check-input" id="CheckEamil" required>
              �̸���</label>
              <input type="email" class="form-control userEmail" id="email" name="email" >
              <input type="text" class="form-control CheckEmailKey" value="������ȣ �Է�" required>
              <button type="button" class="btn btn-primary btn-sm emailKey">������ȣ ��û</button>
              <button type="button" class="btn btn-secondary btn-sm CheckEmailKey">���� Ȯ��</button>
            </div>

            <div class="col-12">
              <label for="CheckPhone" class="form-label"><input type="radio" class="form-check-input" id="CheckPhone" required>
              �޴�����ȣ</label>
            <input type="tel" class="form-control" name="phone" >
            <input type="text" class="form-control" id="CheckSms" value="������ȣ �Է�" >
            <button type="button" class="btn btn-primary btn-sm smsKey">������ȣ ��û</button>
              <button type="button" class="btn btn-secondary btn-sm CheckSmsKey">���� Ȯ��</button>
            </div>
          </div>

            <div class="col-12">
              <label for="address" class="form-label">��������</label>
              <br>����Ư����</br>
              <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                  ������
                </button>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" >������</a></li>
                  <li><a class="dropdown-item" >�߱�</a></li>
                  <li><a class="dropdown-item" >������</a></li>
                </ul>
                <input type="text" id="ssv3-location-label" name="villCode" required>
                <button type="button" class="btn btn-primary btn-sm">�������� ��û</button>

              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>
              �������� ���
              <input type="text" class="form-control" id="address"  required>

            <div class="col-12">

              <button class="btn btn-secondary dropdown-toggle" type="button" name="interList" data-bs-toggle="dropdown" aria-expanded="false">
                ���ɸ��
              </button>
              <ul class="dropdown-menu">
                <li><a class="dropdown1" >������</a></li>
                <li><a class="dropdown2" >�ݷ�����</a></li>
                <li><a class="dropdown3" >����</a></li>
                <li><a class="dropdown4" >����</a></li>
                <li><a class="dropdown5" >����</a></li>
                <li><a class="dropdown6" >����</a></li>
                <li><a class="dropdown7" >����</a></li>
                <li><a class="dropdown8" >����</a></li>
                <li><a class="dropdown9" >��</a></li>
                <li><a class="dropdown10" >�ڵ���</a></li>
                <li><a class="dropdown11" >����</a></li>
                <li><a class="dropdown12" >����</a></li>
                <li><a class="dropdown13" >��Ÿ</a></li>
              </ul>
              <button type="button" class="btn btn-primary btn-sm interList">���ɸ�� �߰�</button>
            </div>

            <div class="col-md-5">
              <label for="myInterList" class="form-label">�� ���ɸ�� (�ִ� 13��)</label>
              <input type="text" id="myInterList">
            </div>



            <div class="col-md-4">
              <label for="userImage" class="form-label">ȸ�� ���� ���</label>
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
            <button class="w-100 btn btn-primary btn-lg cancle" type="button"> ���</button>
            <button class="w-100 btn btn-primary btn-lg addUser" type="submit"> ȸ������</button>
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
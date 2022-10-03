<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>


<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="EUC-KR">

    <!-- ���� : http://getbootstrap.com/css/   ���� -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


    <!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
        body {
            padding-top: 50px;
        }

        .wap {
            width: 700px;
            font-size: 0.9em;
        }
        .check{
            height: 20px;
            width: 35px;
        }
    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">

        //============= ȸ���������� Event  ó�� =============
        $(function () {

            $(".submit").on("click", function () {

                console.log("�̰� �� �ȵǳ�");

                $("form").attr("method", "post").attr("action", "/clubcal/addClubCalender") .attr("enctype", "multipart/form-data").submit();


                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Your work has been saved',
                    showConfirmButton: false,
                    timer: 1500
                });


            });

            $(".close").on("click", function () {
                window.close();
            });
        });


    </script>

</head>

<body>

<form>
    <!--  ȭ�鱸�� div Start /////////////////////////////////////-->
    <div class="wap">
        <div class="container">

            <div class="page-header">
                <h3 class=" text-info">���� ���� �ۼ�</h3>
            </div>

            <div class="row">
                <div class="col-xs-4 col-xs-2"><strong>�� ��</strong></div>
                <div class="col-xs-8 col-xs-4">
                    <input type="text" class="form-control" name="calenderTitle" value=""/>
                </div>
            </div>


            <hr/>

            <div class="row">
                <div class="col-xs-4 col-xs-2"><strong>���� ����</strong></div>
                <div class="col-xs-8 col-xs-4">
                    <textarea class="form-control" name="calenderText" style=" height: 200px;  width: 500px;  margin-bottom: 20px;"></textarea>
                </div>
            </div>


            <hr/>

            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>���� ��¥
                        <input class="form-control" name="clubDate" type="date">
                    </strong>
                </div>
            </div>


            <hr/>


            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>��ġ
                        <input type="button" name="location" value="��ġ �Է�">
                    </strong>
                </div>
            </div>

            <hr/>


            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>����
                        <input type="file" name="file" value="���� ÷��">
                    </strong>
                </div>
            </div>


            <hr/>

            <div class="form-check form-switch">
                �˸� ���� ����
                <input class="form-check-input check" name="noticeCheck" type="checkbox" role="switch" id="flexSwitchCheckDefault1">
                <label class="form-check-label" for="flexSwitchCheckDefault1"></label>
            </div>


            <hr/>

            �˸� �ð� ����
            <hr>
            <input type="time" name="noticeTime">

            <hr/>

            <div class="form-check form-switch">
                �߰� ���� ����
                <input class="form-check-input check" name="calendarApplyCheck" type="checkbox" role="switch" id="flexSwitchCheckDefault2">
                <label class="form-check-label" for="flexSwitchCheckDefault2"></label>
            </div>


            <hr/>


            <div class="form-check form-switch">
                �ڵ� ���� ����
                <input class="form-check-input check" name="applyAutoCheck" type="checkbox" role="switch" id="flexSwitchCheckDefault3">
                <label class="form-check-label" for="flexSwitchCheckDefault3"></label>
            </div>


            <hr/>


            <div class="row">
                <div class="col-xs-12 text-center ">
                    <button type="button" class="btn btn-primary btn-lg submit">Ȯ��</button>
                    <button type="button" class="btn btn-secondary btn-lg close">�ݱ�</button>
                </div>
            </div>

            <br/>

        </div>
    </div>
</form>

</body>

</html>
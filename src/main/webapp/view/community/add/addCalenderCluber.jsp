<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>


<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="utf-8">

    <!-- 참조 : http://getbootstrap.com/css/   참조 -->
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

        .add {
            float: right;
            font-size: 0.5em;
        }
    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">

        //============= 회원정보수정 Event  처리 =============
        $(function () {


            $(".close").on("click", function () {
                window.close();
            });

            const date = new Date();
            if ($(".clubDate").val() > date.toString()) ;


            var str = '';

            $(".add").on("click", function () {

                var cluber = $(this).parents(".wap").find(".cluberName").html()
                var checkBox = $(this).parents(".wap").find(".add")

                if(checkBox.is(":checked")){

                    $(opener.document).find("form").append($("<input type='hidden' class='clubers' value='"+cluber+"'/>"));

                }

            })
        });


    </script>

</head>

<body>

<form>
    <!--  화면구성 div Start /////////////////////////////////////-->

        <div class="container">
            <input hidden class="clubers" value="">

            <div class="page-header">
                <h3 class=" text-info">회원 목록</h3>
            </div>
            <c:set var="i" value="0"/>
            <c:forEach var="cluber" items="${list}">
                <c:set var="i" value="${i+1}"/>
                <div class="wap" style="display: flex;align-items: center; justify-content: center;  margin-top: 20px;">

                    <div class="card shadow-lg chatBox" style="width: 500px; max-width: 500px; margin-bottom: 20px">
                        <div class="row g-0">
                            <div class="col-md-4 potoBox">
                                <img class="bd-placeholder-img img-fluid rounded-start poto"
                                     src="https://placeimg.com/50/50/any" alt="any" >
                            </div>
                            <div class="col-md-8 chatText">
                                <div class="card-body ">
                                    <h5 class="card-title cluberName">${cluber.user.userId}</h5>
                                    <input type="checkbox" class="btn btn-primary btn-lg add" />
                                    <hr>
                                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </c:forEach>


            <div class="row">
                <div class="col-xs-12 text-center ">
                    <button type="button" class="btn btn-secondary btn-lg OK">확인</button>
                    <button type="button" class="btn btn-secondary btn-lg close">닫기</button>
                </div>
            </div>

            <br/>

        </div>
    </div>
</form>

</body>

</html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>


<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css"/>
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

        .wap {
            width: 700px;
            font-size: 0.9em;
        }

        .check {
            height: 20px;
            width: 35px;
        }
    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">

        //============= 회원정보수정 Event  처리 =============
        $(function () {

            $(".submit").on("click", function () {

                var boardCategory = $(".boardCategory").val()
                var villTitle = $(".villTitle").val()
                var villText = $(".villText").val()
                var villTag = $(".villTag").val();


                $.ajax({
                    url: "/commu/json/addVillBoard",
                    method: "post",
                    data: JSON.stringify({
                        "boardCategory": boardCategory,
                        "villTitle": villTitle,
                        "villText": villText,
                        "villTag": villTag

                    }),
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    success: function (JSONData, result) {
                        console.log(JSONData);

                        var boardNum = JSONData

                        var file = $("#file").length

                        if (file > 0) {

                            //form 테그를 불러와서 form변수에 등록
                            var form = document.querySelector("form");
                            //formData 변수에 html에서 form과 같은 역활을 하는 javaScript의 FormData에 form을 넣는다
                            var formData = new FormData(form);
                            //파일 사이즈만큼 formData을 돌리기 위해 fileSize를 알아내는 변수
                            var fileSize = $("#file")[0].files;
                            console.log(fileSize.length);
                            //formData에 해당 게시글 번호, 게시글 category append
                            formData.append("boardNum", boardNum);
                            formData.append("boardCategoru", boardCategory);

                            //file길이 만큼 for문으로 formData에 append함
                            for (var i = 0; i < fileSize.length; i++) {
                                formData.append("form", fileSize[i]);
                                //파일이 잘 들어 갔는지 확인
                                console.log(fileSize[i]);
                            }
                            //formData에 들어 있는 boardNum과 file의 정보를 비동기식으로 보냄
                            //파일은 json형식으로 보낼수 없기 떄문에 contentType, processData, dataType을 false로 지정
                            $.ajax({
                                url: "/clubCal/json/fileUpload",
                                type: "post",
                                processData: false,
                                contentType: false,
                                cache: false,
                                timeout: 600000,
                                data: formData,
                                headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
                                enctype: "multipart/form-data",
                                success: function (result) {

                                    console.log(result);

                                }

                            })
                        }
                        // 성공시 해당 창을 닫고 부모창을 reload
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Your work has been saved',
                            showConfirmButton: false,
                            timer: 1500
                        });

                        setTimeout(function () {
                            opener.location.reload();
                            window.close();
                        }, 2000);
                        //error 발생시 그냥 창을 닫음
                    }, error: function () {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Your work has been saved',
                            showConfirmButton: false,
                            timer: 1500
                        });
                        setTimeout(function () {
                            window.close();
                        }, 2000);
                    }
                });

            });


            $(".close").on("click", function () {
                window.close();
            });

            var input = document.querySelector(".villTag")
            var tagify = new Tagify(input, {});

            tagify.on('add', function (e) {

            })
        });


    </script>

</head>

<body>

<form>
    <!--  화면구성 div Start /////////////////////////////////////-->
    <div class="wap">
        <div class="container">
            <input hidden class="boardCategory" value="03">
            <div class="page-header">
                <h3 class=" text-info">우리 동네 게시글 작성</h3>
            </div>

            <div class="row">
                <div class="col-xs-4 col-xs-2"><strong>제 목</strong></div>
                <div class="col-xs-8 col-xs-4">
                    <input type="text" class="form-control villTitle" name="villTitle" value=""/>
                </div>
            </div>


            <hr/>

            <div class="row">
                <div class="col-xs-4 col-xs-2"><strong>내용</strong></div>
                <div class="col-xs-8 col-xs-4">
                    <textarea class="form-control villText" name="villText"
                              style=" height: 200px;  width: 500px;  margin-bottom: 20px;"></textarea>
                </div>
            </div>

            <hr/>

            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>태그
                        <input type="text" class="villTag" name="villTag" placeholder="태그를 입력 해주세요">
                    </strong>
                </div>
            </div>

            <hr/>


            <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                    <strong>파일
                        <input id="file" type="file" multiple class="file" value="파일 첨부">
                    </strong>
                </div>
            </div>

            <hr/>


            <div class="row">
                <div class="col-xs-12 text-center ">
                    <button type="button" class="btn btn-primary btn-lg submit">확인</button>
                    <button type="button" class="btn btn-secondary btn-lg close">닫기</button>
                </div>
            </div>

            <br/>

        </div>
    </div>
</form>

</body>

</html>
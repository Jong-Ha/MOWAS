<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
</head>
<meta charset="utf-8">

<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<title>Bootstrap Example</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script type="text/javascript">
    $(function () {

        var boardCategory = $(".boardCategory").val()

        $(".get").on("click", function () {
            var villBoardNum = $(this).parents(".cardbox").find(".villNum").val();

            console.log(villBoardNum);
            location.href = "/commu/getVillBoard?villBoardNum=" + villBoardNum + "&boardCategory=" + boardCategory;
        })


        $(".delete").on("click", function () {
            var boardNum = $(this).parents(".cardbox").find(".villNum").val();

            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-success',
                    cancelButton: 'btn btn-danger'
                },
                buttonsStyling: false
            })

            swalWithBootstrapButtons.fire({
                title: '정말 삭제 하시겠습니까?',
                text: "삭제하면 해당 게시글을 볼수 없습니다",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '삭제',
                cancelButtonText: '취소',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    swalWithBootstrapButtons.fire(
                        '삭제 성공!',
                        'success',
                        setTimeout(() => {
                            location.href = "/commu/deleteBoard?boardNum=" + boardNum + "&boardCategory=" + boardCategory
                        }, 1500)
                    )
                } else if (
                    /* Read more about handling dismissals below */
                    result.dismiss === Swal.DismissReason.cancel
                ) {
                    swalWithBootstrapButtons.fire(
                        '삭제 취소',
                        'error'
                    )
                }
            })
        });


        /*좋아요*/
        $(".likeButton").on("click", function () {
            var userId = $(".userId").val();

            console.log(userId);

            if (userId === '' || userId === null) {
                alert("로그인후 사용해주세요");

            } else if (userId !== '') {


                var likeCount = $(this).parents(".cardbox").find(".likeText").html();
                var boardNum = $(this).parents(".cardbox").find(".villNum").val();
                var likeText = $(this).parents(".cardbox").find(".likeText")

                $.ajax({
                    url: "/commu/json/addLike",
                    type: "POST",
                    data: JSON.stringify({
                        "likeCount": likeCount,
                        "boardNum": boardNum,
                        "boardCategory": boardCategory
                    }),
                    dataType: "JSON",
                    contentType: 'application/json; charset=UTF-8',
                    success: function (JSONData, result) {

                        likeText.html(JSONData);
                    }
                });
            }
        });


        /*modal 창 오픈*/

        $(".villBoardSubmit").on("click", function () {

            var villTitle = $(".villTitle1").val()
            var villText = $(".villText1").val()


            var villTag = $("#villTag").val();
            var villTag2 = JSON.parse(villTag);


            var str = ''
            $.each(villTag2, function (index, item) {
                console.log(item);

                str += "#"
                str += item.value;
                str += " "
            })

            $.ajax({
                url: "/commu/json/addVillBoard",
                method: "post",
                data: JSON.stringify({
                    "boardCategory": boardCategory,
                    "villTitle": villTitle,
                    "villText": villText,
                    "villTag": str

                }),
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function (JSONData, result) {
                    console.log(JSONData);

                    alert(JSONData);

                    var boardNum = JSONData

                    var file = $("#addForm #file1").length

                    if (file > 0) {

                        //form 테그를 불러와서 form변수에 등록
                        var form = document.querySelector("form");
                        //formData 변수에 html에서 form과 같은 역활을 하는 javaScript의 FormData에 form을 넣는다
                        var formData = new FormData(form);
                        //파일 사이즈만큼 formData을 돌리기 위해 fileSize를 알아내는 변수
                        var fileSize = $("#addForm #file1")[0].files;
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
                        window.location.reload()
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
                        window.location.reload()
                    }, 2000);
                }
            });

        });


        $(".update").on("click", function () {
            var boardNum = $(this).parents(".cardbox").find(".villNum").val();

            $(".updateVillBoardNum").val(boardNum)

            $.ajax({
                url: "/commu/json/getVillBoard",
                method: "post",
                dataType: "json",
                contentType: 'application/json; charset=UTF-8',
                data: JSON.stringify({
                    "villBoardNum": boardNum
                }),
                success: function (JSONData, result) {
                    console.log(JSONData);

                    var villBoard = JSONData.villBoard


                    $('.villTitle2').val(villBoard.villTitle);
                    $(".villText2").val(villBoard.villText);
                    $(".villTag2").val(villBoard.villTag);

                }

            });
        });

        $(".villBoardUpdateSubmit").on("click", function () {


            var updateVillBoardNum = $(".updateVillBoardNum").val();
            var villTitle = $(".villTitle2").val()
            var villText = $(".villText2").val()

            var villTag = $("#villTag2").val();
            var villTag2 = JSON.parse(villTag);


            var str = ''
            $.each(villTag2, function (index, item) {
                console.log(item);

                str += "#"
                str += item.value;
                str += " "
            })

            alert("dddd" + updateVillBoardNum);

            $.ajax({
                url: "/commu/json/updateVillBoard",
                method: "post",
                data: JSON.stringify({
                    "villBoardNum": updateVillBoardNum,
                    "boardCategory": boardCategory,
                    "villTitle": villTitle,
                    "villText": villText,
                    "villTag": str
                }),
                dataType: "json",
                contentType: "application/json; charset=UTF-8",

                success: function (JSONData, result) {

                    alert(result);

                    var file = $("#updateFile #file2").length

                    if (file > 0) {

                        alert("gkgk");

                        //form 테그를 불러와서 form변수에 등록
                        var form = document.querySelector("form");
                        //formData 변수에 html에서 form과 같은 역활을 하는 javaScript의 FormData에 form을 넣는다
                        var formData = new FormData(form);
                        //파일 사이즈만큼 formData을 돌리기 위해 fileSize를 알아내는 변수
                        var fileSize = $("#updateFile #file2")[0].files;
                        console.log(fileSize.length);
                        //formData에 해당 게시글 번호, 게시글 category append
                        formData.append("boardNum", updateVillBoardNum);
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
                            url: "/clubCal/json/fileUpdate",
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
                        window.location.reload();
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
                        window.location.reload();
                    }, 2000);

                }
            });

        })


        $(".close").on("click", function () {
            window.close();
        });

        var input = document.querySelector("#villTag")
        var tagify = new Tagify(input, {});

        let items = []

        tagify.on('add', function (e) {


        })

        var input2 = document.querySelector("#villTag2")
        var tagify2 = new Tagify(input2, {});


        $(".report").on("click", function () {
            var boardNum = $(this).parents(".cardbox").find(".villNum").val()
            var reportedId = $(this).parents(".cardbox").find(".SUserId").val();


            $("#commuReport .modal-content").load("/view/site/addCommunityReport.jsp",
                {boardNum: boardNum, boardCategory: boardCategory, reportedId: reportedId},
                function (re) {

                    // console.log(re);
                    $("#commuReport .modal-content").html(re);

                    $("#commuReport").modal("show");
                })
        })

        $(".user_manu").on("click", function () {
            $(this).parents(".card-top").find(".user_hidden_manu").slideToggle();
        })

        $(".searchBtn").on("click", function () {

            $("#textSerch").attr("method", "get").attr("action", "villBoardList")
        })


    });


</script>

<style>

    ul li {
        list-style: none;
        cursor: pointer;
    }

    .wap {

        width: 1100px;
        height: 1200px;

    }

    .carditem {
        display: flex;
        flex-direction: column;
        float: left;;
    }


    .itemBox {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

    .clickBox {
        padding: 10px;
        display: flex;
        float: left;
        text-align: right;
        width: 100%;
        margin-right: 39px;
        margin-bottom: 11px;
    }


    .cardbox {
        display: flex;
        flex-direction: row;
        margin-bottom: 30px;
        float: left;
        width: 442px;
        transition: all 0.1s linear;
    }

    .cardbox:hover {
        transform: scale(1.12);
    }


    .buttonBox {
        margin-left: 10px;
        cursor: pointer;
        height: 28px;
        width: 39px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .col.villBox {
        width: 100%;
        margin-right: 30px;
    }


    .addBox {
        margin-bottom: 50px;
    }

    .add {
        margin-right: -700px;
    }

    .get {
        width: 100%;
        height: 100%;
        overflow: hidden;
    }

    .carousel-inner {
        width: 100%;
        height: 100%;
    }


    .text {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }


    .potoBox {
        cursor: pointer;
        padding: 1px;
        width: 100%;
        height: 361px;
        overflow: hidden;
        border-radius: 0 0 5px 5px;
        border-bottom: 2px solid #0a090912;
    }

    .searchBox {
        width: 100%;
        display: flex;
        flex-direction: row-reverse;
        margin-bottom: 100px;
    }

    .userImg {
        width: 60px;
        height: 60px;
        padding: 5px;
    }

    .userInfo {
        padding: 6px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    .user_manu {
        padding: 14px;
        display: flex;
        width: 120%;
        font-size: 1.9em;
        flex-direction: row-reverse;
    }

    .user_hidden_manu {
        width: 100px;
        height: 75px;
        position: absolute;
        z-index: 2;
        margin-top: -14px;
        margin-left: 111px;

    }

    .user_hidden_manu > ul {
        width: 125px;
        border: 1px solid #0000001a;
        padding: 10px;
        border-radius: 5px;
        margin-left: 51px;
        background: #ffff;
    }

    .villTitle {
        text-align: left;
        width: 100%;
        margin-bottom: 20px;
        font-size: 1.3em;
    }

    .villText {
        width: 100%;
        text-align: left;
        font-size: 0.1em;
    }

    .card-top {
        border-bottom: 1px solid;
        display: flex;
        font-weight: bold
    }


    .card-footer {
        height: 208px;
    }

</style>

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">

<input hidden class="userId" value="${user.userId}">


<jsp:include page="/layout/toolbar.jsp"/>

<img src="${pageContext.request.contextPath}/resources/images/mim.jpeg"
     style="height: 500px;border-radius: 10px;  width: 1600px;">

<!-- Example Code -->
<div class="wap">

    <jsp:include page="/layout/commubar.jsp"/>

    <input hidden class="boardCategory" value="3">

    <div class="addBox">
        <button class="btn btn-primary add" data-bs-toggle="modal" data-bs-target="#exampleModal"> 우리 동네 게시글 작성
        </button>
    </div>
    <div class="searchBox">
        <form id="textSerch" class="d-flex" role="search">
            <input type="hidden" class="villCode" name="villCode" value="${user.villCode}">

            <div>
                <select name="searchCondition" class="form-select" aria-label="Default select example">
                    <option ${search.searchCondition == '1' ? 'selected' : '' } value="1">선택 하세요</option>
                    <option ${search.searchCondition == '2' ? 'selected' : '' } value="2">좋아요</option>
                    <option ${search.searchCondition == '3' ? 'selected' : '' } value="3">조회수</option>
                    <option ${search.searchCondition == '4' ? 'selected' : '' } value="4">테그</option>
                </select>
            </div>

            <input class="form-control me-2" type="search" name="searchKeyword" placeholder="검색" aria-label="Search"
                   value="${search.searchKeyword}" style="width: 255px;">
            <button class="btn btn-primary searchBtn" type="submit">검색</button>
        </form>
    </div>


    <c:set var="i" value="0"/>
    <c:forEach var="villBoard" items="${list}">
        <c:set var="i" value="${i+1}"/>
        <div class="cardbox">
            <input hidden class="villNum" value="${villBoard.villBoardNum}">
            <input hidden class="SUserId" value="${villBoard.userId}">
            <div class="col villBox">

                <div class="card h-100 shadow-lg">

                    <div class="card-top" style=" border-bottom: 1px solid; display: flex; font-weight: bold">
                        <div class="userImg">
                            <img src="/resources/${villBoard.userImg}" alt=""
                                 style="border-radius: 10px; width: 100%; height: 100%;">
                        </div>
                        <div class="userInfo">
                            <div>
                                    ${villBoard.userId}
                            </div>
                            <div style="font-size: 0.7em; margin-top: 5px">
                                    ${villBoard.villCode}
                            </div>
                        </div>
                        <div style="width: 56%;">
                            <div class="user_manu">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-three-dots" viewBox="0 0 16 16">
                                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
                                </svg>

                            </div>

                            <div class="user_hidden_manu" style="display: none">
                                <ul class=" shadow-lg">
                                    <li class="getClub">
                                        모임 방문하기
                                    </li>

                                    <c:if test="${user.userId eq villBoard.userId}">
                                        <li data-bs-toggle="modal" data-bs-target="#exampleModal" class="update">
                                            수정
                                        </li>
                                        <li class="delete">
                                            삭제
                                        </li>
                                    </c:if>

                                </ul>
                            </div>

                        </div>
                    </div>

                    <div id="carouselExampleSlidesOnly " class="carousel slide potoBox get" data-bs-ride="carousel"
                         style="cursor: pointer">

                        <c:forEach var="File" items="${villBoard.file}">
                            <div class="carousel-inner">
                                <div class="carousel-item active get">
                                    <img class="poto" width="100%" height="100%"
                                         src="/resources/villBoardFiles${File.fileName }"
                                         alt="any">
                                </div>
                            </div>
                        </c:forEach>
                    </div>


                    <div class="card-text text" style="padding: 10px; font-size: 1em; height: 48px;">
                            ${villBoard.villTag}
                    </div>

                    <div class="card-footer">

                        <div class="card-body carditem" style="padding: 0;">

                            <div class="itemBox">

                                <div class="clickBox">
                                    <button type="button"
                                            class="btn btn-primary position-relative buttonBox likeButton">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor"
                                             class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
                                            <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                                        </svg>
                                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText"
                                              style=" z-index: 1; font-size: 0.5em;">${villBoard.likeCount}</span>
                                    </button>

                                    <button type="button" class="btn btn-secondary position-relative buttonBox">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor"
                                             class="bi bi-eye" viewBox="0 0 16 16">
                                            <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                            <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                        </svg>
                                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                              style="z-index: 1; font-size: 0.5em;">${villBoard.viewCount} </span>
                                    </button>

                                    <button type="button" class="btn btn-danger buttonBox report">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor"
                                             class="bi bi-hand-thumbs-down-fill" viewBox="0 0 16 16">
                                            <path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/>
                                        </svg>
                                    </button>
                                </div>
                                <div class="villTitle">
                                        ${villBoard.villTitle}
                                </div>
                                <div class="villText">
                                        ${villBoard.villText}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </c:forEach>
</div>


<%--우리동네 게시글 등록--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="display: none;">

    <input name="clubCalenderReviewNum" class="clubCalenderReviewNum" hidden value="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel"> 우리 동네 게시글 작성 </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="addForm">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control villTitle1" id="recipient-name" value=""
                               placeholder="asdasd">
                        <label for="recipient-name">제 목</label>
                    </div>


                    <div class="form-floating mb-3">

                        <input type="text" class="form-control villText1" id="recipient-text" value=""
                               placeholder="asdasd">
                        <label for="recipient-text">내용</label>


                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file1" class="form-control file" multiple value="파일 첨부">
                    </div>

                    <div class="mb-3" style="text-align: left;">
                        <input type="hidden" class="form-control villTag" name="villTag" id="villTag"
                               placeholder="테그 입력칸입니다">
                    </div>


                </form>

            </div>

            <div class="modal-footer">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary villBoardSubmit">등록</button>

            </div>
        </div>
    </div>
</div>


<%--우리동네 게시글 수정--%>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true"
     style="display: none;">

    <input name="updateVillBoardNum" class="updateVillBoardNum" hidden value="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel2"> 우리 동네 게시글 작성 </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="updateFile">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control villTitle2" id="recipient-name2" value=""
                               placeholder="asdasd">
                        <label for="recipient-name">제 목</label>
                    </div>


                    <div class="form-floating mb-3">

                        <input type="text" class="form-control villText2" id="recipient-text2" value=""
                               placeholder="asdasd">
                        <label for="recipient-text">내용</label>


                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file2" class="form-control file" multiple value="파일 첨부">
                    </div>

                    <div class="mb-3" style="text-align: left;">
                        <input type="hidden" class="form-control villTag" name="villTag" id="villTag2"
                               placeholder="테그 입력칸입니다">
                    </div>


                </form>

            </div>

            <div class="modal-footer">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary villBoardUpdateSubmit">수정</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="commuReport" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">


        </div>
    </div>
</div>

<jsp:include page="/layout/chatIcon.jsp"/>

<%--<jsp:include page="/layout/footer.jsp"/>--%>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <style>

        .wap {
            width: 1000px;
            height: 680px;
            border-radius: 10px;
        }

        .body {
            text-align: -webkit-center;
        }

        .topbar {
            margin-bottom: 70px;
            margin-top: 20px;
            border-radius: 10px;
        }

        .navbar {
            justify-content: center;
            border-radius: 10px;
        }

        .btnlf {
            margin-left: 20px;
        }

        .textint {
            font-size: 0.2em;
            margin-top: -20px;
        }

        .login {
            float: left;
            margin-right: 20px;
        }

        .alrim {
            font-size: 0.1rem;
            width: 45px;
        }

        .loginbox {
            width: 80px;
            font-size: 0.1rem;
        }

        .carditem {
            display: flex;
            flex-direction: column;
        }

        .cardbox {
            display: flex;
            flex-direction: row;
        }

        .like {
            font-size: 0.1rem;
            width: 45px;
            outline: 0;
            border: none;
            background-color: #fff;
        }

        .usedbox {
            margin-top: 20px;
            padding: 5px;
            height: 500px;
        }

        .thumbnailBox {
            padding: 5px;
            width: 50%;
            float: left;
        }

        .textbox {
            padding: 5px;
            height: 500px;
            width: 50%;
            float: right;
            background: #fff;
            border-radius: 10px;
            font-size: 0.7em;
        }

        .textboxrow {
            margin-top: 20px;
            font-size: 1.3em;
            font-weight: bolder
        }

        .likebox {
            height: 75px;
            background: #ffff;
            margin-top: -30px;
            border-radius: 5px;
        }

        /* 댓글 */
        .commentbox {
            width: 700px;
            border: 1px solid;
            height: 600px;
            margin-top: 50px;
            background: #fff;
        }

        .commentadd {
            width: 600px;
            margin-top: 20px;
            text-align: center;
        }

        .addcomment {
            -webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            -moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            -ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            -o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            display: block;
            margin: 20px auto;
            max-width: 180px;
            text-decoration: none;
            border-radius: 4px;
            padding: 20px 30px;
            color: rgba(30, 22, 54, 0.6);
            box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
        }

        .addcomment:hover {
            color: rgba(255, 255, 255, 0.85);
            box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
        }

        .comment {
            width: 600px;
        }

        .commentText {
            background: #adb5bd;
            border-radius: 10px;
            height: 80px;
        }

        .commentitembox {
            width: 130px;
            height: 50px;
            display: flex;
            position: absolute;
            margin-left: 470px;
            margin-top: -80px;
            border-radius: 10px;
            height: 80px;
        }

        .commentitem {
            height: 50%;
            width: 100%;
        }

        .bntbox {
            height: 50%;
            width: 100%;
            position: absolute;
            margin-top: 40px;
        }

        .addbox {
            float: left;
            height: 40px;
            width: 80px;
        }

        .addbox > button {
            width: 76px;
            height: 37px;
            font-size: 0.5em;
        }

        .updatebox > button {
            width: 46px;
            height: 20px;
            font-size: 0.5em;
        }

        .itmesize {
            width: 0.7em;
            height: 0.7em;
            margin-top: -10px;
        }

        .itembutton {
            height: 30px;
        }

        .delete,
        .update {
            font-size: 0.5em;
        }
    </style>

    <script type="text/javascript">
        /*조회수*/
        $(function () {

            $(document).ready(function () {
                var viewCount = $(".viewText").html();
                var boardNum = $(".boardNum").val();
                var boardCategory = $(".boardCategory").val()

                $.ajax({
                    url: "/commu/json/viewCount",
                    type: "POST",
                    data: JSON.stringify({
                        "viewCount": viewCount,
                        "boardNum": boardNum,
                        "boardCategory" : boardCategory
                    }),
                    dataType: "JSON",
                    contentType: 'application/json; charset=UTF-8',
                    success: function (JSONData, result) {

                        $(".viewText").html(JSONData);
                    }
                })

            });

            /*좋아요 버튼*/
            $(".likeButton").on("click", function () {

                var likeCount = $(".likeText").html();
                var boardNum = $(".boardNum").val();
                var boardCategory = $(".boardCategory").val()

                $.ajax({
                    url: "/commu/json/addLike",
                    type: "POST",
                    data: JSON.stringify({
                        "likeCount": likeCount,
                        "boardNum": boardNum,
                        "boardCategory" : boardCategory
                    }),
                    dataType: "JSON",
                    contentType: 'application/json; charset=UTF-8',
                    success: function (JSONData, result) {


                        $(".likeText").html(JSONData);
                    }
                })

                alert("좋아요 성공");
            })
        });

        $(function () {
            $(".delete").on("click", function () {
                var boardNum = $(".boardNum").val();
                var boardCategory = $(".boardCategory").val()

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
                        location.href = "/commu/deleteBoard?boardNum="+boardNum+"&boardCategory="+boardCategory
                        swalWithBootstrapButtons.fire(
                            '삭제 성공!',
                            'success'
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
            /*댓글*/
            $(".addcomment").on("click", function () {
                //$("form").attr("method", "post").attr("action", "/commu/json/addComment").submit();
                var commentText = $(".addComment").val();
                var boardCategory = $(".boardCategory").val();
                var boardNum = $(".boardNum").val();

                console.log(boardCategory);

                $.ajax({
                    url: "/commu/json/addComment",
                    type: "POST",
                    data: JSON.stringify({
                        "commentText": commentText,
                        "boardCategory": boardCategory,
                        "boardNum": boardNum}),
                    dataType: "json",
                    contentType: 'application/json; charset=UTF-8',
                    success: function (JSONData, result) {
                        console.log(result);
                    }

                })
            })

            $(".updateComment").on("click", function () {
                //$("form").attr("method", "post").attr("action", "/commu/json/addComment").submit();
                var commentText = $(this).parents(".allComment").find(".addComment").val();
                var commentNum = $(this).parents(".allComment").find(".commentNum").val();

                console.log(commentText);

                $.ajax({
                    url: "/commu/json/updateComment",
                    type: "POST",
                    data: JSON.stringify({
                        "commentText": commentText,
                        "commentNum": commentNum}),
                    dataType: "json",
                    contentType: 'application/json; charset=UTF-8',

                    success: function (JSONData, result) {
                        console.log(result);
                    }

                })
            })

            $(".deleteComment").on("click", function () {
                var commentNum = $(".commentNum").val();

                $.ajax({
                    url: "/commu/json/deleteComment",
                    type: "POST",
                    data: JSON.stringify({"commentNum": commentNum}),
                    dataType: "json",
                    contentType: 'application/json; charset=UTF-8',
                    /*
                                        headers:{
                                            "Accept":"application/json",
                                            "Content-Type":"application/json; charset=utf-8"
                                        },*/
                    success: function (JSONData, result) {
                        console.log(result);
                    }

                })
            })

            /*대댓*/
            $(".addRecomment").on("click", function () {
                var recommentText = $(".recomment").val();

                console.log(recommentText);

                $.ajax({
                    url: "/commu/json/addRecomment",
                    type: "POST",
                    data: JSON.stringify({"recommentText": recommentText}),
                    dataType: "json",
                    contentType: 'application/json; charset=UTF-8',
                    /*
                                        headers:{
                                            "Accept":"application/json",
                                            "Content-Type":"application/json; charset=utf-8"
                                        },*/
                    success: function (JSONData, result) {
                        console.log(result);
                    }
                })
            })

            $(".updateRecomment").on("click", function () {
                var recommentText = $(".recomment").val();

                console.log(recommentText);

                $.ajax({
                    url: "/commu/json/updateRecomment",
                    type: "POST",
                    data: JSON.stringify({"recommentText": recommentText}),
                    dataType: "json",
                    contentType: 'application/json; charset=UTF-8',
                    /*
                                        headers:{
                                            "Accept":"application/json",
                                            "Content-Type":"application/json; charset=utf-8"
                                        },*/
                    success: function (JSONData, result) {
                        console.log(result);
                    }
                })
            })

            $(".deleteRecomment").on("click", function () {

                $.ajax({
                    url: "/commu/json/deleteRecomment",
                    type: "POST",
                    data: JSON.stringify({"recommentNum": 10001}),
                    dataType: "json",
                    contentType: 'application/json; charset=UTF-8',
                    /*
                                        headers:{
                                            "Accept":"application/json",
                                            "Content-Type":"application/json; charset=utf-8"
                                        },*/
                    success: function (JSONData, result) {
                        console.log(result);
                    }
                })
            })


            $(".update").on("click", function () {
                var boardNum = $(".villBoardNum").val();
                var boardCategory = $(".boardCategory").val()

                window.open(
                    "/commu/updateVillBoard?boardNum="+boardNum, "우리 동네 게시글 수정",
                    "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no"
                )
            })
        })
    </script>


<body class="bg-light">

<div class="container" style="text-align: -webkit-center;">
    <input hidden class="boardNum" value="${villBoard.villBoardNum}">
    <input hidden class="boardCategory" value="${villBoard.boardCategory}">
    <div class="wap shadow-lg">

        <jsp:include page="/layout/toolbar.jsp"/>

        <jsp:include page="/layout/commubar.jsp"/>
        <div class="usedbox">
            <div class="thumbnailBox">
                <div class="shadow-lg midle"
                     style="margin-bottom: 50px; margin-top: -3px;">
                    <div id="carouselExampleDark"
                         class=" shadow-lg carousel carousel-dark slide"
                         data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleDark"
                                    data-bs-slide-to="0" class="active" aria-label="Slide 1"
                                    aria-current="true"></button>
                            <button type="button" data-bs-target="#carouselExampleDark"
                                    data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
                            <button type="button" data-bs-target="#carouselExampleDark"
                                    data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active" data-bs-interval="10000">
                                <svg
                                        class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
                                        width="800" height="400" xmlns="http://www.w3.org/2000/svg"
                                        role="img" aria-label="Placeholder: First slide"
                                        preserveAspectRatio="xMidYMid slice" focusable="false">
                                    <title>Placeholder</title>
                                    <rect width="100%" height="100%"
                                          fill="#f5f5f5"></rect>
                                    <text x="50%" y="50%" fill="#aaa" dy=".3em">First slide</text>
                                </svg>

                                <div class="carousel-caption d-none d-md-block">
                                    <h5>First slide label</h5>
                                    <p>Some representative placeholder content for the first
                                        slide.</p>
                                </div>
                            </div>
                            <div class="carousel-item" data-bs-interval="2000">
                                <svg
                                        class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
                                        width="800" height="400" xmlns="http://www.w3.org/2000/svg"
                                        role="img" aria-label="Placeholder: Second slide"
                                        preserveAspectRatio="xMidYMid slice" focusable="false">
                                    <title>Placeholder</title>
                                    <rect width="100%" height="100%"
                                          fill="#eee"></rect>
                                    <text x="50%" y="50%" fill="#bbb" dy=".3em">Second slide</text>
                                </svg>

                                <div class="carousel-caption d-none d-md-block">
                                    <h5>Second slide label</h5>
                                    <p>Some representative placeholder content for the second
                                        slide.</p>
                                </div>
                            </div>
                            <div class=" carousel-item">
                                <svg
                                        class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
                                        width="800" height="400" xmlns="http://www.w3.org/2000/svg"
                                        role="img" aria-label="Placeholder: Third slide"
                                        preserveAspectRatio="xMidYMid slice" focusable="false">
                                    <title>Placeholder</title>
                                    <rect width="100%" height="100%"
                                          fill="#e5e5e5"></rect>
                                    <text x="50%" y="50%" fill="#999" dy=".3em">Third slide</text>
                                </svg>

                                <div class="carousel-caption d-none d-md-block">
                                    <h5>Third slide label</h5>
                                    <p>Some representative placeholder content for the third
                                        slide.</p>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button"
                                data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button"
                                data-bs-target="#carouselExampleDark" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="likebox shadow-lg">
                    <div class="itembox" style="padding: 20px;">
                        <button type="button"
                                class="btn btn-primary position-relative itembutton likeButton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-hand-thumbs-up itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                            </svg>
                            <span
                                    class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText" style="z-index: 1; font-size: 0.5em;">${villBoard.likeCount}</span>
                        </button>

                        <button type="button"
                                class="btn btn-secondary position-relative itembutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-eye itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                <path
                                        d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                            </svg>

                            <span
                                    class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger viewText"
                                    style="z-index: 1; font-size: 0.5em;">${villBoard.viewCount}</span>
                        </button>

                        <button type="button" class="btn btn-outline-primary itembutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-chat-left-quote itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                <path
                                        d="M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z"/>
                            </svg>
                        </button>

                        <button type="button" class="btn btn-outline-info itembutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-cart-plus-fill itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0z"/>
                            </svg>
                        </button>


                        <button type="button" class="btn btn-outline-danger itembutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor"
                                 class="bi bi-hand-thumbs-down-fill itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/>
                            </svg>
                        </button>
                        <button type="button" class="btn btn-outline-primary itembutton update">수정</button>
                        <button type="button" class="btn btn-outline-secondary itembutton delete">삭제</button>


                    </div>
                </div>
            </div>

            <div class="textbox shadow-lg">
                <div class="container">
                    <div class="row textboxrow">
                        <div class="col-2">제목</div>
                        <div class="col-10">${villBoard.villTitle}</div>
                    </div>


                    <div class="row textboxrow">
                        <div class="col-2">작성자</div>
                        <div class="col-10">${villBoard.userId}</div>
                    </div>

                    <div class="row textboxrow">
                        <div class="col-2">태그</div>
                        <div class="col-10">${villBoard.villTag}</div>
                    </div>

                    <div class="row textboxrow">
                        <div class="col-2">내용</div>
                        <div class="col-10">
                            <label for="exampleFormControlTextarea1" class="form-label"></label>
                            <textarea class="form-control" id="exampleFormControlTextarea1"
                                      rows="3" style="height: 316px; font-size: 0.4em;"
                                      placeholder="${villBoard.villText}"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--댓글 등록--%>
        <div class="commentbox shadow-lg">
            <div class="commentadd">
                <div class="form-floating">
                        <textarea name="commentText" class="form-control addComment" placeholder="Leave a comment here"
                                  id="floatingTextarea2" style="height: 100px"></textarea>
                    <label for="floatingTextarea2">Comments</label>
                    <a class="button addcomment">등록</a>
                </div>
            </div


            <%--댓글 목록--%>
            <div class="commentList">
                <c:set var="i" value="0"/>
                <c:forEach var="comment" items="${list}">
                    <c:set var="i" value="${i+1}"/>
                    <div class="allComment">
                        <input hidden class="commentNum" value="${comment.commentNum}">
                        <div class="input-group flex-nowrap commentText shadow-lg">
                            <c:if test="${comment.commentCheck == 'n'}">
                                <span class="input-group-text" id="addon-wrapping"
                                      style="width: 100px; font-size: 0.5em; font-weight: bolder;">
                                    <img src="${pageContext.request.contextPath}/resources/images/pngwing.png"
                                         style="width: 20px; margin-right: 10px;" alt="">
                                    ${comment.userId}
                                </span>

                                <div class="commentTexts">
                                        ${comment.commentText}
                                </div>

                                <div class="commentitembox">
                                    <div class="commentitem">
                                        <button type="button"
                                                class="btn btn-primary position-relative itembutton">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-hand-thumbs-up itmesize"
                                                 viewBox="0 0 16 16">
                                                <path
                                                        d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                                            </svg>
                                            <span
                                                    class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                                    style="z-index: 1; font-size: 0.5em;"> 99+ </span>
                                        </button>


                                        <button type="button" class="btn btn-outline-primary itembutton">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-chat-left-quote itmesize"
                                                 viewBox="0 0 16 16">
                                                <path
                                                        d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                <path
                                                        d="M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z"/>
                                            </svg>
                                        </button>


                                        <button type="button" class="btn btn-outline-danger itembutton">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor"
                                                 class="bi bi-hand-thumbs-down-fill itmesize"
                                                 viewBox="0 0 16 16">
                                                <path
                                                        d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/>
                                            </svg>
                                        </button>
                                    </div>
                                    <div class="bntbox">
                                        <div class="addbox">
                                            <button class="btn btn-outline-primary showRecomment" type="button">대댓글
                                            </button>
                                        </div>
                                        <div class="d-grid gap-2 updatebox"
                                             style="gap: 0.1rem !important; margin-top: -5px;">
                                            <button class="btn btn-primary updateComment" type="button">수정</button>
                                            <button class="btn btn-primary deleteComment" type="button">삭제</button>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${comment.commentCheck == 'y'}">
                                <h2>삭제 된 댓글 입니다</h2>
                            </c:if>

                        </div>

                        <div id="reComent"
                             style="margin-top: 10px; margin-bottom: 30px; text-align: -webkit-center; display: none;">
                            <textarea name="recommentText" class="form-control addReomment" placeholder="Recomment"
                                      style="height: 70px; width: 500px; margin-bottom: 10px;"></textarea>
                            <button class="btn btn-primary addRecomment" type="button">대댓글 작성</button>
                        </div>


                        <c:forEach var="Recomment" items="${comment.recommentList}">
                            <c:set var="i" value="${i+1}"/>

                            <div class="RecommentList">
                                <div class="input-group flex-nowrap RecommentText shadow-lg">
                                    <input hidden class="recommentNum" value="${Recomment.recommentNum}">
                                    <span class="input-group-text"
                                          style="width: 100px; font-size: 0.5em; font-weight: bolder;">
                                    <img src="${pageContext.request.contextPath}/resources/images/pngwing.png"
                                         style="width: 20px; margin-right: 10px;" alt="">
                                    ${Recomment.userId}
                                </span>

                                    <div class="RecommentTexts">
                                            ${Recomment.recommentText}
                                    </div>

                                    <div class="Recommentitembox">
                                        <div class="Recommentitem">
                                            <button type="button"
                                                    class="btn btn-primary position-relative itembutton">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" class="bi bi-hand-thumbs-up itmesize"
                                                     viewBox="0 0 16 16">
                                                    <path
                                                            d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                                                </svg>
                                                <span
                                                        class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                                        style="z-index: 1; font-size: 0.5em;"> 99+ </span>
                                            </button>


                                            <button type="button" class="btn btn-outline-primary itembutton">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" class="bi bi-chat-left-quote itmesize"
                                                     viewBox="0 0 16 16">
                                                    <path
                                                            d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                    <path
                                                            d="M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z"/>
                                                </svg>
                                            </button>


                                            <button type="button" class="btn btn-outline-danger itembutton">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor"
                                                     class="bi bi-hand-thumbs-down-fill itmesize"
                                                     viewBox="0 0 16 16">
                                                    <path
                                                            d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/>
                                                </svg>
                                            </button>
                                        </div>
                                        <div class="bntbox">
                                            <div class="addbox">
                                                <button class="btn btn-outline-primary showRecomment" type="button">대댓글
                                                </button>
                                            </div>
                                            <div class="d-grid gap-2 updatebox"
                                                 style="gap: 0.1rem !important; margin-top: -5px;">
                                                <button class="btn btn-primary updateRecomment" type="button">수정
                                                </button>
                                                <button class="btn btn-primary deleteRecomment" type="button">삭제
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>

            <div class="footer">

            </div>
        </div>

    </div>
</div>
<jsp:include page="/layout/chat.jsp"/>
</body>
</html>
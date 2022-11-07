<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>MOWAS</title>
</head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<title>Bootstrap Example</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">

    function lodingListClubCalender() {


        var userId = $(".userId").val();
        var boardCatagory = $(".boardCategory").val()

        //상세 조회
        $(".getPage").off("click").on("click", function () {
            var boardNum = $(this).parents(".cardbox").find(".CalenderReviewNum").val();

            console.log(boardNum);

            location.href = "/clubCal/getClubCalenderReview?clubCalenderReviewNum=" + boardNum + "&boardCategory=" + boardCatagory;
        })


        // 수정 모달 창 오픈
        $(".update").off("click").on("click", function () {
            var boardNum = $(this).parents(".cardbox").find(".CalenderReviewNum").val();

            console.log(boardNum);


            $.ajax({
                url: "/clubCal/json/getClubCalenderReview",
                method: "post",
                dataType: "json",
                contentType: 'application/json; charset=UTF-8',
                data: JSON.stringify({
                    "clubCalenderReviewNum": boardNum
                }),
                success: function (JSONData, result) {

                    var clubCalender = JSONData.clubCalender;

                    $(".clubCalenderReviewNum").val(clubCalender.clubCalenderReviewNum);
                    $(".reviewTitle2").val(clubCalender.reviewTitle);
                    $(".reviewText2").val(clubCalender.reviewText);
                    $(".reviewRange2").val(clubCalender.reviewRange);


                    var date = new Date(clubCalender.clubDate);

                    const year = date.getFullYear();
                    const month = ('0' + (date.getMonth() + 1)).slice(-2);
                    const day = ('0' + date.getDate()).slice(-2);
                    const dateStr = year + '-' + month + '-' + day;
                    alert(date);


                    $(".clubDate2").val(dateStr);


                }

            })

        });

        $(".delete").off("click").on("click", function () {

            var boardNum = $(this).parents(".cardbox").find(".CalenderReviewNum").val();

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
                            location.href = "/commu/deleteBoard?boardNum=" + boardNum + "&boardCategory=" + boardCatagory
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


        $(".likeButton").off("click").on("click", function () {


            console.log("유저의 아이디는 : " + userId);

            if (userId === '' || userId === null) {

                Swal.fire({
                    icon: 'error',
                    title: '사용할수 없는 기능 입니다',
                    text: '로그인후 사용해 주세요',
                    footer: '<a href="">Why do I have this issue?</a>'
                }).then(()=>{
                        $("#loginModal").modal("show")
                    }
                )

            } else if (userId !== '') {

                var likeCount = $(this).parents(".cardbox").find(".likeText").html();
                var boardNum = $(this).parents(".cardbox").find(".CalenderReviewNum").val();
                var boardCategory = $(this).parents(".cardbox").find(".boardCategory").val();
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
                        likeText.html(JSONData)
                    }
                })
            }
        })

        $(".submit").off("click").on("click", function () {

            var clubCalenderReviewNum = $(".clubCalenderReviewNum").val();
            var reviewTitle = $(".reviewTitle2").val();
            var reviewText = $(".reviewText2").val();
            var reviewRange = $(".reviewRange2").val();
            var location = $(".location").val()


            $.ajax({
                url: "/clubCal/json/updateClubCalenderReview",
                method: "post",
                data: JSON.stringify({
                    "clubCalenderReviewNum": clubCalenderReviewNum,
                    "boardCategory": boardCatagory,
                    "reviewTitle": reviewTitle,
                    "reviewText": reviewText,
                    "reviewRange": reviewRange,
                    "location": location
                }),
                dataType: "json",
                contentType: 'application/json; charset=UTF-8',
                success: function (JSONData, result) {

                    var boardNum = $(".clubCalenderReviewNum").val();

                    var file = $("#file").length;

                    if (file > 0) {

                        //form 테그를 불러와서 form변수에 등록
                        var form = document.querySelector("#updateform");
                        //formData 변수에 html에서 form과 같은 역활을 하는 javaScript의 FormData에 form을 넣는다
                        var formData = new FormData(form);
                        //파일 사이즈만큼 formData을 돌리기 위해 fileSize를 알아내는 변수
                        var fileSize = $("#updateform #file")[0].files;

                        //formData에 해당 게시글 번호, 게시글 category append
                        formData.append("boardNum", boardNum);
                        formData.append("boardCategoru", boardCatagory);


                        console.log(formData);

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
                    Swal.fire({
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

        $(".report").off("click").on("click", function () {

            if (userId === '' || userId === null) {


                Swal.fire({
                    icon: 'error',
                    title: '사용할수 없는 기능 입니다',
                    text: '로그인후 사용해 주세요',
                    footer: '<a href="">Why do I have this issue?</a>'
                }).then(()=>{
                        $("#loginModal").modal("show")
                    }
                )

            } else if (userId !== '') {

                var boardNum = $(this).parents(".cardbox").find(".CalenderReviewNum").val();
                var boardCategory = $(this).parents(".cardbox").find(".boardCategory").val()
                var reportedId = $(this).parents(".cardbox").find(".SUserId").val();


                $("#commuReport .modal-content").load("/view/site/addCommunityReport.jsp",
                    {boardNum: boardNum, boardCategory: boardCategory, reportedId: reportedId},
                    function (re) {

                        // console.log(re);
                        $("#commuReport .modal-content").html(re);

                        $("#commuReport").modal("show");
                    })
            }
        })


        $(".user_manu").off("click").on("click", function () {
            $(this).parents(".card").find(".user_hidden_manu").slideToggle();
        })

        $(".searchBtn").off("click").on("click", function () {

            $(".currentPage").val(1);

            $("#textSerch").attr("method", "get").attr("action", "listCalenderReview")
        })

        $(".getClub").off("click").on("click", function () {
            var clubNum = $(this).parents(".reviewBox").find(".clubNum").val()

            Swal.fire({
                title: '해당 모임 페이지로 이동하시겠습니까??',
                text: "해당 페이지로 이동합니다",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText :"취소",
                confirmButtonText: '페이지이동'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        '페이지를 이동 합니다',
                        'success'
                    )

                    setTimeout(() => {
                        location.href = "/club/getClub/" + clubNum
                    }, 1500)
                }
            })

        })
    }


    /*무한스크롤*/
    $(function () {

        lodingListClubCalender()


        function getFormJson(select) {
            // Select Form
            let selForm = document.querySelector(select);

            // Getting an FormData
            let data = new FormData(selForm);

            // Getting a Serialize Data from FormData
            let serializedFormData = serialize(select, data);

            // Log
            console.log(JSON.stringify(serializedFormData));

            return JSON.stringify(serializedFormData)
        }

        function serialize(selector, rawData) {

            let rtnData = {};
            for (let [key, value] of rawData) {
                let sel = document.querySelectorAll(selector + "[name=" + key + "]");

                // Array Values
                if (sel.length > 1) {
                    if (rtnData[key] === undefined) {
                        rtnData[key] = [];
                    }
                    rtnData[key].push(value);
                }
                // Other
                else {
                    rtnData[key] = value;
                }
            }

            return rtnData;
        }


        let loadCheck = false
        $(window).on("scroll", function () {


            if (($(document).height() - $(window).height()) - ($(window).scrollTop()) < 1200) {
                if (loadCheck) {
                    return
                }
                loadCheck = true
                console.log("성공");

                const json = getFormJson('#textSerch')
                $.ajax({
                    url: '/clubCal/json/listClubCalendarReview',
                    method: 'post',
                    'data': json,
                    contentType: 'application/json; charset=utf-8',
                    success: function (JSON, result) {

                        $.each(JSON.list, function (index, item) {
                            console.log(item.reviewTitle)


                            var str =
                                '   <div class="row row-cols-1 row-cols-md-3 g-4 cardbox" style=" margin-left: 66px;">' +
                                '         <div class="col reviewBox">' +
                                '            <input hidden class="CalenderReviewNum" value="' + item.clubCalenderReviewNum + '">' +
                                '            <input hidden class="boardCategory" value="' + item.boardCategory + '">' +
                                '            <input hidden class="SUserId" value="' + item.userId + '">' +
                                '            <input hidden class="clubNum" value="' + item.clubNum + '">' +
                                '            <div class="card h-100 shadow-lg" style="width: 100% ">' +
                                '                     <div class="card-top" style=" border-bottom: 1px solid; display: flex; font-weight: bold">' +
                                '                           <div class="userImg">' +
                                '                                <img src="/resources/' + item.userImg + '" alt=""  style="border-radius: 10px; width: 100%; height: 100%;">' +
                                '                            </div>' +
                                '                            <div class="userInfo">' +
                                '                                <div>' + item.userId + '</div>' +
                                '                                <div style="font-size: 0.7em; margin-top: 5px;  text-align: left;  width: 150px;">' + item.location + '</div>' +
                                '                            </div>' +
                                '                            <div style="width: 56%;">' +
                                '                                   <div class="user_manu">' +
                                '                                         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"class="bi bi-three-dots" viewBox="0 0 16 16">' +
                                '                                            <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>' +
                                '                                          </svg>' +
                                '                                    </div>' +
                                '                                    <div class="user_hidden_manu" style="display: none">' +
                                '                                        <ul class=" shadow-lg">' +
                                '                                            <li class="getClub">모임 방문하기</li>'
                            if ('${user.userId}' === item.userId) {
                                str +=
                                    '<li data-bs-toggle="modal" data-bs-target="#exampleModal" class="update">수정</li>' +
                                    '<li class="delete">삭제</li>'
                            }

                            str +=
                                '                                      </ul>' +
                                '                                    </div>' +
                                '                                  </div>' +
                                '                               </div>' +
                                '                            <div id="' + item.clubCalenderReviewNum + '" class="carousel slide potoBox getPage" data-bs-ride="carousel">' +
                                '                               <div class="carousel-inner">'
                            $.each(item.file, function (index, item) {
                                str +=
                                    '               <div class="carousel-item active get">' +
                                    '                   <img class="poto" width="100%" height="100%" src="/resources' + item.fileName + '" alt="any">' +
                                    '               </div>'
                            })

                            str +=
                                '                                </div>' +
                                '                              </div>' +
                                '                               <div class="card-footer">' +
                                '                                     <div class="card-body carditem" style="padding: 0;">' +
                                '                                        <div class="itemBox">' +
                                '                                              <div class="clickBox">' +
                                '                                                <div class="btn btn-primary position-relative  buttonBox  likeButton">' +
                                '                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"  class="bi bi-hand-thumbs-up" viewBox="0 0 16 16" style="font-size: 1.7em;">' +
                                '                                                         <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>' +
                                '                                                    </svg>' +
                                '                                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText"  style=" z-index: 1; font-size: 0.5em;">' + item.likeConunt + '</span>' +
                                '                                                </div>' +
                                '                                                <div class="btn btn-secondary position-relative position-relative buttonBox">' +
                                '                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"      fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16" style="font-size: 1.7em">' +
                                '                                                        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>' +
                                '                                                        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>' +
                                '                                                    </svg>' +
                                '                                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="z-index: 1; font-size: 0.5em;">' + item.viewCount + '</span>' +
                                '                                                </div>' +
                                '                                                <div class="btn btn-danger buttonBox report">' +
                                '                                                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-lg" style="font-size: 1.7em" viewBox="0 0 16 16">' +
                                '                                                         <path d="M7.005 3.1a1 1 0 1 1 1.99 0l-.388 6.35a.61.61 0 0 1-1.214 0L7.005 3.1ZM7 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0Z"/>'+
                                '                                                    </svg>' +
                                '                                                </div>' +
                                '                                          </div>' +
                                '                                        <div class="reviewTitle">' + item.reviewTitle + '</div>' +
                                '                                        <div class="reviewText">' + item.reviewText + '<div>' +
                                '                                   </div>' +
                                '                                </div>' +
                                '                              </div>' +
                                '                            </div>' +
                                '                        </div>' +
                                '                       </div>'


                            $(".ClubCalendarReviewList").append(str);

                            setTimeout(function () {

                                const carousel = new bootstrap.Carousel($('#' + item.clubCalenderReviewNum), {
                                    interval: 2000,
                                    wrap: true
                                })
                            }, 1)


                        })

                        $("#textSerch .currentPage").val(parseInt($("#textSerch .currentPage").val()) + 1)

                        lodingListClubCalender()


                        if (JSON.list.length > 0) {
                            loadCheck = false
                        } else {
                            $(window).off('scroll')
                        }


                    }

                })

            }


        })


    })


</script>


<style>

    ul li {
        list-style: none;
        cursor: pointer;
    }

    .wap {
        width: 1000px;
        height: 1500px;
    }

    .carditem {
        display: flex;
        flex-direction: column;
        float: left;
    }


    .cardbox {
        display: flex;
        flex-direction: row;
        margin-bottom: 30px;
        float: left;
        width: 360px;
        transition: all 0.1s linear;
    }

    .cardbox:hover {
        transform: scale(1.12);
    }

    .itemBox {
        display: flex;
        align-items: center;
        flex-direction: column;
        width: 297px;
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

    .buttonBox {
        margin-left: 10px;
        cursor: pointer;
        height: 28px;
        width: 39px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .col.reviewBox {
        width: 100%;
        margin-right: 30px;
    }


    .addBox {
        width: 100%;
        display: flex;
        flex-direction: row-reverse;
        margin-bottom: 100px;
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

    .potoBox {
        cursor: pointer;
        padding: 1px;
        width: 100%;
        height: 361px;
        overflow: hidden;
        border-radius: 0 0 5px 5px;
        border-bottom: 2px solid #0a090912;
    }

    .userImg {
        width: 88px;
        height: 60px;
        padding: 5px;
    }

    .userInfo {
        width: 100%;
        padding: 6px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    .user_manu {
        padding: 14px;
        display: flex;
        width: 101%;
        font-size: 1.9em;
        flex-direction: row-reverse;
    }


    .user_hidden_manu {
        width: 100px;
        height: 75px;
        position: absolute;
        z-index: 2;
        margin-top: -14px;
        margin-left: -62px;


    }

    .user_hidden_manu > ul {
        width: 125px;
        border: 1px solid #0000001a;
        padding: 10px;
        border-radius: 5px;
        background: #ffff;
    }

    .reviewTitle {
        text-align: left;
        text-overflow: ellipsis;
        height: 27px;
        width: 100%;
        margin-bottom: 20px;
        font-size: 1.3em;
        white-space: nowrap;
        overflow: hidden;
    }

    .reviewText {
        width: 100%;
        text-align: left;
        font-size: 0.1em;
        text-overflow: ellipsis;
        overflow: hidden;
        height: 76px;
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
</head>
<input hidden class="userId" value="${user.userId}">


<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<jsp:include page="/layout/toolbar.jsp"/>
<div class="container">
    <img class="shadow-lg" src="/resources/images/커뮤8.jpg"
         style="border-radius: 10px;object-fit: cover;aspect-ratio: 12/5;width: 100%;object-fit: cover;">
</div>
<jsp:include page="/layout/commubar.jsp"/>
<div class="container">

    <input hidden class="boardCategory" value="1">

    <%--상단 툴바--%>

    <%--게시판 navigation--%>

    <div class="addBox">
        <form id="textSerch" class="d-flex" role="search">
            <input type="hidden" class="boardCategory" name="boardCategory" value="1">
            <input type="hidden" class="reviewRange" name="reviewRange" value="1">
            <input type="hidden" class="currentPage" name="currentPage" value="2">

            <div>
                <select name="searchCondition" class="form-select" aria-label="Default select example">
                    <option value="1">선택 하세요</option>
                    <option ${search.searchCondition == '2' ? 'selected' : '' } value="2">좋아요</option>
                    <option ${search.searchCondition == '3' ? 'selected' : '' } value="3">조회수</option>
                </select>
            </div>

            <input class="form-control me-2" type="search" name="searchKeyword" placeholder="검색" aria-label="Search"
                   value="${search.searchKeyword}" style="width: 255px;">
            <button class="btn btn-primary searchBtn" type="submit">검색</button>
        </form>
    </div>


    <div class="ClubCalendarReviewList" style=" display: flex;  flex-wrap: wrap;  padding-bottom: 140px;">
        <c:set var="i" value="0"/>
        <c:forEach var="ClubCalendarReview" items="${list}">
            <c:set var="i" value="${i+1}"/>
            <div class="row row-cols-1 row-cols-md-3 g-4 cardbox" style=" margin-left: 66px;">
                <div class="col reviewBox">
                    <input hidden class="CalenderReviewNum" value="${ClubCalendarReview.clubCalenderReviewNum}">
                    <input hidden class="boardCategory" value="${ClubCalendarReview.boardCategory}">
                    <input hidden class="SUserId" value="${ClubCalendarReview.userId}">
                    <input hidden class="clubNum" value="${ClubCalendarReview.clubNum}">
                    <div class="card h-100 shadow-lg" style="width: 100% ">

                        <div class="card-top" style=" border-bottom: 1px solid; display: flex; font-weight: bold">
                            <div class="userImg">
                                <img src="/resources/${ClubCalendarReview.userImg}" alt=""
                                     style="border-radius: 10px; width: 100%; height: 100%;">
                            </div>
                            <div class="userInfo">
                                <div>
                                        ${ClubCalendarReview.userId}
                                </div>
                                <div style="font-size: 0.7em;margin-top: 5px;text-align: left;text-overflow: ellipsis;">
                                        ${ClubCalendarReview.location}
                                </div>
                            </div>
                            <div>
                                <div class="user_manu">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                         fill="currentColor"
                                         class="bi bi-three-dots " viewBox="0 0 16 16">
                                        <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
                                    </svg>

                                </div>
                                <div class="user_hidden_manu" style="display: none">
                                    <ul class=" shadow-lg">
                                        <li class="getClub">
                                            모임 방문하기
                                        </li>

                                        <c:if test="${user.userId eq ClubCalendarReview.userId}">
                                            <li data-bs-toggle="modal" data-bs-target="#exampleModal"
                                                class="update">
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

                        <div id="carouselExampleSlidesOnly" class="carousel slide potoBox getPage"
                             data-bs-ride="carousel">

                            <div class="carousel-inner">
                                <c:forEach var="File" items="${ClubCalendarReview.file}">
                                    <div class="carousel-item active get" data-bs-interval="2000">
                                        <img class="d-block w-100 poto" width="100%" height="100%" style="object-fit: cover;"
                                             src="/resources${File.fileName}" alt="any">
                                    </div>
                                </c:forEach>
                            </div>
                        </div>


                        <div class="card-footer">
                            <div class="card-body carditem" style="padding: 0;">

                                <div class="itemBox">

                                    <div class="clickBox">

                                        <div class="btn btn-primary position-relative  buttonBox  likeButton">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                 fill="currentColor"
                                                 class="bi bi-hand-thumbs-up" viewBox="0 0 16 16"
                                                 style="font-size: 1.7em;">
                                                <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                                            </svg>
                                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText"
                                                  style=" z-index: 1; font-size: 0.5em;">${ClubCalendarReview.likeConunt}</span>
                                        </div>

                                        <div class="btn btn-secondary position-relative position-relative buttonBox">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                 fill="currentColor"
                                                 class="bi bi-eye" viewBox="0 0 16 16" style="font-size: 1.7em">
                                                <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                                <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                            </svg>
                                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                                  style="z-index: 1; font-size: 0.5em;">${ClubCalendarReview.viewCount}</span>
                                        </div>

                                        <div class="btn btn-danger buttonBox report">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-lg" style="font-size: 1.7em" viewBox="0 0 16 16">
                                                <path d="M7.005 3.1a1 1 0 1 1 1.99 0l-.388 6.35a.61.61 0 0 1-1.214 0L7.005 3.1ZM7 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0Z"/>
                                            </svg>
                                        </div>
                                    </div>

                                    <div class="reviewTitle">
                                            ${ClubCalendarReview.reviewTitle}
                                    </div>

                                    <div class="reviewText">
                                            ${ClubCalendarReview.reviewText}
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>

        </c:forEach>
    </div>

</div>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <input name="clubCalenderReviewNum" class="clubCalenderReviewNum" hidden value="">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel"> 모임 일정 후기글 수정 </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="updateform">

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control reviewTitle2" id="recipient-name" value="" placeholder="asdasd">
                        <label for="recipient-name">제 목</label>
                    </div>

                    <div class="form-floating mb-3">
                        <textarea type="text" class="form-control reviewText2" id="message-text" value=""
                                  placeholder="asdasd" style="height: 222px;"></textarea>
                        <label for="message-text">내용</label>
                    </div>

                    <div class="form-floating mb-3">

                        <select class="form-select reviewRange2" name="reviewRange2" id="floatingSelect">
                            <option selected>공개 여부를 선택 하세요</option>
                            <option value="1">전체 공개</option>
                            <option value="2">모임 공개</option>
                        </select>

                        <label for="floatingSelect">공개 여부</label>

                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file" class="form-control file" multiple value="파일 첨부">
                    </div>

                </form>

            </div>

            <div class="modal-footer">

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary submit">수정</button>

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

<jsp:include page="/layout/footer.jsp"/>

</body>
</html>


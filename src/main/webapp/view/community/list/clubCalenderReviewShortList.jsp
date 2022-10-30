<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
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
    $(function () {
        var boardCategory = $(".boardCategory").val()
        var userId = $(".userId").val()

        $(".add").on("click", function () {
            window.open("/view/community/add/addClubCalenderReviewShort.jsp", "모임 일정 후기글 작성",
                "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
        });

        $(".update").on("click", function () {

            var boardNum = $(this).parents(".cardbox").find(".boardNum").val();

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

                    $(".reviewTitle").val(clubCalender.reviewTitle);
                    $(".reviewRange").val(clubCalender.reviewRange);
                    $(".clubDate").val(clubCalender.clubDate);
                    $(".clubCalenderReviewNum").val(clubCalender.clubCalenderReviewNum);
                    $(".file").val(clubCalender.file.fileName)


                }

            })

        });

        $(".delete").on("click", function () {
            var boardNum = $(this).parents(".cardbox").find(".boardNum").val();


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


            if (userId === '' || userId === null) {
                alert("로그인후 사용해 주세요")

            } else if (userId !== '') {
                var likeCount = $(this).parents(".cardbox").find(".likeText").html();
                var boardNum = $(this).parents(".cardbox").find(".boardNum").val();
                var boardCategory = $(this).parents(".cardbox").find(".boardCategory").val()
                var likeText = $(this).parents(".cardbox").find(".likeText")


                console.log(boardCategory);
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


        $(".submit").on("click", function () {

            var clubCalenderReviewNum = $(".clubCalenderReviewNum").val();
            var boardCategory = $(".boardCategory").val();
            var reviewTitle = $(".reviewTitle").val();
            var reviewRange = $(".reviewRange").val();


            $.ajax({
                url: "/clubCal/json/updateClubCalenderReview",
                method: "post",
                data: JSON.stringify({
                    "clubCalenderReviewNum": clubCalenderReviewNum,
                    "boardCategory": boardCategory,
                    "reviewTitle": reviewTitle,
                    "reviewRange": reviewRange,
                }),
                dataType: "json",
                contentType: 'application/json; charset=UTF-8',
                success: function (JSONData, result) {

                    console.log(JSONData);

                    var boardNum = clubCalenderReviewNum

                    var file = $("#file").length;

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

        $(".report").on("click", function () {


            var boardNum = $(this).parents(".cardbox").find(".boardNum").val();
            var boardCategory = $(this).parents(".cardbox").find(".boardCategory").val()
            var reportedId = $(this).parents(".cardbox").find(".SUserId").val();

            $("#commuReport .modal-content").load("/view/site/addCommunityReport.jsp" ,
                {boardNum : boardNum, boardCategory : boardCategory, reportedId : reportedId},
            function (re) {

                // console.log(re);
                $("#commuReport .modal-content").html(re);

                $("#commuReport").modal("show");
            })


        })


    });


</script>


<style>
    .body {
        text-align: -webkit-center;
    }

    .wap {
        width: 1000px;
        height: 1500px;
    }

    .carditem {
        display: flex;
        flex-direction: column;
    }

    .cardbox {
        display: flex;
        flex-direction: row;
        margin-bottom: 30px;
    }

    .carditem {
        display: flex;
        flex-direction: column;
    }


    .itemBox {
        height: 25px;
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
        justify-content: center;
    }

    .buttonBox {
        font-size: 1.6em;
        margin-left: 10px;
        cursor: pointer;
    }
    .updatebox{
        display: flex;
        font-size: 2.5em;
        font-weight: bold;
        margin-top: 5px;
        margin-left: 3px;
        cursor : pointer;
    }


    .card {
        width: 900px;
    }

    .card-height {
        height: 500px;
    }

    .ShortVideo {
        padding: 5px;
    }

    .update,
    .delete {
        font-size: 0.5em;
    }

    .addBox {
        margin-bottom: 50px;
    }

    .add {
        margin-right: -700px;
    }
</style>

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<input hidden class="userId" value="${user.userId}">
<!-- Example Code -->
<jsp:include page="/layout/toolbar.jsp"/>

<img src="${pageContext.request.contextPath}/resources/images/mim.jpeg"
     style="height: 500px;border-radius: 10px;  width: 1600px;">


<div class="wap">


    <jsp:include page="/layout/commubar.jsp"/>


    <div class="addBox">
        <button class="btn btn-primary add ">
            모임 일정 쇼츠
        </button>
    </div>

    <c:set var="i" value="0"/>
    <c:forEach var="ClubCalendarReview" items="${list}">
        <c:set var="i" value="${i+1}"/>
        <div class="row row-cols-1 row-cols-md-3 g-4 cardbox">
            <input hidden class="boardNum" value="${ClubCalendarReview.clubCalenderReviewNum}">
            <input hidden class="boardCategory" value="${ClubCalendarReview.boardCategory}">
            <input hidden class="SUserId" value="${ClubCalendarReview.userId}">

            <div class="col">
                <div class="card h-100" style="">
                    <video id="ShortVideo${i}" controls class="ShortVideo">
                        <source src="/resources/${ClubCalendarReview.file[0].fileName}" type="video/mp4">
                    </video>

                    <div class="card-body carditem">
                        <h5 class="card-title">${ClubCalendarReview.reviewTitle}


                        </h5>
                    </div>
                    <div class="card-footer">

                        <div class="card-body carditem">

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
                                              style=" z-index: 1; font-size: 0.5em;">${ClubCalendarReview.likeConunt} </span>
                                    </button>

                                    <button type="button" class="btn btn-secondary position-relative buttonBox">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor"
                                             class="bi bi-eye" viewBox="0 0 16 16">
                                            <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                            <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                        </svg>
                                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger viewText"
                                              style="z-index: 1; font-size: 0.5em;">${ClubCalendarReview.viewCount}</span>
                                    </button>

                                    <button type="button" class="btn btn-danger buttonBox report">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor"
                                             class="bi bi-hand-thumbs-down-fill" viewBox="0 0 16 16">
                                            <path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/>
                                        </svg>
                                    </button>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="updatebox">
                    <c:if test="${user.userId eq ClubCalendarReview.userId}">
                        <div type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class=" itembutton update" style="margin-right: 10px">수정
                        </div>
                        <div type="button" class=" itembutton delete">삭제</div>
                    </c:if>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     style="display: none;">

    <input name="clubCalenderReviewNum" class="clubCalenderReviewNum" hidden value="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel"> 모임 일정 후기글 수정 </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control reviewTitle" id="recipient-name" value=""
                               placeholder="asdasd">
                        <label for="recipient-name">제 목</label>
                    </div>


                    <div class="form-floating mb-3">

                        <select class="form-select reviewRange" name="reviewRange" id="floatingSelect">
                            <option selected>공개 여부를 선택 하세요</option>
                            <option value="1">전체 공개</option>
                            <option value="2">모임 공개</option>
                        </select>

                        <label for="floatingSelect">공개 여부</label>


                    </div>

                    <div class="input-group mb-3">
                        <input type="file" id="file" class="form-control file" multiple value="파일 첨부">
                    </div>

                    <div class="form-floating mb-3">

                        <input type="date" class="form-control clubDate" id="date-text" value="" placeholder="asdasd"/>
                        <label for="date-text">모임 일정 날짜</label>

                    </div>

                    <div class="input-group mb-3">

                        <input type="button" class="form-control" value="위치 선택">

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



    <script>

        /*rolVideo*/
        $(function () {


            $(".ShortVideo").off('play').on("play", function () {
                var boardNum = $(this).parents(".cardbox").find(".boardNum").val()
                var viewCount = $(this).parents(".cardbox").find(".viewText");
                var boardCategory = $(".boardCategory").val()

                $.ajax({
                    url: "/commu/json/viewCount",
                    type: "POST",
                    data: JSON.stringify({
                        "viewCount": viewCount.html(),
                        "boardNum": boardNum,
                        "boardCategory": boardCategory
                    }),
                    dataType: "JSON",
                    contentType: 'application/json; charset=UTF-8',
                    success: function (JSONData, result) {

                        viewCount.html(JSONData);

                    }

                })

                var offset = $(this).parents(".cardbox").find(".ShortVideo").offset();
                $('html').animate({scrollTop: offset.top}, 10);


            })


            for (let i = 0; i < ${i}; i++) {
                var vide = $("#ShortVideo" + i);

                vide.off('ended').on("ended", function () {
                    $("#ShortVideo" + (i + 1))[0].play();
                })
            }


        });

    </script>

</body>
</html>

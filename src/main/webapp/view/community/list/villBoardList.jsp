<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>MOWAS</title>
</head>
<meta charset="utf-8">

<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<title>MOWAS</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script type="text/javascript">
    function setToolTip(){
        $('.report').attr('data-bs-title','신고하기')
        $.each($('.report'),function(i,e){
            new bootstrap.Tooltip(e)
        })
        $('.likeButton').attr('data-bs-title','좋아요')
        $.each($('.likeButton'),function(i,e){
            new bootstrap.Tooltip(e)
        })
        $('.viewBox').attr('data-bs-title','조회수')
        $.each($('.viewBox'),function(i,e){
            new bootstrap.Tooltip(e)
        })
    }

    function lodingVillBoard() {

        var boardCategory = $(".boardCategory").val()

        $(".get").off("click").on("click", function () {
            var villBoardNum = $(this).parents(".cardbox").find(".villNum").val();

            console.log(villBoardNum);
            location.href = "/commu/getVillBoard?villBoardNum=" + villBoardNum + "&boardCategory=" + boardCategory;
        })


        $(".delete").off("click").on("click", function () {
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
        $(".likeButton").off("click").on("click", function () {
            var userId = $(".userId").val();

            console.log(userId);

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

        $(".villBoardSubmit").off("click").on("click", function () {
            var userId = '${user.userId}';


            if (userId === '') {


                setTimeout(()=>{
                    $("#loginModal").modal("show")
                },1500)

            } else if (userId !== '') {


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
                            icon: 'success',
                            title: '작성 되었습니다',
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
            }


        });


        $(".update").off("click").on("click", function () {
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

        $(".villBoardUpdateSubmit").off("click").on("click", function () {


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


                    var file = $("#updateFile #file2").length

                    if (file > 0) {


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


        $(".close").off("click").on("click", function () {
            window.close();
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
                var boardNum = $(this).parents(".cardbox").find(".villNum").val()
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
            $(this).parents(".card-top").find(".user_hidden_manu").slideToggle();
        })

        $(".searchBtn").off("click").on("click", function () {

            $(".currentPage").val(1);

            $("#textSerch").attr("method", "get").attr("action", "villBoardList")
        })

    }


    $(function () {
        setToolTip()
        lodingVillBoard()

        /*무한 페이징*/

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


                const json = getFormJson('#textSearch')

                $.ajax({
                    url: '/commu/json/listVillBoard',
                    method: 'post',
                    'data': json,
                    contentType: 'application/json; charset=utf-8',
                    success: function (JSON, result) {

                        $.each(JSON.list, function (index, item) {


                            var str =
                                ' <div class="cardbox">' +
                                '     <input hidden class="villNum" value="' + item.villBoardNum + '">' +
                                '     <input hidden class="SUserId" value="' + item.userId + '">' +
                                '       <div class="col villBox">' +
                                '           <div class="card h-100 shadow-lg">' +
                                '              <div class="card-top" style=" border-bottom: 1px solid; display: flex; font-weight: bold">' +
                                '                   <div class="userImg">' +
                                '                      <img src="/resources/' + item.userImg + '" alt=""  style="border-radius: 10px; width: 100%; height: 100%;object-fit: cover;">' +
                                '                   </div>' +
                                '                   <div class="userInfo">' +
                                '                       <div>' + item.userId + '</div>' +
                                '                       <div style="font-size: 0.7em; margin-top: 5px">' + item.villCode + '</div>' +
                                '                   </div>' +
                                '                   <div style="width: 56%;">' +
                                '                     <div class="user_manu">' +
                                '                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">' +
                                '                               <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>' +
                                '                        </svg>' +
                                '                      </div>' +
                                '                   <div class="user_hidden_manu" style="display: none">' +
                                '                                            <li class="getClub">모임 방문하기</li>'
                            if ('${user.userId}' === item.userId) {
                                str +=
                                    '<li data-bs-toggle="modal" data-bs-target="#exampleModal2" class="update">수정</li>' +
                                    '<li class="delete">삭제</li>'
                            }

                            str +=
                                '                                      </ul>' +
                                '                                    </div>' +
                                '                                  </div>' +
                                '                               </div>' +
                                '                            <div id="' + item.villBoardNum + '" class="carousel slide potoBox getPage" data-bs-ride="carousel">' +
                                '                       <div class="carousel-inner">'
                            $.each(item.file, function (index, item) {
                                if(index===0){
                                    str +=
                                        '   <div class="carousel-item active get">' +
                                        '       <img class="poto" width="100%" height="100%" style="object-fit: cover;" src="/resources/' + item.fileName + '" alt="any">' +
                                        '    </div>'
                                }else {
                                    str +=
                                        '   <div class="carousel-item get">' +
                                        '       <img class="poto" width="100%" height="100%" style="object-fit: cover;" src="/resources/' + item.fileName + '" alt="any">' +
                                        '    </div>'
                                }
                            })

                            str +=
                                '                           </div>' +
                                '                               </div>' +
                                '                              <div class="card-text text" style="padding: 10px; font-size: 1em; height: 48px;">' + item.villTag + '</div>' +
                                '                            <div class="card-footer">' +
                                '                               <div class="card-body carditem" style="padding: 0;">' +
                                '                                   <div class="itemBox">' +
                                '                                       <div class="clickBox">' +
                                '                                           <div type="button" class="btn btn-primary position-relative buttonBox likeButton"> ' +
                                '                                               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"      class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">' +
                                '                                                    <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>' +
                                '                                               </svg>' +
                                '                                               <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText"style=" z-index: 1; font-size: 0.5em;">' + item.likeCount + '</span>' +
                                '                                           </div>' +
                                '                                           <div type="button" class="btn btn-secondary position-relative buttonBox viewBox">' +
                                '                                               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"      fill="currentColor"    class="bi bi-eye" viewBox="0 0 16 16">' +
                                '                                                       <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>' +
                                '                                                       <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>' +
                                '                                                   </svg>' +
                                '                                                   <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger viewText"style="z-index: 1; font-size: 0.5em;">' + item.viewCount + '</span>' +
                                '                                               </div>' +
                                '                                               <div class="btn btn-danger buttonBox report">' +
                                '                                                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-lg" style="font-size: 1.2em;" viewBox="0 0 16 16">' +
                                '                                                       <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/><path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>'+
                                '                                                   </svg>' +
                                '                                                </div>' +
                                '                                         </div>' +
                                '                                           <div class="villTitle">' + item.villTitle + ' </div>' +
                                '                                           <div class="villText">' + item.villText + ' </div>' +
                                '                                       </div>' +
                                '                                   </div>' +
                                '                               </div>' +
                                '                           </div>' +
                                '                     </div>' +
                                '                  </div>'

                            $(".ListVillBoard").append(str);


                            setTimeout(function () {

                                const carousel = new bootstrap.Carousel($('#' + item.villBoardNum), {
                                    interval: 2000,
                                    wrap: true
                                })
                            }, 1)


                        });

                        $("#textSearch .currentPage").val(parseInt($("#textSearch .currentPage").val()) + 1)
                        setToolTip()
                        lodingVillBoard();

                        if (JSON.list.length > 0) {
                            loadCheck = false
                        } else {
                            $(window).off("scroll")
                        }


                    }
                });
            }

        })


        var input = document.querySelector("#villTag")
        var tagify = new Tagify(input, {});

        let items = []

        tagify.on('add', function (e) {


        })

        var input2 = document.querySelector("#villTag2")
        var tagify2 = new Tagify(input2, {});


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

    .ListVillBoard {
        align-content: center;
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
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
        margin-left: 60px;
        margin-bottom: 30px;
        float: left;
        width: 360px;
        transition: all 0.1s linear;
    }

    .cardbox:hover {
        transform: scale(1.12);
    }


    .buttonBox {
        margin-left: 10px;
        cursor: pointer;
        height: 28px;
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
        display: flex;
        align-items: flex-start;
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
        margin-top: -83px;
    }

    .userImg {
        width: 108px;
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
        width: 112%;
        font-size: 1.9em;
        flex-direction: row-reverse;
    }

    .user_hidden_manu {
        width: 100px;
        height: 75px;
        position: absolute;
        z-index: 2;
        margin-top: -14px;
        margin-left: 25px;

    }

    .user_hidden_manu > ul {
        width: 76px;
        border: 1px solid #0000001a;
        padding: 10px;
        border-radius: 5px;
        margin-left: -30px;
        background: #ffff;
    }

    .villTitle {
        text-align: left;
        width: 100%;
        margin-bottom: 20px;
        height: 35px;
        font-size: 1.3em;
        text-overflow: ellipsis;
        overflow: hidden;
    }

    .villText {
        width: 100%;
        text-align: left;
        font-size: 1em;
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

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">

<input hidden class="userId" value="${user.userId}">


<jsp:include page="/layout/toolbar.jsp"/>

<div class="container">
    <img class="shadow-lg" src="/resources/images/커뮤8.jpg"
         style="border-radius: 10px;object-fit: cover;aspect-ratio: 12/5;width: 100%;object-fit: cover;">
</div>
<jsp:include page="/layout/commubar.jsp"/>

<!-- Example Code -->
<div class="container">


    <input hidden class="boardCategory" value="3">

    <div class="addBox">
        <button class="btn btn-primary add" data-bs-toggle="modal" data-bs-target="#exampleModal"> 우리 동네 게시글 작성</button>
    </div>
    <div class="searchBox">
        <form id="textSearch" class="d-flex" role="search">
            <input type="hidden" class="villCode" name="villCode" value="${villCode}">
            <input type="hidden" class="currentPage" name="currentPage" value="2">
            <input type="hidden" class="searchLat" name="searchLat" value="">
            <input type="hidden" class="searchLng" name="searchLng" value="">


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


    <div class="ListVillBoard" style=" display: flex;  flex-wrap: wrap;  padding-bottom: 140px;">
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
                                     style="border-radius: 10px; width: 100%; height: 100%;object-fit: cover;">
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
                                        <c:if test="${user.userId eq villBoard.userId}">
                                            <li data-bs-toggle="modal" data-bs-target="#exampleModal2" class="update">
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

                            <div class="carousel-inner get" >
                                <c:forEach var="File" items="${villBoard.file}" varStatus="st">
                                    <div class="carousel-item ${st.first?'active':''}" data-bs-interval="2000" style="height: 100%;">
                                        <img class="d-block w-100  poto" width="100%" height="100%" style="object-fit: cover;"
                                             src="/resources/${File.fileName }" alt="any">
                                    </div>
                                </c:forEach>
                            </div>
                        </div>


                        <div class="card-text text" style="padding: 10px; font-size: 1em; height: 48px;max-width: 320px;">
                                ${villBoard.villTag}
                        </div>

                        <div class="card-footer">

                            <div class="card-body carditem" style="padding: 0;">

                                <div class="itemBox">

                                    <div class="clickBox">
                                        <div type="button"
                                             class="btn btn-primary position-relative buttonBox likeButton">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor"
                                                 class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
                                                <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                                            </svg>
                                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText"
                                                  style=" z-index: 1; font-size: 0.5em;">${villBoard.likeCount}</span>
                                        </div>

                                        <div type="button" class="btn btn-secondary position-relative buttonBox viewBox">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor"
                                                 class="bi bi-eye" viewBox="0 0 16 16">
                                                <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                                <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                            </svg>
                                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger viewText"
                                                  style="z-index: 1; font-size: 0.5em;">${villBoard.viewCount} </span>
                                        </div>

                                        <div class="btn btn-danger buttonBox report">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-lg" style="font-size: 1.2em;" viewBox="0 0 16 16">
                                                <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/><path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
                                            </svg>
                                        </div>
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
                    <form id="addForm">
                        <div class="input-group mb-3">
                            <input type="file" id="file1" class="form-control file" multiple value="파일 첨부">
                        </div>
                    </form>
                    <div class="mb-3" style="text-align: left;">
                        <input type="hidden" class="form-control villTag" name="villTag" id="villTag"
                               placeholder="테그 입력칸입니다">
                    </div>


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
                    <h1 class="modal-title fs-5" id="exampleModalLabel2"> 우리 동네 게시글 수정 </h1>
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
</div>

    <jsp:include page="/layout/chatIcon.jsp"/>

    <jsp:include page="/layout/footer.jsp"/>


</body>
</html>

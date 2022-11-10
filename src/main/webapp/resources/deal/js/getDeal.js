$(function() {
    // $(".update").on("click", function () {
    //     location.href = "/deal/updateDeal/${deal.dealBoardNum}"
    // })
})
//     $(".deleteDeal").on("click",function(){
//         var check = confirm("진짜 삭제?");
//         if(check==true){
//             location.href="/deal/deleteDeal/${deal.dealBoardNum}"
//         }
//     })
// });
//     $(function () {
//         /* 리뷰쓰기 */
//         $(".reply_button_wrap").on("click", function (e) {
//
//             e.preventDefault();
//
//             const userId = '${user.userId}';
//             const dealId = '${deal.dealId}';
//
//             let popUrl = "/deal/review/${dealBoardNum}";
//
//
//             console.log(popUrl);
//             let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
//
//             window.open(popUrl, "리뷰 쓰기", popOption);
//         });
//     })
//
//     $(function () {
//         //좋아요
//         $(".likeToggle").on("click", function () {
//             var dealNum = $(this).parent().children("[name='dealBoardNum']").val();
//             var boardCategory = $(this).parent().children("[name='boardCategory']").val();
//             $.ajax({
//                 url: "/deal/json/dealLike",
//                 method: "POST",
//                 data: JSON.stringify({
//                     "boardNum": dealNum,
//                     "boardCategory": boardCategory
//                 }),
//                 headers: {
//                     "Accept": "application/json",
//                     "Content-Type": "application/json; charset=UTF-8"
//                 },
//                 dataType: "JSON",
//                 success: function (JSONData, result) {
//                     alert(result)
//                     alert(JSONData);
//                     if (JSONData.like === 'n') {
//                         alert("누름")
//                         $(".likeToggle").val("좋아요 해제");
//                     } else if (JSONData.like == 'null') {
//                         $(".likeToggle").val
//                     } else {
//                         alert("뺌")
//                         $(".likeToggle").val("좋아요!");
//                     }
//                 }
//             })
//         })
//     })

// $(function () {
//     var dealNum = $(this).parent().children("[name='dealBoardNum']").val();
//     var boardCategory=$(this).parent().children("[name='boardCategory']").val();
//
//     $.ajax({
//         url : "/deal/json/getLikeCheck",
//         method : "POST",
//         data : JSON.stringify({
//             "boardNum" : dealNum,
//             "boardCategory" : boardCategory
//         }),
//         dataType: "json",
//         headers: {
//             "Accept": "application/json",
//             "Content-Type": "application/json; charset=UTF-8"
//         },
//         success:function (JSONData) {
//             alter("성공 ?")
//             if (JSONData.like === 'n') {
//                 alert("누름")
//                 $(".likeToggle").val("좋아요 해제") ;
//             } else {
//                 alert("뺌")
//                 $(".likeToggle").val("좋아요!");
//             }
//         }
//     })
//
// })


// $(document).ready(function(){
// var dealNum = $(this).parent().children("[name='dealBoardNum']").val();
// var boardCategory=$(this).parent().children("[name='boardCategory']").val();
//
// $.ajax({
//     url : "/deal/json/getLikeCheck",
//     method : "POST",
//     data : JSON.stringify({
//         "boardNum" : dealNum,
//         "boardCategory" : boardCategory
//     }),
//     dataType: "json",
//     headers: {
//         "Accept": "application/json",
//         "Content-Type": "application/json; charset=UTF-8"
//     },
//     success:function (JSONData) {
//         if (JSONData.like === 'n') {
//             alert("누름")
//             $(".likeToggle").val("좋아요 해제") ;
//         } else {
//             alert("뺌")
//             $(".likeToggle").val("좋아요!");
//         }
//     }
// })
// })
// $(".addClub").on("click",function(){
//     location.href="/club/addClub"
// })


//$(".likeToggle").on("click",function(){

//
//         var likeCount =$(this).parents(".cardbox").find(".likeText").html();
//         var boardNum = $(this).parents(".cardbox").find(".boardNum").val();
//         var boardCategory = $(this).parents(".cardbox").find(".boardCategory").val()
//         var  likeText = $(this).parents(".cardbox").find(".likeText")
//
//         $.ajax({
//             url: "/deal/json/addLike",
//             type: "POST",
//             data: JSON.stringify({
//                 "likeCount": likeCount,
//                 "boardNum": boardNum,
//                 "boardCategory": boardCategory
//             }),
//             dataType: "JSON",
//             contentType: 'application/json; charset=UTF-8',
//             success: function (JSONData, result) {
//
//                 likeText.html(JSONData);
//             }
//         })
//     });
// });

//
//         var dealBoardNum = $(this).parent().children("[name='dealBoardNum']").val();
//         var button = $(this);
//         $.ajax({
//             url: "/deal/json/dealLike",
//             type: "POST",
//             data: JSON.stringify({
//                 "boardNum": dealBoardNum,
//                 "boardCategory": "8"
//             }),
//             dataType: "JSON",
//             contentType: 'application/json; charset=UTF-8',
//
//             success: function () {
//                 // alert("ajax")
//                 if(button.val()==='좋아요!'){
//                     // alert("누름")
//                     button.val("좋아요 해제");
//                 }else{
//                     // alert("뺌")
//                     button.val("좋아요!");
//                 }
//             }
//         })
//     })
// })

    // $(function () {
        // $(".updateClub").on("click",function(){
        //     location.href="/club/updateClub/"+$(".boardNum").val()
        // })
        // $(".delete").on("click", function () {
        //     var check = confirm("진짜 삭제?");
        //     if (check === true) {
        //         location.href = "/deal/deleteDeal/" + $(".dealBoardNum").val()
        //     }
        // })
//         $(".listCluber").on("click", function () {
//             var nWidth = "400";
//             var nHeight = "500";
//
// // 듀얼 모니터 고려한 윈도우 띄우기
//             var curX = window.screenLeft;
//             var curY = window.screenTop;
//             var curWidth = document.body.clientWidth;
//             var curHeight = document.body.clientHeight;
//
//             var nLeft = curX + (curWidth / 2) - (nWidth / 2);
//             var nTop = curY + (curHeight / 2) - (nHeight);
//
//             var strOption = "";
//             strOption += "left=" + nLeft + "px,";
//             strOption += "top=" + nTop + "px,";
//             strOption += "width=" + nWidth + "px,";
//             strOption += "height=" + nHeight + "px,";
//             strOption += "toolbar=no,menubar=no,location=no,";
//             strOption += "resizable=yes,status=yes";
//
//             window.open("/club/listCluber/" + $(".boardNum").val(), "popWin", strOption)
//         })
//
//
//         //업데이트 tagify
//         var dealTag = document.querySelector("#dealTag")
//         var tagify = new Tagify(dealTag, {
//             dropdown: {
//                 position: "input",
//                 enabled: 0 // always opens dropdown when input gets focus
//             }
//         })
//
//         let items = []
//
//         $.each($(".tagList"), function (index, item) {
//             // alert($(item).val())
//             items.push($(item).val())
//         })
//         tagify.addTags(items)
//
        //업데이트
        // var dealTag = document.querySelector("#dealTag")
        // var tagify = new Tagify(dealTag, {
        //     dropdown: {
        //         position: "input",
        //         enabled: 0 // always opens dropdown when input gets focus
        //     }
        // })
//완성~~~
//         $("#updateDeal").find(".updateDeal").on('click', function () {
//             alert("클릭되ㅏㅁ? ")
//             if ($("#dealTitle").val() === '') {
//                 alert("제목은 필수입니다")
//                 return;
//             }
//             if ($("#price").val() === '') {
//                 alert("가격은 필수입니다")
//                 return;
//             }
//             if ($("#dealProduct").val() === '') {
//                 alert("제품명은 필수입니다")
//                 return;
//             }
//             // if($("#clubTag").val()===''){
//             //     return;
//             // }
//             // alert(JSON.parse($("#clubTag").val()))
//             let updateForm = $("#updateDealForm");
//             $.each(JSON.parse($("#dealTag").val()), function (index, item) {
//                 updateForm.append('<input type="hidden" name="dealTags" value="' + item.value + '">')
//             })
//
//             updateForm.attr("action", "/deal/updateDeal").attr("method", "post").submit()
//         })
//     })
//완성 ~~~~
//
//
//         $("#updateDeal").find(".newDeal").on("click", function () {
//             if ($("#dealTitle").val() === '') {
//                 alert("제목은 필수입니다")
//                 return;
//             }
//             if ($("#dealProduct").val() === '') {
//                 alert("제품명은 필수입니다")
//                 return;
//             }
//             if ($("#price").val() === '') {
//                 alert("가격은 필수입니다")
//                 return;
//             }
//             let updateForm = $("#updateDealForm");
//             $.each(JSON.parse($("#dealTag").val()), function (index, item) {
//                 updateForm.append('<input type="hidden" name="dealTags" value="' + item.value + '">')
//             })
//             updateForm.attr("method", "post").attr("action", "/deal/updateDeal").submit();
//         })
//     })
        // $('input[name="file"]').on("change", function () {
        //     $('input[name="deleteFile"]').attr("disabled", false)
        // })

        //파일 갯수 체크
    //     $("input:file").on("change", function () {
    //         if ($(this)[0].files.length > 10 - $('#fileSize').val()) {
    //             alert('파일 갯수를 초과하였습니다.');
    //             // alert(10-$('#fileSize').val());
    //             $(this).val('');
    //         }
    //     })
    //         //파일 삭제 버튼
    //         $(".deleteFile").on("click", function () {
    //             alert("${deal.files}");
    //             var size = $("#fileSize");
    //             size.parent().append('<input type="hidden" name="deleteFileName" value="' + $(this).parent().attr('id') + '">')
    //            // $(this).parent().remove()
    //             size.val(size.val() - 1)
    //
    //     })
    // })

//
//             // 확인용
//             $(".listClubMasterBoard").on("click", function () {
//                 location.href = "/club/listClubMasterBoard/" + $(".boardNum").val()
//             })
//
//             $(".addCalender").on("click", () => {
//                 alert($('.boardNum').val());
//
//                 window.open(
//                     "/clubCal/addCalender?clubNum=" + $(".boardNum").val(), "리뷰페이지",
//                     "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
//
//             });
//         })
//     })



        // $(".delete").on("click", function () {
        //     var dealBoardNum = $(".dealBoardNum").val();
        //     var boardCategory = $(".boardCategory").val()
        //
        //     const swalWithBootstrapButtons = Swal.mixin({
        //         customClass: {
        //             confirmButton: 'btn btn-success',
        //             cancelButton: 'btn btn-danger'
        //         },
        //         buttonsStyling: false
        //     })
        //
        //     swalWithBootstrapButtons.fire({
        //         title: '정말 삭제 하시겠습니까?',
        //         text: "삭제하면 해당 게시글을 볼수 없습니다",
        //         icon: 'warning',
        //         showCancelButton: true,
        //         confirmButtonText: '삭제',
        //         cancelButtonText: '취소',
        //         reverseButtons: true
        //     }).then((result) => {
        //         if (result.isConfirmed) {
        //             location.href = "/deal/deleteDeal/" + $(".dealBoardNum").val()
        //             swalWithBootstrapButtons.fire(
        //                 '삭제 성공!',
        //                 'success'
        //             )
        //         } else if (
        //             /* Read more about handling dismissals below */
        //             result.dismiss === Swal.DismissReason.cancel
        //         ) {
        //             swalWithBootstrapButtons.fire(
        //                 '삭제 취소',
        //                 'error'
        //             )
        //         }
        //     })
        // });


        // $(".update").on("click", function () {
        //     var boardNum = $(".boardNum").val()
        //     var boardCatagory = $(".boardCategory").val()
        //     window.open(
        //         "/deal/updateDeal/${deal.dealBoardNum}", "거래 게시글 수정",
        //         "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no"
        //     )
        //
        // });
/*새롭게 진욱이형 코드 review*/
/*조회수*/
$(function () {
    var userId=$(".userId").val()

        $(document).ready(function () {

            var viewCount = $(".viewText").html();
            var dealBoardNum = $(".dealBoardNum").val();
            var boardCategory = $(".boardCategory").val()

            $.ajax({
                url: "/deal/json/viewCount",
                type: "POST",
                data: JSON.stringify({
                    "viewCount": viewCount,
                    "dealBoardNum": dealBoardNum,
                    "boardCategory": boardCategory
                }),
                dataType: "JSON",
                contentType: 'application/json; charset=UTF-8',
                success: function (JSONData, result) {

                    $(".viewText").html(JSONData);
                }
            })

            /*좋아요 버튼*/
            $(".likeButton").on("click", function () {

                if (userId === '' || userId === null) {


                    Swal.fire({
                        icon: 'error',
                        title: '로그인이 필요합니다',
                        text: '로그인을 먼저 진행해주세요'
                    }).then(()=>{
                        $('#loginModal').modal('show')
                    })
                        return false

                }else if (userId !== '') {

                    var likeCount = $(".likeText").html();
                    var dealBoardNum = $(".dealBoardNum").val();
                    var boardCategory = $(".boardCategory").val()

                    console.log(dealBoardNum);

                    $.ajax({
                        url: "/deal/json/dealLike",
                        type: "POST",
                        data: JSON.stringify({
                            "likeCount": likeCount,
                            "dealBoardNum": dealBoardNum,
                            "boardCategory": boardCategory
                        }),
                        dataType: "JSON",
                        contentType: 'application/json; charset=UTF-8',
                        success: function (JSONData, result) {


                            $(".likeText").html(JSONData);
                        }
                    })

                }
            })

        })
    })



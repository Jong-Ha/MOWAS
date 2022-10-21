$(function(){
    $(".updateDeal").on("click",function(){
        location.href="/deal/updateDeal/${deal.dealBoardNum}"
    })
    $(".deleteDeal").on("click",function(){
        var check = confirm("진짜 삭제?");
        if(check==true){
            location.href="/deal/deleteDeal/${deal.dealBoardNum}"
        }
    })
});
$(function (){
    /* 리뷰쓰기 */
    $(".reply_button_wrap").on("click", function(e){

        e.preventDefault();

        const userId = '${user.userId}';
        const dealId = '${deal.dealId}';

        let popUrl = "/deal/review/${dealBoardNum}";


        console.log(popUrl);
        let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";

        window.open(popUrl,"리뷰 쓰기",popOption);
    });
})
//
$(function() {
    $(".dealLogin").on("click",function(){
        location.href="/deal/login?userId="+$("input[name='userId']").val()+"&dealBoardNum=${deal.dealBoardNum}";
    })
    //좋아요
    $(".likeToggle").on("click", function () {
        var dealNum = $(this).parent().children("[name='dealBoardNum']").val();
        var boardCategory=$(this).parent().children("[name='boardCategory']").val();
        $.ajax({
            url: "/deal/json/dealLike",
            method: "POST",
            data: JSON.stringify({
                "boardNum": dealNum,
                "boardCategory": boardCategory
            }),
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json; charset=UTF-8"
            },
            dataType: "JSON",
            success: function (JSONData, result) {
                alert(result)
                alert(JSONData);
                if (JSONData.like === 'n') {
                    alert("누름")
                    $(".likeToggle").val("좋아요 해제") ;
                }else if(JSONData.like=='null'){
                    $(".likeToggle").val
                } else{
                    alert("뺌")
                    $(".likeToggle").val("좋아요!");
                }
            }
        })
    })
})

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

$(function () {
    // $(".updateClub").on("click",function(){
    //     location.href="/club/updateClub/"+$(".boardNum").val()
    // })
    $(".deleteDeal").on("click", function () {
        var check = confirm("진짜 삭제?");
        if (check === true) {
            location.href = "/deal/deleteDeal/" + $(".dealBoardNum").val()
        }
    })
    $(".listCluber").on("click", function () {
        var nWidth = "400";
        var nHeight = "500";

// 듀얼 모니터 고려한 윈도우 띄우기
        var curX = window.screenLeft;
        var curY = window.screenTop;
        var curWidth = document.body.clientWidth;
        var curHeight = document.body.clientHeight;

        var nLeft = curX + (curWidth / 2) - (nWidth / 2);
        var nTop = curY + (curHeight / 2) - (nHeight);

        var strOption = "";
        strOption += "left=" + nLeft + "px,";
        strOption += "top=" + nTop + "px,";
        strOption += "width=" + nWidth + "px,";
        strOption += "height=" + nHeight + "px,";
        strOption += "toolbar=no,menubar=no,location=no,";
        strOption += "resizable=yes,status=yes";

        window.open("/club/listCluber/" + $(".boardNum").val(), "popWin", strOption)
    })


    //업데이트 tagify
    var dealTag = document.querySelector("#dealTag")
    var tagify = new Tagify(dealTag, {
        dropdown: {
            position: "input",
            enabled: 0 // always opens dropdown when input gets focus
        }
    })

    let items = []

    $.each($(".tagList"), function (index, item) {
        // alert($(item).val())
        items.push($(item).val())
    })
    tagify.addTags(items)

    //업데이트
    $(".updateDeal").on("click", function () {
        let updateForm = $("#updateDealForm");
        $.each(JSON.parse($("#dealTag").val()), function (index, item) {
            updateForm.append('<input type="hidden" name="dealTags" value="' + item.value + '">')
        })
        updateForm.attr("method", "post").attr("action", "/deal/updateDeal").submit();
    })
    $('input[name="file"]').on("change", function () {
        $('input[name="deleteFileName"]').attr("disabled", false)
    })
    //파일 갯수 체크
    $("input:file").on("change", function () {
        if ($(this)[0].files.length > 10 - $('#fileSize').val()) {
            alert('파일 갯수를 초과하였습니다.');
            // alert(10-$('#fileSize').val());
            $(this).val('');
        }
        //파일 삭제 버튼
        $(".deleteFile").on("click", function () {
            alert("${deal.files}");
            var size = $("#fileSize");
            size.parent().append('<input type="hidden" name="deleteFileName" value="' + $(this).parent().attr('id') + '">')
            $(this).parent().remove()
            size.val(size.val() - 1)
        })

        // 확인용
        $(".listClubMasterBoard").on("click", function () {
            location.href = "/club/listClubMasterBoard/" + $(".boardNum").val()
        })

        $(".addCalender").on("click", () => {
            alert($('.boardNum').val());

            window.open(
                "/clubCal/addCalender?clubNum=" + $(".boardNum").val(), "리뷰페이지",
                "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

        });
    })
})


